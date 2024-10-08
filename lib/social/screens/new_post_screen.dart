import 'dart:io';
import 'dart:typed_data';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/social/cubit/new_post_cubit.dart';
import 'package:umai/social/screens/new_post_publish_screen.dart';
import 'package:umai/utils/themes.dart';
import 'package:photo_manager/photo_manager.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

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
          progressIndicator: const LoadingCamera(),
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
  final _galery = const _GaleryUi();
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
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
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
                        size: 30,
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
                          color: Colors.white, size: 30),
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
              _galery,
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28.0),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.circle,
                        color: AppTheme.grey, size: 80),
                    onPressed: () {
                      widget.state.takePhoto();
                    },
                  )), // GestureDetector(

              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.text_fields,
                  color: Colors.white,
                  size: 30,
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

class _GaleryUi extends StatefulWidget {
  const _GaleryUi({
    Key? key,
  }) : super(key: key);

  @override
  _GaleryUiState createState() => _GaleryUiState();
}

class _GaleryUiState extends State<_GaleryUi> {
  AssetEntity? lastImage;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      
      await _fetchLastImage();
    });
    super.initState();
  }


  Future<void> _fetchLastImage() async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (paths.isNotEmpty) {
      final AssetPathEntity mainAlbum = paths.first;

      final List<AssetEntity> images =
          await mainAlbum.getAssetListPaged(page: 0, size: 1);

      if (images.isNotEmpty) {
        setState(() {
          lastImage = images.first;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: lastImage != null
          ? FutureBuilder<Uint8List?>(
              future: lastImage!.thumbnailDataWithSize(
                  const ThumbnailSize(300, 300)), // Taille de la vignette
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: MemoryImage(snapshot.data!),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator(); // Loader si l'image n'est pas prête
                }
              },
            )
          : const SizedBox(
              height: 40.0,
              width: 40.0,
              child: CircleAvatar(
                radius: 28,
                child: Icon(Icons.person, size: 28, color: Colors.white),
              ),
            ),
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    NewPostCompleteScreen(file: File(image.path))),
          );
        }
      },
    );
  }
}

class LoadingCamera extends StatelessWidget {
  const LoadingCamera({super.key});

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
                const SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CircleAvatar(
                    radius: 28,
                    child: Icon(Icons.person, size: 28, color: Colors.white),
                  ),
                ),
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
