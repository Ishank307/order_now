import 'package:flutter/material.dart';
import 'package:order_now/views/pages/cart.dart';

class OrderNowButtom extends StatelessWidget {
  const OrderNowButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Cart()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFEF2A39),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: Colors.white,
        fixedSize: Size(180, 50),
      ),
      child: Text("Order Now", style: TextStyle(fontSize: 20)),
    );
  }
}
