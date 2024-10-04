import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/domain/entity/auth/user.dart';
import 'package:ageal/presentation/cubit/platform/episodes/episodes_details.dart';
import 'package:ageal/presentation/view/auth/login/login_screen.dart';
import 'package:ageal/presentation/view/auth/register/register_screen.dart';
import 'package:ageal/presentation/view/edit_profile/edit_profile_screen.dart';
import 'package:ageal/presentation/view/event/card_event_details.dart';
import 'package:ageal/presentation/view/event/event_ticket_body.dart';
import 'package:ageal/presentation/view/event/more_events.dart';
import 'package:ageal/presentation/view/home/home_page.dart';
import 'package:ageal/presentation/view/news/news_details_screen.dart';
import 'package:ageal/presentation/view/news/news_screen.dart';
import 'package:ageal/presentation/view/paltform/new_generation_paltform_screen.dart';
import 'package:ageal/presentation/view/splash/splash_screen.dart';
import 'package:ageal/presentation/widget/platform/custom_episodes.dart';
import 'package:ageal/presentation/widget/platform/custom_playlists.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/view/event/event_page.dart';
import '../../presentation/widget/home_widget/nav_bar_items.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  routes: [
    GoRoute(
      path: Routes.initial,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: Routes.navBar,
      builder: (context, state) => const NavBarItems(),
    ),
    GoRoute(
      path: Routes.events,
      name: 'events',
      builder: (context, state) {
        final navigationSource = state.extra as String;
        return EventsPage(navigationSource: navigationSource);
      },
    ),
    GoRoute(
      path: Routes.news,
      builder: (context, state) => const NewsScreen(),
    ),
    GoRoute(
      path: Routes.platform,
      builder: (context, state) => const NewGenerationPaltformScreen(),
    ),
    GoRoute(
      path: "/${Routes.editProfile}",
      name: Routes.editProfile,
      builder: (context, state) {
        final userData = state.extra as UserDataEntity;
        return EditProfileScreen(userEntity: userData);
      },
    ),
    GoRoute(
      path: "/${Routes.eventDetails}/:id",
      name: Routes.eventDetails,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return CardEventDetails(
          id: int.parse(id!),
        );
      },
    ),
    GoRoute(
      path: "/${Routes.eventTickets}/:id",
      name: Routes.eventTickets,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return EventTicketBody(
          id: int.parse(id!),
        );
      },
    ),
    GoRoute(
        path: "/${Routes.newsDetails}/:id",
        name: Routes.newsDetails,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return NewsDetailsScreen(
            id: int.parse(id!),
          );
        }),
    GoRoute(
        path: '/${Routes.episodes}/:id',
        name: Routes.episodes,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return EpisodesDetailsScreen(
            id: int.parse(id!),
          );
        }),
    GoRoute(
        path: Routes.moreEvent,
        builder: (context, state) => const MoreEventsScreen()),
    GoRoute(
      path: Routes.episodes,
      builder: (context, state) => const CustomEpisodes(),
    ),
    GoRoute(
      path: Routes.playlist,
      builder: (context, state) => const CustomPlaylists(),
    ),
  ],
);
