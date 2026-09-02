import 'package:flutter/material.dart';

// Represents a single quiz question with its options, correct answer, and an interesting fact.
class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String fact;

// Constructor for creating a new Question instance.
  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.fact,
  });
}

// Represents a quiz category containing a name, icon, color, and a list of questions.
class Category {
  final String name;
  final String icon;
  final Color color;
  final List<Question> questions;

// Constructor for creating a new Category instance.
  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.questions,
  });
}

// Returns a list of predefined quiz categories, each containing a set of questions.
// Add questions to each category with
// !!AI-generated!! facts for each question.!!!
List<Category> getCategories() {
  return [
    // ==================== GEOGRAPHY CATEGORY (10 Questions) ====================
    Category(
      name: 'Geography',
      icon: '🌍',
      color: Colors.green,
      questions: [
        Question(
          question: 'What is the capital of France?',
          options: ['London', 'Paris', 'Berlin', 'Madrid'],
          correctAnswerIndex: 1,
          fact: '🗼 Paris is called the "City of Light". It has the Eiffel Tower, built in 1889!',
        ),
        Question(
          question: 'Which country has the most people?',
          options: ['USA', 'India', 'China', 'Indonesia'],
          correctAnswerIndex: 2,
          fact: '👥 China has about 1.4 billion people. India is close behind with about 1.4 billion too!',
        ),
        Question(
          question: 'What is the largest ocean on Earth?',
          options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
          correctAnswerIndex: 3,
          fact: '🌊 The Pacific Ocean is the largest, covering about 30% of Earth\'s surface!',
        ),
        Question(
          question: 'What is the smallest country in the world?',
          options: ['Monaco', 'Vatican City', 'San Marino', 'Liechtenstein'],
          correctAnswerIndex: 1,
          fact: '🇻🇦 Vatican City is the smallest country, only 0.44 square kilometers! It\'s inside Rome, Italy.',
        ),
        Question(
          question: 'Which is the longest river in the world?',
          options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
          correctAnswerIndex: 1,
          fact: '🌊 The Nile River is about 6,650 km long. It flows through 11 countries in Africa!',
        ),
        Question(
          question: 'What is the capital of Japan?',
          options: ['Seoul', 'Beijing', 'Tokyo', 'Bangkok'],
          correctAnswerIndex: 2,
          fact: '🗾 Tokyo is the capital of Japan. It\'s the most populated metropolitan area in the world with over 37 million people!',
        ),
        Question(
          question: 'Which continent has the most countries?',
          options: ['Asia', 'Africa', 'Europe', 'South America'],
          correctAnswerIndex: 1,
          fact: '🌍 Africa has 54 countries, the most of any continent. Nigeria is the most populated African country.',
        ),
        Question(
          question: 'What is the driest continent on Earth?',
          options: ['Africa', 'Australia', 'Antarctica', 'Asia'],
          correctAnswerIndex: 2,
          fact: '❄️ Antarctica is the driest continent. It\'s also the coldest and windiest! Some parts haven\'t seen rain for 2 million years.',
        ),
        Question(
          question: 'Which is the largest desert in the world?',
          options: ['Sahara', 'Gobi', 'Kalahari', 'Arabian'],
          correctAnswerIndex: 0,
          fact: '🏜️ The Sahara Desert is the largest hot desert, covering about 9.2 million square kilometers across North Africa!',
        ),
        Question(
          question: 'What country has the most islands?',
          options: ['Indonesia', 'Philippines', 'Sweden', 'Japan'],
          correctAnswerIndex: 2,
          fact: '🏝️ Sweden has over 267,000 islands, the most of any country. Only about 1,000 of them are inhabited!',
        ),
      ],
    ),

    // ==================== SCIENCE CATEGORY (10 Questions) ====================
    Category(
      name: 'Science',
      icon: '🔬',
      color: Colors.blue,
      questions: [
        Question(
          question: 'Which planet is known as the Red Planet?',
          options: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
          correctAnswerIndex: 1,
          fact: '🔴 Mars is called the Red Planet because of iron oxide on its surface. It has the tallest mountain - Olympus Mons!',
        ),
        Question(
          question: 'What is the chemical symbol for water?',
          options: ['H2O', 'CO2', 'NaCl', 'HCl'],
          correctAnswerIndex: 0,
          fact: '💧 Water is H2O - two hydrogen atoms and one oxygen atom. About 60% of the human body is water!',
        ),
        Question(
          question: 'How many continents are there?',
          options: ['5', '6', '7', '8'],
          correctAnswerIndex: 2,
          fact: '🌍 There are 7 continents: Asia, Africa, North America, South America, Antarctica, Europe, and Australia.',
        ),
        Question(
          question: 'What is the largest organ in the human body?',
          options: ['Liver', 'Brain', 'Skin', 'Heart'],
          correctAnswerIndex: 2,
          fact: '🧬 The skin is the largest organ, covering about 2 square meters and weighing about 4-5 kg in adults!',
        ),
        Question(
          question: 'What is the speed of light?',
          options: ['300,000 km/s', '150,000 km/s', '450,000 km/s', '600,000 km/s'],
          correctAnswerIndex: 0,
          fact: '💡 Light travels at about 300,000 kilometers per second. That\'s 7.5 times around Earth in one second!',
        ),
        Question(
          question: 'What is the hardest natural substance on Earth?',
          options: ['Gold', 'Iron', 'Diamond', 'Quartz'],
          correctAnswerIndex: 2,
          fact: '💎 Diamond is the hardest natural substance. It\'s made of pure carbon atoms arranged in a crystal structure!',
        ),
        Question(
          question: 'How many bones are in the human body?',
          options: ['106', '206', '306', '406'],
          correctAnswerIndex: 1,
          fact: '🦴 Adults have 206 bones. Babies have about 270 bones that fuse together as they grow!',
        ),
        Question(
          question: 'What is the largest planet in our solar system?',
          options: ['Saturn', 'Neptune', 'Jupiter', 'Uranus'],
          correctAnswerIndex: 2,
          fact: '🪐 Jupiter is the largest planet. It\'s so big that over 1,300 Earths could fit inside it!',
        ),
        Question(
          question: 'What is the atomic number of Carbon?',
          options: ['4', '6', '8', '10'],
          correctAnswerIndex: 1,
          fact: '⚛️ Carbon has atomic number 6. It\'s the basis of all known life and has the highest number of compounds!',
        ),
        Question(
          question: 'How much of Earth\'s water is freshwater?',
          options: ['About 3%', 'About 10%', 'About 30%', 'About 50%'],
          correctAnswerIndex: 0,
          fact: '💧 Only about 3% of Earth\'s water is freshwater. Most of it is frozen in glaciers and ice caps!',
        ),
      ],
    ),

    // ==================== HISTORY CATEGORY (10 Questions) ====================
    Category(
      name: 'History',
      icon: '🏛️',
      color: Colors.orange,
      questions: [
        Question(
          question: 'Who built the pyramids?',
          options: ['Romans', 'Greeks', 'Egyptians', 'Persians'],
          correctAnswerIndex: 2,
          fact: '🇪🇬 The ancient Egyptians built the pyramids as tombs for pharaohs. The Great Pyramid was built around 2560 BC!',
        ),
        Question(
          question: 'When did World War II end?',
          options: ['1943', '1945', '1947', '1949'],
          correctAnswerIndex: 1,
          fact: '⚔️ World War II ended in 1945. The war lasted from 1939 to 1945, involving most of the world\'s nations.',
        ),
        Question(
          question: 'Who was the first person to walk on the Moon?',
          options: ['Yuri Gagarin', 'Neil Armstrong', 'Buzz Aldrin', 'John Glenn'],
          correctAnswerIndex: 1,
          fact: '🚀 Neil Armstrong walked on the Moon on July 20, 1969. He said "That\'s one small step for man, one giant leap for mankind."',
        ),
        Question(
          question: 'What was the longest war in history?',
          options: ['World War II', 'Hundred Years War', 'Vietnam War', 'Reconquista'],
          correctAnswerIndex: 3,
          fact: '⚔️ The Reconquista lasted about 781 years (718-1492)! It was the longest war in history between Christians and Muslims in Spain.',
        ),
        Question(
          question: 'Who invented the printing press?',
          options: ['Leonardo da Vinci', 'Johannes Gutenberg', 'Thomas Edison', 'Galileo'],
          correctAnswerIndex: 1,
          fact: '📚 Gutenberg invented the printing press around 1440. It revolutionized the spread of knowledge and information in Europe!',
        ),
        Question(
          question: 'When was the United States founded?',
          options: ['1774', '1776', '1781', '1789'],
          correctAnswerIndex: 1,
          fact: '🇺🇸 The USA declared independence on July 4, 1776. The Declaration of Independence was adopted on this day!',
        ),
        Question(
          question: 'Who was the first Emperor of Rome?',
          options: ['Julius Caesar', 'Augustus', 'Nero', 'Caligula'],
          correctAnswerIndex: 1,
          fact: '🏛️ Augustus was the first Roman Emperor, ruling from 27 BC to 14 AD. He transformed Rome from a republic to an empire!',
        ),
        Question(
          question: 'What was the largest empire in history?',
          options: ['Roman Empire', 'Mongol Empire', 'British Empire', 'Ottoman Empire'],
          correctAnswerIndex: 2,
          fact: '🌍 The British Empire was the largest, covering about 35.5 million km² (25% of Earth\'s land area) at its peak!',
        ),
        Question(
          question: 'When was the Great Wall of China built?',
          options: ['300 BC', '500 BC', '200 BC', '100 BC'],
          correctAnswerIndex: 2,
          fact: '🏯 The Great Wall was built around 200 BC by the first Chinese emperor. It\'s over 21,000 km long!',
        ),
        Question(
          question: 'Who discovered America (by Europeans)?',
          options: ['Vasco da Gama', 'Christopher Columbus', 'Ferdinand Magellan', 'Marco Polo'],
          correctAnswerIndex: 1,
          fact: '🌎 Christopher Columbus reached America in 1492. He was looking for a sea route to Asia but found the "New World" instead!',
        ),
      ],
    ),
  ];
}