import { Component, OnInit } from '@angular/core';
import { UserService } from '../../_services/user.service';
import { TokenStorageService } from 'src/app/_services/token-storage.service';
import { CarModel } from 'src/app/entity/car-model';
import { Post } from 'src/app/entity/post';
import { ThrowStmt } from '@angular/compiler';
import { timeout } from 'rxjs/operators';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private tokenStorage: TokenStorageService,
              private router: Router,
              private route: ActivatedRoute) {}


  ngOnInit() {

  }

}
