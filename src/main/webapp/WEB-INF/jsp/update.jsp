<%--
 Copyright (C) 2012 Timothy Stone

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

<%@ include file="/WEB-INF/jsp/support/taglibs.jsp" %>

<s:layout-render name="/WEB-INF/jsp/layout.jsp" title="Tomcat Manager Management">
    <s:layout-component name="bd">
        <div id="updatePanel">
            <s:form id="updateForm" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean">
                <div class="hd">
                    <h1>Update ${actionBean.user.fname} ${actionBean.user.lname}</h1>
                </div>
                <div class="bd">
                    <dl>
                        <dt>Name</dt>
                        <dd>
                            <s:text name="user.fname"/>
                        </dd>
                        <dd>
                            <s:text name="user.lname"/>
                        </dd>
                    </dl>
                    <dl>
                        <dt>Username</dt>
                        <dd>
                            ${actionBean.user.username}
                        </dd>
                    </dl>
                    <dl>
                        <dt>Password</dt>
                        <dd>
                            <s:password repopulate="true" name="user.password" />
                        </dd>
                    </dl>
                    <dl>
                        <dt>e-mail</dt>
                        <dd>
                            <s:text name="user.email"/>
                        </dd>
                    </dl>
                    <dl>
                        <dt>Phone</dt>
                        <dd>
                            <s:text name="user.phone"/>
                        </dd>
                    </dl>
                    <dl>
                        <dt>Role</dt>
                        <dd>
                            <s:select name="userRoles.rolename">
                            <c:forEach items="${actionBean.roles}" var="role">
                                <c:set var="selected" value="${(actionBean.userRoles.rolename eq role) ? 'selected' : ''}" />
                                <option value="${role}" ${selected}>${role}</option>
                            </c:forEach>
                            </s:select>
                        </dd>
                    </dl>
                </div>
                <div class="ft">
                    <s:submit name="save" value="Update User"/>                    
                    <s:submit name="cancel" value="Cancel"/>                    
                </div>
            </s:form>
        </div>
    </s:layout-component>            
</s:layout-render>
