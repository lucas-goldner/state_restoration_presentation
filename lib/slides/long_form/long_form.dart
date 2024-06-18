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
                  decoration: InputDecoration(
                    hintText: context.l10n.emailHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.nameHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.passwordHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterPasswordHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.birthplaceHintText,
                  ),
                ),
                DatePickerDialog(
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.birthdayHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.favoriteWidgetHintText,
                  ),
                ),
                verticalMargin48,
                Text(context.l10n.stateManagementPreferenceLabel),
                verticalMargin12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(context.l10n.riverpodOption),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        Text(context.l10n.blocOption),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        Text(context.l10n.getItOption),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        Text(context.l10n.vanillaOption),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    Column(
                      children: [
                        Text(context.l10n.theBestOption),
                        Checkbox(value: true, onChanged: (_) {}),
                      ],
                    ),
                  ],
                ),
                verticalMargin12,
                Text(context.l10n.formRatingLabel),
                verticalMargin12,
                Slider(value: 0, onChanged: (_) {}),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterEmailHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterNameHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterPasswordHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterReenterPasswordHintText,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: context.l10n.reenterBirthplaceHintText,
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
                      child: Center(
                        child: Text(context.l10n.chooseProfilePictureLabel),
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
                        child: Text(context.l10n.submitButtonText),
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
          context.l10n.redoUserHintText,
          style: context.textTheme.title.copyWith(color: Colors.white),
        );
      },
    );
  }
}
