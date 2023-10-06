class OnboardingData {
  final String imagePath;
  final String title;
  final String description;
  final List<String> babyImage;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.babyImage,
  });
}

final List<String> babyImages = [
  "assets/images/baby_down.png",
  "assets/images/baby_top.png",
  "assets/images/baby_left.png",
  "assets/images/baby_right.png",
];
List<OnboardingData> onboardingDatas = [
  OnboardingData(
    imagePath: "assets/images/onboarding_first.png",
    title: "Welcome to a New Mothering Experince",
    description:
        "Now you can understand a lot about your new born, bukkle up for an experince you will always long for.",
    babyImage: babyImages,
  ),
  OnboardingData(
    imagePath: "assets/images/onbaording_second.png",
    title: "A Cry with Meaning",
    description:
        "Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.",
    babyImage: babyImages,
  ),
  OnboardingData(
    imagePath: "assets/images/third_onboarding.png",
    title: "Analytical Insight",
    description:
        "Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good dcisions",
    babyImage: babyImages,
  ),
  OnboardingData(
    imagePath: "assets/images/fourth_onboarding.png",
    title: "Happy Mom Happy Home",
    description:
        "Reduce you baby crying time whilst gettting your schedule back together by planning for time of cry activity and time of quite.",
    babyImage: babyImages,
  ),
];
