import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/slides/long_form/widget/photo_dialog.dart';

class LongFormSlide extends FlutterDeckSlideWidget {
  const LongFormSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/long-form',
            title: 'Long Form Slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) {
        final formKey = GlobalKey<FormState>();

        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Password',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Birthplace',
                  ),
                ),
                DatePickerDialog(
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Birthday as text again',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Favorite widget',
                  ),
                ),
                verticalMargin48,
                const Text('State Management Preference'),
                verticalMargin12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Riverpod'),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Bloc'),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('GetIt'),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Vanilla'),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('The Best'),
                        Checkbox(value: true, onChanged: (_) {}),
                      ],
                    ),
                  ],
                ),
                verticalMargin12,
                const Text('Rate how much you liked this form'),
                verticalMargin12,
                Slider(value: 0, onChanged: (_) {}),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Email',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Password',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Reenter Password',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Reenter Birthplace',
                  ),
                ),
                verticalMargin32,
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog<void>(
                        context: context,
                        builder: (context) => PhotoDialog(formKey: formKey),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey,
                      child: const Center(
                        child: Text('Choose profile picture'),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      rightBuilder: (context) {
        return Text(
          'Imagine the user having to reDo this',
          style: context.textTheme.title.copyWith(color: Colors.white),
        );
      },
    );
  }
}
