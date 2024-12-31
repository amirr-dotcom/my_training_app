import 'package:flutter/cupertino.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/storage/training_data.dart';

class TrainingsViewModel extends ChangeNotifier {
  TrainingsViewModel() {
    getTrainingsData();
  }

  List<String> _filters = [];
  List<String> get filters => _filters;
  set filters(List<String> val) {
    _filters = val;
    notifyListeners();
  }
  set removeFilter(String val) {
    _filters.remove(val);
    notifyListeners();
  }

  int limit = 5;

  bool _noMore = false;
  bool get noMore => _noMore;
  set noMore(bool val) {
    _noMore = val;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool val) {
    _loading = val;
    notifyListeners();
  }

  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;
  set trainings(List<Training> val) {
    _trainings = val;
    notifyListeners();
  }

  List<Training> _allTrainings = [];
  List<Training> get allTrainings => _allTrainings;
  set allTrainings(List<Training> val) {
    _allTrainings = val;
    notifyListeners();
  }
  List<Training> get filteredTrainings => _filters.isEmpty? _trainings:_allTrainings.where((Training training) {
  String trainingText = '${training.title} ${training.address} ${training.traineeName} ${training.traineeTitle}';
  return _filters.every((filter) => trainingText.toLowerCase().contains(filter.toLowerCase()));
  }).toList();

  Future<void> getTrainingsData({int? currentLimit}) async {
    loading = true;
    int newLimit = currentLimit ?? (limit + trainings.length);
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      allTrainings = List.of(TrainingData.trainingsProvided.map((e) => Training.fromJson(e)));
      List<Training> fetchedTrainings = List.of(TrainingData.trainingsProvided.take(newLimit).map((e) => Training.fromJson(e)));
      trainings = fetchedTrainings;
      if (trainings.length  == 20) {
        noMore = true;
      }
      loading = false;
    }).catchError((_) {
      // handle error here
    });
  }

  void fetchMoreData() {
    if (noMore) {
      return;
    }
    getTrainingsData();
  }

  Future<void> refreshData() async {
    noMore = false;
    await getTrainingsData(currentLimit: limit);
  }
}
