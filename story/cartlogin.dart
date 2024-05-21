// Implement login/logout in your authentication logic
// For simplicity, I'm providing a basic example using a button.

// login_logout_button.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cartauth.dart';
class LoginLogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = context.watch<CartProvider>();

    return ElevatedButton(
      onPressed: () {
        if (cartProvider.isLoggedIn) {
          cartProvider.logout();
        } else {
          cartProvider.login();
        }
      },
      child: Text(cartProvider.isLoggedIn ? 'Logout' : 'Login'),
    );
  }
}
