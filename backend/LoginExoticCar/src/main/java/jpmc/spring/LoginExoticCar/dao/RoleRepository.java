package jpmc.spring.LoginExoticCar.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.CrossOrigin;

import jpmc.spring.LoginExoticCar.entity.ERole;
import jpmc.spring.LoginExoticCar.entity.Role;


//@CrossOrigin("http://localhost:4200")
@CrossOrigin(origins = "*", maxAge = 3600)
public interface RoleRepository extends JpaRepository<Role, Integer> {

	Optional<Role> findByName(ERole name);
}
