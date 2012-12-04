/**
 * Copyright (C) 2012 Esup Portail http://www.esup-portail.org
 * Copyright (C) 2012 UNR RUNN http://www.unr-runn.fr
 * @Author (C) 2012 Vincent Bonamy <Vincent.Bonamy@univ-rouen.fr>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.esupportail.twitter.beans;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
    private String id;
    private String name;
    private String screen_name;
    private String location;
    private String description;
    private String profile_image_url;
    private String url;
    private String followers_count;
    private String profile_background_color;
    private String profile_text_color;
    private String profile_link_color;
    private String profile_sidebar_fill_color;
    private String profile_sidebar_border_color;
    private String friends_count;
    private String created_at;
    private String favourites_count;
    private String utc_offset;
    private String time_zone;
    private String profile_background_image_url;
    private String profile_background_tile;
    private String notifications;
    private String geo_enabled;
    private String verified;
    private String following;
    private String statuses_count;
    private String lang;
    private String contributors_enabled;
    
    private Status  status;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screenName) {
		screen_name = screenName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProfile_image_url() {
		return profile_image_url;
	}
	public void setProfile_image_url(String profileImageUrl) {
		profile_image_url = profileImageUrl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFollowers_count() {
		return followers_count;
	}
	public void setFollowers_count(String followersCount) {
		followers_count = followersCount;
	}
	public String getProfile_background_color() {
		return profile_background_color;
	}
	public void setProfile_background_color(String profileBackgroundColor) {
		profile_background_color = profileBackgroundColor;
	}
	public String getProfile_text_color() {
		return profile_text_color;
	}
	public void setProfile_text_color(String profileTextColor) {
		profile_text_color = profileTextColor;
	}
	public String getProfile_link_color() {
		return profile_link_color;
	}
	public void setProfile_link_color(String profileLinkColor) {
		profile_link_color = profileLinkColor;
	}
	public String getProfile_sidebar_fill_color() {
		return profile_sidebar_fill_color;
	}
	public void setProfile_sidebar_fill_color(String profileSidebarFillColor) {
		profile_sidebar_fill_color = profileSidebarFillColor;
	}
	public String getProfile_sidebar_border_color() {
		return profile_sidebar_border_color;
	}
	public void setProfile_sidebar_border_color(String profileSidebarBorderColor) {
		profile_sidebar_border_color = profileSidebarBorderColor;
	}
	public String getFriends_count() {
		return friends_count;
	}
	public void setFriends_count(String friendsCount) {
		friends_count = friendsCount;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String createdAt) {
		created_at = createdAt;
	}
	public String getFavourites_count() {
		return favourites_count;
	}
	public void setFavourites_count(String favouritesCount) {
		favourites_count = favouritesCount;
	}
	public String getUtc_offset() {
		return utc_offset;
	}
	public void setUtc_offset(String utcOffset) {
		utc_offset = utcOffset;
	}
	public String getTime_zone() {
		return time_zone;
	}
	public void setTime_zone(String timeZone) {
		time_zone = timeZone;
	}
	public String getProfile_background_image_url() {
		return profile_background_image_url;
	}
	public void setProfile_background_image_url(String profileBackgroundImageUrl) {
		profile_background_image_url = profileBackgroundImageUrl;
	}
	public String getProfile_background_tile() {
		return profile_background_tile;
	}
	public void setProfile_background_tile(String profileBackgroundTile) {
		profile_background_tile = profileBackgroundTile;
	}
	public String getNotifications() {
		return notifications;
	}
	public void setNotifications(String notifications) {
		this.notifications = notifications;
	}
	public String getGeo_enabled() {
		return geo_enabled;
	}
	public void setGeo_enabled(String geoEnabled) {
		geo_enabled = geoEnabled;
	}
	public String getVerified() {
		return verified;
	}
	public void setVerified(String verified) {
		this.verified = verified;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public String getStatuses_count() {
		return statuses_count;
	}
	public void setStatuses_count(String statusesCount) {
		statuses_count = statusesCount;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getContributors_enabled() {
		return contributors_enabled;
	}
	public void setContributors_enabled(String contributorsEnabled) {
		contributors_enabled = contributorsEnabled;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
}
