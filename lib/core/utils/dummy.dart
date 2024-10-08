import 'package:gammal_tech_final_exam/data/models/answer_model.dart';
import 'package:gammal_tech_final_exam/data/models/course_model.dart';
import 'package:gammal_tech_final_exam/data/models/questions_model.dart';
import 'package:gammal_tech_final_exam/data/models/topic_model.dart';

List<CourseModel> allCourses = [
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
];

List<CourseModel> suggestedCourses = [
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
  const CourseModel(
      name: 'Basic Programming Concepts',
      description: 'Learn the basic concepts of programming',
      imageUrl: 'https://i.imgur.com/1YCMYgS.png',
      id: "1",
      numberOfRatings: 15,
      rating: 4.5,
      quizzes: 6),
];

List<TopicModel> allTopics = [dummyTopic, dummyTopic, dummyTopic, dummyTopic];

List<TopicModel> suggestedTopics = [dummyTopic, dummyTopic];

TopicModel dummyTopic = TopicModel(
    id: '1',
    title: 'Introduction to Programming',
    description: 'Learn the basic concepts of programming',
    imageUrl: 'https://i.imgur.com/1YCMYgS.png',
    duration: 10,
    points: 10,
    skills: '''
      - Basic Programming Concepts
      - Basic Programming Concepts
      - Basic Programming Concepts
      - Basic Programming Concepts''',
    questions: [
      QuestionsModel(id: "1", question: questionText, answers: answersList),
      QuestionsModel(id: "2", question: questionText, answers: answersList),
      QuestionsModel(id: "3", question: questionText, answers: answersList),
      QuestionsModel(id: "4", question: questionText, answers: answersList),
      QuestionsModel(id: "5", question: questionText, answers: answersList),
    ],
    subtitle: "Learn the basic concepts of programming");

List<AnswerModel> answersList = [
  const AnswerModel(id: "1", answer: "15\n5\n20", isCorrect: true),
  const AnswerModel(id: "3", answer: "15\n5\n20", isCorrect: false),
  const AnswerModel(id: "2", answer: "15\n5\n20", isCorrect: false),
  const AnswerModel(id: "4", answer: "15\n5\n20", isCorrect: false),
];

String questionText = '''
#include <stdio.h>

int main() {
     int x = 5, y = 10, z;
     z = x + y;
     printf("%d\n", z);
     x = z - y;
     printf("%d\n", x);
     y = x * 2;
     printf("%d\n", y);
     return 0; 
}''';
