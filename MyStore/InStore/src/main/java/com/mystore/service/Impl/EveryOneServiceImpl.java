package com.mystore.service.Impl;

import com.mystore.domain.Product;
import com.mystore.repository.ProductRepository;
import com.mystore.service.EveryOneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class EveryOneServiceImpl implements EveryOneService {
    @Autowired
    ProductRepository productRepository;

    /**
     * @see EveryOneService {@link #getCategory()}
     */
    @Transactional
    @Override
    public List<Product> getCategory() {
        return productRepository.getProductCategories();
    }

    /**
     * @see EveryOneService {@link #getProductByCategory(String)}
     */
    @Transactional
    @Override
    public List<Product> getProductByCategory(String category){
        return productRepository.getProductByCategoty(category);
    }

    /**
     * @see  EveryOneService {@link #getProductsBySession(Set)}
     */
    @Transactional
    @Override
    public List<Product> getProductsBySession(Set<String> productId){
        List<Product> products=new ArrayList<Product>();
        for (String id : productId) {
            products.add(productRepository.getProduct(Long.parseLong(id)));
        }
        return products;
    }

    /**
     *@see EveryOneService {@link #removeFromBasket(String, Set)}
     */
    @Transactional
    @Override
    public void removeFromBasket(String removeId, Set<String> productId){
        for (String id : productId) {
            if(removeId.equals(id)){
                productId.remove(id);
                break;
            }
        }
    }

    /**
     *@see EveryOneService {@link #getProduct(long)}
     */
    @Override
    @Transactional
    public Product getProduct(long id){
        return productRepository.getProduct(id);
    }
}
