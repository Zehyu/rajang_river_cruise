
import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final int starCount;
  final bool isRated;
  final VoidCallback onStarTap;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.starCount,
    required this.isRated,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Cruise Name and Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Cruise Title
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Cruise Location
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Dynamic Star Rating Button
          OutlinedButton.icon(
            onPressed: onStarTap,
            icon: Icon(
              isRated ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            label: Text(
              '$starCount',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
