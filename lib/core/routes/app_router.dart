import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mindchoises_test_app/app/presentation/character_profile/cubits/profile_cubit.dart';
import 'package:mindchoises_test_app/core/di/injector.dart';
import 'package:mindchoises_test_app/core/helpers/pager.dart';
import 'package:mindchoises_test_app/core/routes/app_routes.dart';

/// Bridges a Cubit stream into a [Listenable] so GoRouter re-evaluates
/// redirect every time the cubit emits a new state.
class _CubitListenable<S> extends ChangeNotifier {
  _CubitListenable(BlocBase<S> cubit) {
    cubit.stream.listen((_) => notifyListeners());
  }
}

final appRouter = _buildRouter();

GoRouter _buildRouter() {
  final profileCubit = locator<ProfileCubit>();

  // Kick off the character check here — no need to touch main.dart or app.dart
  profileCubit.loadCharacter();

  return GoRouter(
    initialLocation: AppRoutes.userInfo,
    refreshListenable: _CubitListenable(profileCubit),
    redirect: (context, state) {
      final profileState = profileCubit.state;
      final location = state.matchedLocation;

      // Still loading — show nothing, stay on current route
      if (profileState is ProfileLoading || profileState is ProfileInitial) {
        return null;
      }

      // Character found → send to profile (unless already navigating there)
      if (profileState is ProfileSuccess) {
        final onProfile = location == AppRoutes.characterProfile;
        final onCustomize = location == AppRoutes.characterCustomize;
        if (!onProfile && !onCustomize) {
          return AppRoutes.characterProfile;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.userInfo,
        builder: (context, state) => Pager.userInfo(),
      ),
      GoRoute(
        path: AppRoutes.characterCustomize,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return Pager.characterCustomize(
            name: extra['name'] as String,
            age: extra['age'] as int,
            gender: extra['gender'] as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.characterProfile,
        builder: (context, state) => Pager.characterProfile(),
      ),
    ],
  );
}
