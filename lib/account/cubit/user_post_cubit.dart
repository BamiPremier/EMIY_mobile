import 'dart:developer';

import 'package:potatoes/auto_list/bloc/auto_list_cubit.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:umai/auth/services/auth_service.dart';
import 'package:umai/common/bloc/user_cubit.dart';
import 'package:umai/common/services/preferences_service.dart';

import 'package:umai/social/model/post_response.dart';
import 'package:umai/social/services/social_service.dart';

class UserPostCubit extends AutoListCubit<Post> {
  final PreferencesService preferencesService;

  final SocialService service;
  UserPostCubit(this.service, this.preferencesService)
      : super(provider: ({int page = 1}) async {
          String userId = preferencesService.userUID!;
          final p = await service.getUserPosts(page: page, userId: userId);
          return PaginatedList<Post>(
            items: p.content,
            page: p.page,
            total: p.total,
          );
        });

  @override
  DataProvider<Post> get provider {
    return ({int page = 1}) async {
      String userId = preferencesService.userUID!;
      final p = await service.getUserPosts(page: page, userId: userId);
      return PaginatedList<Post>(
        items: p.content,
        page: p.page,
        total: p.total,
      );
    };
  }
}
