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

<s:layout-definition>

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>${title}</title>
            <meta name="generator" content="BBEdit 10.1">
            <link rel="stylesheet" href="${contextPath}/css/reset-fonts-grids.css" type="text/css">
            <link rel="stylesheet" href="${contextPath}/css/base-min.css" type="text/css">
            <link rel="stylesheet" href="${contextPath}/css/tabview/assets/skins/sam/tabview.css" type="text/css">
            <link rel="stylesheet" href="${contextPath}/css/container/assets/skins/sam/container.css" type="text/css">
            <link rel="stylesheet" href="${contextPath}/css/button/assets/skins/sam/button.css" type="text/css">
            <link rel="stylesheet" href="${contextPath}/css/rjug.css" type="text/css">
            <script type="text/javascript" src="${contextPath}/js/yahoo-dom-event.js"></script>
            <script type="text/javascript" src="${contextPath}/js/element-min.js"></script>
            <script type="text/javascript" src="${contextPath}/js/button-min.js"></script>
            <script type="text/javascript" src="${contextPath}/js/container-min.js"></script>
            <script type="text/javascript" src="${contextPath}/js/tabview-min.js"></script>
            <s:layout-component name="head" />
        </head>
        <body class="yui-skin-sam">
            <div id="tmm-doc">
                <div id="hd">
                    <h1>Tomcat Manager Management</h1>
                    <s:layout-component name="hd" />
                </div>
                <div id="bd">
                    <s:layout-component name="bd" />
                </div>
                <div id="ft">
                    <s:layout-component name="ft">
                        <div class="yui-g">
                            <div class="yui-g first">
                                <div class="yui-u first">
                                    <h1>ICF Ironworks</h1>
                                    <ul>
                                        <li><a href="http://www.ironworks.com/Pages/default.aspx">Home</a></li>
                                        <li><a href="http://www.facebook.com/pages/Glen-Allen-VA/Ironworks-Consulting/33928148675">Facebook</a></li>
                                        <li><a href="http://twitter.com/iwx">Twitter</a></li>
                                        <li><a href="http://www.ironworks.com/Company/Careers/Pages/Careers.aspx">Careers</a></li>
                                    </ul>
                                </div>
                                <div class="yui-u">
                                    <h1>StackExchange</h1>
                                    <ul>
                                        <li><a href="http://stackoverflow.com/">Stack Overflow</a></li>
                                        <li><a href="http://serverfault.com/">Server Fault</a></li>
                                        <li><a href="http://blog.stackoverflow.com/2011/09/welcome-chaos/">CHAOS</a></li>
                                        <li><a href="http://rpg.stackexchange.com/">RPG Beta</a></li>
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
                </div>
            </div>
        </body>
    </html>

</s:layout-definition>