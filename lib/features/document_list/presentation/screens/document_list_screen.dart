import 'package:docflow/features/document_viewer/presentation/screens/document_viewer_screen.dart';
import 'package:docflow/features/documents/presentation/screens/documents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_bloc.dart';
import 'package:docflow/features/document_list/presentation/bloc/document_list_state.dart';
import 'package:docflow/features/document_list/presentation/widgets/document_list_tile.dart';
import 'package:docflow/features/document_list/presentation/widgets/bottom_navigation.dart';
import 'package:docflow/features/document_list/presentation/widgets/app_logo.dart';
import 'package:docflow/features/document_list/presentation/widgets/document_search_bar.dart';
import 'package:docflow/features/document_list/presentation/widgets/tools_screen.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({super.key});

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
            _selectedIndex == 0 ? _buildDocumentsList() : const ToolsScreen(),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildDocumentsList() {
    return Column(
      children: [
        const AppLogo(),
        const DocumentSearchBar(),
        Expanded(
          child: BlocBuilder<DocumentListBloc, DocumentListState>(
            builder: (context, state) {
              if (state.documents.isEmpty) {
                return const DocumentsScreen();
              }
              return ListView.builder(
                itemCount: state.documents.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final document = state.documents[index];
                  return DocumentListTile(
                    document: document,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DocumentViewerScreen(document: document),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
