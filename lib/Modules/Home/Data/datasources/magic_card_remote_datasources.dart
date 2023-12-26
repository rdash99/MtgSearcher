import 'package:mtgsearcher/Modules/Home/Core/endpoints/magic_card_endpoints.dart';
import 'package:mtgsearcher/Modules/Home/Core/errors/exceptions.dart';
import 'package:mtgsearcher/Modules/Home/Data/models/magic_card_model.dart';
import 'package:mtgsearcher/Modules/Home/Domain/entities/magic_card.dart';

import 'package:dio/dio.dart';

abstract class MagicCardRemoteDataSource {
  Future<List<MagicCard>> getCards(String url);
}

class MagicCardRemoteDataSourceImplementation
    implements MagicCardRemoteDataSource {
  @override
  Future<List<MagicCard>> getCards(url) async {
    var dio = Dio();
    final response =
        await dio.get(MagicCardEndpoints.search.replaceAll('#searchTerm', url));
    if (response.statusCode == 200) {
      final decodedData = response.data;
      return List.from(
        decodedData["cards"].map(
          (card) {
            return MagicCardModel.fromJson(card);
          },
        ),
      );
    } else {
      throw ServerException();
    }
  }
}
