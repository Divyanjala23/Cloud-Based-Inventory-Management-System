import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http'; // Updated import for HttpClient
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common'; // Import CommonModule for feature modules
import { RouterModule } from '@angular/router'; // Ensure RouterModule is imported

import { AppRoutingModule } from './app-routing.module'; // Import AppRoutingModule to configure routes
import { AppComponent } from './app.component';

import { ProductListComponent } from './components/product-list/product-list.component';
import { ProductDetailComponent } from './components/product-detail/product-detail.component';
import { CartComponent } from './components/cart/cart.component';
import { OrderHistoryComponent } from './components/order-history/order-history.component';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { NavbarComponent } from './components/Navbar/navbar.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/registration/register.component';
import { AuthInterceptor } from './interceptors/auth.interceptor'; // Importing your interceptor

@NgModule({
  declarations: [
    AppComponent,
    ProductListComponent,
    ProductDetailComponent,
    CartComponent,
    OrderHistoryComponent,
    AdminDashboardComponent,
    NavbarComponent,
    LoginComponent,
    RegisterComponent,
  ],
  imports: [
    BrowserModule,
    CommonModule, // Make sure it's included for directives like *ngIf
    RouterModule, // Make sure RouterModule is included for routing
    AppRoutingModule, // Import routing module for route setup
    FormsModule,
  ],
  providers: [
    provideHttpClient(withInterceptorsFromDi()), // Use the new method to add interceptors
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
