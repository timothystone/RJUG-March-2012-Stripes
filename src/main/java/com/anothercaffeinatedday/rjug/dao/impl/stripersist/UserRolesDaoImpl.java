/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anothercaffeinatedday.rjug.dao.impl.stripersist;

import com.anothercaffeinatedday.rjug.dao.UserRolesDao;
import com.anothercaffeinatedday.rjug.model.User;
import com.anothercaffeinatedday.rjug.model.UserRoles;

/**
 *
 * @author tstone
 */
public class UserRolesDaoImpl extends BaseDaoImpl<UserRoles,Integer>
    implements UserRolesDao {

    @Override
    public User[] findByUserame(String username) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
