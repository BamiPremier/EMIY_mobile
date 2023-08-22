import 'package:EMIY/components/Button/AppIconButton.dart';
import 'package:EMIY/components/Button/ShareButton.dart';
import 'package:EMIY/components/Widget/app_back_button.dart';
import 'package:EMIY/components/Widget/app_loading.dart';
import 'package:EMIY/components/Widget/app_title_right.dart';
import 'package:EMIY/controller/GeneralController.dart';
import 'package:EMIY/controller/ShortController.dart';
import 'package:EMIY/controller/boutiqueController.dart';
import 'package:EMIY/utils/Services/routing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:EMIY/components/Button/IconButtonF.dart';
import 'package:EMIY/components/Button/btnCatList.dart';
import 'package:EMIY/components/Button/btnCatListPV.dart';
import 'package:EMIY/components/Button/button.dart';
import 'package:EMIY/components/Form/formComponent2.dart';
import 'package:EMIY/components/Text/bigText.dart';
import 'package:EMIY/components/Text/bigtitleText.dart';
import 'package:EMIY/components/Text/bigtitleText0.dart';
import 'package:EMIY/components/Widget/categoryComponent.dart';
import 'package:EMIY/components/Widget/produitComponent.dart';
import 'package:EMIY/components/Text/smallText.dart';
import 'package:EMIY/components/Text/titleText.dart';
import 'package:EMIY/components/Widget/produitForBoutiqueComponent.dart';
import 'package:EMIY/components/Widget/produitForCatComponent.dart';
import 'package:EMIY/controller/categoryController.dart';
import 'package:EMIY/controller/categoryBoutiqueController.dart';
import 'package:EMIY/controller/produitController.dart';
import 'package:EMIY/model/data/ProduitModel.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../components/Widget/app_empty.dart';

class PreferenceView extends StatelessWidget {
  PreferenceView({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProduitController>(
      builder: (_controler) => _controler.isLoadedPB == 0
          ? AppLoading()
          : Container(
              // height: double.maxFinite,
              margin: EdgeInsets.symmetric(vertical: kMarginY * .2),
              child: _controler.isLoadedPB == 1
                  ? (_controler.preferenceList.length != 0)
                      ? SingleChildScrollView(
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  EdgeInsets.symmetric(horizontal: kMarginX),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20.0,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 20.0),
                              itemCount: _controler.preferenceList.length,
                              itemBuilder: (_ctx, index) =>
                                  ProduitForBoutiqueComponent(
                                      produit: _controler.preferenceList[index],
                                      type: 'favorite',
                                      index: index)))
                      : Container(
                          height: kHeight,
                          child: AppEmpty(title: 'Aucun Produit'))
                  : Container(
                      height: kMdHeight * .6,
                      alignment: Alignment.center,
                      child: Center(
                        child: Text('Error'),
                      ))),
    );
  }
}
