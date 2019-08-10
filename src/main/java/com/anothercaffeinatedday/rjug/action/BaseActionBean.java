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

import com.anothercaffeinatedday.rjug.ext.RjugActionBeanContext;
import com.anothercaffeinatedday.rjug.dao.UserDao;
import com.anothercaffeinatedday.rjug.dao.UserRolesDao;
import com.anothercaffeinatedday.rjug.dao.impl.stripersist.UserDaoImpl;
import com.anothercaffeinatedday.rjug.dao.impl.stripersist.UserRolesDaoImpl;
import com.anothercaffeinatedday.rjug.model.User;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;

public abstract class BaseActionBean implements ActionBean {
    private RjugActionBeanContext context;

    @Override
    public RjugActionBeanContext getContext() {
        return context;
    }
    
    @Override
    public void setContext(ActionBeanContext context) {
        this.context = (RjugActionBeanContext) context;
    }
    
    protected UserDao userDao = new UserDaoImpl();
    protected UserRolesDao userRolesDao = new UserRolesDaoImpl();
}
