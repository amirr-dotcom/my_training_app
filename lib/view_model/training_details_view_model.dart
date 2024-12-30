import 'package:flutter/cupertino.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/storage/training_data.dart';

class TrainingDetailsViewModel extends ChangeNotifier {
  final int id;
  TrainingDetailsViewModel(this.id) {
    getTrainingDetails();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Training? _trainingDetails;
  Training? get trainingDetails => _trainingDetails;
  set trainingDetails(Training? val) {
    _trainingDetails = val;
    notifyListeners();
  }

  Future<void> getTrainingDetails() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      trainingDetails = Training.fromJson(TrainingData.trainingsProvided[id]);
      loading = false;
    }).catchError((_) {
      // handle error here
    });
  }
}
