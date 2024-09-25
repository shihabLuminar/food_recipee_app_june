import 'package:flutter/material.dart';
import 'package:food_recipee_app_june/dummy_db.dart';
import 'package:food_recipee_app_june/utils/constants/color_constants.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_recipee_card.dart';
import 'package:food_recipee_app_june/view/global_widgets/custom_video_card.dart';
import 'package:food_recipee_app_june/view/profile_screen/widgets/custom_profile_data_widget.dart';
import 'package:food_recipee_app_june/view/recipee_details_screen/recipee_details_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My profile ",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorConstants.mainBlack,
                fontSize: 24),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
        ),
        body: Column(
          children: [
            _buildProfileImageSection(),
            _buildProfileDataSection(),
            Divider(),
            _buildTabBarSection(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView() => Expanded(
      child: TabBarView(children: [_buildVideosTab(), _buildRecipeesTab()]));

  Widget _buildTabBarSection() => Column(
        children: [
          TabBar(
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
        ],
      );

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

  Widget _buildProfileDataSection() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomProfileDataWidget(
                title: "Recipee",
                count: "30",
              ),
              CustomProfileDataWidget(
                title: "Videos",
                count: "55",
              ),
              CustomProfileDataWidget(
                title: "Followers",
                count: "140k",
              ),
              CustomProfileDataWidget(
                title: "Flollowing",
                count: "120",
              ),
            ],
          ),
        ),
      );

  Widget _buildProfileImageSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=400"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstants.primaryColor)),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Name",
            style: TextStyle(
                color: ColorConstants.mainBlack,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          SizedBox(height: 12),
          Text(
            "Hello world I’m Alessandra Blair, I’m from Italy 🇮🇹 I love cooking so much!",
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: ColorConstants.greyShade2,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
