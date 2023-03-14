// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';

import '../cubit/add_comment_cubit.dart';

class AddCommentScreen extends StatelessWidget {
  const AddCommentScreen({
    Key? key,
    required this.idCategory,
    required this.idLesson,
    required this.onSuccess,
  }) : super(key: key);
  final String idCategory;
  final String idLesson;
  final Function() onSuccess;
  @override
  Widget build(BuildContext context) {
    final fWidgets = GlobalVariables.getIt<FApp>();
    return BlocProvider(
      create: (context) => AddCommentCubit(idCategory, idLesson, onSuccess),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(title: const Text('Comment')),
            body: SafeArea(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Builder(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: context.read<AddCommentCubit>().controller,
                      decoration: const InputDecoration(
                          fillColor: AppColors.red,
                          hintText: 'Enter your comment',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0))),
                      maxLines: 5,
                    ),
                    Expanded(
                      child: Center(
                        child: SizedBox(
                            width: double.infinity,
                            child: fWidgets.button(
                                onClick:
                                    context.read<AddCommentCubit>().sendOnClick,
                                title: 'Send')),
                      ),
                    ),
                  ],
                );
              }),
            )),
          ),
          BlocBuilder<AddCommentCubit, AddCommentState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              if (state.isLoading) {
                return const LoadingWidget();
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
