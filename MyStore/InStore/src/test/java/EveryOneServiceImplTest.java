import com.mystore.domain.Product;
import com.mystore.repository.ProductRepository;
import com.mystore.service.EveryOneService;
import com.mystore.service.Impl.EveryOneServiceImpl;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import java.util.*;

import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({"classpath:repo-context.xml"})
public class EveryOneServiceImplTest {

    @Mock
    ProductRepository productRepository;

    @InjectMocks
    EveryOneService everyOneService = new EveryOneServiceImpl();

    @Test
    public void testRemoveFromBasketSuccess() {
        Set<String> products = new HashSet<>(Arrays.asList("1", "2", "3", "4"));
        Set<String> expectedProducts = new HashSet<>(Arrays.asList("2", "3", "4"));

        everyOneService.removeFromBasket("1", products);
        Assert.assertEquals(expectedProducts, products);
    }

    @Test
    public void testGetProductsBySession() {
        Product product1 = new Product("Nokia",12.0, "Телефон",1);
        Product product2 = new Product("Lenovo",12.0, "Ноутбуки",1);

        when(productRepository.getProduct(1)).thenReturn(product1);
        when(productRepository.getProduct(2)).thenReturn(product2);

        List actualProducts = everyOneService.getProductsBySession(new HashSet(Arrays.asList("1","2")));
        List expectedProducts = new ArrayList(Arrays.asList(product1,product2));
        Assert.assertEquals(actualProducts, expectedProducts);
    }

    @Test
    public void testGetProductByCategory(){
        Product product1=new Product("Asus",12.0,"Ноутбуки",1);
        Product product2=new Product("Lenovo",12.0,"Ноутбуки",1);

        when(productRepository.getProductByCategoty("Ноутбуки")).thenReturn(new ArrayList(Arrays.asList(product1,product2)));

        List actualProducts=everyOneService.getProductByCategory("Ноутбуки");
        List expectedProducts=new ArrayList(Arrays.asList(product1,product2));
        Assert.assertEquals(actualProducts, expectedProducts);
    }

    @Test
    public void testGetCategory(){
        Product product1=new Product("Asus",12.0,"Ноутбуки",1);
        Product product2=new Product("Lenovo",12.0,"Ноутбуки",1);

        when(productRepository.getProductCategories()).thenReturn(new ArrayList(Arrays.asList(product1,product2)));

        List actualProducts=everyOneService.getCategory();
        List expectedProducts=new ArrayList(Arrays.asList(product1,product2));
        Assert.assertEquals(actualProducts, expectedProducts);
    }
}
