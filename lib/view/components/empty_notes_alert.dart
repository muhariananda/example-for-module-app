import 'package:flutter/material.dart';

class EmptyNotesAlert extends StatelessWidget {
  const EmptyNotesAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.inbox_rounded,
          color: Colors.grey,
          size: 100,
        ),
        SizedBox(height: 8),
        Text(
          'Notes is empty',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
