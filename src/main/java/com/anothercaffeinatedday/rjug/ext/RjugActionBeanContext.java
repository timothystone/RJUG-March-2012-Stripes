/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anothercaffeinatedday.rjug.ext;

import com.anothercaffeinatedday.rjug.dao.UserDao;
import com.anothercaffeinatedday.rjug.dao.impl.stripersist.UserDaoImpl;
import com.anothercaffeinatedday.rjug.model.User;
import net.sourceforge.stripes.action.ActionBeanContext;

/**
 *
 * @author tstone
 */
public class RjugActionBeanContext extends ActionBeanContext {

    private static final String USER = "user";
    private UserDao userDao = new UserDaoImpl();

    public void setUser(User user) {
        setCurrent(USER, user.getId());
    }

    public User getUser() {
        Integer userId = getCurrent(USER, null);
        return userDao.read(userId);
    }

    protected void setCurrent(String key, Object value) {
        getRequest().getSession().setAttribute(key, value);
    }

    @SuppressWarnings("unchecked")
    protected <T> T getCurrent(String key, T defaultValue) {
        T value = (T) getRequest().getSession().getAttribute(key);
        if (value == null) {
            value = defaultValue;
            setCurrent(key, value);
        }
        return value;
    }
}
