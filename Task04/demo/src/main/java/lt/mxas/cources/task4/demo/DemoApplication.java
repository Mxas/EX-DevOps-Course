package lt.mxas.cources.task4.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Test comment.
 */
@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        TestSpot.print();
        SpringApplication.run(DemoApplication.class, args);

    }

}
