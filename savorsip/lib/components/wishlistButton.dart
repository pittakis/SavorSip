import 'package:flutter/material.dart';

class WishlistButton extends StatefulWidget {
  @override
  _WishlistButtonState createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool addedToWishlist = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          addedToWishlist = !addedToWishlist;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200] // Change color based on state
      ),
      child: Icon(
        addedToWishlist ? Icons.bookmark_remove : Icons.bookmark_add,
        color: addedToWishlist ?  Colors.red : Colors.green,
      ),
    );
  }
}