import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:omega_employee_management/Helper/Color.dart';
import 'package:omega_employee_management/Helper/Session.dart';
import 'package:omega_employee_management/Helper/SimBtn.dart';
import 'package:omega_employee_management/Helper/String.dart';
import 'package:omega_employee_management/Model/Transaction_Model.dart';
import 'package:omega_employee_management/Model/get_user_expenses_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:omega_employee_management/Model/per_day_expenses_model.dart';
import 'package:provider/provider.dart';

import '../Provider/UserProvider.dart';

class UserExpensesScreen extends StatefulWidget {
  const UserExpensesScreen({Key? key}) : super(key: key);

  @override
  State<UserExpensesScreen> createState() => _UserExpensesScreenState();
}

class _UserExpensesScreenState extends State<UserExpensesScreen> {



  List<UserExpenses> userExpenses = [];
  List<PerDayCharges> perDayExpenses = [];
  bool isSelected = true;

  getUserExpense() async{
    var headers = {
      // 'Token': jwtToken.toString(),
      // 'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };
    var request = http.MultipartRequest('POST', Uri.parse(getUserExpensesApi.toString()));
    request.fields.addAll({
      USER_ID: '$CUR_USERID',
      // 'status' : status.toString()
      // categoryValue != null ?
      //     categoryValue.toString() : ""
    });

    print("this is refer request ${request.fields.toString()}");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      var finalResponse = GetUserExpensesModel.fromJson(result);
      setState(() {
        userExpenses = finalResponse.data!;
      });
      print("this is my expenses data ${userExpenses.length}");
      // setState(() {
      // animalList = finalResponse.data!;
      // });
      // print("this is operator list ----->>>> ${operatorList[0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  sendWithdrawlRequest() async{
    var headers = {
      // 'Token': jwtToken.toString(),
      // 'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };
    var request = http.MultipartRequest('POST', Uri.parse(getUserExpensesApi.toString()));
    request.fields.addAll({
      USER_ID: '$CUR_USERID',
      // 'status' : status.toString()
      // categoryValue != null ?
      //     categoryValue.toString() : ""
    });

    print("this is refer request ${request.fields.toString()}");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      var finalResponse = GetUserExpensesModel.fromJson(result);
      setState(() {
        userExpenses = finalResponse.data!;
      });
      print("this is my expenses data ${userExpenses.length}");
      // setState(() {
      // animalList = finalResponse.data!;
      // });
      // print("this is operator list ----->>>> ${operatorList[0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  perDayWiseExpense() async{
    var headers = {
      // 'Token': jwtToken.toString(),
      // 'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };
    var request = http.MultipartRequest('POST', Uri.parse(perDayExpensesApi.toString()));
    request.fields.addAll({
      USER_ID: '$CUR_USERID',
      // 'status' : status.toString()
      // categoryValue != null ?
      //     categoryValue.toString() : ""
    });

    print("this is refer request ${request.fields.toString()}");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      var finalResponse = PerDayExpensesModel.fromJson(result);
      setState((){
        perDayExpenses = finalResponse.data!;
      });


      print("this is per day expenses data ${perDayExpenses.length}");
      // setState(() {
      // animalList = finalResponse.data!;
      // });
      // print("this is operator list ----->>>> ${operatorList[0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserExpense();
    // perDayWiseExpense();
  }

  int _currentPost =  0;
  List<Widget> _buildDots(int index) {
    List<Widget> dots = [];
    for (int i = 0; i < userExpenses[index].images!.length; i++) {
      dots.add(
        Container(
          margin: EdgeInsets.all(2),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPost == i
                ? colors.primary
                : Colors.grey.withOpacity(0.5),
          ),
        ),
      );
    }
    return dots;
  }

  String? categoryValue;

  List<String> leadStatus = [
    'All',
    'New Lead',
    'Open',
    'Follow Up',
    'Proceeded',
    'Not Interested',
    'Closed',
    'Rejected',
    'Not Eligible'
  ];
Widget allExpenses(){
  return Expanded(
    child: ListView.builder(
        itemCount: userExpenses.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              // padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              //height: 220,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.white,
                  border: Border.all(color: colors.primary),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        // height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              userExpenses[index].images!.length > 1
                                  ? Container(
                                width : MediaQuery.of(context).size.width ,
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentPost = index;
                                      });
                                    },
                                    height:  MediaQuery.of(context).size.width/2,
                                    enlargeCenterPage: true,
                                    autoPlay: false,
                                    aspectRatio: 1,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: false,
                                    autoPlayAnimationDuration:
                                    Duration(milliseconds: 1000),
                                    viewportFraction: 1,
                                  ),
                                  items: userExpenses[index].images!.map((item) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context).size.width/1,
                                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                            decoration: const BoxDecoration(),
                                            child: SizedBox(
                                              height: MediaQuery.of(context).size.width /1,
                                              width: MediaQuery.of(context).size.width /2,
                                              child: item.isEmpty || item == ''
                                                  ? Image.asset(
                                                'assets/placeholder.png',
                                                // widget.snap['postUrl'],
                                                fit: BoxFit.cover,
                                              )
                                                  : ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image.network(
                                                  item,
                                                  // widget.snap['postUrl'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ));
                                      },
                                    );
                                  }).toList(),
                                ),
                              )
                                  : Container(
                                height: MediaQuery.of(context).size.width /2,
                                width: MediaQuery.of(context).size.width,
                                child:  userExpenses[index].images!.isEmpty || userExpenses[index].images![0].toString() == ''
                                    ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/placeholder.png',
                                    // widget.snap['postUrl'],
                                    fit: BoxFit.contain,
                                  ),
                                )
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    userExpenses[index].images![0].toString(),
                                    // widget.snap['postUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              userExpenses[index].images!.length > 1 ?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildDots(index),
                              )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Container(
                        padding: EdgeInsets.only(right: 10, top: 10, left: 10),
                        height: 242,
                        width: 100,
                        //MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius:  BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(DateFormat('dd MMM yyyy').format(DateTime.parse(userExpenses[index].createAt.toString())).toString(),
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(' ${userExpenses[index].st.toString()}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: Text('${userExpenses[index].sst.toString()}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                            ),
                            userExpenses[index].st.toString() == 'Travel' ?
                            Column(
                              children: [
                                userExpenses[index].from.toString() == 'null' ?
                                    SizedBox.shrink()
                                : Padding(
                                  padding: const EdgeInsets.only( bottom: 7),
                                  child: Text(
                                      '${userExpenses[index].from.toString()}' ?? '',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                                ),
                                userExpenses[index].to.toString() == 'null' ?
                                SizedBox.shrink() :
                                Text('${userExpenses[index].to.toString()}' ?? '',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                              ],
                            )
                            : SizedBox.shrink(),

                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text('₹ ${userExpenses[index].amount.toString()}',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,  color: colors.whiteTemp) ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: userExpenses[index].status.toString() == "0" ?
                                    Colors.red
                                        : Colors.green
                                ),
                                child: Text("Pending", style: TextStyle(
                                    color: colors.whiteTemp,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                ),),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //
                  //       Row(
                  //         children: [
                  //           Text("Amount : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  //           Text('₹ ${userExpenses[index].amount.toString()}',
                  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: Theme.of(context).colorScheme.fontColor) ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Divider(
                  //   thickness: 1,
                  //   color: colors.secondary,),
                  // Spacer(),
                  // // referralList[index].shareInfo.toString() == "1"?
                  // // Column(
                  // //   crossAxisAlignment: CrossAxisAlignment.start,
                  // //   children: [
                  // //     Text("Sales Co-ordinate Details : ",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  // //     const SizedBox(height: 8,),
                  // //     Row(
                  // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // //       children: [
                  // //         Row(
                  // //           children: [
                  // //             Text("Name : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  // //             Text(userExpenses[index].staffName.toString() ?? "Not Assigned yet!",
                  // //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: Theme.of(context).colorScheme.fontColor) ),
                  // //           ],
                  // //         ),
                  // //         Row(
                  // //           children: [
                  // //             Text("Mobile : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  // //             Text(userExpenses[index].staffMobile.toString() ?? "Not Assigned yet!",
                  // //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: Theme.of(context).colorScheme.fontColor) ),
                  // //           ],
                  // //         ),
                  // //       ],
                  // //     ),
                  // //     const SizedBox(height: 8,),
                  // //    Row(
                  // //       children: [
                  // //         Text("Remark : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  // //         Text(
                  // //             userExpenses[index].remark == null || userExpenses[index].remark == ""?
                  // //                 ""
                  // //             : userExpenses[index].remark.toString() ?? "Not Assigned yet!",
                  // //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: Theme.of(context).colorScheme.fontColor) ),
                  // //       ],
                  // //     ),
                  // //   ],
                  // // ),
                  //     const SizedBox(height: 6,),
                  //     // : SizedBox.shrink(),
                  // // Row(
                  // //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // //   children: [
                  // //     Text("Referral Associate Details: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  // //
                  // //     Container(
                  // //       // width: 100,
                  // //       padding: EdgeInsets.all(8),
                  // //       decoration: BoxDecoration(
                  // //           borderRadius: BorderRadius.circular(10),
                  // //           color: userExpenses[index].shareInfo.toString() == "1"?
                  // //           Colors.green : Colors.red
                  // //       ),
                  // //       child: Center(
                  // //         child: Text(userExpenses[index].shareInfo.toString() == "1"?
                  // //         "Share"
                  // //             : "Do Not Share",
                  // //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                  // //       ),
                  // //     ),
                  // //   ],
                  // // ),
                  //
                  // // Spacer(),
                  // // Divider(
                  // //   thickness: 2,
                  // //   color: colors.secondary,
                  // // ),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //
                  //     // Text("Product : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.fontColor),),
                  //     Container(
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         color: colors.secondary,
                  //         borderRadius: BorderRadius.circular(10)
                  //       ),
                  //         child: Center(child: Text(userExpenses[index].status.toString(), style: TextStyle(fontSize: 14,
                  //             color: colors.whiteTemp,
                  //             fontWeight: FontWeight.w600)))),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        }),
  );
}

  Widget perDayExpenseWidget(){
    return Expanded(
      child: perDayExpenses.isNotEmpty ?
      ListView.builder(
          itemCount: perDayExpenses.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                 padding: EdgeInsets.only(right: 10, top: 10),
                width: MediaQuery.of(context).size.width,
                //height: 220,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.white,
                    border: Border.all(color: colors.primary),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat('dd MMM yyyy').format(DateTime.parse(perDayExpenses[index].date.toString())).toString(),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,  color: colors.primary) ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('₹ ${perDayExpenses[index].totalAmount.toString()}',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600,  color: colors.primary) ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: perDayExpenses[index].status.toString() == "0" ?
                                Colors.red
                                    : Colors.green
                            ),
                            child: Text("Pending", style: TextStyle(
                                color: colors.whiteTemp,
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          })
      : Center(
        child: Text("No data found!", style: TextStyle(color: Theme.of(context).colorScheme.fontColor),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userExpenses.isNotEmpty ?
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: 260,
              decoration: BoxDecoration(
                  color: colors.blackTemp,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                      getUserExpense();
                    },
                    child: Container(
                        height: 40,
                        width: 130,
                        child:  Center(
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: isSelected
                                  ? Color(0xffffffff)
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colors.primary
                              : colors.blackTemp,
                          // border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => NextPage(),
                        // ));
                        isSelected = false;
                      });
                      perDayWiseExpense();
                    },
                    child: Container(
                        height: 40,
                         width: 130,
                        child: Center(
                          child: Text(
                            'Per Day Expenses',
                            style: TextStyle(
                              color: isSelected
                                  ? colors.whiteTemp
                                  : Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: isSelected
                                ? colors.blackTemp
                                : colors.primary,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
            ),
            isSelected ?
                allExpenses()
                :  perDayExpenseWidget()
            // Card(
            //   elevation: 3,
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //   child: Container(
            //     padding: EdgeInsets.only(left: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(color: colors.primary)
            //     ),
            //     child: Row(
            //     children: [
            //       Text("Filter by : ", style: TextStyle(
            //         fontSize: 20, color: Colors.black87
            //       ),),
            //       Padding(
            //           padding: const EdgeInsets.all(20),
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             height: 50,
            //             width: MediaQuery.of(context).size.width - 185,
            //             decoration: BoxDecoration(
            //                 color: Theme.of(context).colorScheme.white,
            //                 borderRadius: BorderRadius.circular(12),
            //                 border: Border.all(color: Theme.of(context).colorScheme.fontColor)
            //             ),
            //             child: DropdownButtonHideUnderline(
            //               child: DropdownButton(
            //                 hint: Text('Select type'), // Not necessary for Option 1
            //                 value: categoryValue,
            //                 onChanged: (String? newValue) {
            //                   setState(() {
            //                     categoryValue = newValue;
            //                   });
            //                   if(categoryValue == "All"){
            //                     getUserExpense('');
            //                   }else{
            //                     getUserExpense(categoryValue.toString());
            //                   }
            //                   print("this is category value $categoryValue");
            //                 },
            //                 items: leadStatus.map((item) {
            //                   return DropdownMenuItem(
            //                     child:  Text(item, style:TextStyle(color: Theme.of(context).colorScheme.fontColor),),
            //                     value: item,
            //                   );
            //                 }).toList(),
            //               ),
            //             ),
            //           )
            //       )
            //     ],
            //   ),),
            // ),

          ],
        ),
      )
      : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Text("No data found !!")),
      ),
    );
  }
}


