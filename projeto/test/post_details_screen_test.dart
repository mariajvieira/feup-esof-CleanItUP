import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/screens/post_details_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final Map<String, dynamic> testPost = {
    'description': 'This is a test post',
    'imageUrl': 'https://example.com/image.jpg',
    'likes': ['user1', 'user2'],
    'comments': [
      {'userId': 'user1', 'comment': 'Nice post!'},
      {'userId': 'user2', 'comment': 'I agree!'}
    ]
  };
  final String testUserName = 'Test User';

  testWidgets('PostDetailsScreen displays post details', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PostDetailsScreen(post: testPost, userName: testUserName)));

    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('This is a test post'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('2 Likes'), findsOneWidget);
    expect(find.text('2 Comments'), findsOneWidget);
    expect(find.text('Nice post!'), findsOneWidget);
    expect(find.text('I agree!'), findsOneWidget);
  });
}
