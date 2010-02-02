<%@ include file="/WEB-INF/jsp/include.jsp" %>

<portlet:renderURL var="renderRefreshUrl" />
<a href="${renderRefreshUrl}"><spring:message code="view.refresh"/></a>

<div class="portlet-title">
<h2>  <img height="80px" src="${user.profile_image_url}" alt="${user.name}"/> ${user.name}, ${user.location} - <a href="${user.url}">${user.url}</a></h2>
</div>
<div class="portlet-note">
${user.description}
</div>

<div class="portlet-section">
        
            <div class="portlet-section-body">

<ul>
<c:forEach var="status" items="${statusList}">
<li>

<%-- create the substitute regexp "s/test1/test2/gmi" --%>
<rx:regexp id="parseurl">s/(http:\/\/[^ ]*)/<a href="$1" target="_blank">$1<\/a>/g</rx:regexp>
<%-- set the text to match on --%>                        
<rx:text id="text">                                    
${status.text}
</rx:text>                         

<p>

<c:choose>
<c:when test="${not empty status.retweeted_status}">
 <img height="40px" src="${status.retweeted_status.user.profile_image_url}" alt="${status.retweeted_status.user.name}"/> 
</c:when>
<c:otherwise>
 <img height="40px" src="${status.user.profile_image_url}" alt="${status.user.name}"/> 
</c:otherwise>
</c:choose>

<rx:substitute regexp="parseurl" text="text"/>

<br/>
<span style="font-size:80%; font-style:italic">${status.created_at}
<c:choose>
<c:when test="${not empty status.retweeted_status}">
 - Retweeted by ${status.user.name}
</c:when>
<c:otherwise>
 - ${status.user.name}
</c:otherwise>
</c:choose>
</span>

</p>
</li>
</c:forEach>
</ul>

</div>

</div>

