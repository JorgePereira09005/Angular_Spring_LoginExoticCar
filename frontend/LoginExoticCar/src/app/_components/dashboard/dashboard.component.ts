import { Component, OnInit } from '@angular/core';
import { TokenStorageService } from 'src/app/_services/token-storage.service';
import { UserService } from 'src/app/_services/user.service';
import { Post } from 'src/app/entity/post';
import { CarModel } from 'src/app/entity/car-model';
import { Router, ActivatedRoute } from '@angular/router';
import { identifierModuleUrl } from '@angular/compiler';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  returnUrl: string;

  carModels: CarModel[];
  content: string;
  isLoggedIn = false;
  posts: Post[];
  postedBy: string;

  constructor(private userService: UserService,
              private tokenStorage: TokenStorageService,
              private router: Router,
              private route: ActivatedRoute) {

  }

  ngOnInit() {

    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
    }

    this.userService.getCarModels().subscribe(
      data => {
        this.carModels = data;
      },
      err => {
        this.content = JSON.parse(err.error).message;
        console.log(err.error);
      }
    );

  }

  getCarPosts(carModelId: number) {
    return this.getCarPosts(carModelId).map(res => {
      return res.json();
    });
  }

  getPostedBy(postId: number) {
    this.userService.getPostedBy(postId).subscribe(
      data => {
        this.postedBy = data;
      }
    )
  }

  log(x: any) {
    console.log(x);
  }

}
