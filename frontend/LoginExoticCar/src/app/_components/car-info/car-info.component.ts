import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/_services/user.service';
import { ActivatedRoute } from '@angular/router';
import { CarModel } from 'src/app/entity/car-model';
import { Post } from 'src/app/entity/post';
import { DashboardComponent } from '../dashboard/dashboard.component';

@Component({
  selector: 'app-car-info',
  templateUrl: './car-info.component.html',
  styleUrls: ['./car-info.component.css']
})
export class CarInfoComponent implements OnInit {

  carModel: CarModel;

   //string represents the user who posted the comment
   mapPosts: Map<Post, string> = new Map<Post, string>(); 

  constructor(private userService: UserService,
              private route: ActivatedRoute) { 
                
  }

  ngOnInit(): void {

    this.route.paramMap.subscribe( () => {
      this.getCarModel();

      setTimeout( ()=> {
        this.getCarPosts();
      }, 200 )

    });

  }

  getCarModel() {
    const carId: number = +this.route.snapshot.paramMap.get('carId');

    this.userService.getCarModel(carId).subscribe( data=> {
      this.carModel = data;
    });
  }

  getCarPosts() {
    const carId: number = +this.route.snapshot.paramMap.get('carId');

    this.userService.getCarPosts(carId).subscribe( data=> {
      
      /* let posts: Post[];

      //populate the map keys with the posts
      for(let tempPost of data) {
        posts.push(tempPost);
      } */

      //use the id of the posts to get the name of the poster
      for(let tempPost of data) {
        this.getPostedBy(tempPost);
      }

    });
  }

  getPostedBy(post: Post) {
    this.userService.getPostedBy(post.id).subscribe( postedBy => {
      this.mapPosts.set(post, postedBy);
    });
  }

}
