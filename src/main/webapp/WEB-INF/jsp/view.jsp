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
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<rx:regexp id="parseurl">s/(http(s)?:\/\/[^\s]*)(\s|\n)/<a href="$1" title="$1" target="_blank">$1<\/a> /g</rx:regexp>
<rx:regexp id="parseatorhash">s/((#|@)[(\w|-|_)]+)/<a href="https:\/\/twitter.com\/$1" title="https:\/\/twitter.com\/$1" target="_blank">$1<\/a> /g</rx:regexp>
          
<link type="text/css" rel="stylesheet" href="<c:url value="/css/esupTwitter.css"/>" media="screen, projection"/>

<div class="esupTwitter">

<div class="portlet-title wrapper-cms">
  	<img class="profileImg" src="${twitterProfile.profileImageUrl}" alt="${twitterProfile.name}" />
    <h3 class="profilTitle">
    	<a href="https://twitter.com/${twitterProfile.screenName}" title="https://twitter.com/${twitterProfile.screenName}" target="_blank"></a>
    	${twitterProfile.name}, ${twitterProfile.location}
	    <c:choose>
	      <c:when test="${not empty twitterProfile.url}">
	       - <a href="${twitterProfile.url}" title="${twitterProfile.url}" target="_blank" class="profilUrl">${twitterProfile.url}</a>
	      </c:when>
	      <c:otherwise>
	      </c:otherwise>
	    </c:choose>
  	</h3>
</div>
<div class="portlet-note wrapper-cms profilDesc">
	<rx:text id="text">
	   ${twitterProfile.description}
	</rx:text>
	<rx:text id="texturl">
	<rx:substitute regexp="parseurl" text="text" />
	</rx:text>
	<rx:substitute regexp="parseatorhash" text="texturl" />
</div>

<div class="portlet-section">

  <div class="portlet-section-body">

    <ul>
      <c:forEach var="tweet" items="${tweetList}">
        <li class="esuptwitter-list">
            <c:choose>
              <c:when test="${not empty tweet.retweetedStatus}">
                <rx:text id="text">
                  ${tweet.retweetedStatus.text}
                </rx:text>
                <rx:text id="texturl">
                  <rx:substitute regexp="parseurl" text="text" />
                </rx:text>
          		<a href="https://twitter.com/${tweet.retweetedStatus.user.screenName}/status/${tweet.id}" title="https://twitter.com/${tweet.retweetedStatus.user.screenName}/status/${tweet.id}" target="_blank">
	                <img 
	                    src="${tweet.retweetedStatus.user.profileImageUrl}"
	                    alt="${tweet.retweetedStatus.user.name}"
	                />
	                <h4>${tweet.retweetedStatus.user.name}</h4>
                </a>
              </c:when>
              <c:otherwise>
                <rx:text id="text">
                  ${tweet.text}
                </rx:text>
                <rx:text id="texturl">
                  <rx:substitute regexp="parseurl" text="text" />
                </rx:text>
          		<a href="https://twitter.com/${tweet.user.screenName}/status/${tweet.id}" title="https://twitter.com/${tweet.user.screenName}/status/${tweet.id}" target="_blank">
	                <img 
	                    src="${tweet.user.profileImageUrl}"
	                    alt="${tweet.user.name}"
	                />
	                <h4>${tweet.user.name}</h4>
	            </a>
              </c:otherwise>
            </c:choose>
            <p>
            <rx:substitute regexp="parseatorhash" text="texturl" />
            </p>
            <p>
                ${tweet.createdAt}
                <c:choose>
                  <c:when test="${not empty tweet.retweetedStatus}">
                    - Retweeted by ${tweet.user.name}
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
                </c:choose>
            </p>
        </li>
      </c:forEach>
    </ul>

  </div>

</div>

</div>
