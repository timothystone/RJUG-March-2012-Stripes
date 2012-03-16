/*
 * Copyright (C) 2012 Timothy Stone
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

package com.anothercaffeinatedday.rjug.dao.mock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.anothercaffeinatedday.rjug.dao.UserDao;
import com.anothercaffeinatedday.rjug.model.User;

/**
 * Mock implementation of the user DAO. This implementation does
 * not attempt to be efficient; rather, it serves the purposes of
 * providing a simple working DAO with no dependencies on libraries or
 * a database.
 */
public class MockUserDao implements UserDao {
    private List<User> list = new ArrayList<User>();
    private Map<Integer,User> map = new HashMap<Integer,User>();
    private int nextId = 1;

    @Override
    public List<User> read() {
        return list;
    }
    @Override
    public User read(Integer id) {
        return map.get(id);
    }
    @Override
    public void save(User user) {
        if (user != null) {
            if (user.getId() == null) {
                int id = nextId++;
                user.setId(id);
                list.add(user);
            }
            else {
                Integer id = user.getId();
                list.set(list.indexOf(map.get(id)), user);
            }
            map.put(user.getId(), user);
        }
    }
    @Override
    public void delete(Integer id) {
        User user = map.get(id);
        list.remove(user);
        map.remove(id);
    }

    private static final int FIRST_NAME   =  0;
    private static final int LAST_NAME    =  1;
    private static final int USERNAME     =  2;
    private static final int PASSWORD     =  3;
    private static final int EMAIL        =  4;
    private static final int PHONE_NUMBER =  5;

    private static final String[] RAW_DATA = {
        "Sophie,Hunter,shunter,shunter,sh@com.anothercaffeinatedday.rjug.org,555-555-8440",
        "Daniel,Greene,dgreene,dgreene,dg@com.anothercaffeinatedday.rjug.org,555-555-7763",
        "Jen,Ballou,jballou,jballou,jb@com.anothercaffeinatedday.rjug.org,555-555-6495",
        "Sammy,Blair,sblair,sblair,sb@com.anothercaffeinatedday.rjug.org,555-555-9592",
    };

    private MockUserDao() {
        try {
            for (String string : RAW_DATA) {
                save(createUserFromString(string));
            }
        }
        catch (Exception exc) {
            throw new RuntimeException(exc);
        }
    }

    private static MockUserDao instance = new MockUserDao();
    public static MockUserDao getInstance() { return instance; }

    private User createUserFromString(String string)
        throws Exception
    {
        String[] fields = string.split(",");

        User user = new User();

        user.setFname(fields[FIRST_NAME]);
        user.setLname(fields[LAST_NAME]);
        user.setUsername(fields[USERNAME]);
        user.setPassword(fields[PASSWORD]);
        user.setEmail(fields[EMAIL]);
        user.setPhone(fields[PHONE_NUMBER]);

        return user;
    }
}
