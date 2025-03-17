import { Injectable } from '@angular/core';
import { Product } from '../models/product.model';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cartItems: { product: Product; quantity: number }[] = [];

  constructor() {}

  addToCart(product: Product, quantity: number = 1): void {
    const existingItem = this.cartItems.find(
      (item) => item.product.id === product.id
    );
    if (existingItem) {
      existingItem.quantity += quantity;
    } else {
      this.cartItems.push({ product, quantity });
    }
  }

  removeFromCart(productId: number): void {
    this.cartItems = this.cartItems.filter(
      (item) => item.product.id !== productId
    );
  }

  getCartItems(): { product: Product; quantity: number }[] {
    return this.cartItems;
  }

  clearCart(): void {
    this.cartItems = [];
  }
}