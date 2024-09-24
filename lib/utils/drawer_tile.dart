import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({this.name, this.function, super.key, this.iconIs});
  final String? name;
  final VoidCallback? function;
  final Icon? iconIs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: InkWell(
        onTap: function,
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
