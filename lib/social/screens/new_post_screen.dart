import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/social/cubit/new_post_cubit.dart';
import 'package:umai/social/screens/new_post_publish_screen.dart';
import 'package:umai/utils/themes.dart';

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
        // TODO convert to CameraAwesomeBuilder.custom
        body: CameraAwesomeBuilder.awesome(
          onMediaCaptureEvent: (event) {
            switch ((event.status, event.isPicture, event.isVideo)) {
              case (MediaCaptureStatus.capturing, true, false):
                debugPrint('Capture de photo en cours...');
                break;
              case (MediaCaptureStatus.success, true, false):
                event.captureRequest.when(
                  single: (single) async {
                    debugPrint('Photo enregistrée: ${single.file?.path}');

                    var file = File(single.file?.path ?? '');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              NewPostCompleteScreen(file: file)),
                    );
                  },
                );
                break;
              case (MediaCaptureStatus.failure, true, false):
                debugPrint(
                    'Échec de la capture photo: ${event.exception}');

                break;
              case (MediaCaptureStatus.capturing, false, true):
                debugPrint('Capture vidéo en cours...');
                break;
              case (MediaCaptureStatus.success, false, true):
                event.captureRequest.when(
                  single: (single) {
                    debugPrint(
                        'Vidéo enregistrée: ${single.file?.path}');
                  },
                  multiple: (multiple) {
                    multiple.fileBySensor.forEach((key, value) {
                      debugPrint(
                          'Vidéos multiples prises: $key ${value?.path}');
                    });
                  },
                );
                break;
              case (MediaCaptureStatus.failure, false, true):
                debugPrint(
                    'Échec de la capture vidéo: ${event.exception}');

                break;
              default:
                debugPrint('Événement inconnu: $event');
            }
          },
          saveConfig: SaveConfig.photo(),
          sensorConfig: SensorConfig.single(
            aspectRatio: CameraAspectRatios.ratio_1_1,
          ),
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          topActionsBuilder: (state) => Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        state.when(
                          onPhotoMode: (photoState) {
                            switch (
                                photoState.sensorConfig.flashMode) {
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
                          onVideoRecordingMode: (_) =>
                              Icons.flash_off,
                          onPreparingCamera: (_) => Icons.flash_off,
                        ),
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        state.when(
                          onPhotoMode: (photoState) {
                            final FlashMode nextMode = {
                              FlashMode.auto: FlashMode.on,
                              FlashMode.on: FlashMode.none,
                              FlashMode.none: FlashMode.auto,
                            }[photoState.sensorConfig.flashMode]!;

                            debugPrint(
                                'Changement du mode flash : ${photoState.sensorConfig.flashMode} -> $nextMode');
                            setState(() {
                              photoState.sensorConfig
                                  .setFlashMode(nextMode);
                            });
                          },
                          onVideoRecordingMode: (_) => debugPrint(
                              'Mode flash non disponible en enregistrement vidéo'),
                          onPreparingCamera: (_) => debugPrint(
                              'Caméra en cours de préparation'),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.flip_camera_android,
                          color: Colors.white, size: 30),
                      onPressed: () {
                        state.switchCameraSensor();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomActionsBuilder: (state) => Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const SizedBox(
                          height: 40.0,
                          width: 40.0,
                          child: CircleAvatar(
                            radius: 28,
                            child: Icon(Icons.person,
                                size: 28, color: Colors.white),
                          ),
                        ),
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewPostCompleteScreen(
                                          file: File(image.path))),
                            );
                            print('Image sélectionnée : ${image.path}');
                          }
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 28.0),
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.circle,
                                color: AppTheme.grey, size: 80),
                            onPressed: () {
                              state.when(
                                onPhotoMode: (captureRequest) {
                                  captureRequest.when(
                                    onPhotoMode: (single) async {
                                      single.takePhoto();
                                    },
                                  );
                                },
                              );
                            },
                          )),
                      IconButton(
                        icon: const Icon(
                          Icons.text_fields,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    NewPostCompleteScreen(file: null)),
                          );
                        },
                      ),
                    ]),
              )),
      ),
    );
  }

}
