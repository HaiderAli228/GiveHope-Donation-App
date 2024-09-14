import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({this.name, this.function, super.key, this.iconIs});
  final String? name;
  final VoidCallback? function;
  final Icon? iconIs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
        child: ListTile(
          leading: iconIs,
          title: Text(
            name ?? "Nothing",
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),
    );
  }
}
