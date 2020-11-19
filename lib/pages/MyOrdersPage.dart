
import 'package:brandstorex/pages/ContactUsPage.dart';
import 'package:brandstorex/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brandstorex/pages/OrderDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rating_dialog/rating_dialog.dart';
var length=0;

class MyOrdersPage extends StatelessWidget{
  String username;

 bool isShow=false;
  MyOrdersPage({Key key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    AssetImage assetImage = AssetImage("images/emptyorder.png");
    Image image = Image(
      image: assetImage,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Orders"),),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
                  StreamBuilder(
                      stream: Firestore.instance.collection(username).document("Orderinfo").collection("Orderx").document("max").snapshots(),
                      builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                                  return new Text("Loading");
                            }
                            var userDocument = snapshot.data;
                            // picture1[index] = userDocument["pic1"];
                            return Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                        "You have " + userDocument["length"].toString() + " orders in your List", maxLines: 1,
                                        style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                        ),
                                  ),
                            );
                      }
                  ),

              StreamBuilder(
                    stream: Firestore.instance.collection(username).document("Orderinfo").collection("Orderx").document("max").snapshots(),

                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      }
                      var userDocument = snapshot.data;

                      int s = int.parse(userDocument["length"].toString());
                      //assert(s is int);
                      if(s==0){
                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20,bottom: 20),

                              alignment: Alignment.center,
                              height: 150,
                              width: 150,
                              child: image,
                            ),
                            Text("OOPS \nNo orders found",textAlign: TextAlign.center,style: TextStyle(
                              fontFamily: "Raleway",fontSize: 20,fontWeight: FontWeight.w600,
                            ),),

                            Container(
                              width: 300.0,
                              height: 50.0,
                              margin: EdgeInsets.only(top: 30.0, bottom: 15),
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(15),
                                    side: BorderSide(color: Color(0xFFceced8))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Continue shopping', style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      else{
                        isShow=true;
                        return   Container(
                          alignment: Alignment.topLeft,

                          //height: 320,
                          margin: EdgeInsets.all(6),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: int.parse(userDocument["length"].toString()),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 100.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: new BorderRadius.circular(10)),
                                  margin: EdgeInsets.all(2),
                                  child: Column(
                                    children: <Widget>[
                                      StreamBuilder(
                                          stream: Firestore.instance.collection(username).document("Orderinfo").collection("Orderx").document("a" + index.toString()).snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return new Text("Loading");
                                            }

                                            var userDocument = snapshot.data;

                                            //pricex=(pricex+finalprice).round();
                                            return GestureDetector(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetailsPage(username: username,indexno: index,)));
                                              },
                                              child: Container(
                                                height: 150.0,
                                                child: Row(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(
                                                        userDocument["pic1"],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 25,
                                                          width: 200,
                                                          margin: EdgeInsets.only( top: 8),
                                                          child: Text(
                                                            userDocument["name1"],
                                                            style: TextStyle(fontFamily: "Raleway", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 25,
                                                          width: 220,
                                                         // margin: EdgeInsets.only(top: 8),
                                                          child: Text("Status:"+userDocument["status"],
                                                            style: TextStyle(fontFamily: "Raleway", fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 25,
                                                          width: 200,
                                                         // margin: EdgeInsets.only(top: 8),
                                                          child: Text("PID:"+userDocument["orderid"],
                                                            style: TextStyle(fontFamily: "Raleway", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 25,
                                                          width: 200,
                                                          //margin: EdgeInsets.only(top: 8),
                                                          child: Text("OID:"+userDocument["paymentid"],
                                                            style: TextStyle(fontFamily: "Raleway", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 25,
                                                          width: 200,
                                                          margin: EdgeInsets.only(top: 8),
                                                          alignment: Alignment.bottomRight,
                                                          child: RaisedButton(
                                                            color: Colors.blueAccent,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(15),
                                                                side: BorderSide(color: Color(0xFFceced8))),
                                                            onPressed: () {
                                                              showDialog(
                                                                  context: context,
                                                                  barrierDismissible: true, // set to false if you want to force a rating
                                                                  builder: (context) {
                                                                    return RatingDialog(
                                                                      icon: Image.network(userDocument["pic1"],height: 170,), // set your own image/icon widget
                                                                      title: "Item ID:s23",
                                                                      description:
                                                                      "Tap a star to set your rating.\nNote: Review/Rating can't be Edited later",
                                                                      submitButton: "SUBMIT",
                                                                       alternativeButton: "Contact us instead?", // optional
                                                                       positiveComment: "We are so happy to hear :)", // optional
                                                                       negativeComment: "We're sad to hear :(", // optional
                                                                      accentColor: Colors.red, // optional
                                                                      onSubmitPressed: (int rating) {
                                                                        print("onSubmitPressed:"+"Rated"+rating.toString()+"Star");
                                                                        //   open the app's page on Google Play / Apple App Store
                                                                        Fluttertoast.showToast(textColor:Colors.white,backgroundColor: Colors.deepPurpleAccent,
                                                                            msg: "Review noted successfully",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT);
                                                                      },
                                                                      onAlternativePressed: () {
                                                                        print("onAlternativePressed: do something"+"Rated"+"3 or less Star");
                                                                        //  maybe you want the user to contact you instead of rating a bad review
                                                                        //Fluttertoast.showToast(textColor:Colors.white,backgroundColor: Colors.deepPurpleAccent,
                                                                           // msg: "Help not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT);
                                                                        Navigator.of(context).pop();
                                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUsPage()));
                                                                      },
                                                                    );
                                                                  });



                                                            //  Fluttertoast.showToast(msg: "Fature not present",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT);


                                                            },
                                                            child: Text("Review", style: TextStyle(
                                                                color: Colors.white,
                                                                fontFamily: "Raleway",
                                                                fontWeight: FontWeight.w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                );

                              }),
                        );
                      }
                      // picture1[index] = userDocument["pic1"];


                    }),

              isShow ?
              Container(
                width: 300.0,
                height: 50.0,
                margin: EdgeInsets.only(top: 30.0, bottom: 15),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15),
                      side: BorderSide(color: Color(0xFFceced8))),
                  onPressed: () {
                    Navigator.of(context).pop();

                  },
                  child: Text('Update', style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600),
                  ),
                ),
              ): Container(),

            ],
          ),
        ),
      )
    );
  }

}
