import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/core/extensions/context_ext.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

enum PossibleOptions {
  database,

  file,
  restorationManager;
}

extension PossibleOptionsExtension on PossibleOptions {
  String getLocalizedName(BuildContext context) {
    switch (this) {
      case PossibleOptions.database:
        return context.l10n.databaseOption;
      case PossibleOptions.file:
        return context.l10n.fileOption;
      case PossibleOptions.restorationManager:
        return context.l10n.restorationManagerOption;
    }
  }

  AssetGenImage get asset => switch (this) {
        PossibleOptions.database => Assets.images.database,
        PossibleOptions.file => Assets.images.file,
        PossibleOptions.restorationManager => Assets.images.restorationManager
      };
}
