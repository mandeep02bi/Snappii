class OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

const List<OnboardingData> onboardingPages = [
  OnboardingData(
    title: 'Earn from Content',
    subtitle:
        'Paid campaigns, creator services, and direct brand opportunities to grow your income faster.',
    imagePath: 'assets/images/image 1.png',
  ),
  OnboardingData(
    title: 'Grow with AI',
    subtitle:
        'Smart tools, trends, analytics, and automation designed for faster creator and brand growth.',
    imagePath: 'assets/images/image 1 (1).png',
  ),
  OnboardingData(
    title: 'Safe & Powerful',
    subtitle:
        'Secure payments, trusted collaborations, verified users, and everything in one powerful platform.',
    imagePath: 'assets/images/image 1 (2).png',
  ),
];
