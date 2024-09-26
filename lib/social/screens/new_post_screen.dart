import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart';
import 'package:umai/account/cubit/account_cubit.dart';
import 'package:umai/account/screens/param/edit_profile_picture_screen.dart';
import 'package:umai/account/widgets/large_text_field.dart';
import 'package:umai/common/utils/validators.dart';
import 'package:umai/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:umai/common/widgets/customtextfield.dart';
import 'package:umai/social/cubit/social_cubit.dart';
import 'package:umai/social/screens/new_post_complete_screen.dart';
import 'package:umai/utils/assets.dart';
import 'package:umai/utils/dialogs.dart';
import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:umai/utils/themes.dart';
// import 'utils/file_utils.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> with CompletableMixin {
  late final socialCubit = context.read<SocialCubit>();

  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialCubit, SocialState>(
      listener: onEventReceived,
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              CameraAwesomeBuilder.awesome(
                  onMediaCaptureEvent: (event) {
                    switch ((event.status, event.isPicture, event.isVideo)) {
                      case (MediaCaptureStatus.capturing, true, false):
                        debugPrint('Capture de photo en cours...');
                        break;
                      case (MediaCaptureStatus.success, true, false):
                        event.captureRequest.when(
                          single: (single) async {
                            debugPrint(
                                'Photo enregistrée: ${single.file?.path}');

                            var file = File(single.file?.path ?? '');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewPostCompleteScreen(file: file)),
                            );
                          },
                          multiple: (multiple) {
                            multiple.fileBySensor.forEach((key, value) {
                              debugPrint(
                                  'Photos multiples prises: $key ${value?.path}');
                              // TODO: Traiter les photos multiples
                            });
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
                  saveConfig: SaveConfig.photoAndVideo(
                    initialCaptureMode: CaptureMode.photo,
                    photoPathBuilder: (sensors) async {
                      final Directory extDir = await getTemporaryDirectory();
                      final testDir = await Directory(
                        '${extDir.path}/camerawesome',
                      ).create(recursive: true);
                      if (sensors.length == 1) {
                        final String filePath =
                            '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                        return SingleCaptureRequest(filePath, sensors.first);
                      }
                      return MultipleCaptureRequest(
                        {
                          for (final sensor in sensors)
                            sensor:
                                '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                        },
                      );
                    },
                    videoOptions: VideoOptions(
                      enableAudio: true,
                      ios: CupertinoVideoOptions(fps: 30),
                      android: AndroidVideoOptions(
                        bitrate: 10000000,
                        fallbackStrategy: QualityFallbackStrategy.lower,
                      ),
                    ),
                    exifPreferences: ExifPreferences(saveGPSLocation: true),
                  ),
                  sensorConfig: SensorConfig.single(
                    sensor: Sensor.position(SensorPosition.back),
                    flashMode: FlashMode.auto,
                    aspectRatio: CameraAspectRatios.ratio_4_3,
                    zoom: 0.0,
                  ),
                  enablePhysicalButton: true,
                  previewAlignment: Alignment.center,
                  previewFit: CameraPreviewFit.contain,
                  availableFilters: awesomePresetFiltersList,
                  onMediaTap: (mediaCapture) {
                    mediaCapture.captureRequest.when(
                      single: (single) {
                        debugPrint('Fichier unique: ${single.file?.path}');
                        // TODO: Afficher l'aperçu du fichier capturé
                      },
                      multiple: (multiple) {
                        multiple.fileBySensor.forEach((key, value) {
                          debugPrint('Fichiers multiples: $key ${value?.path}');
                          // TODO: Afficher l'aperçu des fichiers capturés
                        });
                      },
                    );
                  },
                  middleContentBuilder: (state) => Container(),
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
                                    color: ThemeApp.white,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.circle,
                                        color: ThemeApp.grey, size: 80),
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
            ],
          ),
        ),
      ),
    );
  }

  void onEventReceived(BuildContext context, SocialState state) async {
    await waitForDialog();

    if (state is NewPostLoadingState) {
      loadingDialogCompleter = showLoadingBarrier(context: context);
    } else if (state is NewPostSuccessState) {
      showSuccessToast("Mise à jour effectuée avec succes");
    } else if (state is NewPostErrorState) {
      showErrorToast(state.error);
    }
  }
}
