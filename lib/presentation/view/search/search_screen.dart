import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/auth_widget/custom_text_from_filed.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routing/routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_sizes.dart';
import 'search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<dynamic> searchResults = [];

  void search(String query) {
    setState(() {
      searchResults = searchAllEntities(query);
      //print('_searchResults: $searchResults');
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomArrowBack(
                  onPressed: () {
                    context.push(Routes.navBar);
                  },
                ),
                width(100),
                Image.asset(AppAssets.logo)
              ],
            ),
            height(32),
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: CustomTextFromFiled(
                    controller: searchController,
                    hintText: S.current.search,
                    onChanged: (query) => search(query),
                  ),
                ),
                width(16),
                Flexible(
                  child: Container(
                    height: 55,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.search,
                      size: 30,
                    )),
                  ),
                ),
              ],
            ),
            height(32),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return Text(searchResults[index].toString());
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
