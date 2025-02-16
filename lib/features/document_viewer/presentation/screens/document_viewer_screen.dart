import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/core/constants/colors.dart';
import 'package:docflow/core/services/revenue_cat_service.dart';
import 'package:docflow/features/document_viewer/domain/models/document_action.dart';
import 'package:docflow/features/subscription/presentation/screens/paywall_screen.dart';
import 'package:docflow/features/document_list/data/models/document_model.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DocumentViewerScreen extends StatefulWidget {
  final DocumentModel document;

  const DocumentViewerScreen({
    super.key,
    required this.document,
  });

  @override
  State<DocumentViewerScreen> createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.document.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () => _handleAction(DocumentAction.print),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _handleAction(DocumentAction.share),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _handleAction(DocumentAction.delete),
          ),
        ],
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.document.file.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            onError: (error) {
              print(error.toString());
            },
            onRender: (_pages) {
              setState(() {
                _isLoading = false;
              });
            },
            onViewCreated: (PDFViewController pdfViewController) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Container(
              color: AppColors.overlayBackground,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleAction(DocumentAction action) async {
    if (action == DocumentAction.delete) {
      Navigator.pop(context);
      return;
    }

    final revenueCatService = context.read<RevenueCatService>();
    final isPremium = await revenueCatService.isPremium();

    if (!isPremium) {
      if (!mounted) return;
      final success = await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        builder: (context) => PaywallScreen(
          showCloseButton: true,
          isModal: true, // Это модальное окно
          onSuccess: () {
            Navigator.pop(context, true);
          },
        ),
      );

      if (success == true) {
        final newIsPremium = await revenueCatService.isPremium();
        if (newIsPremium) {
          _executeAction(action);
        }
      }
      return;
    }

    _executeAction(action);
  }

  Future<void> _executeAction(DocumentAction action) async {
    setState(() => _isLoading = true);
    try {
      switch (action) {
        case DocumentAction.print:
          // TODO: Реализация печати
          break;
        case DocumentAction.share:
          // TODO: Реализация шаринга
          break;
        case DocumentAction.delete:
          Navigator.pop(context);
          break;
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
