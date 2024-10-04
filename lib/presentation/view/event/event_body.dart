import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/events/cubit/events_cubit.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/events_widget/custom_event_body_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../dependency_injection.dart';
import '../../widget/events_widget/custom_grid_view.dart';

class EventBody extends StatefulWidget {
  const EventBody({super.key});

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  @override
  void initState() {
    super.initState();
    context.read<EventsCubit>().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsCubit(eventsRepo: getIt())..getEvents(),
      child: RefreshIndicator(
        onRefresh: () async => context.read<EventsCubit>().getEvents(),
        child: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            return switch (state) {
              EventsInitial() => const CustomEventBodyShimmer(),
              EventsLoading() => const CustomEventBodyShimmer(),
              EventsFailure(message: final message) => Center(
                    child: DefaultText(
                  text: message,
                  color: AppColors.kprimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
              EventsSuccess(festivalEntity: final festivalEntity) =>
                CustomStackScaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(20),
                        Image.network(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.18,
                          "https://ajyalona.org.ly/${festivalEntity.media}",
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            AppAssets.aboutCommunityPic,
                            fit: BoxFit.fill,
                          ),
                          fit: BoxFit.fill,
                        ),
                        height(16),
                        DefaultText(
                          text: S.current.event,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey82,
                        ),
                        Expanded(
                            child: CustomGridView(
                          events: festivalEntity.events ?? [],
                        )),
                      ],
                    ),
                  ),
                ),
              _ => const Center(child: Text('Error')),
            };
          },
        ),
      ),
    );
  }
}
