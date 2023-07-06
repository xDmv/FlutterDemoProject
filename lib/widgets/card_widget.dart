import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.title,
    this.description,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String? description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: description != null,
              child: Text(
                description ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text('Детальніше ...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
