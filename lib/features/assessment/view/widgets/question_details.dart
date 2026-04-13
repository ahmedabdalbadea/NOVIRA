import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class QuestionDetails extends StatefulWidget {
  const QuestionDetails({super.key});

  @override
  State<QuestionDetails> createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  int currentQuestion = 0;

  final List<QuestionModel> questions = [
    QuestionModel(
      description: "Assessing core interest levels and daily engagement.",
      question:
          "Over the last 2 weeks, how often have you been bothered by little interest or pleasure in doing things?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Evaluating overall mood and emotional outlook.",
      question: "How often have you felt down, depressed, or hopeless lately?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Monitoring physical recovery and biological rhythms.",
      question:
          "Have you had trouble falling or staying asleep, or sleeping too much?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Measuring vitality and physical energy levels.",
      question: "How often have you felt tired or had little energy?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Observing changes in appetite as a stress response.",
      question: "Have you noticed a poor appetite or overeating?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Analyzing self-perception and cognitive distortions.",
      question:
          "How often have you felt bad about yourself—or that you are a failure or have let yourself or your family down?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Assessing cognitive focus and mental clarity.",
      question:
          "Have you had trouble concentrating on things, such as reading the newspaper or watching television?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Identifying psychomotor changes visible to others.",
      question:
          "Have you been moving or speaking so slowly that other people could have noticed? Or the opposite—being so fidgety or restless?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Screening for severe negative thoughts (Clinical Safety).",
      question:
          "How often have you had thoughts that you would be better off dead, or of hurting yourself in some way?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
    QuestionModel(
      description: "Measuring the functional impact on daily life.",
      question:
          "If you checked off any problems, how difficult have these problems made it for you to do your work or take care of things at home?",
      answers: [
        "Not difficult at all",
        "Somewhat difficult",
        "Very difficult",
        "Extremely difficult",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(
      body: Column(
        children: [
          Text(
            questions[currentQuestion].description,
            style: Styles.textStyle16.copyWith(color: kDesTextColor),
          ),
          const SizedBox(height: 16),
          Text(questions[currentQuestion].question, style: Styles.textStyle20),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
