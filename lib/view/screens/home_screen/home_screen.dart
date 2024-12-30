import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/view/screens/home_screen/widget/home_app_bar.dart';
import 'package:my_training_app/view/screens/home_screen/widget/list_of_trainings.dart';
import 'package:my_training_app/view_model/trainings_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = "home_screen";
  static const String path = "/$name";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
     Provider.of<TrainingsViewModel>(context, listen: false).fetchMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TrainingsViewModel>(context, listen: false);
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: RefreshIndicator(
          onRefresh: viewModel.refreshData,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              HomeAppBar(
                title: LocaleHelper.homeScreen('title'),
                subTitle: LocaleHelper.homeScreen('sub_title'),
              ),
              const ListOfTrainings(),
            ],
          ),
        ),
      ),
    );
  }
}
