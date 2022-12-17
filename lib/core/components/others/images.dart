import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shimmers.dart';
import 'utilities.dart';

import '../../constants/image_assets.dart';
import '../../constants/radius_values.dart';

class DetailScreenImage extends StatelessWidget {
  final String logName = 'DetailScreenImage';
  const DetailScreenImage(this.imagePath, {Key? key}) : super(key: key);

  final AsyncValue<String?> imagePath;

  @override
  Widget build(BuildContext context) {
    final Image defaultImage = Image.asset(
      iaDefaultCategoryImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardRadius),
          ),
          clipBehavior: Clip.hardEdge,
          child: imagePath.when(
            data: (data) => (data != null)
                ? CachedNetworkImage(
                    imageUrl: data,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (_, __) =>
                        const LoadingSkeleton(progressBar: LinearProgressBar()),
                  )
                : defaultImage,
            loading: () => const LoadingSkeleton(
              progressBar: LinearProgressBar(),
            ),
            error: (_, stackTrace) {
              log(stackTrace.toString(), name: logName);
              return Container();
            },
          )),
    );
  }
}
