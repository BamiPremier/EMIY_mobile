import 'package:fahkapmobile/components/Button/IconButtonF.dart';
import 'package:fahkapmobile/components/Button/btnCatList.dart';
import 'package:fahkapmobile/components/Button/btnCatListPV.dart';
import 'package:fahkapmobile/components/Button/button.dart';
import 'package:fahkapmobile/components/Form/formComponent2.dart';
import 'package:fahkapmobile/components/Text/bigText.dart';
import 'package:fahkapmobile/components/Text/bigtitleText0.dart';
import 'package:fahkapmobile/components/Widget/BoutiqueComponent.dart';
import 'package:fahkapmobile/components/Widget/categoryComponent.dart';
import 'package:fahkapmobile/components/Widget/productComponent.dart';
import 'package:fahkapmobile/components/Text/smallText.dart';
import 'package:fahkapmobile/components/Text/titleText.dart';
import 'package:fahkapmobile/components/Widget/productComponentAll.dart';
import 'package:fahkapmobile/components/Widget/productForCatComponent.dart';
import 'package:fahkapmobile/controller/boutiqueController.dart';
import 'package:fahkapmobile/controller/categoryController.dart';
import 'package:fahkapmobile/controller/categoryBoutiqueController.dart';
import 'package:fahkapmobile/controller/productController.dart';
import 'package:fahkapmobile/styles/colorApp.dart';
import 'package:fahkapmobile/styles/textStyle.dart';
import 'package:fahkapmobile/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ListProduitsView extends StatelessWidget {
  ListProduitsView({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    print(Get.parameters);
    Get.find<ProductController>().getProduitAll();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorsApp.black,
            ),
            onTap: () {
              Get.back();
            },
          ),
          title: BigtitleText0(text: 'Liste des produits', bolder: true),
        ),
        body: GetBuilder<ProductController>(builder: (prods) {
          return RefreshIndicator(
            color: ColorsApp.skyBlue,
            onRefresh: () async {
              await Get.find<ProductController>().getProduitAll();
              ;
            },
            child: prods.isLoadedPAll == 0
                ? Shimmer.fromColors(
                    baseColor: Colors.blueGrey,
                    highlightColor: Colors.greenAccent,
                    child: SizedBox(
                      height: kMdHeight,
                      child: Stack(
                        children: [
                          GridView.builder(
                            padding: const EdgeInsets.all(20),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 50.0),
                            itemCount: 10,
                            itemBuilder: (_ctx, index) => Container(
                              height: kMdHeight * 2,
                              width: kMdWidth * 1.1,
                              margin: EdgeInsets.only(right: kMarginX),
                              decoration: BoxDecoration(
                                  color: ColorsApp.greySecond,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: kMdHeight * .115,
                                        width: Get.width * .5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage('assets/logo.png'),
                                        ))),
                                    Container(
                                      width: kSmWidth * .6,
                                      margin: EdgeInsets.only(
                                          top: Get.height * .005,
                                          left: Get.width * .008),
                                      child: Text('produit.titre',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsApp.black,
                                              fontSize: 12)),
                                    ),
                                    // Container(
                                    //   width: kSmWidth * .6,
                                    //   margin: EdgeInsets.only(
                                    //       top: Get.height * .005,
                                    //       left: Get.width * .008),
                                    //   child: Text('XAF ' + '1000',
                                    //       overflow: TextOverflow.ellipsis,
                                    //       style: TextStyle(
                                    //           color: Colors.red,
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.bold)),
                                    // ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ))
                : (prods.produitListAll.length != 0)
                    ? StaggeredGridView.countBuilder(
                        physics: ScrollPhysics(),
                        crossAxisCount: 4,
                        itemCount: prods.produitListAll.length,
                        itemBuilder: (_ctx, index) => ProductComponentAll(
                            type: 1,
                            produit: prods.produitListAll[index],
                            index: index),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(2, index.isEven ? 3 : 2),
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 4.0,

                        //   GridView.builder(
                        //       physics:
                        //           NeverScrollableScrollPhysics(),
                        //       gridDelegate:
                        //           const SliverGridDelegateWithFixedCrossAxisCount(
                        //               crossAxisCount: 2,
                        //               crossAxisSpacing:
                        //                   10.0,
                        //               mainAxisSpacing:
                        //                   50.0),
                        //       itemCount:
                        //           prods.produitList.length,
                        //       itemBuilder: (_ctx, index) =>
                        //           ProductComponentAll(
                        //               produit:
                        //                   prods.produitList[
                        //                       index],
                        //               index: index)),
                      )
                    : Container(
                        height: kMdHeight * .6,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text('Aucune produit'),
                        )),

            // Builds 1000 ListTiles
          );
        }));
  }
}
