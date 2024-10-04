import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/domain/entity/news/news.dart';
import 'package:ageal/presentation/cubit/news/news_cubit.dart';
import 'package:ageal/presentation/cubit/news/news_state.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/app_text.dart';
import '../../widget/custom/custom_stack_scaffold.dart';
import '../../widget/news/custom_hrizontal_list_view_body.dart';
import '../../widget/news/custom_news_list_view_body.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int cuurentIndex = 0;
  List<NewsModel> filteredNews = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(getIt())..getNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewSuccessState) {
            if (cuurentIndex > 0) {
              filteredNews = state.newsEntities.news!
                  .where((news) =>
                      news.newsCategoryId ==
                      state.newsEntities.categories![cuurentIndex - 1].id
                          .toString())
                  .toList();
            } else {
              filteredNews = state.newsEntities.news!;
            }
          }
          return CustomStackScaffold(
            body: switch (state) {
              NewInitialState() => const CustomLoading(),
              NewLoadingState() => const CustomLoading(),
              NewFailureState(errorMessage: final message) => Center(
                  child: DefaultText(
                    text: message,
                    color: AppColors.kprimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              NewSuccessState(newsEntities: final newsEntities) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: Column(children: [
                    Image.asset(
                      AppAssets.news,
                      width: widthSize(context),
                      height: heightSize(context) * 0.18,
                      fit: BoxFit.fill,
                    ),
                    height(16),
                    width(4),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => width(4),
                        itemCount: newsEntities.categories!.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CustomHrizontalListViewBody(
                              text: "الكل",
                              containerColor: cuurentIndex == index
                                  ? AppColors.red
                                  : AppColors.transparent,
                              textColor: cuurentIndex == index
                                  ? AppColors.white
                                  : AppColors.red,
                              onTap: () {
                                filteredNews = newsEntities.news!;
                                setState(() {
                                  cuurentIndex = index;
                                });
                              },
                            );
                          } else {
                            return CustomHrizontalListViewBody(
                              text: newsEntities.categories![index - 1].arName!,
                              containerColor: cuurentIndex == index
                                  ? AppColors.red
                                  : AppColors.transparent,
                              textColor: cuurentIndex == index
                                  ? AppColors.white
                                  : AppColors.red,
                              onTap: () {
                                setState(() {
                                  cuurentIndex = index;
                                  filteredNews = newsEntities.news!
                                      .where((news) =>
                                          news.newsCategoryId ==
                                          newsEntities.categories![index - 1].id
                                              .toString())
                                      .toList();
                                });
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredNews.length,
                        itemBuilder: (context, index) {
                          return CustomNewsListViewBody(
                            content: filteredNews[index].arContent!,
                            srcImage:
                                "https://ajyalona.org.ly/${filteredNews[index].image}",
                            title: filteredNews[index].arTitle!,
                          ).onTap(
                            () {
                              context.pushNamed(Routes.newsDetails,
                                  pathParameters: {
                                    'id':
                                        newsEntities.news![index].id.toString()
                                  });
                            },
                          );
                        },
                      ),
                    ),
                  ]),
                ),
            },
          );
        },
      ),
    );
  }
}
