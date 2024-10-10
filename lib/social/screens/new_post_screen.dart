import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/social/cubit/new_post_cubit.dart';
import 'package:umai/social/screens/new_post_publish_screen.dart';
import 'package:umai/utils/themes.dart';

class NewPostScreen extends StatefulWidget {
  static Future<bool> _requestPermissions() async {
    final status = await Permission.camera.request();
    switch (status) {
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
        return false;
      default:
        // photo manager permission is not mandatory
        await PhotoManager.requestPermissionExtend();
        return true;
    }
  }

  static Future<void> show({required BuildContext context}) async {
    bool hasPermission = await _requestPermissions();
    if (hasPermission) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NewPostScreen._()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Vous devez accorder la permission d'accès à la caméra pour continuer.")),
      );
    }
  }

  const NewPostScreen._();

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> with CompletableMixin {
  late final newPostCubit = context.read<NewPostCubit>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.fullBlackTheme(context),
      child: Scaffold(
        body: CameraAwesomeBuilder.custom(
          progressIndicator: const _LoadingCamera(),
          builder: (cameraState, previewSize) {
            return cameraState.when(
              onPhotoMode: (state) => _TakePhotoUI(
                state: state,
              ),
            );
          },
          onMediaCaptureEvent: (event) {
            if (event.status == MediaCaptureStatus.success && event.isPicture) {
              event.captureRequest.when(
                single: (single) async {
                  var file = File(single.file?.path ?? '');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            NewPostCompleteScreen(file: file)),
                  );
                },
              );
            }
          },
          saveConfig: SaveConfig.photo(),
          sensorConfig: SensorConfig.single(
            aspectRatio: CameraAspectRatios.ratio_1_1,
          ),
        ),
      ),
    );
  }
}

class _TakePhotoUI extends StatefulWidget {
  final PhotoCameraState state;

  const _TakePhotoUI({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  _TakePhotoUIState createState() => _TakePhotoUIState();
}

class _TakePhotoUIState extends State<_TakePhotoUI> {
  final _gallery = const _GalleryUi();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close, color: Colors.white, size: 24),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        widget.state.when(
                          onPhotoMode: (photoState) {
                            switch (photoState.sensorConfig.flashMode) {
                              case FlashMode.auto:
                                return Icons.flash_auto;
                              case FlashMode.on:
                                return Icons.flash_on;
                              case FlashMode.none:
                                return Icons.flash_off;
                              default:
                                return Icons.flash_auto;
                            }
                          },
                          onVideoRecordingMode: (_) => Icons.flash_off,
                          onPreparingCamera: (_) => Icons.flash_off,
                        ),
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        widget.state.when(
                          onPhotoMode: (photoState) {
                            final FlashMode nextMode = {
                              FlashMode.auto: FlashMode.on,
                              FlashMode.on: FlashMode.none,
                              FlashMode.none: FlashMode.auto,
                            }[photoState.sensorConfig.flashMode]!;

                            setState(() {
                              photoState.sensorConfig.setFlashMode(nextMode);
                            });
                          },
                        );
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.flip_camera_android,
                          color: Colors.white, size: 24),
                      onPressed: () {
                        widget.state.switchCameraSensor();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _gallery,
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28.0),
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: AppTheme.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.circle,
                        color: AppTheme.grey, size: 80),
                    onPressed: () {
                      widget.state.takePhoto();
                    },
                  )),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.text_fields,
                  color: AppTheme.white,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const NewPostCompleteScreen(file: null)),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GalleryUi extends StatefulWidget {
  const _GalleryUi() : super();

  @override
  _GalleryUiState createState() => _GalleryUiState();
}

class _GalleryUiState extends State<_GalleryUi> {
  ImageProvider? lastImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchLastImage();
    });
  }

  Future<void> _fetchLastImage() async {
    try {
      final paths =
          await PhotoManager.getAssetPathList(type: RequestType.image);

      if (paths.isNotEmpty) {
        final AssetPathEntity mainAlbum = paths.first;
        final images = await mainAlbum.getAssetListPaged(page: 0, size: 1);

        if (images.isNotEmpty) {
          setState(() {
            lastImage = AssetEntityImageProvider(images.first);
          });
        }
      }
    } catch (ignored) {/**/}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    NewPostCompleteScreen(file: File(image.path))),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppTheme.white),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).disabledColor,
          foregroundImage: lastImage,
          radius: 20.0,
          child: Icon(
            Icons.image_outlined,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _LoadingCamera extends StatelessWidget {
  const _LoadingCamera();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.fullBlackTheme(context),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon:
                        const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.flash_auto,
                            color: Colors.white, size: 30),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.flip_camera_android,
                            color: Colors.white, size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _GalleryUi(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28.0),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: const IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.circle, color: AppTheme.grey, size: 80),
                    onPressed: null,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.text_fields,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
