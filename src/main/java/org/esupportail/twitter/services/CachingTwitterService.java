/**
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.
 *
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.esupportail.twitter.services;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.esupportail.twitter.beans.OAuthTwitterConfig;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.TwitterApi;
import org.scribe.oauth.OAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.social.twitter.api.Tweet;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.TwitterProfile;
import org.springframework.social.twitter.api.impl.TwitterTemplate;
import org.springframework.stereotype.Service;

@Service
public class CachingTwitterService implements TwitterService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
    private OAuthTwitterConfig oAuthTwitterConfig;
	
	@Autowired
	private OAuthTwitterApplicationOnlyService oAuthTwitterApplicationOnlyService;
	
	protected OAuthService oAuthService;
	
	@PostConstruct
	public void afterPropertiesSet() throws Exception {		
		if(oAuthTwitterConfig != null && !oAuthTwitterConfig.getConsumerKey().isEmpty() && !oAuthTwitterConfig.getConsumerSecret().isEmpty()) {
			oAuthService = new ServiceBuilder().provider(TwitterApi.SSL.class)
			.apiKey(oAuthTwitterConfig.getConsumerKey())
			.apiSecret(oAuthTwitterConfig.getConsumerSecret())
			.build();
		} else {
			new Exception("You have to setup twitterConfig.xml and register your EsupTwitter on https://dev.twitter.com/apps");
		}
	}
	
	@Override
	public boolean isOAuthEnabled() {
		return oAuthService != null;
	}
	
	@Override
	public OAuthService getOAuthService() {
		return oAuthService;
	}
	
	@Override
	@Cacheable("twitter")
	public TwitterProfile getUserProfile(String twitterUserToken, String twitterUserSecret) {
		Twitter twitter = new TwitterTemplate(oAuthTwitterConfig.getConsumerKey(), oAuthTwitterConfig.getConsumerSecret(), twitterUserToken, twitterUserSecret);
		return twitter.userOperations().getUserProfile();   			

	}
	
	@Override
	@Cacheable("twitter")
	public List<Tweet> getHomeTimeline(String twitterUserToken, String twitterUserSecret, int pageSize) {
		Twitter twitter = new TwitterTemplate(oAuthTwitterConfig.getConsumerKey(), oAuthTwitterConfig.getConsumerSecret(), twitterUserToken, twitterUserSecret);
		return twitter.timelineOperations().getHomeTimeline(pageSize);
	}
	
	@Override
	@Cacheable("twitter")
	public TwitterProfile getUserProfile(String screenName) {
		String applicationOnlyBearerToken = oAuthTwitterApplicationOnlyService.getApplicationOnlyBearerToken();
		Twitter twitter = new TwitterTemplate(applicationOnlyBearerToken);
    	return twitter.userOperations().getUserProfile(screenName);   			
	}
	
	@Override
	@Cacheable("twitter")
	public List<Tweet> getUserTimeline(String screenName, int pageSize) {
		String applicationOnlyBearerToken = oAuthTwitterApplicationOnlyService.getApplicationOnlyBearerToken();
		Twitter twitter = new TwitterTemplate(applicationOnlyBearerToken); 			
    	return twitter.timelineOperations().getUserTimeline(screenName, pageSize);		
	}
}
