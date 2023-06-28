import 'dart:convert';

import 'package:EMIY/components/Button/app_button.dart';
import 'package:EMIY/controller/negociationController.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:video_player/video_player.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   var messages = [];
//   late VideoPlayerController _videoPlayerController;
//   late Future<void> videoPlayerInitializer;
//   void initState() {
//     super.initState();
//     loadController();
//   }

//   loadController() async {
//     //print('**************lectyre');
//     _videoPlayerController = VideoPlayerController.network(
//         "http://172.20.10.8:4000/short?video=test.mp4");
//     videoPlayerInitializer = _videoPlayerController.initialize();

//     _videoPlayerController.setLooping(true);
//   }

//   Future<Stream<List<int>>?> fetchVideoSegment(
//       String url, int startByte, int endByte) async {
//     final connect = Get.find<GetConnect>();

//     final response = await connect.get(
//       url,
//       headers: {'range': 'bytes=$startByte-$endByte'},
//     );

//     return response.bodyBytes;
//   }

//   Future<void> playVideoSegment() async {
//     final startByte = 0;
//     final endByte = 100000; // Exemple de plage de segment

//     final segmentData = await fetchVideoSegment(
//         'http://172.20.10.8:4000/api/video?video=test.mp4', startByte, endByte);

//     // await _videoPlayerController.memory();
//     //   _videoPlayerController = VideoPlayerController.memory(segmentData);

//     await _videoPlayerController.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NegociationController>(
//       builder: (_negociation) => Scaffold(
//           appBar: AppBar(
//             title: Text('Conversation'),
//           ),
//           body: Column(
//             children: [
//               Container(
//                   margin: EdgeInsets.only(
//                       top: Get.size.height * .02,
//                       bottom: Get.size.height * .025),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white),
//                   // padding: EdgeInsets.only(
//                   //   top: 25,
//                   // ),
//                   child: AppButton(
//                       size: MainAxisSize.max,
//                       bgColor: ColorsApp.black,
//                       text: 'Debuter',
//                       onTap: () async {
//                         _videoPlayerController.play();
//                         // await loadController();
//                       })),
//               FutureBuilder(
//                 future: videoPlayerInitializer,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return AspectRatio(
//                       aspectRatio: 100 / 50,
//                       child: VideoPlayer(
//                         _videoPlayerController,
//                       ),
//                     );
//                   } else {
//                     return CircularProgressIndicator();
//                   }
//                 },
//               ),
//               VideoProgressIndicator(_videoPlayerController,
//                   allowScrubbing: true)
//             ],
//           )),
//     );
//   }
// }

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color>? _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: ColorsApp.textBlue,
      end: ColorsApp.orange,
    ).animate(_controller as Animation<double>) as Animation<Color>?;
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Color Animation')),
        body: Center(
            child: AnimatedBuilder(
                animation: _colorAnimation!,
                builder: (context, child) {
                  return ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          _colorAnimation!.value, BlendMode.modulate),
                      child: SvgPicture.asset(
                        Assets.logoSvg,
                        width: kHeight * 2.5,
                        height: kHeight * 2.5,
                      ));
                })));
  }
}
