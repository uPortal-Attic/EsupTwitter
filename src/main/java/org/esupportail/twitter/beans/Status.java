/**
 * Copyright (C) 2010 Esup Portail http://www.esup-portail.org
 * Copyright (C) 2010 UNR RUNN http://www.unr-runn.fr
 * @Author (C) 2010 Vincent Bonamy <Vincent.Bonamy@univ-rouen.fr>
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



public class Status {

	  private String created_at;
	  private String id;
	  private String text;
	  private String source;
	  private String truncated;
	  private String in_reply_to_status_id;
	  private String in_reply_to_user_id;
	  private String favorited;
	  private String in_reply_to_screen_name;
	  private User user;
	  private String geo;
	  private String  coordinates;
	  private String place;
	  private String contributors;
	  private Status retweeted_status;
	  
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String createdAt) {
		created_at = createdAt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getTruncated() {
		return truncated;
	}
	public void setTruncated(String truncated) {
		this.truncated = truncated;
	}
	public String getIn_reply_to_status_id() {
		return in_reply_to_status_id;
	}
	public void setIn_reply_to_status_id(String inReplyToStatusId) {
		in_reply_to_status_id = inReplyToStatusId;
	}
	public String getIn_reply_to_user_id() {
		return in_reply_to_user_id;
	}
	public void setIn_reply_to_user_id(String inReplyToUserId) {
		in_reply_to_user_id = inReplyToUserId;
	}
	public String getFavorited() {
		return favorited;
	}
	public void setFavorited(String favorited) {
		this.favorited = favorited;
	}
	public String getIn_reply_to_screen_name() {
		return in_reply_to_screen_name;
	}
	public void setIn_reply_to_screen_name(String inReplyToScreenName) {
		in_reply_to_screen_name = inReplyToScreenName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getGeo() {
		return geo;
	}
	public void setGeo(String geo) {
		this.geo = geo;
	}
	public String getContributors() {
		return contributors;
	}
	public void setContributors(String contributors) {
		this.contributors = contributors;
	}
	public Status getRetweeted_status() {
		return retweeted_status;
	}
	public void setRetweeted_status(Status retweetedStatus) {
		retweeted_status = retweetedStatus;
	}
	public String getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(String coordinates) {
		this.coordinates = coordinates;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
}
