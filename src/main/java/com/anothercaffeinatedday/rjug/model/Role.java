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
package com.anothercaffeinatedday.rjug.model;

/**
 *
 * @author tstone
 */
public class Role {

    private Integer id;
    private String rolename;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the rolename
     */
    public String getRolename() {
        return rolename;
    }

    /**
     * @param rolename the rolename to set
     */
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public enum Roles {
        GUI("manager-gui", 0),
        Script("manager-script", 1),
        Status("manager-status", 2),
        JMX("manager-jmx", 3);
        
        private String rolename;
        private Integer id;

        Roles(String rolename, Integer id) {
            this.rolename = rolename;
            this.id = id;
        }
        
        public String getRolename() {
            return rolename;
        }
        
        public Integer getId() {
            return id;
        }
    };
}
