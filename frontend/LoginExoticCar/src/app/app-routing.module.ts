import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { RegisterComponent } from './_components/register/register.component';
import { LoginComponent } from './_components//login/login.component';
import { HomeComponent } from './_components//home/home.component';
import { ProfileComponent } from './_components//profile/profile.component';
import { DashboardComponent } from './_components/dashboard/dashboard.component';
import { AuthGuard } from 'src/_helpers/auth.guard';
import { UserListComponent } from './_components/user-list/user-list.component';
import { CarInfoComponent } from './_components/car-info/car-info.component';


const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'carinfo', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'carinfo/:carId', component: CarInfoComponent, canActivate: [AuthGuard] },
  { path: 'userlist', component: UserListComponent, canActivate: [AuthGuard] },
  { path: 'register', component: RegisterComponent },
  { path: 'profile', component: ProfileComponent },
  { path: '', redirectTo: 'home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
