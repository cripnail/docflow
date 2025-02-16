import 'package:flutter/material.dart';

import 'dimensions.dart';

abstract class AppStyles {
  static final elevatedButtonStyle = ButtonStyle(
    minimumSize: WidgetStateProperty.all(
      Size.fromHeight(AppDimensions.buttonHeight),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
      ),
    ),
  );
  static final textButtonStyle = ButtonStyle(
    minimumSize: WidgetStateProperty.all(
      Size.fromHeight(AppDimensions.buttonHeight),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
      ),
    ),
  );
}
