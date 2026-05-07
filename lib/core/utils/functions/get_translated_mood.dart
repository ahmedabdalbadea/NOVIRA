import 'package:flutter/material.dart';
import 'package:novira_app/generated/l10n.dart';

String getTranslatedMood(BuildContext context, String moodKey) {
  switch (moodKey) {
    case "happyMood":
      return S.of(context).happyMood;
    case "calmMood":
      return S.of(context).calmMood;
    case "neutralMood":
      return S.of(context).neutralMood;
    case "sadMood":
      return S.of(context).sadMood;
    case "anxiousMood":
      return S.of(context).anxiousMood;
    case "overwhelmedMood":
      return S.of(context).overwhelmedMood;
    default:
      return moodKey;
  }
}
