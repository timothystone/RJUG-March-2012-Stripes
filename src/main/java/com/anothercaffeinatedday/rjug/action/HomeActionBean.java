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
import com.anothercaffeinatedday.rjug.model.UserRoles;
import java.util.List;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.EmailTypeConverter;
import net.sourceforge.stripes.validation.LocalizableError;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;

@UrlBinding("/Home.htm")
public class HomeActionBean extends BaseActionBean {

    @ValidateNestedProperties({
      @Validate(field="fname", required=true, on="save", maxlength=32),
      @Validate(field="lname", required=true, on="save", maxlength=32),
      @Validate(field="email", required=true, on="save", converter=EmailTypeConverter.class),
      @Validate(field="username", required=true, on="save", maxlength=16),
      @Validate(field="password", required=true, on="save", minlength=6, maxlength=32),
      @Validate(field="phone", maxlength=16)         
    })
    private User user;
    private UserRoles userRoles;
    private Integer id;

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
        System.out.println("saving...");
        userRoles = getUserRoles();
        userRoles.setUsername(user.getUsername());
        userDao.save(user);
        userRolesDao.save(userRoles);
        userDao.commit();
        getContext().getMessages().add(
                new SimpleMessage("{0} has been saved.", user));
        return new RedirectResolution(HomeActionBean.class);
    }
    
    @DontValidate
    public Resolution cancel() {
        return new RedirectResolution(HomeActionBean.class);
    }    
    
    public User getUser() {
        if(id != null) {
            return userDao.read(id);
        }
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public UserRoles getUserRoles() {
        return this.userRoles;
    }
    
    public void setUserRoles(UserRoles userRoles) {
        this.userRoles = userRoles;
    }
    
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public List<User> getUsers() {
        return userDao.read();
    }
    
    @ValidationMethod(on="save")
    public void validateUniqueUsername(ValidationErrors errors) {
         String username = user.getUsername();
        if (userDao.findByUsername(username) != null) {
            errors.add("user.username",
              new SimpleError("{1} is already in use.", username));
        }    
    }
    
    @ValidationMethod(on="save")
    public void validateFirstAndLastName(ValidationErrors errors) {
        String fname = user.getFname(), lname= user.getLname();
        if ("First Name".equals(fname)) {
            errors.add("user.fname",
              new SimpleError("Please enter a first, or given, name."));
        }    
        if ("Last Name".equals(lname)) {
            errors.add("user.lname",
              new SimpleError("Please enter a lastname (or surname)."));
        }
    }
}