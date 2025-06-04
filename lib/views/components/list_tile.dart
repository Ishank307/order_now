import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({super.key, required this.active});
  final bool active;
  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.active ? Colors.redAccent : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          foregroundColor: Colors.white,
          fixedSize: Size(100, 50),
        ),

        child: Text("Food", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
