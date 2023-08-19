
class OnboardingData {
final String imagePath;
final String title;
final String description;
final String babyTopImage;
final String babyBottomImage;
final String babyleftImage;
final String babyRightImage;

  OnboardingData({
  required this.imagePath, 
  required this.title, 
  required this.description,
  required this.babyTopImage,
  required this.babyBottomImage,
  required this.babyRightImage,
  required this.babyleftImage,
  });


}

List <OnboardingData> onboardingDatas = [
  OnboardingData(
    imagePath: "assets/images/onboarding_first.png", 
    title: "Welcome to a New Mothering Experince", 
    description: "Now you can understand a lot about your new born, bukkle up for an experince you will always long for.",
    babyTopImage: "assets/images/first_baby_top.png",
    babyBottomImage: "assets/images/first_baby_down.png",
    babyRightImage: "assets/images/first_baby_right.png",
    babyleftImage: "assets/images/first_baby_left.png"
    ),

   OnboardingData(
    imagePath: "assets/images/onbaording_second.png", 
    title: "A Cry with Meaning", 
    description: "Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.",
    babyTopImage: "assets/images/second_baby_top.png",
    babyBottomImage: "assets/images/second_baby_bottom.png",
    babyRightImage: "assets/images/second_baby_right.png",
    babyleftImage: "assets/images/second_baby_left.png"
     ),

     OnboardingData(
    imagePath: "assets/images/third_onboarding.png", 
    title: "Analytical Insight", 
    description: "Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good dcisions",
    babyTopImage: "assets/images/third_baby_top.png",
    babyBottomImage: "assets/images/third_baby_bottom.png",
    babyRightImage: "assets/images/third_baby_right.png",
    babyleftImage: "assets/images/third_baby_left.png",
    ),

     OnboardingData(
    imagePath: "assets/images/fourth_onboarding.png", 
    title: "Happy Mom Happy Home", 
    description: "Reduce you baby crying time whilst gettting your schedule back together by planning for time of cry activity and time of quite.",
    babyTopImage: "assets/images/fourth_baby_top.png",
    babyBottomImage: "assets/images/fourth_baby_bottom.png",
    babyRightImage: "assets/images/fourth_baby_right.png",
    babyleftImage: "assets/images/fourth_baby_left.png",
    ),

];