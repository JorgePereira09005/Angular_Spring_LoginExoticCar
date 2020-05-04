package jpmc.spring.LoginExoticCar.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;

import jpmc.spring.LoginExoticCar.entity.Post;

//@PreAuthorize("hasRole('USER')")
@PreAuthorize("isAuthenticated()")
@CrossOrigin(origins = "*", maxAge = 3600)
public interface PostRepository extends JpaRepository<Post, Integer> {
	

}
