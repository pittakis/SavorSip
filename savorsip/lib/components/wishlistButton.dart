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
        backgroundColor: addedToWishlist ? Colors.green : Colors.deepPurple[500], // Change color based on state
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            addedToWishlist ? Icons.check : Icons.add,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            addedToWishlist ? "Added to Wishlist" : " Add to Wishlist   ",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}