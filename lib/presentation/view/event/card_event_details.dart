import 'dart:developer';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/events/cubit/events_cubit.dart';
import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/custom/default_button.dart';
import 'package:ageal/presentation/widget/events_widget/buy_tickets_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CardEventDetails extends StatefulWidget {
  final int id;

  const CardEventDetails({super.key, required this.id});

  @override
  State<CardEventDetails> createState() => _CardEventDetailsState();
}

class _CardEventDetailsState extends State<CardEventDetails> {
  @override
  void initState() {
    super.initState();
    context.read<EventsCubit>().getEventsById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
      body: BlocConsumer<EventsCubit, EventsState>(
        listener: (context, state) {
          if (state is EventsReserveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: DefaultText(
                  text: state.success.toString(),
                  color: AppColors.kprimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: AppColors.greyD9,
                duration: const Duration(seconds: 4),
              ),
            );
            log("++++++++++++++++++++++++++${state.success.toString()}");
            context.pop();
          }
          if (state is EventsReserveFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: DefaultText(
                  text: state.message,
                  color: AppColors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: AppColors.greyD9,
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            EventsByIdLoading() => const Center(child: CustomLoading()),
            EventsByIdFailure(message: final message) => Center(
                  child: DefaultText(
                text: message,
                color: AppColors.kprimaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              )),
            EventsByIdSuccess(eventEntity: final eventEntity) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(30),
                    Row(
                      children: [
                        const CustomArrowBack(),
                        width(100),
                        Image.asset(AppAssets.logo),
                      ],
                    ),
                    height(20),
                    Image.network(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      "https://ajyalona.org.ly/${eventEntity.image}",
                      fit: BoxFit.fill,
                    ),
                    height(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          text: eventEntity.arTitle ?? 'title',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kprimaryColor,
                        ),
                        DefaultButton(
                          width: MediaQuery.sizeOf(context).width * 0.28,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          containerColor: AppColors.kprimaryColor,
                          borderColor: AppColors.kprimaryColor,
                          textColor: AppColors.white,
                          title: S.current.reserve,
                          onPressed: () {
                            context
                                .read<EventsCubit>()
                                .reserve(eventId: widget.id);
                          },
                        )
                      ],
                    ),
                    height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            DefaultText(
                                text: eventEntity.location ?? '',
                                color: AppColors.kprimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                            width(8),
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.grey9c,
                            )
                          ],
                        ),
                        DefaultText(
                            text: "{price}: ${eventEntity.price}",
                            color: AppColors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.share,
                              color: AppColors.red,
                            ),
                            width(8),
                            DefaultText(
                                text: S.of(context).share,
                                color: AppColors.kprimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                        Row(
                          children: [
                            DefaultText(
                                text: DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(eventEntity.date ?? '')),
                                color: AppColors.kprimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            width(8),
                            const Icon(
                              Icons.calendar_today,
                              color: AppColors.grey9c,
                            )
                          ],
                        ),
                      ],
                    ),
                    height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultText(
                            text: DateFormat('hh:mm a')
                                .format(DateTime.parse(eventEntity.date ?? '')),
                            color: AppColors.kprimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        width(8),
                        const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.grey9c,
                        ),
                      ],
                    ),
                    const Spacer(),
                    DefaultText(
                      text: S.current.places_to_buy_tickets,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kprimaryColor,
                      isCenter: false,
                    ),
                    BuyTicketsWidget(eventEntity: eventEntity),
                    const Spacer()
                  ],
                ),
              ),
            _ => const SizedBox.shrink()
          };
        },
      ),
    );
  }
}
