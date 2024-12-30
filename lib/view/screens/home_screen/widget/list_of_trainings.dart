import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/app_manager/helper/navigation_helper.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/view/screens/training_details_screen.dart';
import 'package:my_training_app/view/widget/training_widget.dart';
import 'package:my_training_app/view_model/trainings_view_model.dart';
import 'package:provider/provider.dart';

class ListOfTrainings extends StatefulWidget {
  const ListOfTrainings({super.key});

  @override
  State<ListOfTrainings> createState() => _ListOfTrainingsState();
}

class _ListOfTrainingsState extends State<ListOfTrainings> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Selector<TrainingsViewModel, (bool, bool, List<Training>)>(
        shouldRebuild: (prev, nex) => true,
        selector: (buildContext, vm) => (vm.loading, vm.noMore, vm.trainings),
        builder: (context, (bool, bool, List<Training>) data, child) {
          bool loading = data.$1;
          bool noMore = data.$2;
          List<Training> trainings = data.$3;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == trainings.length && noMore) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        LocaleHelper.common('no_more'),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  if (index == trainings.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  Training training = trainings[index];
                  return TrainingWidget(
                    training: training,
                    onTap: () {
                      NavigationHelper.pushNamed(context, TrainingDetailsScreen.name, pathParameters: {"id": index.toString()});
                    },
                  );
                },
                childCount: (loading || noMore) ? trainings.length + 1 : trainings.length,
              ),
            ),
          );
        });
  }
}
