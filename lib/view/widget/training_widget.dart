import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/component/my_cache_image.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';
import 'package:my_training_app/app_manager/helper/navigation_helper.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/view/screens/training_details_screen.dart';

class TrainingWidget extends StatelessWidget {
  final Training training;
  final VoidCallback? onTap;
  const TrainingWidget({super.key, required this.training,  this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    DateTime? date = training.date == null ? null : DateTime.parse(training.date!);
    String? formatedDate = date == null ? null : DateFormat('MMM dd - yyyy').format(date);
    Widget enrollNowWidget = SizedBox(height: 30, child: TextButton(onPressed: () {}, child: const Text("Enroll Now")));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorConstant.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 4,
                      ),
                      child: Text(
                        formatedDate.toString(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: Text(
                        training.timeRange.toString(),
                        style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      training.address.toString(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 120,
                  child: DottedLine(
                    direction: Axis.vertical,
                    dashColor: Colors.grey,
                    lineThickness: 1,
                    dashLength: 4,
                    dashGapLength: 4,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Filling Fast!".toString(),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor),
                    ),
                    Text(
                      "${training.title} (4.6)",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              child: ClipOval(child: MyCacheImage(imageUrl: training.url ?? "")),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -12,
                              child: SizedBox(
                                height: 10,
                                child: CircleAvatar(
                                  backgroundColor: theme.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                training.traineeTitle ?? "",
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                training.traineeName ?? "",
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: enrollNowWidget)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
