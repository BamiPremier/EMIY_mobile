import 'package:flutter/material.dart';

class SearchAnimeDelegate extends SearchDelegate<String> {
  final List<String> data = [
    'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
    'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
    'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
    'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
    'Re:Zero kara Hajimeru Isekai Seikatsu 3rd Season',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  String? get searchFieldLabel => 'Rechercher...';
  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 5.0,
        color: const Color(0xffD9D9D9),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0xffD9D9D9),
        ),
        toolbarTextStyle: theme.textTheme.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.bodyMedium,
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildListView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildListView();
  }

  Widget _buildListView() {
    final List<String> suggestions = data
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 56,
            height: 56,
            color: const Color(0xffD9D9D9),
          ),
          title: Text(suggestions[index],
              style: Theme.of(context).textTheme.titleMedium),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
