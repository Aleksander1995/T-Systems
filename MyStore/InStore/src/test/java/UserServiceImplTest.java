import com.mystore.repository.ClientRepository;
import com.mystore.service.Impl.UserServiceImpl;
import com.mystore.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.test.context.ContextConfiguration;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration({"classpath:repo-context.xml"})
public class UserServiceImplTest {

    @Mock
    ClientRepository clientRepository;

    @InjectMocks
    UserService userService=new UserServiceImpl();

    @Test
    public void testExistUserPositive(){
        when(clientRepository.existsUser("san-ya26@inbox.ru")).thenReturn(true);
        boolean actual=userService.existUser("san-ya26@inbox.ru");

        Assert.assertTrue(actual);
    }

    @Test
    public void testExistUserNegative(){
        when(clientRepository.existsUser("san-ya26@inbox.ru")).thenReturn(false);
        boolean actual=userService.existUser("san-ya26@inbox.ru");

        Assert.assertFalse(actual);
    }
}
