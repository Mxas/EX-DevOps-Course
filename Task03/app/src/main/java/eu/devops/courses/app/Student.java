package eu.devops.courses.app;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "students")
public class Student {

	@Id
	private Long id;
	private String name;
	private Integer age;
}
