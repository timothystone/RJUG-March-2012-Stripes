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

import com.anothercaffeinatedday.rjug.model.User;
import java.util.List;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;

@UrlBinding("/Home.htm")
public class HomeActionBean extends BaseActionBean {

    private User user;

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

    public Resolution save() {
        userDao.save(user);
        userDao.commit();
        getContext().getMessages().add(
                new SimpleMessage("{0} has been saved.", user));
        return new RedirectResolution(HomeActionBean.class);
    }
    
    public Resolution cancel() {
        getContext().getMessages().add(
                new SimpleMessage("Action cancelled."));
        return new RedirectResolution(HomeActionBean.class);
    }    
    
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        return userDao.read();
    }
}