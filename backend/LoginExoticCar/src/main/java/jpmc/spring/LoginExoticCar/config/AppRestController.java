//package jpmc.spring.LoginExoticCar.config;
//
//import java.util.List;
//import java.util.Optional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import jpmc.spring.LoginExoticCar.dao.CarModelRepository;
//import jpmc.spring.LoginExoticCar.dao.PostRepository;
//import jpmc.spring.LoginExoticCar.dao.UserRepository;
//import jpmc.spring.LoginExoticCar.entity.CarModel;
//import jpmc.spring.LoginExoticCar.entity.Post;
//import jpmc.spring.LoginExoticCar.entity.User;
//
//@CrossOrigin(origins = "*", maxAge = 3600)
//@RestController
//@RequestMapping("/api")
//public class AppRestController {
//
//	@Autowired
//	CarModelRepository carModelRepository;
//	
//	@Autowired
//	PostRepository postRepository;
//	
//	@Autowired
//	UserRepository userRepository;
//	
//	@GetMapping("/users")
//	public List<User> getUsers() {
//		return this.userRepository.findAll();
//	}
//	
//	@GetMapping("/users/{id}")
//	public Optional<User> getUser(@PathVariable("id") int id) {
//		return this.userRepository.findById(id);
//	}
//	
//	@GetMapping("/carModels")
//	public List<CarModel> getCarModels() {
//		return this.carModelRepository.findAll();
//	}
//	
//	@GetMapping("/carModels/{id}")
//	public Optional<CarModel> getCarModel(@PathVariable("id") int id) {
//		return this.carModelRepository.findById(id);
//	}
//	
//	@GetMapping("/posts")
//	public List<Post> getPosts() {
//		return this.postRepository.findAll();
//	}
//	
//	@GetMapping("/carModels/{carId}/posts")
//	public List<Post> getCarModelPosts(@PathVariable("carId") int id) {
//		return this.postRepository.findByCarModel(id);
//	}
//	
////	@GetMapping("/posts/{postId}/postedBy")
////	public User getPostedBy(@PathVariable("postId") int id) {
////		
////	}
//	
//	
//}
