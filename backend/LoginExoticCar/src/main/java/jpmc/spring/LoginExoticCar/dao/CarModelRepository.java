package jpmc.spring.LoginExoticCar.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;

import jpmc.spring.LoginExoticCar.entity.CarModel;

//@CrossOrigin("http://localhost:4200")
@CrossOrigin(origins = "*", maxAge = 3600)
//@PreAuthorize("hasRole('USER')")
@PreAuthorize("isAuthenticated()")
public interface CarModelRepository extends JpaRepository<CarModel, Integer> {
	
}
