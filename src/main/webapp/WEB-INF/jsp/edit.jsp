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
  <div>
    <p>
      <label class="portlet-form-label">
        <spring:message code="edit.password"/>
        :
      </label>
    </p>
    <input type="password" name="twitterPassword" class="portlet-form-input-field" value="${twitterPassword}"/>
  </div>
  <input type="submit" value="${setTwitterUsernameMessage}" class="portlet-form-button"/>
</form>


<portlet:renderURL var="formDoneAction" portletMode="VIEW"/>
<p>
  <button onclick="window.location='${formDoneAction}'" class="portlet-form-button">
    <spring:message code="edit.done.button"/>
  </button>
</p>
