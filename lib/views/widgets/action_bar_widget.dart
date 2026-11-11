
import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  const ActionBarWidget({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // CALL Button
              _buildActionButton(
                context,
                Icons.call,
                'CALL',
                onCall,
              ),

              // ROUTE Button
              _buildActionButton(
                context,
                Icons.directions,
                'ROUTE',
                onRoute,
              ),

              // SHARE Button
              _buildActionButton(
                context,
                Icons.share,
                'SHARE',
                onShare,
              ),
            ],
          ),

          const Divider(),
        ],
      ),
    );
  }

  // Reusable Action Button
  Widget _buildActionButton(
      BuildContext context,
      IconData icon,
      String label,
      VoidCallback onPressed,
      ) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 6),

          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
