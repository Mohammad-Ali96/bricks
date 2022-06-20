import '/../features/home_page/pages/home_page.dart';
import 'package:auto_route/auto_route.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
