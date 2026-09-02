import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

// QuizScreen is a StatefulWidget that displays a quiz based on
// the selected category. It manages the
// current question, score, and answer state.
class QuizScreen extends StatefulWidget {
  final Category category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

// _QuizScreenState manages the state of the QuizScreen widget.
class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  int? selectedAnswerIndex;
  String feedbackMessage = '';

// question list is initialized in initState to ensure it
// is set up when the widget is created.

  @override
  void initState() {
    super.initState();
    questions = widget.category.questions.toList()..shuffle();
  }

// checkAnswer checks if the selected answer is correct
// and updates the score and feedback message accordingly.
  void checkAnswer(int selectedIndex) {
    if (isAnswered) return;

    setState(() {
      isAnswered = true;
      selectedAnswerIndex = selectedIndex;

      if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
        feedbackMessage = '✅ Correct! Good job!';
      } else {
        feedbackMessage = '❌ Wrong! The correct answer'
            ' is: ${questions[currentQuestionIndex].options[questions[currentQuestionIndex].correctAnswerIndex]}';
      }
    });
  }

// nextQuestion moves to the next question in the quiz
// or navigates to the result screen if all questions have been answered.
  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        isAnswered = false;
        selectedAnswerIndex = null;
        feedbackMessage = '';
      } else {
        // All questions answered - navigate to result screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              total: questions.length,
              category: widget.category,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        // Display category name and question number in app bar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.category.icon} ${widget.category.name}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        backgroundColor: widget.category.color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.category.color.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: widget.category.color,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 20),

            // Question Number
            Text(
              'Question ${currentQuestionIndex + 1}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            // Question Text
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // List of Answer Options
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  bool isCorrect = index == question.correctAnswerIndex;
                  bool isSelected = index == selectedAnswerIndex;

                  // Determine background color based on answer state
                  Color? bgColor;
                  if (isAnswered) {
                    if (isCorrect) {
                      bgColor = Colors.green.shade100;
                    } else if (isSelected && !isCorrect) {
                      bgColor = Colors.red.shade100;
                    } else {
                      bgColor = Colors.white;
                    }
                  } else {
                    bgColor = Colors.white;
                  }

                  // Determine border color based on answer state
                  Color? borderColor;
                  if (isAnswered) {
                    if (isCorrect) {
                      borderColor = Colors.green;
                    } else if (isSelected && !isCorrect) {
                      borderColor = Colors.red;
                    } else {
                      borderColor = Colors.grey.shade300;
                    }
                  } else {
                    borderColor = Colors.grey.shade300;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: isAnswered ? null : () => checkAnswer(index),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: borderColor,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Option letter (A, B, C, D)
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: isAnswered
                                    ? (isCorrect
                                    ? Colors.green
                                    : (isSelected && !isCorrect
                                    ? Colors.red
                                    : Colors.grey.shade300))
                                    : Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    color: isAnswered && (isCorrect || (isSelected && !isCorrect))
                                        ? Colors.white
                                        : Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),

                            // Option text
                            Expanded(
                              child: Text(
                                question.options[index],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: isAnswered
                                      ? (isCorrect
                                      ? Colors.green.shade800
                                      : (isSelected && !isCorrect
                                      ? Colors.red.shade800
                                      : Colors.grey.shade600))
                                      : Colors.black87,
                                  fontWeight: isAnswered && isCorrect
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),

                            // Correct/Incorrect icons
                            if (isAnswered && isCorrect)
                              const Icon(Icons.check_circle, color: Colors.green),
                            if (isAnswered && isSelected && !isCorrect)
                              const Icon(Icons.cancel, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Fact Card - Shows interesting fact after answering
            if (isAnswered)
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.category.color.withOpacity(0.2),
                      widget.category.color.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: widget.category.color.withOpacity(0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.category.color.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: widget.category.color,
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '💡 Did you know?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: widget.category.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      question.fact,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

            // Feedback Message - Shows correct/incorrect
            if (isAnswered)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: selectedAnswerIndex == question.correctAnswerIndex
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedAnswerIndex == question.correctAnswerIndex
                        ? Colors.green
                        : Colors.red,
                    width: 2,
                  ),
                ),
                child: Text(
                  feedbackMessage,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: selectedAnswerIndex == question.correctAnswerIndex
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // Next Button - Only active after answering
            ElevatedButton(
              onPressed: isAnswered ? nextQuestion : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isAnswered ? widget.category.color : Colors.grey.shade300,
                foregroundColor: isAnswered ? Colors.white : Colors.grey.shade500,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'See Results 📊'
                    : 'Next Question ➡️',
              ),
            ),
          ],
        ),
      ),
    );
  }
}