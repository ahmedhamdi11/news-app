import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
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
    return ListTile(
      title: title,
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onTap: onTap,
    );
  }
}
