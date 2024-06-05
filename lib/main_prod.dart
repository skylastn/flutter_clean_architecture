import 'package:flutter/material.dart';
import 'core/env.dart';

void main() => Production();

class Production extends Env {
  @override
  final String appName = 'SkyKomik';

  @override
  final String appUsername = 'skytronik';

  @override
  final String baseUrl = 'http://admin.lugu.id'; //dev

  @override
  final String imageUrl = 'http://admin.lugu.id/file/';

  @override
  final String logo = 'assets/images/logo.png';

  @override
  final String vapidKey =
      'BNPbvw_VuGEdfX_n1_yx5ZSQ_fYtghBhQPz36QrupiqCWACHtLcHq5Dm-j_OOgBWVSU2bBukq-EvFgB5tXTfX2o';

  @override
  final String websocket =
      'wss://ai-care.callink.id/websocket'; // socket.io reject connecting so websocket handle it
  @override
  final Color primarySwatch = Colors.teal;

  @override
  EnvType environmentType = EnvType.production;

  @override
  final String dbName = 'LuguSuperApps';
}
