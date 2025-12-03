import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class GroupRankingsScreen extends StatelessWidget {
  const GroupRankingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rankings = [
      {'rank': 1, 'name': 'Alice', 'streak': 15, 'avatar': Icons.person},
      {'rank': 2, 'name': 'Bob', 'streak': 12, 'avatar': Icons.person_outline},
      {'rank': 3, 'name': 'Charlie', 'streak': 10, 'avatar': Icons.person},
      {'rank': 4, 'name': 'You', 'streak': 8, 'avatar': Icons.account_circle, 'isYou': true},
      {'rank': 5, 'name': 'David', 'streak': 7, 'avatar': Icons.person_outline},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Rankings'),
      ),
      body: Column(
        children: [
          // Top 3 Podium
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildPodium(rankings[1], 2, 120).animate().slideY(begin: 1, delay: 200.ms),
                _buildPodium(rankings[0], 1, 150).animate().slideY(begin: 1, delay: 100.ms),
                _buildPodium(rankings[2], 3, 100).animate().slideY(begin: 1, delay: 300.ms),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Members',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Chip(
                  label: const Text('22:00 Sleep Squad'),
                  avatar: const Icon(Icons.bedtime, size: 16),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rankings.length,
              itemBuilder: (context, index) {
                final member = rankings[index];
                final isYou = member['isYou'] == true;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isYou ? AppColors.primary.withOpacity(0.1) : null,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getRankColor(member['rank'] as int),
                      child: Text(
                        '#${member['rank']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      member['name'] as String,
                      style: TextStyle(
                        fontWeight: isYou ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text('${member['streak']} day streak'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          '${member['streak']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().slideX(begin: 0.2, delay: ((index + 5) * 100).ms);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodium(Map<String, dynamic> member, int rank, double height) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          member['avatar'] as IconData,
          size: rank == 1 ? 48 : 40,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          member['name'] as String,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: rank == 1 ? 16 : 14,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: _getRankColor(rank),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                rank == 1 ? Icons.emoji_events : Icons.military_tech,
                color: Colors.white,
                size: rank == 1 ? 32 : 24,
              ),
              const SizedBox(height: 4),
              Text(
                '${member['streak']} days',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return AppColors.primary;
    }
  }
}
