import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/dummy_db.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_video_card.dart';
import 'package:food_recipee_app_june/view/home_screen/widgets/popular_category_card.dart';
import 'package:food_recipee_app_june/view/recipee_details_screen/recipee_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // # seciton 1- title section
              _titleSection(),
              //# seciton 2 - trending now seciton
              _trendingNowSection(),
              //# seciton 3 - Popular category seciton
              _popularCategorySection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularCategorySection() {
    return DefaultTabController(
      length: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Category",
                style: TextStyle(
                  color: ColorConstants.mainBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 16),
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: ColorConstants.mainWhite,
              unselectedLabelColor: ColorConstants.primaryColor,
              dividerHeight: 0,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Salad"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Breakfast"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Appetizer"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Noodle"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Lunch"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 231,
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularCategoryCard(),
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget _trendingNowSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 12),
          //title seciton
          child: Row(
            children: [
              Text(
                "Trending Now 🔥",
                style: TextStyle(
                  color: ColorConstants.mainBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Text(
                "See all",
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_outlined,
                color: ColorConstants.primaryColor,
              )
            ],
          ),
        ),
        SizedBox(height: 16),

        // video player list seciton
        SizedBox(
          height: 256,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomVideoCard(
              onCardTaped: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeeDetailsScreen(
                        recipeeTitle: DummyDb.trendingNowList[index]["title"],
                        image: DummyDb.trendingNowList[index]["imageurl"],
                        rating: DummyDb.trendingNowList[index]["rating"],
                        profileImage: DummyDb.trendingNowList[index]
                            ["profileImage"],
                        userName: DummyDb.trendingNowList[index]["userName"],
                      ),
                    ));
              },
              rating: DummyDb.trendingNowList[index]["rating"],
              duration: DummyDb.trendingNowList[index]["duration"],
              imageUrl: DummyDb.trendingNowList[index]["imageurl"],
              profileUrl: DummyDb.trendingNowList[index]["profileImage"],
              title: DummyDb.trendingNowList[index]["title"],
              userName: DummyDb.trendingNowList[index]["userName"],
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 16,
            ),
            itemCount: DummyDb.trendingNowList.length,
          ),
        ),
      ],
    );
  }

  Widget _titleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Text(
            "Find best recipes\nfor cooking",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: ColorConstants.mainBlack,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search recipes",
                hintStyle: TextStyle(
                    color: ColorConstants.greyShade1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.greyShade1),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.greyShade1),
                    borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorConstants.greyShade1,
                )),
          ),
        )
      ],
    );
  }
}
