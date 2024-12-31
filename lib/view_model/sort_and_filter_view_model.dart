import 'package:flutter/cupertino.dart';
import 'package:my_training_app/model/sort_title.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/storage/sorting_data.dart';
import 'package:my_training_app/storage/training_data.dart';

class SortAndFilterViewModel extends ChangeNotifier {
  final List<String>? initialSelectedFilter;
  SortAndFilterViewModel({this.initialSelectedFilter}) {
    getSortTitlesData();
  }

  List<String> _selectedValues = [];
  List<String> get selectedValues => _selectedValues;
  set selectedValues(List<String> val) {
    _selectedValues = val;
    notifyListeners();
  }
  set onSelectValue(String val) {
    if (selectedValues.contains(val)) {
      _selectedValues.remove(val);
    } else {
      selectedValues.removeWhere((e) => (selectedSortTitle?.values??[]).contains(e));
      _selectedValues = [..._selectedValues, val];
    }
    notifyListeners();
  }

  SortTitle? _selectedSortTitle;
  SortTitle? get selectedSortTitle => _selectedSortTitle;
  set selectedSortTitle(SortTitle? val) {
    _selectedSortTitle = val;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();
  String _search = "";
  String get search => _search;
  set search(String val) {
    if(val.isEmpty) {
      searchController.clear();
    }
    _search = val;
    notifyListeners();
  }


  List<SortTitle> _sortTitles = [];
  List<SortTitle> get sortTitles => _sortTitles;
  set sortTitles(List<SortTitle> val) {
    _sortTitles = val;
    notifyListeners();
  }

  Future<void> getSortTitlesData() async {
    sortTitles = List.of(SortingData.data.map((e) => SortTitle.fromJson(e)));
    if (sortTitles.length > 1) {
      selectedSortTitle = sortTitles[1];
    }
    selectedValues = initialSelectedFilter??[];
    List<Training> fetchedTrainings = List.of(TrainingData.trainingsProvided.map((e) => Training.fromJson(e)));
    populateSortTitlesWithTrainings(fetchedTrainings);
  }

  void populateSortTitlesWithTrainings(List<Training> trainings) {
    for (var training in trainings) {
      for (var sortTitle in sortTitles) {
        switch (sortTitle.title) {
          case "Location":
            sortTitle.addValues([training.address ?? ""]);
            break;
          case "Training Name":
            sortTitle.addValues([training.title ?? ""]);
            break;
          case "Trainer":
            sortTitle.addValues([training.traineeName ?? ""]);
            break;
          default:
            break;
        }
      }
    }
    for (var sortTitle in sortTitles) {
      sortTitle.values = sortTitle.values?.toSet().toList();
    }

    notifyListeners();
  }
}
