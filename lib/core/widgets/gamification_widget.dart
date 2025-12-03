import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class GamificationWidget extends StatelessWidget {
  const GamificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).animate().fadeIn(),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildBadge(
                context,
                'Early Bird',
                Icons.wb_sunny,
                Colors.orange,
                true,
              ).animate().scale(delay: 100.ms),
              _buildBadge(
                context,
                '7 Day Streak',
                Icons.local_fire_department,
                Colors.red,
                true,
              ).animate().scale(delay: 200.ms),
              _buildBadge(
                context,
                '30 Days',
                Icons.star,
                Colors.amber,
                false,
              ).animate().scale(delay: 300.ms),
              _buildBadge(
                context,
                'Perfect Week',
                Icons.emoji_events,
                Colors.purple,
                false,
              ).animate().scale(delay: 400.ms),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    bool unlocked,
  ) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: unlocked ? color.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: unlocked ? color : Colors.grey,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: unlocked ? color : Colors.grey,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: unlocked ? null : Colors.grey,
              fontWeight: unlocked ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
