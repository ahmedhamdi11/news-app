import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.leadingIcon,
  });

  final Widget title;
  final IconData leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        title: title,
        leading: Icon(
          leadingIcon,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onTap: onTap,
      ),
    );
  }
}
