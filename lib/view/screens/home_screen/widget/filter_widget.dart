import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/theme/my_text_button_theme.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, child) {
              return TextButtonTheme(
                data: MyTextButtonTheme.grey,
                child: TextButton(onPressed: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Hii"),
                      ),
                    );
                  });
                }, child: const Row(
                  children: [
                    Icon(Icons.filter_list, size: 14,),
                    SizedBox(width: 5,),
                    Text("Filter"),
                  ],
                )),
              );
            }),
      ),
    );
  }
}
