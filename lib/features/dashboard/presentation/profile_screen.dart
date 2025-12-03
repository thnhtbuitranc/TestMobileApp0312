import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/providers/theme_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final notificationsEnabled = ref.watch(notificationsEnabledProvider);
    final soundEnabled = ref.watch(soundEnabledProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ).animate().scale(),
            const SizedBox(height: 16),
            Text(
              'Sleepy User',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Settings'),
            const SizedBox(height: 8),
            _buildSettingTile(
              context,
              ref,
              'Notifications',
              Icons.notifications,
              notificationsEnabled,
              (val) => ref.read(notificationsEnabledProvider.notifier).state = val,
            ).animate().slideX(begin: 0.1, end: 0),
            _buildSettingTile(
              context,
              ref,
              'Sound',
              Icons.volume_up,
              soundEnabled,
              (val) => ref.read(soundEnabledProvider.notifier).state = val,
            ).animate().slideX(begin: 0.1, end: 0),
            _buildSettingTile(
              context,
              ref,
              'Dark Mode',
              Icons.dark_mode,
              isDarkMode,
              (val) => ref.read(themeModeProvider.notifier).toggleTheme(),
            ).animate().slideX(begin: 0.1, end: 0),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Account'),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.error),
              title: const Text('Logout', style: TextStyle(color: AppColors.error)),
              onTap: () => context.go('/login'),
              tileColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ).animate().slideX(begin: 0.1, end: 0, delay: 400.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildSettingTile(
    BuildContext context,
    WidgetRef ref,
    String title,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: SwitchListTile(
        secondary: Icon(icon, color: AppColors.primary),
        title: Text(title),
        value: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
      ),
    );
  }
}
