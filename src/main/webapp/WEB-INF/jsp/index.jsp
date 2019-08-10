<%@ include file="/WEB-INF/jsp/support/taglibs.jsp" %>

<s:layout-render name="/WEB-INF/jsp/layout.jsp" title="Tomcat Manager Management">
  <s:layout-component name="head">
    <script type="text/javascript">
      var Dom = YAHOO.util.Dom,
          Event = YAHOO.util.Event,
          Tabs = YAHOO.widget.TabView,
          SimpleDialog = YAHOO.widget.SimpleDialog,
          Connect = YAHOO.util.Connect,
          getHtmlById = function (el, id, tag) {
              var e;
              e = Dom.getElementBy(function (el) {
                  return (el.id === id);
              }, tag, el);
              return e.parentNode;
          };


      Event.onDOMReady(function (e) {
          var crud = new Tabs("crud"),
              users = 0;
          var deletes = Dom.getElementsByClassName("confirm");
          var updates = Dom.getElementsByClassName("update");

          var deleteYes = function () {
              //user confirms the deletion of this item;
              //this method would perform that deletion;
              this.hide();
          };
          var deleteNo = function () {
              //user cancels item deletion; this method
              //would handle the cancellation of the
              //process.
              this.hide();
          };
          var deleteButtons = [
              {text: "Delete User", handler: deleteYes},
              {text: "Cancel", handler: deleteNo, isDefault: true}
          ];

          var updateYes = function () {
              //user confirms the deletion of this item;
              //this method would perform that deletion;
              this.hide();
          };

          var updateNo = function () {
              //user cancels item deletion; this method
              //would handle the cancellation of the
              //process.
              this.hide();
          };

          var updateButtons = [
              {text: "Update User", handler: updateYes},
              {text: "Cancel", handler: updateNo, isDefault: true}
          ];

          var deletepanel = {
              cache: false,
              success: function (o) {
                  var tempDiv = document.createElement("div");
                  tempDiv.innerHTML = o.responseText;
                  var deleteDialog = new YAHOO.widget.Dialog(getHtmlById(tempDiv, "deleteForm", "form"), {
                      width: "40em",
                      fixedcenter: true,
                      modal: true,
                      visible: false,
                      draggable: false,
                      underlay: "none"

                  });
                  deleteDialog.cfg.queueProperty("buttons", deleteButtons);
                  deleteDialog.render(document.body);
                  deleteDialog.show();
              },
              failure: function (o) {
                  alert("failed to make connection");
              }
          };

          Event.on(deletes, "click", function (e) {
              Event.preventDefault(e);
              var xhr = Connect.asyncRequest('GET', this.href, deletepanel);
          });

          var updatepanel = {
              cache: false,
              success: function (o) {
                  var tempDiv = document.createElement("div");
                  tempDiv.innerHTML = o.responseText;
                  var updateDialog = new YAHOO.widget.Dialog(getHtmlById(tempDiv, "updateForm", "form"), {
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
              failure: function (o) {
                  alert("failed to make connection");
              }
          };

          Event.on(updates, "click", function (e) {
              Event.preventDefault(e);
              var xhr = Connect.asyncRequest('GET', this.href, updatepanel);
          });

          users = ${fn:length(actionBean["users"])};
          //  ${fn:length(actionBean.users)}
          if (users > 0) {
              crud.selectTab(1);
          }

          console.log(document.cookie);
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
              <s:select name="userRoles.rolename">
                <c:forEach items="${actionBean.roles}" var="role">
                  <s:option value="${role}" label="${role}" />
                </c:forEach>
              </s:select>
              </dd>
            </dl>
            <dl>
              <dt><s:submit name="save" value="Create User" class="" /></dt>
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
                <td>${fullname}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>manager-gui</td>
                <td><s:link event="update" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="update">
                <s:param name="uid" value="${user.id}"/>
                <s:param name="rid" value="${user.id}"/>
                Update</s:link> |
              <s:link event="delete" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="confirm">
                <s:param name="uid" value="${user.id}"/>
                <s:param name="rid" value="${user.id}"/>
                Delete</s:link></td>
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
            <c:forEach items="${actionBean.users}" var="user">
              <c:set var="fullname" value="${user.fname} ${user.lname}" />
              <c:set var="userRoles" value="${actionBean.userRoles}"/>
              <tr>
                <td>${fullname}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>manager-gui</td>
                <td><s:link event="update" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="update">
                <s:param name="uid" value="${user.id}"/>
                <s:param name="rid" value="${user.id}"/>
                Update</s:link></td>
              </tr>
            </c:forEach>
          </table>
        </div>
        <div>
          <h1>Delete Users</h1>
          <table id="users-delete">
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
              <c:set var="userRoles" value="${actionBean.userRoles}"/>
              <tr>
                <td>${fullname}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>manager-gui</td>
                <td><s:link event="delete" beanclass="com.anothercaffeinatedday.rjug.action.HomeActionBean" class="delete">
                <s:param name="uid" value="${user.id}"/>
                <s:param name="rid" value="${user.id}"/>Delete</s:link></td>
              </tr>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>
  </s:layout-component>

  <s:layout-component name="ft">
    <div class="yui-g">
      <div class="yui-g first">
        <div class="yui-u first">
          <h1>Capital One</h1>
            <ul>
              <li><a href="http://https://www.capitalonecareers.com/">Careers</a></li>
              <li><a href="https://www.facebook.com/capitalone/">Facebook</a></li>
              <li><a href="https://twitter.com/capitalone">Twitter</a></li>
            </ul>
        </div>
        <div class="yui-u">
          <h1>StackExchange</h1>
          <ul>
            <li><a href="http://stackoverflow.com/">Stack Overflow</a></li>
            <li><a href="http://serverfault.com/">Server Fault</a></li>
            <li><a href="http://blog.stackoverflow.com/2011/09/welcome-chaos/">CHAOS</a></li>
            <li><a href="http://rpg.stackexchange.com/">RPG</a></li>
          </ul>
        </div>
      </div>
      <div class="yui-g">
        <div class="yui-u">
          <h1>Tomcat</h1>
          <ul>
            <li><a href="http://tomcat.apache.org/">Home</a></li>
            <li>Realm HOW-TO</li>
          </ul>
        </div>
        <div class="yui-u first">
          <h1>Stripes</h1>
          <ul>
            <li><a href="http://www.stripesframework.org/">Home</a></li>
            <li><a href="http://pragprog.com/book/fdstr/stripes"><em>Stripes...</em> Book</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="yui-g fade"></div>
  </s:layout-component>

</s:layout-render>

