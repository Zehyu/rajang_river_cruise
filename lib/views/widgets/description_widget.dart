
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Description Title
          Text(
            'About the Destination',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Description Paragraph
          Text(
            description,
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
