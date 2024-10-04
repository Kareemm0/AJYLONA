import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/news/news_cubit.dart';
import 'package:ageal/presentation/cubit/news/news_state.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/custom/app_text.dart';
import '../../widget/news/custom_news_shimmer_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  final int id;
  const NewsDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = NewsCubit(getIt());
    return BlocProvider.value(
      value: cubit..getNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewLoadingState) {
            return const CustomStackScaffold(body: CustomNewsShimmerWidget());
          } else if (state is NewSuccessState) {
            final newsItem = state.newsEntities.news?.firstWhere(
              (item) => item.id == id,
            );
            return CustomStackScaffold(
                body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Column(
                  children: [
                    const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomArrowBack()),
                    height(8),
                    Image.network(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      "https://ajyalona.org.ly/${newsItem!.image}",
                      fit: BoxFit.fill,
                    ),
                    height(8),
                    DefaultText(
                      text: newsItem.arHead!,
                      color: AppColors.kprimaryColor,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    height(8),
                    DefaultText(
                      maxLines: 100,
                      text: newsItem.arContent!,
                      color: AppColors.grey8f,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ),
            ));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
