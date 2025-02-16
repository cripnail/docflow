import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/constants/assets.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/core/constants/strings.dart';
import 'package:docflow/core/constants/text_styles.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_bloc.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_state.dart';
import 'package:docflow/features/document_list/presentation/widgets/bottom_navigation.dart';
import 'package:docflow/features/document_list/presentation/widgets/document_list_tile.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  // Добавляем поле с начальным значением
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signText,
                  style: TextStyle(
                    fontSize: AppDimensions.titleSize,
                    fontWeight: AppTextStyles.fontWeightSemiBold,
                  ),
                ),
                Text(
                  AppStrings.itText,
                  style: TextStyle(
                    fontSize: AppDimensions.titleSize,
                    fontWeight: AppTextStyles.fontWeightSemiBold,
                    fontStyle: FontStyle.italic,
                    color: AppColors.buttonBlue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingM),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(AppDimensions.documentSearchRadius),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.search,
                    hintStyle: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: AppDimensions.bodySize,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.textSecondary,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingM,
                      vertical: AppDimensions.paddingS,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<DocumentListBloc, DocumentListState>(
                builder: (context, state) {
                  if (state.documents.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.emptyDocuments,
                          width: AppDimensions.emptyStateWidth,
                          height: AppDimensions.emptyStateHeight,
                        ),
                        SizedBox(height: AppDimensions.spacingM),
                        Text(
                          AppStrings.emptyStateTitle,
                          style: TextStyle(
                            fontSize: AppDimensions.headlineSize,
                            fontWeight: AppTextStyles.fontWeightSemiBold,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spacingS),
                        Text(
                          AppStrings.emptyStateSubtitle,
                          style: TextStyle(
                            fontSize: AppDimensions.bodySize,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    );
                  }
                  return ListView.builder(
                    itemCount: state.documents.length,
                    itemBuilder: (context, index) {
                      final document = state.documents[index];
                      return DocumentListTile(
                        document: document,
                        onTap: () {
                          // Navigation logic here
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}