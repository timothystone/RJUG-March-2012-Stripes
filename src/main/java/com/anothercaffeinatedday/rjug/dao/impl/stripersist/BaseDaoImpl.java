/**
 * *
 * Excerpted from "Stripes: and Java Web Development is Fun Again", published by The Pragmatic Bookshelf. Copyrights
 * apply to this code. It may not be used to create training material, courses, books, articles, and the like. Contact
 * us if you are in doubt. We make no guarantees that this code is fit for any purpose. Visit
 * http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
**
 */
package com.anothercaffeinatedday.rjug.dao.impl.stripersist;

import com.anothercaffeinatedday.rjug.dao.Dao;
import com.anothercaffeinatedday.rjug.model.User;
import org.stripesstuff.stripersist.Stripersist;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.persistence.NonUniqueResultException;
import javax.persistence.NoResultException;
import javax.persistence.Query;

public abstract class BaseDaoImpl<T, ID extends Serializable>
        implements Dao<T, ID> {

    private Class<T> entityClass;

    @SuppressWarnings("unchecked")
    public BaseDaoImpl() {
        entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    /*
     * methods...
     */

    @SuppressWarnings("unchecked")
    @Override
    public List<T> read() {
        return Stripersist.getEntityManager().createQuery("from " + entityClass.getName()).getResultList();
    }

    @Override
    public T read(ID id) {
        return Stripersist.getEntityManager().find(entityClass, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public void save(T object) {
        Stripersist.getEntityManager().persist(object);
    }

    @Override
    public void delete(T object) {
        Stripersist.getEntityManager().remove(object);
    }

    @Override
    public void commit() {
        Stripersist.getEntityManager().getTransaction().commit();
    }

    @SuppressWarnings("unchecked")
    public T findBy(String fieldName, Object value) {
        Query query = Stripersist.getEntityManager().createQuery(getQuery(fieldName, null)).setParameter(fieldName, value);
        return getSingleResult(query);
    }

    @SuppressWarnings("unchecked")
    public T findBy(String fieldName, Object value, User user) {
        Query query = Stripersist.getEntityManager().createQuery(getQuery(fieldName, user)).setParameter(fieldName, value).setParameter("user", user);
        return getSingleResult(query);
    }

    private String getQuery(String fieldName, User user) {
        String query =
                "from " + entityClass.getName() + " t "
                + "where t." + fieldName + " = :" + fieldName;
        if (user == null) {
            return query;
        }
        return query + " and t.user = :user";
    }

    @SuppressWarnings("unchecked")
    private T getSingleResult(Query query) {
        try {
            return (T) query.getSingleResult();
        } catch (NonUniqueResultException exc) {
            return (T) query.getResultList().get(0);
        } catch (NoResultException exc) {
            return null;
        }
    }
}
