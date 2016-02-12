package org.esupportail.twitter.services;

import java.util.List;

import org.scribe.oauth.OAuthService;
import org.springframework.social.twitter.api.Tweet;
import org.springframework.social.twitter.api.TwitterProfile;

public interface TwitterService {

	TwitterProfile getUserProfile(String twitterUserToken, String twitterUserSecret);

	List<Tweet> getHomeTimeline(String twitterUserToken, String twitterUserSecret, int pageSize);

	TwitterProfile getUserProfile(String screenName);

	List<Tweet> getUserTimeline(String screenName, int pageSize);

	boolean isOAuthEnabled();
	
	OAuthService getOAuthService();
}