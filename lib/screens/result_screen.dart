import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import '../models/question.dart';

// ResultScreen displays the user's score and
// performance after completing a quiz
class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final Category category; // ADD category field

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.category,
  });

  // Function to determine the message and icon based on the score


  @override
  Widget build(BuildContext context) {
    double percentage = (score / total) * 100;
    String message;
    IconData icon;
    Color color;

    if (percentage == 100) {
      message = 'Perfect Score! 🏆';
      icon = Icons.star;
      color = Colors.green;
    } else if (percentage >= 80) {
      message = 'Excellent! 🌟';
      icon = Icons.emoji_events;
      color = Colors.blue;
    } else if (percentage >= 60) {
      message = 'Good Job! 👍';
      icon = Icons.thumb_up;
      color = Colors.orange;
    } else if (percentage >= 40) {
      message = 'Keep Learning! 📚';
      icon = Icons.book;
      color = Colors.orange.shade300;
    } else {
      message = 'Try Again! 💪';
      icon = Icons.replay;
      color = Colors.red;
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade100,
              Colors.purple.shade50,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Category Name TO BE DISPLAYED
                    Text(
                      '📚 ${category.name}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Icon
                    Icon(
                      icon,
                      size: 80,
                      color: color,
                    ),

                    const SizedBox(height: 20),

                    // Message to user based on performance
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Score showing the number
                    // of correct answers out of total questions
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '$score / $total',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '${percentage.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Buttons to go back to home or retry the quiz
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Home Button
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                                  (route) => false,
                            );
                          },
                          icon: const Icon(Icons.home),
                          label: const Text('Home'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // Retry Button for the same category
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  category: category,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.replay),
                          label: const Text('Try Again'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}