
import 'package:go_router/go_router.dart';

import '../../views/post_list/post_list_screen.dart';
import 'app_pages.dart';

final pagesRoutes = GoRouter(
    initialLocation: Routes.initial,
    routes: 
        [
            GoRoute(
                path: Routes.initial,
                builder: (context,state) => PostListScreen()
            ),
        ]
);
