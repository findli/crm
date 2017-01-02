package ui;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class LoginPage {
    private static final String DOMAIN_PORT = "http://localhost:8080";
    By usernameElementLocator = By.id("email");
    By passwordElementLocator = By.id("password");
    By loginElementLocator = By.cssSelector("input[type=submit]");
    By loginOutElementLocator = By.cssSelector("input[type=submit]");
    private WebDriver driver;

    @Before
    public void setUp() {
        System.setProperty("webdriver.gecko.driver", "/Users/miiix/Documents/geckodriver");
        this.driver = new FirefoxDriver();

        driver.navigate().to(DOMAIN_PORT);
        // Check that we're on the right page.
        if (!"Login".equals(driver.getTitle())) {
            // Alternatively, we could navigate to the login page, perhaps logging out first
            throw new IllegalStateException("This is not the login page");
        }
    }

    @After
    public void tearDown() {
        driver.close();
        driver.quit();
    }

    public LoginPage typeUsername(String username) {
        driver.findElement(usernameElementLocator).sendKeys(username);

        // Return the current page object as this action doesn't navigate to a page represented by another PageObject
        return this;
    }

    public void typePassword(String password) {
        driver.findElement(passwordElementLocator).sendKeys(password);

        // Return the current page object as this action doesn't navigate to a page represented by another PageObject
    }

    // The login page allows the user to submit the login form
    public void submitLogin() {
        // This is the only place that submits the login form and expects the destination to be the home page.
        // A seperate method should be created for the instance of clicking login whilst expecting a login failure.
        driver.findElement(loginElementLocator).submit();

        // Return a new page object representing the destination. Should the login page ever
        // go somewhere else (for example, a legal disclaimer) then changing the method signature
        // for this method will mean that all tests that rely on this behaviour won't compile.
//        return new HomePage();
    }

    @Test
    public void submitLoginExpectingFailure() {
        // given
        WebDriverWait webDriverWait = new WebDriverWait(driver, 10);
        webDriverWait.until(ExpectedConditions.elementToBeClickable(loginElementLocator));

        // when
        typeUsername("random" + Math.random());
        typePassword("random" + Math.random());
        driver.findElement(loginElementLocator).submit();

        // then
        assertEquals(driver.getCurrentUrl(), DOMAIN_PORT + "/userValidator");
        assertTrue(driver.getPageSource().contains("Wrong user/password"));
    }

    @Test
    public void logoutUser() {
        // given
        WebDriverWait webDriverWait = new WebDriverWait(driver, 10);
        webDriverWait.until(ExpectedConditions.elementToBeClickable(loginOutElementLocator));

        // when
        driver.get("/");
        driver.findElement(loginOutElementLocator).click();

        // then
        assertEquals(driver.getCurrentUrl(), DOMAIN_PORT + "/user-logout");
    }
    @Test
    // Conceptually, the login page offers the user the service of being able to "log into"
    // the application using a user name and password.
    public void loginAs() {
        // given
        // you wait to load
        WebDriverWait webDriverWait = new WebDriverWait(driver, 10);
        webDriverWait.until(ExpectedConditions.elementToBeClickable(loginElementLocator));

        // when
        // The PageObject methods that enter username, password & submit login have already defined and should not be repeated here.
        typeUsername("user1");
        typePassword("password1");
        submitLogin();

        // then
        assertEquals(driver.getCurrentUrl(), DOMAIN_PORT + "/userValidator");
        assertTrue(driver.getPageSource().contains("You have logged in."));
    }
}
