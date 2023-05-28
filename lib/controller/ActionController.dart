import 'package:Fahkap/Views/CategoryBoutique/CategoryView.dart';
import 'package:Fahkap/Views/Home/HomeView.dart';
import 'package:Fahkap/controller/CommandeController.dart';
import 'package:Fahkap/controller/productController.dart';
import 'package:Fahkap/model/data/CartModel.dart';
import 'package:Fahkap/model/data/CategoryModel.dart';
import 'package:Fahkap/model/data/LivreurModel.dart';
import 'package:Fahkap/model/data/ModePaiementModel.dart';
import 'package:Fahkap/model/data/ProduitCategoryModel.dart';
import 'package:Fahkap/model/data/ProduitModel.dart';
import 'package:Fahkap/repository/ActionRepo.dart';
import 'package:Fahkap/repository/BuyShoopingCartRepo.dart';
import 'package:Fahkap/repository/LivreurRepo.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:Fahkap/utils/Services/requestServices.dart';
import 'package:Fahkap/utils/Services/storageService2.dart';
import 'package:Fahkap/utils/database/DataBase.dart';
import 'package:Fahkap/utils/functions/viewFunctions.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:Fahkap/Views/Shopping/ShoppingView.dart';
import 'package:Fahkap/Views/UsersMange/ManageView.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Fahkap/controller/cartController.dart';

import 'package:Fahkap/styles/textStyle.dart';
import 'package:Fahkap/utils/constants/assets.dart';
import 'package:Fahkap/utils/database/DataBase.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Fahkap/Views/ComplementView/AboutUsView.dart';
import 'package:Fahkap/Views/Shopping/ShoppingView.dart';
import 'package:Fahkap/Views/UsersMange/ManageView.dart';
import 'package:Fahkap/components/Widget/optionComponent.dart';
// import 'package:antdesign_icons/antdesign_icons.dart';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:Fahkap/components/Text/smallText.dart';
import 'package:Fahkap/controller/cartController.dart';
import 'package:Fahkap/controller/categoryController.dart';
import 'package:Fahkap/utils/Services/dependancies.dart';
import 'package:flutter/material.dart';
import 'package:Fahkap/styles/colorApp.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';

class ActionController extends GetxController {
  final ActionRepo actionRepo;
  ActionController({required this.actionRepo});

  notificationSnackBar(title, id) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Recover',
      'ddd',
      '$title',
      icon: 'launcher_icon',
      importance: Importance.max,
      // priority: Priority.high,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true,
      largeIcon: DrawableResourceAndroidBitmap('launcher_icon'),
      enableVibration: true,
    );

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // if (box.read("open") == false) {
    // return await flutterLocalNotificationsPlugin.show(
    //     id, 'Notification in :', '$title', platformChannelSpecifics,
    //     payload: 'item x');
    // } else {
    //   return Fluttertoast.showToast(
    //       msg: 'New Notifications in : $title',
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 5,
    //       backgroundColor: ColorsApp.skyBlue,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
  }

  ScrollController _scrollcontroller = new ScrollController();
  ScrollController get scrollcontroller => _scrollcontroller;
  bool _dark = false;
  bool get dark => _dark;
  // getTheme(context) {
  //   _dark = vf.getTheme(context);
  //   update();
  // }

  // var vf = new ViewFunctions();
  // changeTheme(context) {
  //   vf.changeTheme(context);
  //   getTheme(context);
  // }

  List<ModePaiementModel> _lmodePaiement = [];
  List<ModePaiementModel> get lmodePaiement => _lmodePaiement;
  int _isLoadedMP = 0;
  int get isLoadedMP => _isLoadedMP;

  int _selected = 0;
  int get selected => _selected;
  selectMode(mode) {
    _selected = mode;
    update();
  }

  getListModePaiement() async {
    _isLoadedMP = 0;
    update();
    try {
      Response response = await actionRepo.getModePaiement();
      _lmodePaiement.clear();
      if (response.body != null) {
        if (response.body['data'].length != 0) {
          _lmodePaiement.addAll((response.body['data'] as List)
              .map((e) => ModePaiementModel.fromJson(e))
              .toList());
        }
        // _isLoadedMP = 1;

        // update();
      }
      _isLoadedMP = 1;

      update();
      _isLoadedMP = 1;
      update();
    } catch (e) {
      //print(e);
    }
  }

  GetStorage box = GetStorage();

  changeTheme() async {
    // //print(box.read('theme') == '1');
    _dark = !_dark;
    update();

    await Get.find<DB>().saveTheme(_dark ? "1" : "0");

    // _dark = box.read('theme') != null ? box.read('theme') == '1' : false;

    // Get.changeThemeMode(
    //   _dark ? ThemeMode.dark : ThemeMode.light,
    // );
    getTheme();
    //print(box.read('theme'));
  }

  getCurrentTheme() {
    return this.dark;
  }

  getTheme() async {
    var theme = await Get.find<DB>().getTheme();
    _dark = theme != null ? theme == '1' : false;
    update();
    Get.changeTheme(!_dark ? ThemeData.light() : ThemeData.dark());
  }

  getThemeInit(context) async {
    var theme = await Get.find<DB>().getTheme();
    _dark = theme != null
        ? theme == '1'
        : Theme.of(context).brightness == Brightness.dark;
    Get.changeTheme(!_dark ? ThemeData.light() : ThemeData.dark());
    update();
  }

  Locale _lan = Locale('fr', 'FR');
  Locale get lan => _lan;

  // getLan() async {
  //   _lan = await Get.find<DB>().getLan();
  //   //print('_lan********');
  //   //print(_lan);

  //   update();
  // }

  final List locale = [
    {'name': 'En', 'locale': const Locale('en', 'US')},
    {'name': 'Fr', 'locale': const Locale('fr', 'FR')},
  ];

  final lang = (Get.locale?.languageCode ?? 'Fr').obs;
  var store = Get.find<DB>();

  updateLanguage(String localLang) async {
    int index = locale.indexWhere((element) => element['name'] == localLang);
    if (index != -1) {
      lang.value = locale[index]['name'];
      //        fn.closeSnack();

      Get.updateLocale(locale[index]['locale']);

      await store.saveLan(lang.value);
    }
  }

  getLanguage(String localLang) {
    int index = locale.indexWhere((element) => element['name'] == localLang);
    if (index != -1) {
      return locale[index]['locale'];
    }
  }

  getLanguageInit() async {
    var lan = await Get.find<DB>().getLan();
    int index = locale.indexWhere((element) => element['name'] == lan);
    if (index != -1) {
      lang.value = locale[index]['name'];
      Get.updateLocale(locale[index]['locale']);

      // return locale[index]['locale'];
    }
  }

  final CarouselController _controller = CarouselController();
  CarouselController get controller => _controller;
  int _index = 0;
  int get index => _index;
  var fn = new ViewFunctions();

  setIndex(index) {
    _index = index;
    update();
  }

  var s = Get.find<DB>();

  notationProduit(note, codeProduit) async {
    if (note < 0 || note > 5) {
      return false;
    }
    var getU = await s.getKey();
    if (getU == null) {
      fn.snackBar('Note', 'Veuillez vous connecter', true);
    }
    var data = {
      'note': note,
      'codeProduit': codeProduit,
      "keySecret": getU,
    };
    //print(data);

    fn.loading('Note', 'Notation du produit en cours');

    try {
      Response response = await actionRepo.addNotationProduit(data);

      fn.closeSnack();

      update();
      if (response.statusCode == 200) {
        fn.snackBar('Note', 'Effectue', true);
      } else {
        fn.snackBar('Note', 'Erreur', false);
      }
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Note', 'Erreur', false);

      //print(e);
    }
  }

  notationBoutique(note, codeBoutique) async {
    if (note < 0 || note > 5) {
      return false;
    }
    // var getU = await s.getKey();
    // if (getU == null) {
    //   fn.snackBar('Note', 'Veuillez vous connecter', true);
    // }
    var data = {
      'note': note,
      'codeBoutique': codeBoutique,
      "keySecret": 12341 //getU,
    };
    //print(data);
    fn.loading('Note', 'Notation de la boutique en cours');

    try {
      Response response = await actionRepo.addNotationBoutique(data);
      //print(response.body);
      fn.closeSnack();

      update();
      if (response.statusCode == 200) {
        fn.snackBar('Note', 'Effectue', true);
      } else {
        fn.snackBar('Note', 'Erreur', false);
      }
    } catch (e) {
      fn.closeSnack();

      fn.snackBar('Note', 'Erreur', false);
      //print(e);
    }
  }

  late ScrollController _controllerT;
  get controllerT => _controllerT;
  @override
  void onInit() {
    // test();
    // _controllerT = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    //print('-++++++++-----${_controllerT.offset + 200}');
    //print('-------${_controllerT.position.maxScrollExtent}');
    if (_controllerT.offset + 200 >= _controllerT.position.maxScrollExtent) {
      test();
    }
  }

  bool _loaddata = false;
  get loaddata => _loaddata;
  List _data = [];
  get data => _data;
  int indexC = 0;
  test() async {
    //print('-----------------------action-------${_loaddata}----------');
    if (_loaddata == false) {
      _loaddata = true;
      indexC += int.parse(data.length.toString());
      update();
      try {
        Response response = await actionRepo.test(indexC);
        //print(response.body);

        if (response.statusCode == 200) {
          _data.addAll(response.body['data']);
          _loaddata = false;
          update();
        } else {}
      } catch (e) {
        fn.closeSnack();

        //print(e);
      }
    }
  }

  int _currentIndex = 0;
  Widget buildContent() {
    switch (_currentIndex) {
      case 0:
        return HomeView();
      // case 1:
      //   return SearchView();
      case 1:
        //   return ListBoutiqueView();
        // case 2:
        return CategoryView();

      // case 2:
      //   return SearchView();
      case 2:
        return ShoppingView();

      case 3:
        return ManageView();

      // case 4:
      //   return ProfileUserView();

      default:
        return HomeView();
    }
  }

  Widget buildBorderRadiusDesign() {
    return GetBuilder<ProductController>(builder: (_controller) {
      return Offstage(
          offstage: _controller.isBottomBarVisible,
          child: CustomNavigationBar(
                iconSize: 30.0,
                // elevation: 0.0,
                scaleFactor: 0.4,
                selectedColor: Color(0xff0c18fb),
                strokeColor: Color(0x300c18fb),
                unSelectedColor: Colors.grey[600],
                backgroundColor: ColorsApp.greySearch,
                // borderRadius: Radius.circular(15.0),
                // isFloating: true,
                // blurEffect: true,
                items: [
                  CustomNavigationBarItem(
                      icon: Container(
                        height: kSmHeight / 1.7,
                        width: kSmWidth / 4.2,
                        child: SvgPicture.asset(
                          Assets.home,
                          width: 90,
                          height: 90,
                          color: _currentIndex == 0
                              ? ColorsApp.skyBlue
                              : ColorsApp.grey,
                        ),
                      ),
                      title: Container(
                          padding: EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: _currentIndex == 0
                                      ? BorderSide(
                                          color: ColorsApp.skyBlue, width: 2)
                                      : BorderSide.none,
                                  top: BorderSide.none)),
                          child: Text('home'.tr,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: _currentIndex == 0
                                    ? ColorsApp.skyBlue
                                    : ColorsApp.grey,
                              )))), // CustomNavigationBarItem(

                  CustomNavigationBarItem(
                    icon: Container(
                      height: kSmHeight / 1.7,
                      width: kSmWidth / 4.2,
                      child: SvgPicture.asset(
                        Assets.grid1,
                        width: 80,
                        height: 80,
                        color: _currentIndex == 1
                            ? ColorsApp.skyBlue
                            : ColorsApp.grey,
                      ),
                    ),
                    title: Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: _currentIndex == 1
                                    ? BorderSide(
                                        color: ColorsApp.skyBlue, width: 2)
                                    : BorderSide.none,
                                top: BorderSide.none)),
                        child: Text('categories'.tr,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: _currentIndex == 1
                                  ? ColorsApp.skyBlue
                                  : ColorsApp.grey,
                            ))),
                  ),

                  CustomNavigationBarItem(
                    icon: Container(
                      height: kSmHeight / 1.7,
                      width: kSmWidth / 4.2,
                      child: SvgPicture.asset(
                        Assets.shoppingCart,
                        width: 90,
                        height: 90,
                        color: _currentIndex == 2
                            ? ColorsApp.skyBlue
                            : ColorsApp.grey,
                      ),
                    ),
                    title: Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: _currentIndex == 2
                                    ? BorderSide(
                                        color: ColorsApp.skyBlue, width: 2)
                                    : BorderSide.none,
                                top: BorderSide.none)),
                        child: Text('Shop',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: _currentIndex == 2
                                  ? ColorsApp.skyBlue
                                  : ColorsApp.grey,
                            ))),
                  ),

                  CustomNavigationBarItem(
                    icon: Container(
                      height: kSmHeight / 1.7,
                      width: kSmWidth / 4.2,
                      child: Icon(
                        Icons.settings,
                        size: 25,
                        color: _currentIndex == 3
                            ? ColorsApp.skyBlue
                            : ColorsApp.grey,
                      ),
                    ),
                    title: Container(
                        padding: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: _currentIndex == 3
                                    ? BorderSide(
                                        color: ColorsApp.skyBlue, width: 2)
                                    : BorderSide.none,
                                top: BorderSide.none)),
                        child: Text('setting'.tr,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: _currentIndex == 3
                                  ? ColorsApp.skyBlue
                                  : ColorsApp.grey,
                            ))),

                    // badgeCount: _badgeCounts[4],
                    // showBadge: _badgeShows[4],
                  ),
                  // CustomNavigationBarItem(
                  //   icon: Icon(Icons.hourglass_disabled),
                  //   badgeCount: _badgeCounts[4],
                  //   showBadge: _badgeShows[4],
                  // ),
                ],
                currentIndex: _currentIndex,
                onTap: (index) {
                  _currentIndex = index;
                  update();
                  if (index == 0) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.find<ProductController>().restoreScrollPosition();
                    });
                  }
                },
              ));
    });
  }
}