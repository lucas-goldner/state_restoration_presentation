import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';

class TestingSlide extends FlutterDeckSlideWidget {
  const TestingSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/testing',
            header: FlutterDeckHeaderConfiguration(
              title: 'テスト書き方',
            ),
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    const codeSnippet = '''
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // ０が表示されている
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 1が表示されている
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test 2', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // FAIL 🔥
    expect(find.text('0'), findsOneWidget);
    // 実は1が表示されている
    expect(find.text('1'), findsNothing);

    ...
  });
}''';

    const codeSnippetFixed = '''
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // ０が表示されている
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 1が表示されている
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test 2', (WidgetTester tester) async {
    // 修正 👍
    await tester.restartAndRestore();
    await tester.pumpWidget(const MyApp());

    // ０が表示されている
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    ...
  });
}''';

    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) {
          print(step);
          return SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterDeckCodeHighlight(
                  code: step == 1
                      ? formatCode(codeSnippet)
                      : formatCode(codeSnippetFixed),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
