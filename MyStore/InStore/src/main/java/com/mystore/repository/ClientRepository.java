package com.mystore.repository;

import com.mystore.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<User, Long> {

    @Query("SELECT c FROM User c where c.email=:email")
    User getUser(@Param("email") String email);

    @Query(value = "select case when (count(u) > 0) then true else false end  from User u where u.email=:email")
    boolean existsUser(@Param("email")String email);

    @Query(value = "SELECT new com.mystore.domain.User(c.name,c.surname,c.email,c.payCounter ) FROM User c where c.authority='ROLE_USER' ORDER BY c.payCounter desc")
    List<User> getTopUsers();
}
