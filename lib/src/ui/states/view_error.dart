import 'package:flutter/material.dart';

class ViewError extends StatelessWidget {
  final String message;
  final String? title;
  final Function()? close;

  const ViewError({
    super.key,
    required this.message,
    this.title,
    this.close,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Text(message),
    );
  }
}
