import 'package:flutter/material.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';

import 'package:potatoes/auto_list/widgets/auto_list_view.dart';
import 'package:umai/common/bloc/user_search_cubit.dart';
import 'package:umai/common/models/user.dart'; 
import 'package:umai/common/widgets/empty_builder.dart';
import 'package:umai/common/widgets/error_builder.dart';
import 'package:umai/common/widgets/item_user.dart'; 

class HomeSearchUserDelegate extends SearchDelegate<String> {
  late final AutoListCubit<User> _cubit;

  HomeSearchUserDelegate(BuildContext context) : super() {
    _cubit = UserSearchCubit(
      userService: context.read(),
      cubitManager: context.read(),
      search: query,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          _cubit.reset();
        },
      ),
    ];
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
        color: Color(0xffD9D9D9),
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 14.0,
      );

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
        hintStyle: theme.textTheme.bodySmall,
        border: InputBorder.none,
        helperStyle: theme.textTheme.bodySmall,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Container();
    }
    _cubit.reset();
    return _buildListView(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return Container();
    }
    _cubit.reset();
    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return AutoListView.get<User>(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      cubit: UserSearchCubit(
        userService: context.read(),
        cubitManager: context.read(),
        search: query,
      ),
      shrinkWrap: true,
      autoManage: false,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, user) =>
          UserItem.get(context: context, user: user),
      emptyBuilder: (ctx) =>  const EmptyBuilder(),
     errorBuilder: (context, retry) => ErrorBuilder(retry: retry),
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      loadingMoreBuilder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, bottom: 28)
            .add(const EdgeInsets.symmetric(horizontal: 16)),
        child: LinearProgressIndicator(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
