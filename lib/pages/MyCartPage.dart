import 'package:brandstorex/pages/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

 var path1,path2,path3,path4;
var length=0;
 class MyCartPage extends StatefulWidget{

  String username;

  MyCartPage({Key key, this.username}) : super(key: key);
  @override
  _MyCartPageState createState() => _MyCartPageState(username);
}

class _MyCartPageState extends State<MyCartPage> {
  ProgressDialog pr;

 String username;
  _MyCartPageState(String usernamex){
    username=usernamex;
  }
  int total=0;
  bool isready=false;
   @override
  Widget build(BuildContext context) {
    // TODO: implement buildj

    AssetImage assetImage = AssetImage("images/emptycart.png");
    Image image = Image(
      image: assetImage,
    );


    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            StreamBuilder(
                stream: Firestore.instance.collection(username).document("Cartinfo").collection("Cartx").document("max").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return new Text("Loading");
                  }
                  var userDocument = snapshot.data;
                  length = userDocument["length"];
                  return   IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: (){
                      deleteData(username,length);
                      Fluttertoast.showToast(msg:"Item(s) deleted",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.teal,textColor: Colors.white);

                    },
                  );
                }
            ),

          ],
          title: Text("Cart"),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
              child: Column(
              children: <Widget>[
                StreamBuilder(
                    stream: Firestore.instance.collection(username).document("Cartinfo").collection("Cartx").document("max").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      }
                      var userDocument = snapshot.data;
                    length = userDocument["length"];
                      return Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "You have " + userDocument["length"].toString() + " items in your Cart", maxLines: 1,
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
                   stream: Firestore.instance.collection(username).document("Cartinfo").collection("Cartx").document("max").snapshots(),
                    builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    }
                    var userDocument = snapshot.data;

                    int x = int.parse(userDocument["length"].toString());

                    if(x==0){
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            child: image,
                          ),
                          Text("OOPS \nLooks like your cart is empty",textAlign: TextAlign.center,style: TextStyle(
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
                    else {


                       return  Column(
                        children: <Widget>[
                          Container(
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
                                    height: 165.0,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: new BorderRadius.circular(10)),
                                    margin: EdgeInsets.all(2),
                                    child: Column(
                                      children: <Widget>[
                                        StreamBuilder(
                                            stream: Firestore.instance.collection(username).document('Cartinfo').collection("Cartx").document("a" + index.toString()).snapshots(),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return new Text("Loading");
                                              }


                                              var userDocumentx = snapshot.data;
                                              path1 = userDocumentx["path1"];
                                              path2 = userDocumentx["path2"];
                                              path3 = userDocumentx["path3"];
                                              path4 = userDocumentx["path4"];

                                              return StreamBuilder(
                                                  stream: Firestore.instance.collection(path1).document(path2).collection(path3).document("a" + path4).snapshots(),
                                                  builder: (context, snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return new Text("Loading");
                                                    }

                                                    var userDocument = snapshot.data;
                                                    var price = int.parse(userDocument["price"]);
                                                    assert(price is int);
                                                    var offer = int.parse(userDocument["offer"]);

                                                    var finalprice = (price * offer) / 100;
                                                    var finalpricexx = price - finalprice;
                                                    var finalpricexxx = finalpricexx.round();
                                                    total=total+finalpricexxx;



                                                    //pricex=(pricex+finalprice).round();
                                                    return Container(
                                                      height: 165.0,
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
                                                                height: 25,
                                                                width: 200,
                                                                margin: EdgeInsets.only(left: 8, top: 8),
                                                                child: Text(
                                                                  userDocument["name1"],
                                                                  style: TextStyle(fontFamily: "Raleway", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 25,
                                                                width: 200,
                                                                margin: EdgeInsets.only(left: 8, top: 8),
                                                                child: Text(
                                                                  userDocument["name2"],
                                                                  style: TextStyle(fontFamily: "Raleway", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 25,
                                                                width: 200,
                                                                margin:
                                                                EdgeInsets.only(left: 8, top: 8),
                                                                child: Text(userDocumentx["size"] + "/" + userDocumentx["qty"],
                                                                  style: TextStyle(fontFamily: "Raleway", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                                                                ),
                                                              ),
                                                              Row(
                                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 25,
                                                                    width: 100,
                                                                    margin: EdgeInsets.only(left: 8, top: 8),
                                                                    child: Text(
                                                                      finalpricexxx.toString(),
                                                                      style: TextStyle(fontFamily: "Raleway", fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 100,
                                                                    child: RaisedButton(
                                                                      color: Color(0xFFceced8),
                                                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10),
                                                                          side: BorderSide(color: Color(0xFFceced8))),
                                                                      onPressed: () {},
                                                                      child: Text('Remove',
                                                                        style: TextStyle(color: Colors.white, fontFamily: "Raleway",fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            }),
                                      ],
                                    ),
                                  );

                                }),
                          ),
                          //PriceCalculator(),
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
                                //Navigator.of(context).pop();
                                //Pricecal(totalx: total,);
                                if(!isready){
                                  setState(() {
                                    isready=true;
                                  });
                                }
                                else{
                                  Fluttertoast.showToast(msg: "Already in updated state",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT);
                                }


                              },
                              child: Text('Calculate  total', style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          isready ? Pricecal(totalx: total,) :Container(),
                        ],
                      );

                    }


                  }),

              ],
            ),
          ),
        )
    );

  }


  void deleteData(String mail, int length) {

    try {
      for(int i=0;i<=length-1;i++){

        Firestore.instance.collection(mail).document("Cartinfo").collection("Cartx").document("a"+i.toString()).delete();


      }


      Firestore.instance.collection(mail).document("Cartinfo").collection("Cartx").document("max").setData({
        'length': 0,

      });

      setState(() {

      });

    } catch (e) {
      print(e.toString());
    }
  }


}

class Pricecal extends StatelessWidget{

   final totalx;

  const Pricecal({Key key, this.totalx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 280,
      width: 350,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black38,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(7),
            alignment: Alignment.topLeft,
            child: Text("Price Details",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(7),
                child: Text("Price: " + length.toString()+ " items",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(7),
                child: Text((totalx/2).toString(),
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(7),
                child: Text("Delivery charge ",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(7),
                child: Text("+00",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 1,
            color: Colors.white,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(7),
                child: Text("Grand Total ",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(7),
                child: Text((totalx/2).toString(),
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Container(
            width: 300.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 30.0, bottom: 15),
            child: RaisedButton(
              color: Color(0xFF195A79),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15),
                  side: BorderSide(color: Colors.white)),
              onPressed: () {
//                Fluttertoast.showToast(msg:"Payment gateway is not implemented",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
//                    backgroundColor: Colors.teal,textColor: Colors.white);

             Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(amount: (totalx/2).toString(),)));

              },
              child: Text('Proceed to pay',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );

  }

}




