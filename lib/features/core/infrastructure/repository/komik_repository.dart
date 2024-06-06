import 'package:dartz/dartz.dart';
import 'package:lugu_pet/app/common/exception.dart';
import 'package:lugu_pet/features/core/infrastructure/model/recent_chapter_komik_model.dart';

import '../../domain/interface/komik_repository_base.dart';
import '../data_source/komik_local_data_source.dart';

class KomikRepository implements KomikRepositoryBase {
  @override
  Stream<List<RecentChapterKomikModel>> getRecentChapterKomik(
      {required String slug}) {
    return KomikLocalDataSource().getRecentChapterKomik(slug: slug);
  }

  @override
  Future<Either<GenericException, int>> insertOrUpdateRecentChapter(
      {required RecentChapterKomikModel recentChapter}) async {
    return await KomikLocalDataSource().insertOrUpdateRecentChapter(
      recentChapter: recentChapter,
    );
  }

  
}
