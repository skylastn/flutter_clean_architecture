import 'package:dartz/dartz.dart';

import '../../../../app/common/exception.dart';
import '../../infrastructure/model/komik_response.dart';
import '../../infrastructure/model/recent_chapter_komik_model.dart';

abstract class KomikRepositoryBase {
  Stream<List<RecentChapterKomikModel>> getRecentChapterKomik({
    required String slug,
  });
  Future<Either<GenericException, int>> insertOrUpdateRecentChapter({
    required RecentChapterKomikModel recentChapter,
  });

  Future<Either<GenericException, KomikResponse>> getPopularKomik();
}
