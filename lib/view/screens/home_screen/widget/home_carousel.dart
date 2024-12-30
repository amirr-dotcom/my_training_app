import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/component/my_cache_image.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/storage/training_data.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Training> fetchedTrainings = List.of(TrainingData.trainingsProvided.take(5).map((e) => Training.fromJson(e)));
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        viewportFraction: 0.8,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: List.generate(fetchedTrainings.length, (index) {
        int number = 200 + index;
        Training training = fetchedTrainings[index];
        DateTime? date = training.date == null ? null : DateTime.parse(training.date!);
        String? formatedDate = date == null ? null : DateFormat('MMM dd - yyyy').format(date);
        return Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: MyCacheImage(imageUrl: 'https://picsum.photos/$number'),
            ),
            Container(
              height: 160,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        training.title ?? "",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "${training.address ?? ""} ${formatedDate ?? ""}",
                        style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              "\$${training.price ?? ""}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: theme.primaryColor,
                                  color: theme.primaryColor, fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\$${training.discountPrice ?? ""}",
                              style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
