import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key});

  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {
  String? _currentlyPlaying;
  double _volume = 0.5;
  int _timerMinutes = 30;

  final List<Map<String, dynamic>> _musicCategories = [
    {
      'category': 'Nature Sounds',
      'items': [
        {'name': 'Rain', 'icon': Icons.water_drop, 'duration': '60 min'},
        {'name': 'Ocean Waves', 'icon': Icons.waves, 'duration': '45 min'},
        {'name': 'Forest', 'icon': Icons.forest, 'duration': '50 min'},
        {'name': 'Thunder', 'icon': Icons.flash_on, 'duration': '40 min'},
      ],
    },
    {
      'category': 'White Noise',
      'items': [
        {'name': 'White Noise', 'icon': Icons.graphic_eq, 'duration': '∞'},
        {'name': 'Pink Noise', 'icon': Icons.equalizer, 'duration': '∞'},
        {'name': 'Brown Noise', 'icon': Icons.show_chart, 'duration': '∞'},
      ],
    },
    {
      'category': 'Relaxing Music',
      'items': [
        {'name': 'Piano', 'icon': Icons.piano, 'duration': '35 min'},
        {'name': 'Meditation', 'icon': Icons.self_improvement, 'duration': '30 min'},
        {'name': 'Lullaby', 'icon': Icons.music_note, 'duration': '25 min'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Music & Sounds'),
      ),
      body: Column(
        children: [
          // Now Playing Card
          if (_currentlyPlaying != null)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Now Playing',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentlyPlaying!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.pause_circle, size: 48, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentlyPlaying = null;
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.stop_circle, size: 48, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentlyPlaying = null;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.volume_down, color: Colors.white),
                      Expanded(
                        child: Slider(
                          value: _volume,
                          onChanged: (value) {
                            setState(() {
                              _volume = value;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.white30,
                        ),
                      ),
                      const Icon(Icons.volume_up, color: Colors.white),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Auto-stop:', style: TextStyle(color: Colors.white70)),
                      DropdownButton<int>(
                        value: _timerMinutes,
                        dropdownColor: AppColors.primary,
                        style: const TextStyle(color: Colors.white),
                        items: [15, 30, 45, 60].map((minutes) {
                          return DropdownMenuItem(
                            value: minutes,
                            child: Text('$minutes min'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _timerMinutes = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ).animate().slideY(begin: -0.5, end: 0),
          
          // Music Categories
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _musicCategories.length,
              itemBuilder: (context, index) {
                final category = _musicCategories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        category['category'],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: category['items'].length,
                      itemBuilder: (context, itemIndex) {
                        final item = category['items'][itemIndex];
                        return _buildMusicCard(item);
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ).animate().fadeIn(delay: (index * 200).ms);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMusicCard(Map<String, dynamic> item) {
    final isPlaying = _currentlyPlaying == item['name'];
    return InkWell(
      onTap: () {
        setState(() {
          _currentlyPlaying = isPlaying ? null : item['name'];
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: isPlaying
              ? AppColors.primary.withOpacity(0.2)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPlaying ? AppColors.primary : Colors.grey.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'],
              size: 40,
              color: isPlaying ? AppColors.primary : Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              item['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPlaying ? AppColors.primary : null,
              ),
            ),
            Text(
              item['duration'],
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
