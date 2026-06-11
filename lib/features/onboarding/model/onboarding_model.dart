import 'package:event_hup/core/helpers/app_assets.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

const List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: 'Explore Upcoming and\nNearby Events',
    description:
        'In publishing and graphic design, Lorem is\na placeholder text commonly',
    imagePath: Assets.imagesPngOnboarding1,
  ),
  OnboardingModel(
    title: 'Web Have Modern Events\nCalendar Feature',
    description:
        'In publishing and graphic design, Lorem is\na placeholder text commonly',
    imagePath: Assets.imagesPngOnboarding2,
  ),
  OnboardingModel(
    title: 'To Look Up More Events or\nActivities Nearby By Map',
    description:
        'In publishing and graphic design, Lorem is\na placeholder text commonly',
    imagePath: Assets.imagesPngOnboarding3,
  ),
];
