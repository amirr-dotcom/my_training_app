import 'package:flutter/material.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/view/widget/training_widget.dart';
import 'package:my_training_app/view_model/training_details_view_model.dart';
import 'package:provider/provider.dart';

class TrainingDetailsScreen extends StatelessWidget {
  final String? id;
  const TrainingDetailsScreen({super.key, required this.id});

  static const String name = "training_details";
  static const String path = "/$name/:id";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return id==null? const Center(child: CircularProgressIndicator()):ChangeNotifierProvider<TrainingDetailsViewModel>(
      create: (_)=> TrainingDetailsViewModel(int.parse(id!)),
      child: Selector<TrainingDetailsViewModel, (bool, Training?)>(
          shouldRebuild: (prev, nex) => true,
          selector: (buildContext, vm) => (vm.loading, vm.trainingDetails),
          builder: (context, (bool, Training?) data, child) {
            bool loading = data.$1;
            Training? trainingDetails = data.$2;
          return Scaffold(
            appBar: AppBar(
              title: Text(trainingDetails?.title ??"Loading"),
            ),
            body: loading? const Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: Column(
                children: [
                  trainingDetails ==null? Container():TrainingWidget(training: trainingDetails,),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("Summary",
                          style: textTheme.titleLarge?.copyWith(
                            color: Colors.black
                          ),),
                        ),
                        Text(trainingDetails?.summary??""),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
