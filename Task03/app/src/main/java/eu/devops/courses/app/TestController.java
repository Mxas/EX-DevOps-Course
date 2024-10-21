package eu.devops.courses.app;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@Value("${demo.test-config}")
	private String testConfig;

	@Value("${DEVOPS}")
	private String testEnvironmentVariable;

	@GetMapping
	public String test() {
		return "Test controller Mindaugas 2024. "
				+ "Config 1: " + testConfig + ". "
				+ "Environment Variable: " + testEnvironmentVariable + ".";
	}

}
