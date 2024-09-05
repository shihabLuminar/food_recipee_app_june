import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 231,
          width: 150,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 176,
            decoration: BoxDecoration(
                color: ColorConstants.greyShade2,
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/20154170/pexels-photo-20154170/free-photo-of-white-plate-with-a-fish-spinach-and-lemon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            backgroundColor: ColorConstants.primaryColor,
            radius: 55,
          ),
        ),
      ],
    );
  }
}
