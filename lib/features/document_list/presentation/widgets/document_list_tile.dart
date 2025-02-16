import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/constants/dimensions.dart';
import 'package:docflow/features/document_list/domain/models/document_type.dart';
import 'package:flutter/material.dart';

import 'package:docflow/features/document_list/data/models/document_model.dart';

class DocumentListTile extends StatelessWidget {
  final DocumentModel document;
  final VoidCallback onTap;

  const DocumentListTile({
    super.key,
    required this.document,
    required this.onTap,
  });

  Widget _buildLeadingIcon() {
    return Container(
      width: AppDimensions.documentIconSize,
      height: AppDimensions.documentIconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
        color: AppColors.cardBackground,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
        child: Builder(
          builder: (context) {
            // Если файл существует и доступен, пробуем показать его
            if (document.file.existsSync()) {
              return Image.file(
                document.file,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildFallbackIcon(),
              );
            }
            // В противном случае показываем иконку-плейсхолдер
            return _buildFallbackIcon();
          },
        ),
      ),
    );
  }

  Widget _buildFallbackIcon() {
    IconData iconData;
    switch (document.type) {
      case DocumentType.scan:
        iconData = Icons.document_scanner;
      case DocumentType.gallery:
        iconData = Icons.photo;
      case DocumentType.file:
        iconData = Icons.description;
    }

    return Icon(
      iconData,
      size: AppDimensions.iconM,
      color: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _buildLeadingIcon(),
      title: Text(document.name),
      subtitle: Text(
        document.createdAt.toString(),
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppDimensions.fontSizeXS,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: AppDimensions.iconS,
        color: AppColors.textSecondary,
      ),
    );
  }
}
