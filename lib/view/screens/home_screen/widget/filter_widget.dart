import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/app_manager/theme/my_text_button_theme.dart';
import 'package:my_training_app/view/screens/sort_and_filter_screen/sort_and_filters_screen.dart';
import 'package:my_training_app/view_model/trainings_view_model.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TrainingsViewModel viewModel = Provider.of<TrainingsViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 30,
        child: Selector<TrainingsViewModel, List<String>>(
            shouldRebuild: (prev, nex) => true,
            selector: (buildContext, vm) => vm.filters,
            builder: (context, List<String> filters, child) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: TextButtonTheme(
                          data: MyTextButtonTheme.grey,
                          child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SortAndFiltersScreen(
                                          initialSelectedFilter: filters,
                                          onSelectValues: (List<String> values) {
                                            viewModel.filters = values;
                                          });
                                    });
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.filter_list,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(LocaleHelper.common('filter')),
                                ],
                              )),
                        ),
                      );
                    }
                    int correctIndex = index - 1;
                    String filter = filters[correctIndex];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextButtonTheme(
                        data: MyTextButtonTheme.grey,
                        child: TextButton(
                            style: TextButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.3), foregroundColor: Colors.white),
                            onPressed: () {
                              viewModel.removeFilter = filter;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              constraints: const BoxConstraints(maxWidth: 100),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Text(
                                    filter,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )),
                                ],
                              ),
                            )),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
