import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/dummy_db.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_recipee_card.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_video_card.dart';
import 'package:food_recipee_app_june/view/recipee_details_screen/recipee_details_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Saved recipes",
              style: TextStyle(
                  color: ColorConstants.mainBlack, fontWeight: FontWeight.w600),
            ),
            bottom: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ColorConstants.mainWhite,
              unselectedLabelColor: ColorConstants.primaryColor,
              dividerHeight: 0,
              indicator: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Video"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Recipee"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [_buildVideosTab(), _buildRecipeesTab()])),
    );
  }

  ListView _buildRecipeesTab() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemBuilder: (context, index) => CustomRecipeeCard(
              rating: DummyDb.trendingNowList[index]["rating"],
              imageUrl: DummyDb.trendingNowList[index]["imageurl"],
              title: DummyDb.trendingNowList[index]["title"],
            ),
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: 10);
  }

  ListView _buildVideosTab() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemBuilder: (context, index) => CustomVideoCard(
        onCardTaped: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeeDetailsScreen(
                  rating: DummyDb.trendingNowList[index]["rating"],
                  recipeeTitle: DummyDb.trendingNowList[index]["title"],
                  image: DummyDb.trendingNowList[index]["imageurl"],
                  profileImage: DummyDb.trendingNowList[index]["profileImage"],
                  userName: DummyDb.trendingNowList[index]["userName"],
                ),
              ));
        },
        width: double.infinity,
        duration: DummyDb.trendingNowList[index]["duration"],
        profileUrl: DummyDb.trendingNowList[index]["profileImage"],
        rating: DummyDb.trendingNowList[index]["rating"],
        imageUrl: DummyDb.trendingNowList[index]["imageurl"],
        title: DummyDb.trendingNowList[index]["title"],
        userName: DummyDb.trendingNowList[index]["userName"],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
      itemCount: DummyDb.trendingNowList.length,
    );
  }
}
