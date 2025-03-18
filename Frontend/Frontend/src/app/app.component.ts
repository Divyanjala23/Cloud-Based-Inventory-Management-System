import { Component } from '@angular/core';
import { NavbarComponent } from './components/Navbar/navbar.component';
import { RouterModule } from '@angular/router'; // Add this import

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  imports: [NavbarComponent, RouterModule], // Add RouterModule here
})
export class AppComponent {
  title = 'Inventory Management System';
}