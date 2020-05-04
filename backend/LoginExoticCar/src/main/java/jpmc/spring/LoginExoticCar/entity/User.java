package jpmc.spring.LoginExoticCar.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name="user",
	   uniqueConstraints = { 
			@UniqueConstraint(columnNames = "user_name"),
			@UniqueConstraint(columnNames = "email") 
		})
public class User {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id")
	public Integer id;
	
	@NotBlank
	@Size(max = 50)
	@Column(name="user_name")
	private String username;
	
	@NotBlank
	@Size(max = 50)
	@Email
	@Column(name="email")
	private String email;
	
	@NotBlank
	@Size(max = 68)
	@Column(name="password")
	private String password;
	
	@NotBlank
	@Size(max = 100)
	@Column(name="first_name")
	private String firstName;
	
	@NotBlank
	@Size(max = 100)
	@Column(name="last_name")
	private String lastName;
	
	@Size(max = 100)
	@Column(name="token")
	private String token;
	
	@OneToMany(cascade =  CascadeType.ALL, mappedBy = "postedBy")
	private Set<Post> posts;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(	name = "user_roles", 
				joinColumns = @JoinColumn(name = "user_id"), 
				inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<>();
	
	public User() {
		
	}

	public User(@NotBlank @Size(max = 50) String userName, @NotBlank @Size(max = 50) String firstName,
			@NotBlank @Size(max = 50) String lastName,
			@NotBlank @Size(max = 50) @Email String email,
			@NotBlank @Size(max = 68) String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = userName;
		this.email = email;
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	

}
