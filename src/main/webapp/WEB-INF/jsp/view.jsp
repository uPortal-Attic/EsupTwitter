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

<portlet:renderURL var="renderRefreshUrl" />

<div class="portlet-title">
  <h2>
  	<a href="http://twitter.com/${twitterProfile.screenName}" target="_blank">
    	<img height="80px" src="${twitterProfile.profileImageUrl}" alt="${twitterProfile.name}" />
    </a>
    ${twitterProfile.name}, ${twitterProfile.location} -
    <a href="${twitterProfile.url}" target="_blank">
      ${twitterProfile.url}
    </a>
  </h2>
</div>
<div class="portlet-note">
  ${twitterProfile.description}
</div>

<div class="portlet-section">

  <div class="portlet-section-body">

    <ul>
      <c:forEach var="tweet" items="${tweetList}">
        <li>
          <rx:regexp id="parseurl">s/(http:\/\/[^ ]*)/<a href="$1" target="_blank">$1<\/a>/g</rx:regexp>
          <rx:text id="text">
            ${tweet.text}
          </rx:text>

          <p>
            <c:choose>
              <c:when test="${not empty tweet.retweetedStatus}">
                <img 
                    height="40px"
                    src="${tweet.retweetedStatus.user.profileImageUrl}"
                    alt="${tweet.retweetedStatus.user.name}"
                />
              </c:when>
              <c:otherwise>
                <img height="40px" src="${tweet.user.profileImageUrl}" alt="${tweet.user.name}" />
              </c:otherwise>
            </c:choose>
            <rx:substitute regexp="parseurl" text="text" />
            <br />

            <span style="font-size: 80%; font-style: italic">
              ${tweet.createdAt}
              <c:choose>
                <c:when test="${not empty tweet.retweetedStatus}">
                  - Retweeted by ${tweet.user.name}
                </c:when>
                <c:otherwise>
                  - ${tweet.user.name}
                </c:otherwise>
              </c:choose>
            </span>
          </p>
        </li>
      </c:forEach>
    </ul>

  </div>

</div>

