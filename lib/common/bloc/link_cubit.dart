import 'package:bloc/bloc.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class LinkCubit extends Cubit<String?> {
  final navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  LinkCubit() : super(null) {
    _initialize();
  }

  void _initialize() async {
    _appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    _linkSubscription = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        emit(uri.toString());
        openAppLink(uri);
      }
    });
  }

  void openAppLink(Uri uri) {
    navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  @override
  Future<void> close() {
    _linkSubscription?.cancel();
    return super.close();
  }
}
