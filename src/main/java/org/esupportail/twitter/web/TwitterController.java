/**
 * Copyright 2007 The JA-SIG Collaborative.  All rights reserved.
 * See license distributed with this file and
 * available online at http://www.uportal.org/license.html
 */
package org.esupportail.twitter.web;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.httpclient.Credentials;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.esupportail.twitter.beans.Status;
import org.esupportail.twitter.beans.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.CommonsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.portlet.ModelAndView;

/**
 * @author Vincent Bonamy
 */
@Controller
public class TwitterController {

	private static final String PREF_TWITTER_USERNAME = "twitterUsername";
	private static final String PREF_TWITTER_PASSWORD = "twitterPassword";
    private static final String DEFAULT_TWITTER_USERNAME = "lavillederouen";
    
    private RestTemplate restTemplate;

    @Autowired
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
		CommonsClientHttpRequestFactory factory = (CommonsClientHttpRequestFactory)restTemplate.getRequestFactory(); 
		HttpClient client = factory.getHttpClient();
		
		// without this we have a WARN : Illegal domain attribute ".twitter.com". Domain of origin: "twitter.com"
		client.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);
		
		client.getParams().setSoTimeout(50000);
	}


    @RequestMapping("VIEW")
    protected ModelAndView renderView(RenderRequest request, RenderResponse response) throws Exception {
        
    	ModelMap model = new ModelMap();
    	
    	final PortletPreferences prefs = request.getPreferences();
    	String twitterUsername = prefs.getValue(PREF_TWITTER_USERNAME, DEFAULT_TWITTER_USERNAME);
    	String twitterPassword = prefs.getValue(PREF_TWITTER_PASSWORD, null);
    	
    	if(!(twitterPassword != null && StringUtils.hasLength(twitterPassword) && StringUtils.hasText(twitterUsername))) {
    		try {
    			User user = restTemplate.getForObject("http://twitter.com/users/show/{username}.xml", User.class, twitterUsername);
    			List<Status> statusList = restTemplate.getForObject("http://twitter.com/statuses/user_timeline.xml?id={username}", ArrayList.class, twitterUsername);
    			model.put("user", user);
    			model.put("statusList", statusList);
    		} catch(HttpClientErrorException e) {
    			return new ModelAndView("error", model);
    		}
    	} else {
    	    if(authenticate(twitterUsername, twitterPassword)) {  
    	    	User user = restTemplate.getForObject("http://twitter.com/users/show/{username}.xml", User.class, twitterUsername);
    	    	List<Status> statusList = restTemplate.getForObject("http://api.twitter.com/1/statuses/home_timeline.xml", ArrayList.class);
    	    	model.put("user", user);
    	    	model.put("statusList", statusList);
    	    } else {
    	    	return new ModelAndView("error", model);
    	    }
    	}
        return new ModelAndView("view", model);
    }


	private boolean authenticate(String twitterUsername, String twitterPassword) {
		Credentials credentials = new UsernamePasswordCredentials(twitterUsername, twitterPassword);  
		CommonsClientHttpRequestFactory factory = (CommonsClientHttpRequestFactory)restTemplate.getRequestFactory(); 
		HttpClient client = factory.getHttpClient();
		
		client.getState().setCredentials(AuthScope.ANY, credentials);
		try {
			restTemplate.getForObject("http://api.twitter.com/1/statuses/home_timeline.xml", ArrayList.class);
		} catch(HttpClientErrorException e) {
			return false;
		}
		return true;
	}
    
    @RequestMapping("EDIT")
	public ModelAndView renderEditView(RenderRequest request, RenderResponse response) throws Exception {
        final PortletPreferences prefs = request.getPreferences();
		ModelMap model = new ModelMap("twitterUsername", prefs.getValue(PREF_TWITTER_USERNAME, DEFAULT_TWITTER_USERNAME));
		model.put("twitterPassword", prefs.getValue(PREF_TWITTER_PASSWORD, null));
		return new ModelAndView("edit", model);
	}
    

    @RequestMapping(value = {"EDIT"}, params = {"action=setTwitterUsername"})
    public void setTwitterUsername(
            @RequestParam(value = "twitterUsername", required = true) String twitterUsername,
            @RequestParam(value = "twitterPassword", required = false) String twitterPassword,
            ActionRequest request, ActionResponse response) throws Exception {
    	
        PortletPreferences prefs = request.getPreferences();
       
        ModelMap model = new ModelMap();
        
        // validate the submitted data
        if (StringUtils.hasText(twitterUsername) && StringUtils.hasLength(twitterUsername)) {
        	prefs.setValue(PREF_TWITTER_USERNAME, twitterUsername);
        	prefs.setValue(PREF_TWITTER_PASSWORD, twitterPassword);
            prefs.store();
        }

        return;
	}
    
    @RequestMapping("ABOUT")
	public ModelAndView renderAboutView(RenderRequest request, RenderResponse response) throws Exception {
		ModelMap model = new ModelMap();
		return new ModelAndView("about", model);
	}
    
    @RequestMapping("HELP")
	public ModelAndView renderHelpView(RenderRequest request, RenderResponse response) throws Exception {
		ModelMap model = new ModelMap();
		return new ModelAndView("help", model);
	}
    
}
