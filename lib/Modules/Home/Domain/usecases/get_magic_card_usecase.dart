import 'package:mtgsearcher/Modules/Home/Core/errors/failures.dart';
import 'package:mtgsearcher/Modules/Home/Domain/entities/magic_card.dart';
import 'package:mtgsearcher/Modules/Home/Domain/repositories/magic_card_repository.dart';
import 'package:dartz/dartz.dart';

class GetMagicCardUseCase {
  final MagicCardRepository magicCardRepository;
  GetMagicCardUseCase(this.magicCardRepository);

  Future<Either<Failure, List<MagicCard>>> call(String url) async {
    return await magicCardRepository.getMagicCards(url);
  }
}
