import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { CarModel } from '../entity/car-model';
import { Post } from '../entity/post';
import { User } from '../entity/user';

const API_URL = 'http://localhost:8080/api/';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

 

  getUsers(): Observable<User[]> {
    return this.http.get<GetResponseUsers>(API_URL + 'users').pipe
      (map (response => response._embedded.users) );
  }

  getCarModels(): Observable<CarModel[]> {
    return this.http.get<GetResponseCarModels>(API_URL + 'carModels', ).pipe
      (map (response => response._embedded.carModels) );
  }

  getCarModel(carId: number): Observable<CarModel> {
    return this.http.get<CarModel>(API_URL + `carModels/${carId}`);
  }

  getCarPosts(carModelId: number): Observable<Post[]> {
    return this.http.get<GetCarModelPosts>(API_URL + `carModels/${carModelId}/posts`)
      .pipe( map (response => response._embedded.posts) );
  }

  getPostedBy(postId: number): Observable<string> {
    const url = API_URL + `posts/${postId}/postedBy`;

    return this.http.get<GetPostedBy>(url)
      .pipe( map (response => response.userName));
  }

}

interface GetResponseCarModels{
  _embedded: {
    carModels: CarModel[];
  }
}

interface GetResponseUsers{
  _embedded: {
    users: User[];
  }
}

interface GetCarModelPosts {
  _embedded: {
    posts: Post[];
  }
}

interface GetPostedBy {
  userName: string;
}
