import 'package:refreshed/refreshed.dart';
import '../features/core/infrastructure/repository/komik_repository.dart';

class AppBinding {
  static List<Bind<dynamic>> listInitialBinding = [
    Bind.lazyPut<KomikRepository>(
      () => KomikRepository(),
    ),
  ];
  // @override
  // List<Bind> dependencies() {
  //   return [
  //     Bind.lazyPut<KomikRepository>(
  //       () => KomikRepository(),
  //     ),
  //   ];
  // }
}
