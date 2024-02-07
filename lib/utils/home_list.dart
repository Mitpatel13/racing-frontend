import 'package:flutter/material.dart';

import 'app_color.dart';
class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BENGALURU TROPHY',
                style: TextStyle(color: AppColor.primaryColor, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    'Details',
                    style: TextStyle(color: AppColor.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.info_outline, color: AppColor.white),
                ],
              )
            ],
          ),
          Divider(
            color: AppColor.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.emoji_events, color: AppColor.white),
                  Text.rich(
                    TextSpan(
                      text: 'Price: ',
                      style: TextStyle(color: AppColor.white),
                      children: [TextSpan(text: '50,000', style: TextStyle(fontWeight: FontWeight.w400))],
                    ),
                  ),
                ],
              ),
              // SizedBox(width: 10), // Added SizedBox for spacing
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        image: DecorationImage(image: AssetImage('assets/home/coin.png',),fit: BoxFit.fill)),

                    constraints: BoxConstraints(maxHeight: 15, maxWidth: 15), // Define dconstraints here
                    // child: Image.asset(
                    //   'assets/download.png',
                    //   fit: BoxFit.fill,
                    //   color: AppColor.white,
                    // ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Entry: ',
                      style: TextStyle(color: AppColor.white),
                      children: [TextSpan(text: '500', style: TextStyle(fontWeight: FontWeight.w400))],
                    ),
                  ),
                ],
              ),
              register(onPressed: (){}, text: 'REGISTER'),
            ],
          )
        ],
      ),
    );
  }
  Widget register({required void Function()? onPressed,required String text}){return
    Material(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // shadowColor: AppColor.primaryColor,
        color: AppColor.primaryColor,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
            child: Text(text,style: TextStyle(color: AppColor.white),))
    );}

}
