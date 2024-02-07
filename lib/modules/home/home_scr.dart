import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/model/usermodel.dart';
import 'package:untitled/modules/home/home_ctrl.dart';
import 'package:untitled/modules/login/login_ctrl.dart';
import 'package:untitled/modules/updateUser/update_user_scr.dart';
import 'package:untitled/utils/app_color.dart';
import 'package:untitled/utils/home_list.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  final HomeCTRL c = Get.put(HomeCTRL());

  final PageController _controller = PageController(
    initialPage: 0,
  );
  final List<String> images = [
    'assets/pageview.png',
    'assets/pageview.png',
    'assets/pageview.png',
  ];
  final CarouselController _carouselController = CarouselController();

  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    c.getAdminId();
  }
  @override
  Widget build(BuildContext context) {
    print('build time admin get ${c.isAdmin.value}');
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 10, bottom: 10),
          child: Image.asset(
            'assets/person.png',
            color: AppColor.white,
            height: 10,
            width: 10,
            fit: BoxFit.fill,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 20,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )
        ],
      ),
      body:
      Obx(() {
        return c.isAdmin.value ? showUserList() : carasul();
      }),

    );
  }
  Widget showUserList() {
    return Obx(
          () {
        final userList = c.userList;
        if (userList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                title: Text(user.mobileNo ?? ""),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => UpdateUserScr(), arguments: user);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        c.deleteUser(
                          userId: user.id.toString(),
                          adminId: c.user.data?.id ?? "",
                        );
                      },
                      icon: Icon(Icons.delete_forever),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
Widget carasul(){
    return
      SingleChildScrollView(
        child: Column(
          children:[
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 100,
                viewportFraction: 0.99,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: images.map((i) {
                return Builder(

                  builder: (BuildContext context) {
                    return Image.asset(i);
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                int index = entry.key;
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? AppColor.secondaryColor : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            ListView.builder(itemBuilder: (context, index) {
              return HomeList();
            },itemCount: 5,shrinkWrap: true,scrollDirection: Axis.vertical,physics:NeverScrollableScrollPhysics(),)

          ],
        ),
      );
}

}
