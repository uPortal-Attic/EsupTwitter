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

<div class="portlet-title wrapper-cms">
  <h3>
    <a href="https://twitter.com/${twitterProfile.screenName}" title="https://twitter.com/${twitterProfile.screenName}" target="_blank"><img style="border-radius: 1em; float: left; position: relative; height: 60px; margin: 0px 10px 0px 0px;" src="${twitterProfile.profileImageUrl}" alt="${twitterProfile.name}" /></a>
    ${twitterProfile.name}, ${twitterProfile.location}
    <c:choose>
      <c:when test="${not empty twitterProfile.url}">
       - <a href="${twitterProfile.url}" title="${twitterProfile.url}" target="_blank" style="font-size: 90%;">${twitterProfile.url}</a>
      </c:when>
      <c:otherwise>
      </c:otherwise>
    </c:choose>
  </h3>
</div>
<div class="portlet-note wrapper-cms" style="clear:both;">
  ${twitterProfile.description}
</div>

<div class="portlet-section">

  <div class="portlet-section-body">

    <ul data-role="listview" style="margin:0;">
      <c:forEach var="tweet" items="${tweetList}">
        <li style="list-style: none;">
          <rx:regexp id="parseurl">s/(http(s)?:\/\/[^\s]*)(\s|\n)/<a href="$1" title="$1" target="_blank">$1<\/a> /g</rx:regexp>
          <rx:regexp id="parseatorhash">s/((#|@)[(\w|-|_)]+)/<a href="https:\/\/twitter.com\/$1" title="https:\/\/twitter.com\/$1" target="_blank">$1<\/a> /g</rx:regexp>
            <c:choose>
              <c:when test="${not empty tweet.retweetedStatus}">
                <rx:text id="text">
                  ${tweet.retweetedStatus.text}
                </rx:text>
                <rx:text id="texturl">
                  <rx:substitute regexp="parseurl" text="text" />
                </rx:text>
          <a href="https://twitter.com/${tweet.retweetedStatus.user.screenName}/status/${tweet.id}" title="https://twitter.com/${tweet.retweetedStatus.user.screenName}/status/${tweet.id}" target="_blank" style="text-decoration:none; height:30px; min-height:20px; float:left; padding:0px;">
                <img style="height: 40px; margin-top: 10px; border-radius: 1em; float:left;" class="ui-li-thumb"
                    src="${tweet.retweetedStatus.user.profileImageUrl}"
                    alt="${tweet.retweetedStatus.user.name}"
                />
                <h4 style="padding-left:60px;">${tweet.retweetedStatus.user.name}</h4>
              </c:when>
              <c:otherwise>
                <rx:text id="text">
                  ${tweet.text}
                </rx:text>
                <rx:text id="texturl">
                  <rx:substitute regexp="parseurl" text="text" />
                </rx:text>
          <a href="https://twitter.com/${tweet.user.screenName}/status/${tweet.id}" title="https://twitter.com/${tweet.user.screenName}/status/${tweet.id}" target="_blank" style="text-decoration:none; height:30px; min-height:20px; float:left; padding:0px;">
                <img style="height: 40px; margin-top: 10px; border-radius: 1em; float:left;" class="ui-li-thumb"
                    src="${tweet.user.profileImageUrl}"
                    alt="${tweet.user.name}"
                />
                <h4 style="padding-left:60px;">${tweet.user.name}</h4>
              </c:otherwise>
            </c:choose>
          </a>
            <p style="padding-left:60px; padding-right:20px; clear:both; overflow:hidden; text-overflow: clip; white-space: normal;">
              <rx:substitute regexp="parseatorhash" text="texturl" />
              </br>
              <span style="font-size: 80%; font-style: italic;">
                ${tweet.createdAt}
                <c:choose>
                  <c:when test="${not empty tweet.retweetedStatus}">
                    - Retweeted by ${tweet.user.name}
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
                </c:choose>
              </span>
            </p>
        </li>
      </c:forEach>
    </ul>

  </div>

</div>

