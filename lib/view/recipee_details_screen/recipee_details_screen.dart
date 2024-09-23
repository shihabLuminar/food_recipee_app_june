import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_button.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_list_tile.dart';

class RecipeeDetailsScreen extends StatelessWidget {
  RecipeeDetailsScreen(
      {super.key,
      required this.recipeeTitle,
      required this.image,
      required this.rating,
      required this.profileImage,
      required this.userName});
  String recipeeTitle;
  String image;
  String profileImage;
  String userName;
  String rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _builTitleSection(),
              SizedBox(height: 26),
              _buildIngredientsSeciton()
            ],
          ),
        ),
      ),
    );
  }

  Column _buildIngredientsSeciton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ingredients",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.mainBlack),
            ),
            Text(
              "5 items",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorConstants.greyShade2),
            )
          ],
        ),
        ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomListTile(
                  haveArrow: false,
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
            itemCount: 10)
      ],
    );
  }

  Column _builTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipeeTitle,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorConstants.mainBlack,
              fontSize: 24),
        ),
        SizedBox(height: 24),
        Container(
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image))),
          child: Center(
            child: CircleAvatar(
              backgroundColor: ColorConstants.lightBlack.withOpacity(.3),
              child: Icon(
                Icons.play_arrow,
                color: ColorConstants.mainWhite,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Icon(
              Icons.star,
              color: ColorConstants.goldenYellow,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              "$rating",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.mainBlack,
                  fontSize: 14),
            ),
            SizedBox(width: 7),
            Text(
              "(300 reviews)",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.greyShade2,
                  fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              radius: 20.5,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.mainBlack,
                      fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      size: 16,
                      Icons.location_on_rounded,
                      color: ColorConstants.primaryColor,
                    ),
                    SizedBox(width: 7),
                    Text(
                      "Bali, Indonesia",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ColorConstants.greyShade2,
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            CustomButton(
              text: "Follow",
              onButtonPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
