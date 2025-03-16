# Check if Angular CLI is installed
if (-not (Get-Command ng -ErrorAction SilentlyContinue)) {
    Write-Host "Angular CLI is not installed. Installing now..."
    npm install -g @angular/cli
}

# Define the project name and root folder
$projectName = "Frontend"
$rootFolder = "$PSScriptRoot\$projectName"

# Create the root folder
New-Item -ItemType Directory -Path $rootFolder -Force
Set-Location -Path $rootFolder

# Create a new Angular project
ng new $projectName --routing --style=css --skip-git
Set-Location -Path "$rootFolder\$projectName"

# Create folders
$folders = @("src/app/components", "src/app/services", "src/app/models", "src/app/guards", "src/app/interceptors")
foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force
}

# Generate components
$components = @("product-list", "product-detail", "cart", "order-history", "admin-dashboard")
foreach ($component in $components) {
    ng generate component components/$component
}

# Generate services
$services = @("product", "order", "auth")
foreach ($service in $services) {
    ng generate service services/$service
}

# Create models
@"
export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  quantity: number;
}
"@ | Out-File -FilePath "src/app/models/product.model.ts"

@"
export interface Order {
  id: number;
  productId: number;
  quantity: number;
  orderDate: Date;
}
"@ | Out-File -FilePath "src/app/models/order.model.ts"

@"
export interface User {
  id: number;
  username: string;
  password: string;
  role: string;
}
"@ | Out-File -FilePath "src/app/models/user.model.ts"

# Create guards
@"
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    const isLoggedIn = false; // Replace with actual authentication logic
    if (isLoggedIn) {
      return true;
    } else {
      this.router.navigate(['/login']);
      return false;
    }
  }
}
"@ | Out-File -FilePath "src/app/guards/auth.guard.ts"

# Create interceptors
@"
import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = 'sample-token'; // Replace with actual token logic
    const authReq = req.clone({
      setHeaders: { Authorization: `Bearer ${token}` }
    });
    return next.handle(authReq);
  }
}
"@ | Out-File -FilePath "src/app/interceptors/auth.interceptor.ts"

# Add Bootstrap for styling
npm install bootstrap

# Update angular.json to include Bootstrap CSS
(Get-Content -Path "angular.json") -replace '"styles": \["src/styles.css"\]', '"styles": ["src/styles.css", "node_modules/bootstrap/dist/css/bootstrap.min.css"]' | Set-Content -Path "angular.json"

# Run the frontend
ng serve