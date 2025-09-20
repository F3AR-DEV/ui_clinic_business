import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import '../home_view.dart';

part 'home_route.g.dart';

@riverpod
List<GoRoute> homeRoutes(Ref ref) {
  return [
    GoRoute(path: '/home', builder: (context, state) => const HomeView()),
  ];
}
