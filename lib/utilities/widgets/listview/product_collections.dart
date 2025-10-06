import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skincare_task/utilities/app_styles.dart';
import 'package:skincare_task/views/test_grphql.dart';

class ProductCollections extends StatelessWidget {
  const ProductCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final parm = {'subject': "hiiii"};
        final model = Model(subject: "subject");
        context.pushNamed(
          test_graphql.Route,
          queryParameters: parm,
          extra: model,
        );
      },
      child: Container(
        width: 266,
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            const BoxShadow(
              color: const Color(0xFF000000),
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 0.2,
            ),
          ],
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://img.lazcdn.com/g/p/22c058b9bcbf3bed499710489cc6655e.jpg_360x360q75.jpg_.webp",
                height: 85,
                width: 90,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Granactive Retinoid 5%",
                    style: Styles.boldtextsTYLE(fontsize: 18),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "This water free solution contains 5% \n concentration of retinoid.",
                    style: Styles.getsmalltext(fontsize: 14, underline: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Model {
  final String? subject;
  Model({required this.subject});
}
