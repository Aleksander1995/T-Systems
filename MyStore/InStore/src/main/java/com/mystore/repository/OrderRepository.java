package com.mystore.repository;

import com.mystore.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o from Order  o where id=:id")
    Order getOrder(@Param("id")long id);
}
