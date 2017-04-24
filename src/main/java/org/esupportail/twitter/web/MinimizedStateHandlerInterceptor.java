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
package org.esupportail.twitter.web;

import java.util.Calendar;
import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.WindowState;

import org.apache.log4j.Logger;
import org.esupportail.twitter.beans.OAuthTwitterConfig;
import org.esupportail.twitter.services.OAuthTwitterApplicationOnlyService;
import org.scribe.oauth.OAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.twitter.api.Tweet;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.impl.TwitterTemplate;
import org.springframework.web.portlet.handler.HandlerInterceptorAdapter;


public class MinimizedStateHandlerInterceptor  extends HandlerInterceptorAdapter {

    private static Logger log = Logger.getLogger(MinimizedStateHandlerInterceptor.class);
	
    private static final String PREF_TWITTER_USERNAME = "twitterUsername";
    private static final String DEFAULT_TWITTER_USERNAME = "apereoorg";
    
    private static final String PREF_TWITTER_USER_TOKEN = "twitterUserToken";
    private static final String PREF_TWITTER_USER_SECRET = "twitterUserSecret";
    
    private static final String PREF_TWITTER_TWEETS_NUMBER = "twitterTweetsNumber";
    
    
    @Autowired
    protected OAuthTwitterConfig oAuthTwitterConfig;
    
    @Autowired
    OAuthTwitterApplicationOnlyService oAuthTwitterApplicationOnlyService;
    
    protected OAuthService service;
    
    @Override
    public boolean preHandleRender(RenderRequest request, RenderResponse response, Object handler) throws Exception {
 
        if (WindowState.MINIMIZED.equals(request.getWindowState())) {
            
            log.debug("preHandleRender");

            int newCount = 0;
            
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE,-1);

            final PortletPreferences prefs = request.getPreferences();
            String twitterUsername = prefs.getValue(PREF_TWITTER_USERNAME, DEFAULT_TWITTER_USERNAME);
            
            String applicationOnlyBearerToken = oAuthTwitterApplicationOnlyService.getApplicationOnlyBearerToken();
            
            String twitterUserToken = prefs.getValue(PREF_TWITTER_USER_TOKEN, null);
            String twitterUserSecret = prefs.getValue(PREF_TWITTER_USER_SECRET, null);
            
            int tweetsNumber = Integer.parseInt(prefs.getValue(PREF_TWITTER_TWEETS_NUMBER, "-1"));

            // get username timeline with oAuth authentication
            log.debug("twitterUserToken:" + twitterUserToken);
            log.debug("twitterUserSecret:" + twitterUserSecret);
            
            Twitter twitter;
            List<Tweet> tweetList;
            
            if(twitterUserToken != null && twitterUserSecret != null) {
                twitter = new TwitterTemplate(oAuthTwitterConfig.getConsumerKey(), oAuthTwitterConfig.getConsumerSecret(), twitterUserToken, twitterUserSecret);
                tweetList = twitter.timelineOperations().getHomeTimeline(tweetsNumber);
            } else {
                twitter = new TwitterTemplate(applicationOnlyBearerToken);
                tweetList = twitter.timelineOperations().getUserTimeline(twitterUsername, tweetsNumber);
            }
            
            for(Tweet tweet:tweetList)
            {
                if(tweet.getCreatedAt().getTime() > cal.getTime().getTime()) {
                    newCount++;
                }
            }
            
            response.setProperty("newItemCount", String.valueOf(newCount));
            log.debug("newItemCount:" + newCount);
            return false;
        }
        
        return true;
    }
}
