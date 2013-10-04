<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work for
    additional information regarding copyright ownership.

    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file except in
    compliance with the License. You may obtain a copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<div class="portlet-title">
  <h3>
    <spring:message code="edit.title"/>
  </h3>
</div>

 <c:choose>
  <c:when test="${connectedMode}">
	<spring:message code="edit.info.connected.description" arguments="${currentTwitterUsername}"/>
  </c:when>
  <c:otherwise>
  	<spring:message code="edit.info.anonymous.description" arguments="${currentTwitterUsername}"/>
  </c:otherwise>
 </c:choose>

<hr/>

<h3><spring:message code="edit.mode.anonymous"/></h3>

<portlet:actionURL var="setTwitterUsername">
  <portlet:param name="action" value="setTwitterUsername"/>
</portlet:actionURL>

<form id="${n}setTwitterUsername" class="setTwitterUsername" action="${setTwitterUsername}" method="post">
  <div>
    <p>
      <label class="portlet-form-label">
        <spring:message code="edit.username"/>
        :
      </label>
    </p>
    <input name="twitterUsername" class="portlet-form-input-field" value="${twitterUsername}"/>
    <spring:message var="setTwitterUsernameMessage" code="edit.set.username.button"/>
  </div>
  <input type="submit" value="${setTwitterUsernameMessage}" class="portlet-form-button"/>
 </form>
 
  <hr/>
 
  <c:if test="${isOAuthEnabled}">
  
  <h3><spring:message code="edit.mode.connected"/></h3>
  
  <portlet:actionURL var="setTwitterPin">
    <portlet:param name="action" value="setTwitterPin"/>
  </portlet:actionURL>
  
  <form id="${n}setTwitterPin" class="setTwitterPin" action="${setTwitterPin}" method="post">
     <div>
 	 	<a target="_blank" href="https://twitter.com/oauth/authorize?oauth_token=${twitterAccessToken}"><spring:message code="edit.get.pin.link"/></a>
   		 <p>
     		 <label class="portlet-form-label">
     		   <spring:message code="edit.pin"/>
     		   :
     		 </label>
   		 </p>
   		 <input type="text" name="twitterPin" class="portlet-form-input-field" value="${twitterPin}"/>
   		 <input type="hidden" name="twitterAccessToken" class="portlet-form-input-field" value="${twitterAccessToken}"/>
  		 <input type="hidden" name="twitterAccessTokenSecret" class="portlet-form-input-field" value="${twitterAccessTokenSecret}"/>
  		 <spring:message var="setTwitterPinMessage" code="edit.set.pin.button"/>
  	  </div>
  	<input type="submit" value="${setTwitterPinMessage}" class="portlet-form-button"/>
  </form>
  
  <hr/>
  
  </c:if>

  <portlet:actionURL var="setTwitterTweetsNumber">
    <portlet:param name="action" value="setTwitterTweetsNumber"/>
  </portlet:actionURL>
  
  <form id="${n}setTwitterTweetsNumber" class="setTwitterTweetsNumber" action="${setTwitterTweetsNumber}" method="post">
     <div>
   		 <p>
     		 <label class="portlet-form-label">
     		   <spring:message code="edit.tweetsNumber"/>
     		   :
     		 </label>
   		 </p>
   		 <input type="text" name="twitterTweetsNumber" class="portlet-form-input-field" value="${twitterTweetsNumber}"/>
     	 <spring:message var="setTwitterTweetsNumber" code="edit.set.tweetsNumber.button"/>
  	  </div>
  	<input type="submit" value="${setTwitterTweetsNumber}" class="portlet-form-button"/>
  </form>

  <hr/>
 

<portlet:renderURL var="formDoneAction" portletMode="VIEW"/>
<p>
  <button onclick="window.location='${formDoneAction}'" class="portlet-form-button">
    <spring:message code="edit.done.button"/>
  </button>
</p>
