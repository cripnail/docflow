import 'package:flutter/material.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';

class DocumentSearchBar extends StatelessWidget {
  const DocumentSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.searchHint,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
          ),
        ),
      ),
    );
  }
}
