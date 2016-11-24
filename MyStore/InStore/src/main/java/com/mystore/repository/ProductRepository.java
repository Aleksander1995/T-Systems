package com.mystore.repository;

import com.mystore.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query("SELECT p from Product p group by p.category order by p.category desc")
    List<Product> getProductCategories();

    @Query("SELECT p from Product p where p.category=:category")
    List<Product> getProductByCategoty(@Param("category") String category);

    @Query("select p from Product p where p.id=:id")
    Product getProduct(@Param("id") long productsId);

    @Query("select new com.mystore.domain.Product(p.productName,p.price, p.category,p.sellCounter) from Product p ORDER BY p.sellCounter desc")
    List<Product> getTopProduct();
}
