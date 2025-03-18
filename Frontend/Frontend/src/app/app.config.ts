import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http'; // Add this import


import { routes } from './app.routes';
import { provideClientHydration, withEventReplay } from '@angular/platform-browser';

export const appConfig: ApplicationConfig = {
  // Provide HttpClient here
  providers: [provideZoneChangeDetection({ eventCoalescing: true }),  provideHttpClient(),provideRouter(routes), provideClientHydration(withEventReplay())]
};
