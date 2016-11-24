package com.mystore.service;

import com.mystore.domain.Product;
import java.util.List;
import java.util.Set;

public interface EveryOneService {
    /**
     * Receive grouped by category products.
     *
     * @return list of Products.
     */
    List<Product> getCategory();

    /**
     * Receive products by category.
     *
     * @param category name of category.
     * @return list of products.
     */
    List<Product> getProductByCategory(String category);

    /**
     * Receive products by session.
     *
     * @param idProducts product id
     * @return list of Products.
     */
    List<Product> getProductsBySession(Set<String> idProducts);

    /**
     * Remove from basket.
     *
     * @param removeId deleting product id.
     * @param productsId set of products id in basket.
     */
    void removeFromBasket(String removeId, Set<String> productsId);

    /**
     * Receive product by id.
     *
     * @param id product id.
     * @return product with certain id.
     */
    Product getProduct(long id);
}

