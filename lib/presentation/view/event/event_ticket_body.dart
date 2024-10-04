import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/presentation/cubit/events/cubit/events_cubit.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/app_text.dart';
import '../../widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventTicketBody extends StatefulWidget {
  final int id;
  const EventTicketBody({super.key, required this.id});

  @override
  State<EventTicketBody> createState() => _EventTicketBodyState();
}

class _EventTicketBodyState extends State<EventTicketBody> {
  @override
  void initState() {
    super.initState();
    context.read<EventsCubit>().getTicketsDataById(ticketId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(body: BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        return switch (state) {
          EventsTicketsDataLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          EventsTicketsDataFailure(message: final message) => Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  height(30),
                  Row(
                    children: [
                      const CustomArrowBack(),
                      width(100),
                      Image.asset(AppAssets.logo),
                    ],
                  ),
                  DefaultText(
                    text: message,
                    color: AppColors.kprimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            )),
          EventsTicketsDataSuccess(branchEntity: final brachEntity) =>
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  Row(
                    children: [
                      Image.network(
                        "https://ajyalona.org.ly/${brachEntity.image}",
                        fit: BoxFit.cover,
                      ),
                      height(12),
                      const DefaultText(
                        text: 'الفرع :',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey82,
                      ),
                      DefaultText(
                        text: brachEntity.arName ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey82,
                      ),
                    ],
                  ),
                ])),
          _ => const SizedBox.shrink()
        };
      },
    ));
  }
}
