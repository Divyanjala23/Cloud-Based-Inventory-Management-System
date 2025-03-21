import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = 'sample-token'; // Replace with actual token logic
    const authReq = req.clone({
      setHeaders: { Authorization: Bearer  }
    });
    return next.handle(authReq);
  }
}
