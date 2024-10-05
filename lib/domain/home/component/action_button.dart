import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final bool isSelected;

  const ActionButton(
      {super.key, required this.onPressed, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: isSelected ? Theme.of(context).disabledColor : Theme.of(context).primaryColor,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
