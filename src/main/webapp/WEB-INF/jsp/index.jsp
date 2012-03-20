<%@ include file="/WEB-INF/jsp/support/taglibs.jsp" %>

<s:layout-render name="/WEB-INF/jsp/layout.jsp" title="Tomcat Manager Management">
    <s:layout-component name="head">      
        <script type="text/javascript">
            var Dom = YAHOO.util.Dom,
            Event = YAHOO.util.Event,
            Tabs = YAHOO.widget.TabView,
            SimpleDialog = YAHOO.widget.SimpleDialog;     

            Event.onDOMReady(function(e) {
                var crud = new Tabs("crud"),
                users = 0;    
                var deletes = Dom.getElementsByClassName("confirm");
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

                Event.on(deletes, "click", function(e) {
                    Event.preventDefault(e);
                    deleteModal.show();
                });
                
                users = ${fn:length(actionBean.users)};
                //  ${fn:length(actionBean.users)}
                if(users > 0) {
                    crud.selectTab(1);
                } 
            });
        </script>
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
                    <div><s:hidden name="user" /></div>
                    <div>
                        <h1>Create New User</h1>
                        <dl>
                            <dt>Name</dt>
                            <dd>
                                <s:text name="user.fname" value="First" />
                            </dd>
                            <dd>
                                <s:text name="user.lname" value="Last" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>Username</dt>
                            <dd>
                                <s:text name="user.username" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>Password</dt>
                            <dd>
                                <s:password name="user.password" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>e-mail</dt>
                            <dd>
                                <s:text name="user.email" />
                            </dd>
                        </dl>
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
                            <td><a href="update.html">Update</a> | <a href="delete.html" class="confirm" data-fullname="" data-username="">Delete</a></td>
                        </tr>
                        <tr>
                            <td>Jane Doe</td>
                            <td>804.255.1212</td>
                            <td>janedoe@manager.org</td>
                            <td>janedoe</td>
                            <td>manager-gui</td>
                            <td><a href="update.html">Update</a> | <a href="delete.html" class="confirm" data-fullname="" data-username="">Delete</a></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <h1>Update Users</h1>
                    <table id="users-update">
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
                            <td><a href="update.html">Update</a></td>
                        </tr>
                        <tr>
                            <td>Jane Doe</td>
                            <td>804.255.1212</td>
                            <td>janedoe@manager.org</td>
                            <td>janedoe</td>
                            <td>manager-gui</td>
                            <td><a href="update.html">Update</a></td>
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
                            <td><a href="delete.html" class="confirm" data-fullname="" data-username="">Delete</a></td>
                        </tr>
                        <tr>
                            <td>Jane Doe</td>
                            <td>804.255.1212</td>
                            <td>janedoe@manager.org</td>
                            <td>janedoe</td>
                            <td>manager-gui</td>
                            <td><a href="delete.html" class="confirm" data-fullname="" data-username="">Delete</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </s:layout-component>
</s:layout-render>

