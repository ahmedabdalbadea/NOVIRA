import 'package:novira_app/core/models/mood_model.dart';

abstract class AssetsData {
  static const kLogo = "assets/images/logo.png";

  static const kMoodsList = [
    MoodModel(moodImage: "assets/images/happy.png", mood: "happyMood"),
    MoodModel(moodImage: "assets/images/Clam.png", mood: "calmMood"),
    MoodModel(moodImage: "assets/images/netural.png", mood: "neutralMood"),
    MoodModel(moodImage: "assets/images/sad.png", mood: "sadMood"),
    MoodModel(moodImage: "assets/images/anxious.png", mood: "anxiousMood"),
    MoodModel(moodImage: "assets/images/over.png", mood: "overwhelmedMood"),
  ];
}
