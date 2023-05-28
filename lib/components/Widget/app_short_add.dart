import 'dart:io';

import 'package:Fahkap/controller/boutiqueController.dart';
import 'package:Fahkap/model/data/ProduitBoutiqueModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Fahkap/styles/textStyle.dart';
import 'package:get/get.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppShortAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoutiqueController>(
        builder: (_controller) => InkWell(
              child: Container(
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 3),
                  height: kMdHeight * .2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorsApp.greySecond,
                    borderRadius: BorderRadius.circular(20),
                  )),
              onTap: () {
                _controller.getVideo();
              },
            ));
  }
}