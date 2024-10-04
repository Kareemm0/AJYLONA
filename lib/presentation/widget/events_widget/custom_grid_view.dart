import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/domain/entity/events/event_entity.dart';
import 'package:ageal/generated/l10n.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/app_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CustomGridView extends StatelessWidget {
  final List<EventEntity> events;
  const CustomGridView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pushNamed(
            Routes.eventDetails,
            pathParameters: {'id': events[index].id.toString()},
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: MediaQuery.sizeOf(context).width * 0.42,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://ajyalona.org.ly/${events[index].image}',
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.fill,
                  ),
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.14,
                ),
              ),
              height(8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width,
                  minWidth: MediaQuery.sizeOf(context).width * 0.5,
                ),
                child: DefaultText(
                  text: events[index].arTitle ?? '',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey82,
                  textOverflow: TextOverflow.ellipsis,
                  isCenter: false,
                ),
              ),
              height(8),
              Row(
                children: [
                  DefaultText(
                    text: events[index].location ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey82,
                    textOverflow: TextOverflow.ellipsis,
                    isCenter: false,
                  ),
                  width(8),
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.grey9c,
                  )
                ],
              ),
              height(8),
              Row(
                children: [
                  DefaultText(
                      text: DateFormat('dd MMM yyyy')
                          .format(DateTime.parse(events[index].date ?? '')),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textOverflow: TextOverflow.ellipsis,
                      color: AppColors.grey82),
                  width(8),
                  const Icon(
                    Icons.calendar_today,
                    color: AppColors.grey9c,
                  )
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.2,
                      minWidth: MediaQuery.sizeOf(context).width * 0.2,
                    ),
                    child: DefaultText(
                        text: "price:${events[index].price}",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.ellipsis,
                        color: AppColors.red),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.share),
                      width(8),
                      DefaultText(
                          text: S.current.share,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey82),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
