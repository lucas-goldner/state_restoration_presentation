import 'package:flutter/material.dart';
import 'package:state_restoration_presentation/generated/assets.gen.dart';

enum PossibleOptions {
  database,
  package,
  file,
  restorationManager;
}

extension PossibleOptionsExtension on PossibleOptions {
  String getLocalizedName(BuildContext context) {
    switch (this) {
      case PossibleOptions.database:
        return 'Database';
      case PossibleOptions.package:
        return 'Package\n(Hydrated Bloc)';
      case PossibleOptions.file:
        return 'JSON\nFile';
      case PossibleOptions.restorationManager:
        return 'Restoration\nManager';
    }
  }

  AssetGenImage get asset => switch (this) {
        PossibleOptions.database => Assets.images.database,
        PossibleOptions.package => Assets.images.package,
        PossibleOptions.file => Assets.images.file,
        PossibleOptions.restorationManager => Assets.images.restorationManager
      };
}
