import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/app/cubit/app_cubit.dart';
import 'package:mat_practice_pte/src/features/search/cubit/search_cubit.dart';
import 'package:mat_practice_pte/src/features/search/widgets/lesson_search_component.dart';
import 'package:mat_practice_pte/src/features/search/widgets/tab_search_widget.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';
import 'package:mat_practice_pte/src/widgets/splash_scaffold.dart';

import '../cubit/search_state.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController _tabBarController;
  @override
  Widget build(BuildContext context) {
    _tabBarController = TabController(length: 2, vsync: this);
    final searchTitle =
        GlobalVariables.getIt<FLocate>().str(FLocalKey.searchTitle);
    return BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) =>
            previous.categories != current.categories,
        builder: (context, state) {
          bool isLoadingCategories = state.categories.isEmpty;
          return isLoadingCategories
              ? SplashScaffold(title: searchTitle)
              : BlocProvider(
                  create: (context) =>
                      SearchCubit(sourceCategories: state.categories),
                  child: Stack(
                    children: [
                      BlocBuilder<SearchCubit, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.currenCategories !=
                            current.currenCategories,
                        builder: (context, state) {
                          return Scaffold(
                              appBar: AppBar(title: Text(searchTitle)),
                              body: SafeArea(
                                  child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    children: [
                                      SearchTextField(
                                          controller: context
                                              .read<SearchCubit>()
                                              .textFieldController),
                                      FSizeBoxs.h20,
                                      TabSearchWidget(
                                          tabController: _tabBarController),
                                      FSizeBoxs.h20,
                                      Wrap(
                                          spacing: 10,
                                          runSpacing: 10,
                                          children: state.currenCategories
                                              .map((e) => CategoryCardWidget(
                                                  category: e))
                                              .toList()),
                                      FSizeBoxs.h20,
                                      const LessonSearchComponent(),
                                    ],
                                  ),
                                ),
                              )));
                        },
                      ),
                      BlocBuilder<SearchCubit, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.isLoading != current.isLoading,
                        builder: (context, state) {
                          if (state.isLoading) return const LoadingWidget();
                          return Container();
                        },
                      )
                    ],
                  ));
        });
  }
}
