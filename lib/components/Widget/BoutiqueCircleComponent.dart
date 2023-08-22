// ignore: must_be_immutable
import 'package:EMIY/components/Widget/ShimmerBox.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:EMIY/model/data/BoutiqueModel.dart';
import 'package:EMIY/model/data/CategoryModel.dart';
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/Services/routing.dart';
import 'package:get/get.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class BoutiqueCircleComponent extends StatelessWidget {
  BoutiqueModel boutique;

  BoutiqueCircleComponent({required this.boutique});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppLinks.BOUTIQUE +
            '?lienBoutique=${boutique.lienBoutique.toString()}&status_abonnement=${boutique.status_abonnement.toString()}&note=${boutique.note}&codeBoutique=${boutique.codeBoutique}&note=${boutique.note}&nomBoutique=${boutique.titre}&description=${boutique.description}&ville=${boutique.localisation.ville}&image=${boutique.images[boutique.images.length - 1].src}');
      },
      child: Container(
        height: kHeight / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: boutique.images[boutique.images.length - 1].src,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: kHeight * .15,
                    decoration: BoxDecoration(
                      color: ColorsApp.greySecond,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.transparent, BlendMode.colorBurn)),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                      baseColor: Colors.blueGrey,
                      highlightColor: Colors.greenAccent,
                      child: Container(
                          height: kHeight * .15,
                          decoration: BoxDecoration(
                            color: ColorsApp.greySecond,
                            borderRadius: BorderRadius.circular(50),
                          )));
                },
                errorWidget: (context, url, error) {
                  return Container(
                      height: kHeight / 4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/logo/logo.png'),
                      )));
                },
              ),
            ),
            Container(
                // width: kWidth / 1.5,
                child: Text(boutique.titre,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsApp.secondBlue,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 12))),
            Container(
                child: Text(boutique.localisation.ville,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // color: ColorsApp.secondBlue,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.bold,
                        fontSize: 12))),
            // Container(
            //     child: Row(
            //   children: [
            //     Icon(
            //       Icons.cancel,
            //       color: ColorsApp.red,
            //     ),
            //     Text('Ne plus suivre',
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             color: ColorsApp.red,
            //             fontFamily: 'Montserrat',
            //             // fontWeight: FontWeight.bold,
            //             fontSize: 10)),
            //   ],
            // )),
          ],
        ),
      ),
    );
  }
}
