import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/dummy_db.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_video_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => CustomVideoCard(
          width: double.infinity,
          rating: DummyDb.trendingNowList[index]["rating"],
          duration: DummyDb.trendingNowList[index]["duration"],
          imageUrl: DummyDb.trendingNowList[index]["imageurl"],
          profileUrl: DummyDb.trendingNowList[index]["profileImage"],
          title: DummyDb.trendingNowList[index]["title"],
          userName: DummyDb.trendingNowList[index]["userName"],
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
        itemCount: DummyDb.trendingNowList.length,
      ),
    );
  }
}
