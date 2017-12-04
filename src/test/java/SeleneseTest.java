/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import io.github.bonigarcia.wdm.ChromeDriverManager;
import java.util.concurrent.TimeUnit;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 *
 * @author raphael
 */
public class SeleneseTest {
    
   private static WebDriver driver;
    private static WebDriverWait wait;

    //@BeforeClass
    public static void setUpClass() throws Exception {

//         // Chrome usando o DriverManager do cara
        ChromeDriverManager.getInstance().setup();
        driver = new ChromeDriver();

//        // Chrome usando o driver diretamente
//        System.setProperty("webdriver.chrome.driver", "/home/rafael/Programas/webdrivers/chromedriver");
//        driver = new ChromeDriver();

//        // Firefox usando o DriverManager do cara e os Thread.sleep
//        FirefoxDriverManager.getInstance().setup();
//        driver = new FirefoxDriver();
        
//        // Firefox usando o driver diretamente e os Thread.sleep
//        System.setProperty("webdriver.gecko.driver", "/home/rafael/Programas/webdrivers/geckodriver");
//        System.setProperty("firefox.binary", "/usr/bin/firefox");
//        System.setProperty("firefox binary", "/usr/bin/firefox");
//        DesiredCapabilities c = DesiredCapabilities.firefox();
//        c.setCapability("binary", "/usr/bin/firefox");
//        driver = new FirefoxDriver(c);

//        // Opera
//        System.setProperty("webdriver.opera.driver", "/home/rafael/Programas/webdrivers/operadriver");
//        System.setProperty("opera.binary", "/usr/bin/opera");
//        DesiredCapabilities c = DesiredCapabilities.operaBlink();
//        c.setCapability("opera.binary", "/usr/bin/opera");
//        c.setCapability("binary", "/usr/bin/opera");
//        driver = new OperaDriver(c);

//        // Opera
//        System.setProperty("webdriver.chrome.driver", "/home/rafael/Programas/webdrivers/operadriver");    
//        System.setProperty("opera.binary", "/usr/bin/opera");
//        DesiredCapabilities c = DesiredCapabilities.chrome();
//        c.setCapability("opera.binary", "/usr/bin/opera");
//        c.setCapability("binary", "/usr/bin/opera");
//        driver = new ChromeDriver(c);

        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);  

        wait = new WebDriverWait(driver, 10L);  //segundos
	}


	//@Test
    public void testWikipedia() throws Exception {
        driver.get("http://localhost:8080/aplicacao/usuarios/login");

       WebElement elemento = driver.findElement(By.id("login"));
      
        elemento.sendKeys("adm");
        elemento = driver.findElement(By.id("pwd"));
        elemento.sendKeys("123");
        elemento.submit();
//        Thread.sleep(3000);  //pro firefox!
//        wait.until(ExpectedConditions.presenceOfElementLocated(By.id("someid")));
//        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("someid")));
//        wait.until(ExpectedConditions.elementToBeClickable(By.id("someid")));
//        wait.until(new ExpectedCondition<Boolean>() {
//            @Override
//            public Boolean apply(WebDriver d) {
//                return d.getTitle().toLowerCase().startsWith("cheese!");
//            }
//        });
//        elemento = driver.findElement(By.linkText("PlayStation 3"));
       
//        Thread.sleep(3000);  //pro firefox!
//        elemento = driver.findElement(By.id("firstHeading"));
        
    }


   // @AfterClass
    public static void tearDownClass() {
        if (driver != null) {
            driver.quit();
        }
        }
    
}
