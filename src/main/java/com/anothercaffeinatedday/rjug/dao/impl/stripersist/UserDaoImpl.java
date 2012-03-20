/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anothercaffeinatedday.rjug.dao.impl.stripersist;

import com.anothercaffeinatedday.rjug.dao.UserDao;
import com.anothercaffeinatedday.rjug.model.User;

/**
 *
 * @author tstone
 */
public class UserDaoImpl extends BaseDaoImpl<User,Integer>
    implements UserDao {

    @Override
    public User findByUsername(String username, User user) {
        return findBy("username",username,user);
    }
    
}
