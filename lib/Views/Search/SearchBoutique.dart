import 'package:EMIY/components/Form/home_search_field.dart';
import 'package:EMIY/components/Form/search_field.dart';
import 'package:EMIY/components/Widget/BoutiqueCircleComponent.dart';
import 'package:EMIY/components/Widget/BoutiqueComponent.dart';
import 'package:EMIY/components/Widget/BoutiqueComponentHomeN.dart';
import 'package:EMIY/components/Widget/ShimmerBox.dart';
import 'package:EMIY/components/Widget/ShimmerBoxBoutique.dart';
import 'package:EMIY/components/Widget/ShimmerProduit.dart';
import 'package:EMIY/components/Widget/app_title_right.dart';
import 'package:EMIY/components/Widget/icon_svg.dart';
import 'package:EMIY/controller/GeneralController.dart';
import 'package:EMIY/controller/CommandeController.dart';
import 'package:EMIY/controller/ShortController.dart';
import 'package:EMIY/controller/managerController.dart';
import 'package:EMIY/controller/MySearchController.dart';
import 'package:EMIY/utils/constants/assets.dart';
import 'package:EMIY/components/Widget/categoryComponent.dart';
import 'package:EMIY/components/Widget/produitComponent.dart';
import 'package:EMIY/components/Text/smallText.dart';
import 'package:EMIY/components/Text/titleText.dart';
import 'package:EMIY/components/Widget/produitComponentAll.dart';
import 'package:EMIY/controller/categoryBoutiqueController.dart';
import 'package:EMIY/controller/categoryController.dart';
import 'package:EMIY/controller/produitController.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/Services/routing.dart';
import 'package:EMIY/utils/functions/viewFunctions.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/Button/app_button.dart';

class SearchBoutique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController>(builder: (search) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
        child: SingleChildScrollView(
          controller: search.controllerT,
          child: Column(
            children: [
              /*  search.isLoadedSupp == 0
                          ? ShimmerProduit()
                          : */
              GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),

                  // Ratio largeur/hauteur pour chaque élément
                  // controller: search.controllerT,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.70,
                      mainAxisSpacing: 10.0),
                  itemCount: search.listBoutique.length,
                  itemBuilder: (_ctx, index) => BoutiqueCircleComponent(
                        boutique: search.listBoutique[index],
                      )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: search.isLoaded == true
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          // Ratio largeur/hauteur pour chaque élément
                          // controller: search.controllerT,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.70,
                                  mainAxisSpacing: 10.0),
                          itemCount: 9,
                          itemBuilder: (_ctx, index) => ShimmerBoxBoutique())
                      : Container())
            ],
          ),
        ),
      );
    });
  }
}
