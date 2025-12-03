import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  int _reminderMinutes = 30;
  String _selectedSound = 'Gentle Bell';
  bool _enableNotifications = true;
  bool _enableVibration = true;

  final List<int> _reminderOptions = [15, 30, 60, 90];
  final List<String> _soundOptions = [
    'Gentle Bell',
    'Morning Birds',
    'Ocean Waves',
    'Soft Piano',
    'Wind Chimes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Reminder Time',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Remind me before sleep time:'),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    children: _reminderOptions.map((minutes) {
                      final isSelected = _reminderMinutes == minutes;
                      return ChoiceChip(
                        label: Text('$minutes min'),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _reminderMinutes = minutes;
                          });
                        },
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : null,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ).animate().slideX(begin: 0.2, end: 0, delay: 200.ms),
          const SizedBox(height: 24),
          Text(
            'Notification Sound',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: _soundOptions.map((sound) {
                return RadioListTile<String>(
                  title: Text(sound),
                  value: sound,
                  groupValue: _selectedSound,
                  onChanged: (value) {
                    setState(() {
                      _selectedSound = value!;
                    });
                  },
                  activeColor: AppColors.primary,
                  secondary: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      // TODO: Play sound preview
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Playing $sound...')),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ).animate().slideX(begin: 0.2, end: 0, delay: 400.ms),
          const SizedBox(height: 24),
          Text(
            'Preferences',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Enable Notifications'),
                  subtitle: const Text('Receive sleep reminders'),
                  value: _enableNotifications,
                  onChanged: (value) {
                    setState(() {
                      _enableNotifications = value;
                    });
                  },
                  activeColor: AppColors.primary,
                  secondary: const Icon(Icons.notifications_active),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Enable Vibration'),
                  subtitle: const Text('Vibrate on notification'),
                  value: _enableVibration,
                  onChanged: (value) {
                    setState(() {
                      _enableVibration = value;
                    });
                  },
                  activeColor: AppColors.primary,
                  secondary: const Icon(Icons.vibration),
                ),
              ],
            ),
          ).animate().slideX(begin: 0.2, end: 0, delay: 600.ms),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings saved successfully!'),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Save Settings'),
          ).animate().slideY(begin: 1, end: 0, delay: 700.ms),
        ],
      ),
    );
  }
}
