<%@ include file="/WEB-INF/jsp/include.jsp" %>

<div class="portlet-title">
  <h2>
    <spring:message code="edit.title"/>
  </h2>
</div>



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
