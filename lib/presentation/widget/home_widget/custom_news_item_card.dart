import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/domain/entity/news_entity.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/routing/routes.dart';

class CustomNewsItemCard extends StatelessWidget {
  final List<NewsEntity> newsEntity;
  const CustomNewsItemCard({
    super.key,
    required this.newsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.35,
        child: ListView.builder(
            itemCount: newsEntity.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: MediaQuery.sizeOf(context).height * 0.31,
                  margin: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          "https://ajyalona.org.ly/${newsEntity[index].image}",
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          height: MediaQuery.sizeOf(context).height * 0.18,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                        ),
                        child: DefaultText(
                          text:
                              "${newsEntity[index].arTitle}: ${newsEntity[index].arHead}",
                          fontSize: 16.0,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              Share.share(newsEntity[index].arContent!);
                            },
                          ),
                          const SizedBox(width: 4.0),
                          DefaultText(
                            text: S.current.share,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.ktextColor,
                          ),
                        ],
                      ),
                    ],
                  ).onTap(() {
                    context.pushNamed(Routes.newsDetails, pathParameters: {
                      'id': newsEntity[index].id.toString()
                    });
                  }),
                )));
  }
}
