import 'package:flutter/material.dart';

import 'core/env.dart';

void main() => Development();

class Development extends Env {
  @override
  final String appName = 'SkyKomik Dev';

  @override
  final String appUsername = '';

  @override
  final String baseUrl = 'https://admin.lugu.id'; //dev

  @override
  final String imageUrl = 'https://admin.lugu.id/file/';

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
  EnvType environmentType = EnvType.development;

  @override
  final String dbName = 'LuguSuperAppsDev';
}
