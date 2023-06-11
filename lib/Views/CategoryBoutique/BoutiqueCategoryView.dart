import 'package:EMIY/components/Button/IconButtonF.dart';
import 'package:EMIY/components/Button/btnCatList.dart';
import 'package:EMIY/components/Button/btnCatListPV.dart';
import 'package:EMIY/components/Button/button.dart';
import 'package:EMIY/components/Form/formComponent2.dart';
import 'package:EMIY/components/Text/bigText.dart';
import 'package:EMIY/components/Text/bigtitleText.dart';
import 'package:EMIY/components/Widget/BoutiqueComponent.dart';
import 'package:EMIY/components/Widget/app_back_button.dart';
import 'package:EMIY/components/Widget/app_empty.dart';
import 'package:EMIY/components/Widget/app_loading.dart';
import 'package:EMIY/components/Widget/app_title_right.dart';
import 'package:EMIY/components/Widget/categoryComponent.dart';
import 'package:EMIY/components/Widget/productComponent.dart';
import 'package:EMIY/components/Text/smallText.dart';
import 'package:EMIY/components/Text/titleText.dart';
import 'package:EMIY/components/Widget/productForCatComponent.dart';
import 'package:EMIY/controller/boutiqueController.dart';
import 'package:EMIY/controller/categoryController.dart';
import 'package:EMIY/controller/categoryBoutiqueController.dart';
import 'package:EMIY/controller/productController.dart';
import 'package:EMIY/styles/colorApp.dart';
import 'package:EMIY/styles/textStyle.dart';
import 'package:EMIY/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BoutiqueCategoryView extends StatelessWidget {
  BoutiqueCategoryView({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    //print(Get.parameters);
    Get.find<CategoryBoutiqueController>()
        .getCategoryBoutique(Get.parameters['id']);

    return Scaffold(
        body: RefreshIndicator(
      color: ColorsApp.skyBlue,
      onRefresh: () async {
        await Get.find<CategoryBoutiqueController>()
            .getCategoryBoutique(Get.parameters['id']);
      },
      child: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // Provide a standard title.
          // title: Text('title'),
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: InkWell(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(top: Get.height * .030),
                    padding: EdgeInsets.only(
                        left: Get.width * .030, right: Get.width * .030),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBackButton(),
                          Container(
                            child: AppTitleRight(
                                title: 'Boutique',
                                description:
                                    Get.parameters['libelle'].toString(),
                                icon: null),
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * .005),
                          ),
                        ])),
              ]),
            ),
          ),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 60,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => GetBuilder<CategoryBoutiqueController>(
              builder: (_lbcontroller) => _lbcontroller.isLoadedP == 0
                  ? AppLoading()
                  : (_lbcontroller.ListBoutique.length != 0)
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
                                      childAspectRatio: 0.8,
                                      mainAxisSpacing: 20.0),
                              itemCount: _lbcontroller.ListBoutique.length,
                              itemBuilder: (_ctx, index) => BoutiqueComponent(
                                    boutique: _lbcontroller.ListBoutique[index],
                                  )))
                      : AppEmpty(title: 'Aucune boutique'),
            ),

            // Builds 1000 ListTiles
            childCount: 1,
          ),
        )
      ]),
    ));
  }
}
