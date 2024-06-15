import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/widgets/fade_animation.dart';
import 'package:state_restoration_presentation/slides/saving_state/model/possible_options.dart';

class SavingOption extends StatelessWidget {
  const SavingOption({
    required this.step,
    required this.currentStep,
    required this.option,
    super.key,
  });

  final int step;
  final int currentStep;
  final PossibleOptions option;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: currentStep >= step,
        child: FadeAnimation(
          delay: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              option.asset.image(
                width: 100,
                height: 100,
              ),
              Text(
                option.getLocalizedName(context),
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
}
