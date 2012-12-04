<%--

    Copyright (C) 2012 Esup Portail http://www.esup-portail.org
    Copyright (C) 2012 UNR RUNN http://www.unr-runn.fr
    @Author (C) 2012 Vincent Bonamy <Vincent.Bonamy@univ-rouen.fr>

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
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<portlet:renderURL var="renderRefreshUrl" />

<div class="portlet-title">
  <h2>
  	<a href="http://twitter.com/${user.screen_name}" target="_blank">
    	<img height="80px" src="${user.profile_image_url}" alt="${user.name}" />
    </a>
    ${user.name}, ${user.location} -
    <a href="${user.url}" target="_blank">
      ${user.url}
    </a>
  </h2>
</div>
<div class="portlet-note">
  ${user.description}
</div>

<div class="portlet-section">

  <div class="portlet-section-body">

    <ul>
      <c:forEach var="status" items="${statusList}">
        <li>
          <rx:regexp id="parseurl">s/(http:\/\/[^ ]*)/<a href="$1" target="_blank">$1<\/a>/g</rx:regexp>
          <rx:text id="text">
            ${status.text}
          </rx:text>

          <p>
            <c:choose>
              <c:when test="${not empty status.retweeted_status}">
                <img 
                    height="40px"
                    src="${status.retweeted_status.user.profile_image_url}"
                    alt="${status.retweeted_status.user.name}"
                />
              </c:when>
              <c:otherwise>
                <img height="40px" src="${status.user.profile_image_url}" alt="${status.user.name}" />
              </c:otherwise>
            </c:choose>
            <rx:substitute regexp="parseurl" text="text" />
            <br />

            <span style="font-size: 80%; font-style: italic">
              ${status.created_at}
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

