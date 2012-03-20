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
        <div id="deletePanel">
            <s:form id="deleteForm" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean">
                <div class="hd">
                    <h1>Delete ${actionBean.user.fname} ${actionBean.user.lname}</h1>
                </div>
                <div class="bd">
                    <dl>
                        <dt>Username</dt>
                        <dd>
                            ${actionBean.user.username}
                        </dd>
                    </dl>
                    <dl>
                        <dt>e-mail</dt>
                        <dd>
                            ${actionBean.user.email}
                        </dd>
                    </dl>
                    <dl>
                        <dt>Phone</dt>
                        <dd>
                            ${actionBean.user.phone}
                        </dd>
                    </dl>
                    <dl>
                        <dt>Role</dt>
                        <dd>
                            [role]
                        </dd>
                    </dl>
                </div>
                <div class="ft">
                    <s:submit name="save" value="Delete User"/>                    
                    <s:submit name="cancel" value="Cancel"/>                    
                </div>
            </s:form>
        </div>
    </s:layout-component>            
</s:layout-render>

