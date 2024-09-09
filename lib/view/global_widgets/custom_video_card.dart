import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';

class CustomVideoCard extends StatelessWidget {
  String rating;
  double width;
  String title;
  String duration;
  String imageUrl;
  String userName;
  String profileUrl;
  void Function()? onCardTaped;
  CustomVideoCard({
    this.width = 280,
    required this.rating,
    required this.duration,
    required this.imageUrl,
    required this.profileUrl,
    required this.title,
    required this.userName,
    super.key,
    this.onCardTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTaped,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 180,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage("$imageUrl"))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConstants.lightBlack.withOpacity(.3)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorConstants.mainWhite,
                            ),
                            Text(
                              rating,
                              style: TextStyle(
                                  color: ColorConstants.mainWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: ColorConstants.mainWhite,
                        child: Icon(Icons.bookmark_outline),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: ColorConstants.lightBlack.withOpacity(.3),
                    child: Icon(
                      Icons.play_arrow,
                      color: ColorConstants.mainWhite,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConstants.lightBlack.withOpacity(.3)),
                        child: Text(
                          "$duration",
                          style: TextStyle(
                              color: ColorConstants.mainWhite,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("$profileUrl"),
                  radius: 16,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "$userName",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: ColorConstants.greyShade2),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class Student {
//   String name;
//   String? age;

//   Student({this.age = 0, required this.name});
// }
