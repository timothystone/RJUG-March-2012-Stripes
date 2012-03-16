/*
 * Copyright (C) 2008-2012 Freddy Daoud
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. * 
 */

package com.anothercaffeinatedday.rjug.action;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;

@UrlBinding("/Home.htm")
public class HomeActionBean extends BaseActionBean {

    @DefaultHandler
    public Resolution view() {
        return new ForwardResolution("/WEB-INF/jsp/index.jsp");
    }
    
    public Resolution update() {
        return new ForwardResolution("/WEB-INF/jsp/update.jsp");
    }

    public Resolution delete() {
        return new ForwardResolution("/WEB-INF/jsp/delete.jsp");
    }
    
    public String getJavaVersion() {
        return System.getProperty("java.version");
    }

    public String getOsName() {
        return System.getProperty("os.name");
    }
}
