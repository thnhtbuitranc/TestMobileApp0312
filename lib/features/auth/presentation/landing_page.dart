import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 600,
              decoration: const BoxDecoration(
                gradient: AppColors.sleepGradient,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.bedtime,
                        size: 100,
                        color: Colors.white,
                      ).animate().scale(delay: 200.ms),
                      const SizedBox(height: 32),
                      const Text(
                        'Nhắc nhở cùng ngủ sớm',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 400.ms),
                      const SizedBox(height: 16),
                      const Text(
                        'Xây dựng thói quen ngủ đúng giờ cùng bạn bè',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 600.ms),
                      const SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.go('/register'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                            ),
                            child: const Text('Bắt đầu ngay'),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: () => context.go('/login'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                            ),
                            child: const Text('Đăng nhập'),
                          ),
                        ],
                      ).animate().slideY(begin: 1, end: 0, delay: 800.ms),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => context.go('/admin-login'),
                        child: const Text(
                          'Admin Login',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ).animate().fadeIn(delay: 1000.ms),
                    ],
                  ),
                ),
              ),
            ),
            
            // Features Section
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const Text(
                    'Tính năng nổi bật',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  _buildFeatureCard(
                    context,
                    Icons.schedule,
                    'Đặt lịch ngủ',
                    'Tạo thói quen ngủ đúng giờ với lịch trình cá nhân hóa',
                    Colors.blue,
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    context,
                    Icons.groups,
                    'Ngủ cùng bạn bè',
                    'Tham gia nhóm và cùng nhau xây dựng thói quen tốt',
                    Colors.purple,
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    context,
                    Icons.bar_chart,
                    'Theo dõi thống kê',
                    'Xem biểu đồ và streak để duy trì động lực',
                    Colors.green,
                  ).animate().fadeIn(delay: 600.ms),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    context,
                    Icons.emoji_events,
                    'Huy hiệu & Thành tích',
                    'Mở khóa huy hiệu khi hoàn thành mục tiêu',
                    Colors.orange,
                  ).animate().fadeIn(delay: 800.ms),
                ],
              ),
            ),
            
            // CTA Section
            Container(
              padding: const EdgeInsets.all(48),
              color: AppColors.primary.withOpacity(0.1),
              child: Column(
                children: [
                  const Text(
                    'Sẵn sàng cải thiện giấc ngủ?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/register'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 20,
                      ),
                    ),
                    child: const Text('Tạo tài khoản miễn phí'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
