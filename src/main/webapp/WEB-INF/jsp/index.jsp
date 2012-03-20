<%@ include file="/WEB-INF/jsp/support/taglibs.jsp" %>

<s:layout-render name="/WEB-INF/jsp/layout.jsp" title="Tomcat Manager Management">
    <s:layout-component name="head">      
        <script type="text/javascript">
            var Dom = YAHOO.util.Dom,
            Event = YAHOO.util.Event,
            Tabs = YAHOO.widget.TabView,
            SimpleDialog = YAHOO.widget.SimpleDialog,
            Connect = YAHOO.util.Connect,
            getHtmlById = function(el,id,tag) {
                var e;
                e = Dom.getElementBy(function(el) {
                    return (el.id === id);
                },tag,el);
                return e.parentNode;
            };

    
            Event.onDOMReady(function(e) {
                var crud = new Tabs("crud"),
                users = 0;    
                var deletes = Dom.getElementsByClassName("confirm");
                var updates = Dom.getElementsByClassName("update");
                var deleteModal = new SimpleDialog("cDelete", { 
                    width: "30em", 
                    fixedcenter: true,
                    modal: true,
                    visible: false,
                    draggable: false
                });
                deleteModal.setHeader("Delete [User Full Name]");
                deleteModal.setBody("Are you sure you want to delete the user '[username]'?");
                deleteModal.cfg.setProperty("icon", SimpleDialog.ICON_WARN);
            
                var handleYes = function() {
                    //user confirms the deletion of this item;
                    //this method would perform that deletion;
                    this.hide();
                };
                var handleNo = function() {
                    //user cancels item deletion; this method
                    //would handle the cancellation of the
                    //process.
                    this.hide();
                };
                var deleteButtons = [
                    { text: "Yes", handler: handleYes },
                    { text:"Cancel", handler: handleNo, isDefault:true}
                ];
            
                deleteModal.cfg.queueProperty("buttons", deleteButtons); 
                deleteModal.render(document.body);            
            
                var updateYes = function() {
                    //user confirms the deletion of this item;
                    //this method would perform that deletion;
                    this.hide();
                };
                var updateNo = function() {
                    //user cancels item deletion; this method
                    //would handle the cancellation of the
                    //process.
                    this.hide();
                };
                
                var updateButtons = [
                    { text: "Update User", handler: updateYes },
                    { text:"Cancel", handler: updateNo, isDefault:true}
                ];
            
                
                Event.on(deletes, "click", function(e) {
                    Event.preventDefault(e);
                    deleteModal.show();
                });
                
                var loadpanel = {
                    cache: false,
                    success: function(o) {
                        var tempDiv = document.createElement("div");
                        tempDiv.innerHTML = o.responseText;
                        var updateDialog = new YAHOO.widget.Dialog(getHtmlById(tempDiv,"updateForm","form"),{
                            width: "40em", 
                            fixedcenter: true,
                            modal: true,
                            visible: false,
                            draggable: false,
                            underlay: "none"
                            
                        });
                        updateDialog.cfg.queueProperty("buttons", updateButtons); 
                        updateDialog.render(document.body);
                        updateDialog.show();
                    },
                    failure: function(o) {
                        alert("failed to make connection");
                    }
                };
                
                Event.on(updates, "click", function(e) {
                    Event.preventDefault(e);
                    var xhr = Connect.asyncRequest('GET',this.href,loadpanel);
                });
                
                users = ${fn:length(actionBean.users)};
                //  ${fn:length(actionBean.users)}
                if(users > 0) {
                    crud.selectTab(1);
                }
            });
        </script>
    </s:layout-component> 
    <s:layout-component name="hd">
        <s:errors globalErrorsOnly="true" />
    </s:layout-component>
    <s:layout-component name="bd">
        <div id="crud" class="yui-navset">
            <p>A simple interface for managing a Tomcat JDBCRealm.</p>
            <p>In the current implementation, users can only be assigned one (1) role.</p>
            <ul class="yui-nav">
                <li class="first selected"><a href="#tab1"><em>Create</em></a></li>
                <li><a href="#tab2"><em>Read</em></a></li>
                <li><a href="#tab3"><em>Update</em></a></li>
                <li><a href="#tab4"><em>Delete</em></a></li>
            </ul>
            <div class="yui-content">
                <s:form beanclass="${actionBean['class']}">
                    <div>
                        <h1>Create New User</h1>
                        <dl>
                            <dt>Name</dt>
                            <dd>
                                <s:text name="user.fname" value="First Name" />
                            </dd>
                            <dd>
                                <s:text name="user.lname" value="Last Name" />
                            </dd>
                        </dl>
                        <c:if test="${s:hasErrors(actionBean,'user.fname') or s:hasErrors(actionBean,'user.lname')}">
                            <dl>
                                <dt>&nbsp;</dt>
                                <dd>
                                    <s:errors field="user.fname" />
                                </dd>
                                <dd>
                                    <s:errors field="user.lname" />
                                </dd>
                            </dl>
                        </c:if>
                        <dl>
                            <dt>Username</dt>
                            <dd>
                                <s:text name="user.username" />
                            </dd>
                        </dl>
                        <c:if test="${s:hasErrors(actionBean,'user.username')}">
                            <dl>
                                <dt>&nbsp;</dt>
                                <dd>
                                    <s:errors field="user.username" />
                                </dd>
                            </dl>
                        </c:if>
                        <dl>
                            <dt>Password</dt>
                            <dd>
                                <s:password name="user.password" />
                            </dd>
                        </dl>
                        <c:if test="${s:hasErrors(actionBean,'user.password')}">
                            <dl>
                                <dt>&nbsp;</dt>
                                <dd>
                                    <s:errors field="user.password" />
                                </dd>
                            </dl>
                        </c:if>
                        <dl>
                            <dt>e-mail</dt>
                            <dd>
                                <s:text name="user.email" />
                            </dd>
                        </dl>
                        <c:if test="${s:hasErrors(actionBean,'user.email')}">
                            <dl>
                                <dt>&nbsp;</dt>
                                <dd>
                                    <s:errors field="user.email" />
                                </dd>
                            </dl>
                        </c:if>
                        <dl>
                            <dt>Phone</dt>
                            <dd>
                                <s:text name="user.phone" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>Role</dt>
                            <dd>
                                <select name="role">
                                    <option value="0">manager-script</option>
                                    <option value="1">manager-status</option>
                                    <option value="2">manager-gui</option>
                                    <option value="3">manager-jmx</option>
                                </select>
                            </dd>
                        </dl>
                        <dl>
                            <dt><s:submit name="save" value="Create User" /></dt>
                        </dl>
                    </div>
                </s:form>
                <div>
                    <h1>Read Users</h1>
                    <table id="users-list">
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach items="${actionBean.users}" var="user">
                            <c:set var="fullname" value="${user.fname} ${user.lname}" />
                            <tr>
                                <td>${fullname}</td><!-- name -->
                                <td>${user.username}</td><!-- username -->
                                <td>${user.email}</td><!-- email -->
                                <td>${user.phone}</td><!-- phone -->
                                <td></td><!-- role -->
                                <td><s:link event="update" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="update">
                                        <s:param name="id" value="${user.id}"/>Update</s:link> | <s:link event="delete" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="confirm" data-fullname="${fullname}" data-username="${user.username}"><s:param name="user.id" value="${user.id}"/>Delete</s:link></td>
                                </tr>                            
                        </c:forEach>

                    </table>
                </div>
                <div>
                    <h1>Update Users</h1>
                    <table id="users-update">
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                        <tr>
                            <td>Jon Doe</td>
                            <td>804.255.1212</td>
                            <td>jdoe@manager.org</td>
                            <td>jdoe</td>
                            <td>manager-script</td>
                            <td><s:link event="update" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="update">
                                    <s:param name="id" value="${user.id}"/>Update</s:link></td>
                            </tr>
                            <tr>
                                <td>Jane Doe</td>
                                <td>804.255.1212</td>
                                <td>janedoe@manager.org</td>
                                <td>janedoe</td>
                                <td>manager-gui</td>
                                <td><s:link event="update" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="update">
                                    <s:param name="id" value="${user.id}"/>Update</s:link></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <h1>Delete Users</h1>
                        <table id="users-delete">
                            <tr>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>Jon Doe</td>
                                <td>804.255.1212</td>
                                <td>jdoe@manager.org</td>
                                <td>jdoe</td>
                                <td>manager-script</td>
                                <td><s:link event="delete" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="confirm" data-fullname="${fullname}" data-username="${user.username}"><s:param name="user.id" value="${user.id}"/>Delete</s:link></td>
                            </tr>
                            <tr>
                                <td>Jane Doe</td>
                                <td>804.255.1212</td>
                                <td>janedoe@manager.org</td>
                                <td>janedoe</td>
                                <td>manager-gui</td>
                                <td><s:link event="delete" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="confirm" data-fullname="${fullname}" data-username="${user.username}"><s:param name="user.id" value="${user.id}"/>Delete</s:link></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </s:layout-component>
</s:layout-render>

