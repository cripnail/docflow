import 'package:flutter/material.dart';

import 'package:docflow/core/constants/dimensions.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimensions.spacingXS),
          width: AppDimensions.dotIndicatorSize,
          height: AppDimensions.dotIndicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
          ),
        ),
      ),
    );
  }
}
