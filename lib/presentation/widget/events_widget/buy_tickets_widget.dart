import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/domain/entity/events/event_entity.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuyTicketsWidget extends StatelessWidget {
  final EventEntity eventEntity;
  const BuyTicketsWidget({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventEntity.branches?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.eventTickets, pathParameters: {
                "id": eventEntity.branches![index].id.toString(),
              });
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              margin: const EdgeInsets.all(10.0),
              child: Image.network(
                "https://ajyalona.org.ly/${eventEntity.branches![index].image}",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
