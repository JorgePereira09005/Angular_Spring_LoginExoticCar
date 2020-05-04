package jpmc.spring.LoginExoticCar.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;

import jpmc.spring.LoginExoticCar.entity.User;

//@CrossOrigin("http://localhost:4200")
@CrossOrigin(origins = "*", maxAge = 3600)
//@PreAuthorize("hasRole('USER')")
public interface UserRepository extends JpaRepository<User, Integer> {
	
	Optional<User> findByUsername(String userName);
	
	Boolean existsByUsername(String userName);
	
	Boolean existsByEmail(String email);

}
