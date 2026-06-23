import 'package:get_it/get_it.dart';
import 'package:mindchoises_test_app/app/data/contracts/character_contract.dart';
import 'package:mindchoises_test_app/app/data/repositories/character_repository.dart';
import 'package:mindchoises_test_app/app/data/services/character_service.dart';
import 'package:mindchoises_test_app/app/presentation/character_profile/cubits/profile_cubit.dart';
import 'package:mindchoises_test_app/core/base/stroge/stroge_contract.dart';
import 'package:mindchoises_test_app/core/base/stroge/stroge_repository.dart';
import 'package:mindchoises_test_app/core/service/openai_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<StrogeContract>(StrogeRepository());

  locator.registerLazySingleton<OpenAiService>(() => OpenAiService());

  locator.registerLazySingleton<CharacterService>(
    () => CharacterService(locator<StrogeContract>()),
  );

  locator.registerLazySingleton<CharacterRepository>(
    () => CharacterRepository(
      locator<CharacterService>(),
      locator<OpenAiService>(),
    ),
  );

  locator.registerLazySingleton<CharacterContract>(
    () => locator<CharacterRepository>(),
  );

  locator.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(locator<CharacterRepository>()),
  );
}
