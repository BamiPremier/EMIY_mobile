// ignore: must_be_immutable
import 'package:EMIY/components/Widget/ShimmerBox.dart';
import 'package:EMIY/controller/negociationController.dart';
import 'package:EMIY/styles/theme.dart';
import 'package:cached_network_image/cached_network_image.dart'; 
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/Services/routing.dart';
import 'package:EMIY/utils/Services/apiUrl.dart';
import 'package:get/get.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProduitForBoutiqueComponent extends StatelessWidget {
  var produit, type;
  var height, index;

  ProduitForBoutiqueComponent(
      {required this.produit,
      required this.index,
      this.height,
      this.type = '2'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: kHeight / 4,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: produit.images[0].src,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: kHeight / 4,
                      decoration: BoxDecoration(
                        color: ColorsApp.greySecond,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.colorBurn)),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return ShimmerBox();
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                        height: kHeight / 4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/logo/logoNew.png'),
                        )));
                  },
                ),
                produit.negociable
                    ? Positioned(
                        top: 2,
                        right: 2,
                        child: InkWell(
                            child: Icon(Icons.handshake),
                            onTap: () {
                              Get.find<NegociationController>()
                                  .newNegociation(produit.codeProduit);
                            }),
                      )
                    : Container()
              ]),
              Container(
                  width: kWidth / 2,
                  child: Text(produit.titre,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TexteStyle().secondaryTextStyle)),
              Container(
                  width: kWidth / 2,
                  child: Text('XAF ' + produit.prix.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TexteStyle().bprimaryTextStyle)),
            ]),
      ),
      onTap: () {
        // //print(AppLinks.PRODUCT);

        Get.toNamed(AppLinks.PRODUCT +
            '?index=${index}&type=${type}&id=${produit.id}&titre=${produit.titre}&description=${produit.description}&image=${ApiUrl.baseUrl}/images/produits/${produit.images[0].src}');
      },
    );
  }
}