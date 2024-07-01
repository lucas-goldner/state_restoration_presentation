import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/core/util/format_code.dart';
import 'package:state_restoration_presentation/core/widgets.dart';
import 'package:state_restoration_presentation/core/widgets/outlined_border.dart';

class FixingJapananaSlide extends FlutterDeckSlideWidget {
  const FixingJapananaSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/fixing-japanana',
            header: FlutterDeckHeaderConfiguration(
              title: 'Adding restoration to Japanana 🍌',
            ),
            steps: 11,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final codeSnippets = [
      r'''
class InReview extends StatefulHookConsumerWidget {
  const InReview(this.reviewOption, {super.key});
  final (LectureType, ReviewSetupOptions) reviewOption;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InReviewState();
}

class _InReviewState extends ConsumerState<InReview> {
  List<Lecture> lectures = [];
  late final MatchEngine matchEngine;
  late final ReviewSetupOptions options;

  void _onNope(Lecture lecture) {
    if (options.repeatOnFalseCard) matchEngine..rewindMatch();
  }

  @override
  void initState() {
    options = widget.reviewOption.$2;
    lectures = ref
        .read(lectureProvider.notifier)
        .getLecturesForReviewOption(widget.reviewOption.$1);
    if (options.randomize) lectures.shuffle();
    matchEngine = MatchEngine(
        swipeItems: lectures
            .map(
              (lecture) => SwipeItem(
                content: LectureCard(lecture),
                nopeAction: () => _onNope(lecture),
              ),
            )
            .toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewProgress = useState(0);
    final done = useState(false);
    final linearPercentIndicatorExt =
        context.themeExtension<LinearPercentIndicatorColors>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: Text(
          key: K.getInReviewAppTitleForReviewOption(widget.reviewOption.$1),
          widget.reviewOption.$1.getLocalizedTitle(context),
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: done.value,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.congratsOnFinising(
                      widget.reviewOption.$1.getLocalizedTitle(context),
                    ),
                    style: context.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    key: K.startNextReviewButton,
                    onPressed: () =>
                        context.popUntilPath(AppRoutes.reviewSelection.path),
                    child: Text(
                      context.l10n.startNextReview.toUpperCase(),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SwipeCards(
                  key: K.inReviewCardStack,
                  matchEngine: matchEngine,
                  itemBuilder: (BuildContext context, int index) =>
                      LectureCard(lectures[index]),
                  onStackFinished: () => done.value = true,
                  itemChanged: (SwipeItem item, int index) =>
                      reviewProgress.value = index,
                  upSwipeAllowed: false,
                  fillSpace: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: LinearPercentIndicator(
                  key: K.progressIndicator,
                  animation: true,
                  animateFromLastPercent: true,
                  lineHeight: 20.0,
                  animationDuration: 1250,
                  percent: ((reviewProgress.value + 1) / lectures.length),
                  center: Text(
                    key: K.progressIndicatorLabel,
                    "${reviewProgress.value + 1} / ${lectures.length}",
                    style: context.textTheme.labelLarge?.copyWith(
                      color: linearPercentIndicatorExt.progressLabelTextColor,
                    ),
                  ),
                  progressColor: linearPercentIndicatorExt.progressColor,
                  backgroundColor: linearPercentIndicatorExt.backgroundColor,
                  barRadius: Radius.circular(4.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
''',
      r'''
class InReview extends StatefulHookConsumerWidget {
  const InReview(this.reviewOption, {super.key});
  final (LectureType, ReviewSetupOptions)? reviewOption;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InReviewState();
}

class _InReviewState extends ConsumerState<InReview> {
  List<Lecture> lectures = [];
  late final MatchEngine matchEngine;
  late final ReviewSetupOptions options;

  void _onNope(Lecture lecture) {
    if (options.repeatOnFalseCard) matchEngine..rewindMatch();
  }

  @override
  void initState() {
    options = widget.reviewOption.$2;
    lectures = ref
        .read(lectureProvider.notifier)
        .getLecturesForReviewOption(widget.reviewOption.$1);
    if (options.randomize) lectures.shuffle();
    matchEngine = MatchEngine(
        swipeItems: lectures
            .map(
              (lecture) => SwipeItem(
                content: LectureCard(lecture),
                nopeAction: () => _onNope(lecture),
              ),
            )
            .toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewProgress = useState(0);
    final done = useState(false);
    final linearPercentIndicatorExt =
        context.themeExtension<LinearPercentIndicatorColors>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: Text(
          key: K.getInReviewAppTitleForReviewOption(widget.reviewOption.$1),
          widget.reviewOption.$1.getLocalizedTitle(context),
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: done.value,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.congratsOnFinising(
                      widget.reviewOption.$1.getLocalizedTitle(context),
                    ),
                    style: context.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    key: K.startNextReviewButton,
                    onPressed: () =>
                        context.popUntilPath(AppRoutes.reviewSelection.path),
                    child: Text(
                      context.l10n.startNextReview.toUpperCase(),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SwipeCards(
                  key: K.inReviewCardStack,
                  matchEngine: matchEngine,
                  itemBuilder: (BuildContext context, int index) =>
                      LectureCard(lectures[index]),
                  onStackFinished: () => done.value = true,
                  itemChanged: (SwipeItem item, int index) =>
                      reviewProgress.value = index,
                  upSwipeAllowed: false,
                  fillSpace: false,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: LinearPercentIndicator(
                  key: K.progressIndicator,
                  animation: true,
                  animateFromLastPercent: true,
                  lineHeight: 20.0,
                  animationDuration: 1250,
                  percent: ((reviewProgress.value + 1) / lectures.length),
                  center: Text(
                    key: K.progressIndicatorLabel,
                    "${reviewProgress.value + 1} / ${lectures.length}",
                    style: context.textTheme.labelLarge?.copyWith(
                      color: linearPercentIndicatorExt.progressLabelTextColor,
                    ),
                  ),
                  progressColor: linearPercentIndicatorExt.progressColor,
                  backgroundColor: linearPercentIndicatorExt.backgroundColor,
                  barRadius: Radius.circular(4.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
''',
      r'''
class InReview extends StatefulWidget {
  const InReview(this.reviewOption, {super.key});
  final (LectureType, ReviewSetupOptions)? reviewOption;

  @override
  State<InReview> createState() => _InReviewState();
}

class _InReviewState extends State<InReview> with RestorationMixin {
  final RestorableEnum _restorableLectureType = RestorableEnum<LectureType>(
    LectureType.writing,
    values: LectureType.values,
  );

  @override
  String? get restorationId => "inReview";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_restorableLectureType, 'inReviewLectureType');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () => reviewSection(widget.reviewOption?.$1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _restorableLectureType.dispose();
  }

  void reviewSection(LectureType? value) {
    print("Writing now: $value");
    if (value == null) return;
    setState(() {
      _restorableLectureType.value = value;
    });
  }

  LectureType get reviewingLecture {
    return widget.reviewOption?.$1 ??
        _restorableLectureType.value as LectureType;
  }

  @override
  Widget build(BuildContext context) => Center(
        child: _InReviewContent((
          reviewingLecture,
          widget.reviewOption?.$2 ??
              ReviewSetupOptions(randomize: false, repeatOnFalseCard: false)
        )),
      );
}

class _InReviewContent extends StatefulHookConsumerWidget {
  const _InReviewContent(this.reviewOption);
  final (LectureType, ReviewSetupOptions) reviewOption;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InReviewContentState();
}

class _InReviewContentState extends ConsumerState<_InReviewContent> {
  late final MatchEngine matchEngine;
  late final ReviewSetupOptions _options;
  List<Lecture> lectures = [];

  void _onNope(lecture) {
    if (_options.repeatOnFalseCard) matchEngine..rewindMatch();
  }

  @override
  void initState() {
    super.initState();
    _options = widget.reviewOption.$2;
    lectures = ref
        .read(lectureProvider.notifier)
        .getLecturesForReviewOption(widget.reviewOption.$1);
    if (_options.randomize) lectures.shuffle();
    matchEngine = MatchEngine(
        swipeItems: lectures
            .map(
              (lecture) => SwipeItem(
                content: LectureCard(lecture),
                nopeAction: () => _onNope(lecture),
              ),
            )
            .toList());
  }

  void increaseProgress(
    RestorationBucket restorationBucket,
    ValueNotifier<int> reviewProgress,
    int newValue,
  ) {
    restorationBucket.write("reviewProgressKey", newValue);
    setState(() {
      reviewProgress.value == newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviewProgress = useState(0);
    final restorationBucket = RestorationScope.of(context);
    final progress = restorationBucket.read<int>("reviewProgressKey") ?? 0;
    final done = useState(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: Text(
          key: K.getInReviewAppTitleForReviewOption(
            widget.reviewOption.$1,
          ),
          widget.reviewOption.$1.getLocalizedTitle(context),
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: done.value,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.congratsOnFinising(
                      widget.reviewOption.$1.getLocalizedTitle(context),
                    ),
                    style: context.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    key: K.startNextReviewButton,
                    onPressed: () =>
                        context.popUntilPath(AppRoutes.reviewSelection.path),
                    child: Text(
                      context.l10n.startNextReview.toUpperCase(),
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: SwipeCards(
                  key: K.inReviewCardStack,
                  matchEngine: matchEngine,
                  itemBuilder: (BuildContext context, int index) =>
                      LectureCard(lectures[progress]),
                  onStackFinished: () => done.value = true,
                  itemChanged: (SwipeItem item, int index) => increaseProgress(
                    restorationBucket,
                    reviewProgress,
                    index,
                  ),
                  upSwipeAllowed: false,
                  fillSpace: false,
                ),
              ),
              Spacer(),
              LectureProgress(progress, lectures.length),
            ],
          ),
        ],
      ),
    );
  }
}
'''
    ];

    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) => SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  FlutterDeckCodeHighlight(
                    code: formatCode(
                      switch (step) {
                        0 => codeSnippets[0],
                        >= 6 && < 8 => codeSnippets[1],
                        >= 8 => codeSnippets[2],
                        _ => codeSnippets[0],
                      },
                    ),
                  ),
                  Visibility(
                    visible: step == 2 || step == 6,
                    child: Positioned(
                      top: 40,
                      left: 80,
                      child: AnimatedFadeAtStep(
                        step: 2,
                        currentStep: step,
                        child: const OutlinedBorderWidget(
                          size: 100,
                          width: 650,
                          height: 100,
                          borderWidth: 20,
                          borderColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: step == 4,
                    child: Positioned(
                      top: 0,
                      left: 280,
                      child: AnimatedFadeAtStep(
                        step: 2,
                        currentStep: step,
                        child: const OutlinedBorderWidget(
                          size: 100,
                          width: 400,
                          height: 100,
                          borderWidth: 20,
                          borderColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: step == 6 || step == 10,
                    child: Positioned(
                      top: 2820,
                      left: 20,
                      child: AnimatedFadeAtStep(
                        step: 2,
                        currentStep: step,
                        child: const OutlinedBorderWidget(
                          size: 100,
                          width: 900,
                          height: 200,
                          borderWidth: 20,
                          borderColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              horizontalMargin12,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.problems,
                      style: context.textTheme.bodyLarge.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalMargin16,
                    AnimatedFadeAtStep(
                      step: 1,
                      currentStep: step,
                      child: Text(
                        step >= 7
                            ? '${context.l10n.goRouterProblem} ✅'
                            : context.l10n.goRouterProblem,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin16,
                    AnimatedFadeAtStep(
                      step: 3,
                      currentStep: step,
                      child: Text(
                        step >= 9
                            ? context.l10n.statehookconsumerwidgetSolution
                            : context.l10n.statehookconsumerwidgetProblem,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    verticalMargin16,
                    AnimatedFadeAtStep(
                      step: 5,
                      currentStep: step,
                      child: Text(
                        step >= 11
                            ? context.l10n.hooksSolution
                            : context.l10n.hooksProblem,
                        style: context.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
