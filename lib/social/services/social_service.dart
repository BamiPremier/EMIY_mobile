import 'dart:io';

import 'package:umai/common/models/anime_response.dart';
import 'package:umai/common/models/follower_response.dart';
import 'package:umai/common/services/api_service.dart';
import 'package:potatoes/libs.dart';
import 'package:umai/common/services/preferences_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class SocialService extends ApiService {
  final PreferencesService preferencesService;
  static const String _newPost = '/posts';
  const SocialService(
    super._dio,
    this.preferencesService,
  );
  Future newPost({
    required String content,
    required File file,
  }) async {
    return compute(
      dio.post(
        _newPost,
        data: FormData.fromMap({
          'image': await MultipartFile.fromFile(file.path,
              filename: basename(file.path))
        }),
        options: Options(headers: withAuth()),
      ),
    );
  }
}
