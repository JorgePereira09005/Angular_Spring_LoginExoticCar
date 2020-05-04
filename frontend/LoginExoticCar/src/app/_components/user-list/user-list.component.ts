import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/entity/user';
import { UserService } from 'src/app/_services/user.service';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  userList: User[];

  constructor(private userService: UserService) { }

  ngOnInit(): void {

    this.getUsers();

  }

  getUsers(){
    this.userService.getUsers().subscribe(
      data => {
        this.userList = data;
      }
    );
  }

}
