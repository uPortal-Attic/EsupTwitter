<%--

    Copyright (C) 2010 Esup Portail http://www.esup-portail.org
    Copyright (C) 2010 UNR RUNN http://www.unr-runn.fr
    @Author (C) 2010 Vincent Bonamy <Vincent.Bonamy@univ-rouen.fr>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
            http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %>

<div class="portlet-title">
  <h2>
    <spring:message code="edit.title"/>
  </h2>
</div>

<h3>${currentTwitterUsername} [${connectedMode}]</h3>

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
 	 	<a target="_blank" href="https://twitter.com/oauth/authorize?oauth_token=${twitterAccessToken}">Get PIN from twitter</a>
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

 

<portlet:renderURL var="formDoneAction" portletMode="VIEW"/>
<p>
  <button onclick="window.location='${formDoneAction}'" class="portlet-form-button">
    <spring:message code="edit.done.button"/>
  </button>
</p>
