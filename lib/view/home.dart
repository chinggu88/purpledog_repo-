import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpledog_repo/controller/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: Row(
        children: [
          SizedBox(
            width: Get.size.width * 0.1,
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: Get.size.width * 0.8,
                child: AwesomeDropDown(
                    dropDownBGColor: Color(0xFFf2f2f2),
                    dropDownList: [
                      "topstories",
                      "newstories",
                      "askstories",
                      "showstories",
                      "jobstories"
                    ],
                    onDropDownItemClick: (selectedItem) {
                      Home_controller.to.changelist(selectedItem);
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: Get.size.width * 0.8,
                  height: 150,
                  child: Obx(
                    () {
                      return Home_controller.to.isloading.value
                          ? Text("로딩중")
                          : ListView.builder(
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                              itemCount: Home_controller.to.listitem.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Home_controller.to.getDetail(
                                          Home_controller.to.listitem[index]
                                              .toString()),
                                      child: ClayContainer(
                                        width: 100,
                                        height: 100,
                                        color: Color(0xFFf2f2f2),
                                        child: Row(
                                          children: [
                                            Text(Home_controller
                                                .to.listitem[index]
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                );
                              });
                    },
                  )),
              Container(
                height: 400,
                width: Get.size.width * 0.8,
                color: Colors.red,
                child: Obx(() {
                  return Column(
                    children: [
                      Text(Home_controller.to.itemdetail.value.toString()),
                    ],
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
