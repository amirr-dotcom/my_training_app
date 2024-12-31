import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/app_manager/helper/navigation_helper.dart';
import 'package:my_training_app/model/sort_title.dart';
import 'package:my_training_app/view/screens/sort_and_filter_screen/widget/sort_title_widget.dart';
import 'package:my_training_app/view/screens/sort_and_filter_screen/widget/sort_value_widget.dart';
import 'package:my_training_app/view_model/sort_and_filter_view_model.dart';
import 'package:provider/provider.dart';

class SortAndFiltersScreen extends StatelessWidget {
  final ValueChanged<List<String>> onSelectValues;
  final List<String>? initialSelectedFilter;
  const SortAndFiltersScreen({super.key, required this.onSelectValues, this.initialSelectedFilter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    Widget titleWidget = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: ColorConstant.greyLight)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleHelper.sortAndFilters('title'),
            style: textTheme.titleLarge?.copyWith(color: Colors.black.withOpacity(0.8)),
          )),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                NavigationHelper.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: ColorConstant.grey,
              ))
        ],
      ),
    );
    return ChangeNotifierProvider<SortAndFilterViewModel>(
      create: (_) => SortAndFilterViewModel(initialSelectedFilter: initialSelectedFilter),
      child: Builder(builder: (context) {
        final SortAndFilterViewModel viewModel = Provider.of<SortAndFilterViewModel>(context, listen: false);

        Widget section1Widget(List<SortTitle> sortTitles, SortTitle? selectedSortTitle) {
          return ListView.builder(
              itemCount: sortTitles.length,
              itemBuilder: (context, index) {
                SortTitle sortTitle = sortTitles[index];
                return SortTitleWidget(
                    onTap: () {
                      viewModel.selectedSortTitle = sortTitle;
                      viewModel.search = '';
                    },
                    sortTitle: sortTitle,
                    selected: sortTitle.title == selectedSortTitle?.title);
              });
        }

        Widget searchWidget = Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: viewModel.searchController,
            onChanged: (val) {
              viewModel.search = val;
            },
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConstant.greyLight,
                ),
                hintText: LocaleHelper.common('search')),
          ),
        );

        Widget section2Widget(List<String> values, List<String> selectedValues, String search) {
          List<String> searchedValues = search.isEmpty ? values : values.where((e) => e.toLowerCase().contains(search.toLowerCase())).toList();
          return ListView.builder(
              itemCount: searchedValues.length,
              itemBuilder: (context, index) {
                String value = searchedValues[index];
                return SortValueWidget(
                  value: value,
                  selected: selectedValues.contains(value),
                  onTap: () {
                    viewModel.onSelectValue = value;
                    onSelectValues(viewModel.selectedValues);
                  },
                );
              });
        }

        return Center(
          child: Column(
            children: [
              titleWidget,
              Expanded(
                child: Selector<SortAndFilterViewModel, (List<SortTitle>, SortTitle?, List<String>, String)>(
                    shouldRebuild: (prev, nex) => true,
                    selector: (buildContext, vm) => (vm.sortTitles, vm.selectedSortTitle, vm.selectedValues, vm.search),
                    builder: (context, (List<SortTitle>, SortTitle?, List<String>, String) data, child) {
                      List<SortTitle> sortTitles = data.$1;
                      SortTitle? selectedSortTitle = data.$2;
                      List<String>? selectedValues = data.$3;
                      String search = data.$4;
                      return Row(
                        children: [
                          Expanded(flex: 4, child: section1Widget(sortTitles, selectedSortTitle)),
                          Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  searchWidget,
                                  Expanded(child: section2Widget(selectedSortTitle?.values ?? [], selectedValues, search)),
                                ],
                              )),
                        ],
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
