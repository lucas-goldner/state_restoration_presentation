import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/core/widgets/outlined_border.dart';

class RestorationIds extends FlutterDeckSlideWidget {
  const RestorationIds()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/restorationIds',
            title: 'RestorationId/RestorationScopeId',
            steps: 2,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckCodeHighlight(
        code: formatCode('''
                 class RestorableTextField extends StatelessWidget {
  const RestorableTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        restorationId: "restorationId", // Provide the id here
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter name',
        ),
    );
  }
}

class RestorableScrollView extends StatelessWidget {
  const RestorableScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      restorationId: 'restorationId', // Provide the id here
      child: Text('Scrollable content'),
    );
  }
}
'''),
      ),
      rightBuilder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) => Stack(
          children: [
            FlutterDeckCodeHighlight(
              code: formatCode('''
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.restorablePush(
          context, _myRouteBuilder,
        ),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
'''),
            ),
            Positioned(
              top: 192,
              right: 380,
              child: AnimatedFadeAtStep(
                step: 2,
                currentStep: step,
                child: const OutlinedBorderWidget(
                  width: 320,
                  height: 60,
                  size: 100,
                  borderColor: Colors.red,
                  borderWidth: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
