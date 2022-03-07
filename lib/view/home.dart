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
                height: Get.size.height * 0.1,
              ),
              Container(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.1,
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
                height: Get.size.height * 0.05,
              ),
              Container(
                  width: Get.size.width * 0.8,
                  height: Get.size.height * 0.2,
                  child: Obx(
                    () {
                      return Home_controller.to.isloading.value
                          ? Container(
                              width: Get.size.width * 0.8,
                              height: Get.size.height * 0.2,
                              child: Center(child: Text("로딩중...")))
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
                                        width: Get.size.height * 0.2,
                                        height: Get.size.height * 0.2,
                                        color: Color(0xFFf2f2f2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                Home_controller
                                                    .to.listitem[index]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Pre-Bold',
                                                  fontSize: 15,
                                                )),
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
              SizedBox(
                height: Get.size.height * 0.05,
              ),
              Container(
                width: Get.size.width * 0.8,
                height: Get.size.height * 0.5,
                child: Obx(() {
                  return Home_controller.to.itemdetail.value.isEmpty
                      ? ClayContainer(
                          height: Get.size.height * 0.45,
                          child: Center(
                              child: Text("골라주세요",
                                  style: TextStyle(
                                    fontFamily: 'Pre-Bold',
                                    fontSize: 22,
                                  ))),
                        )
                      : ClayContainer(
                          height: Get.size.height * 0.45,
                          child: SingleChildScrollView(child: detailvalue()),
                        );
                  // return Container(child: detailvalue());
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget detailvalue() {
    List<Widget> widgetlist = [];
    Home_controller.to.itemdetail.forEach((key, value) {
      widgetlist.add(Container(
        padding: EdgeInsets.all(5),
        width: Get.size.width * 0.8,
        child: Text('${key.toString()} :: ${value.toString()}',
            softWrap: true,
            textAlign: TextAlign.start,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.bold)),
      ));
    });
    return Column(
      children: widgetlist,
    );
  }
}
