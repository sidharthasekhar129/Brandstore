import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brandstorex/pages/ProductDetailsPage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProductsList extends StatelessWidget{

  String Categorypath = "";
  String mail = "";

  ProductsList({Key key, this.Categorypath,this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildj
    return Scaffold(
      appBar: AppBar(title: Text("Products list"),),
      body: Container(
          color: Colors.black12,

          child: listloader(Categorypath,mail)
      ),
    );
  }

}

class listloader extends StatelessWidget{
  var path = "";
  var mailx="";
  listloader(String categorypath,String mail){
    path = categorypath;
    mailx=mail;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GridView.count(
      // crossAxisCount is the number of columns
      crossAxisCount: 2,
      //   childAspectRatio: (itemWidth / itemHeight),
      childAspectRatio: (100 / 180),
      // This creates two columns with two items in each column
      children: List.generate(22, (index) {
        return GestureDetector(
          onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(path1: "Category",
             path2: "SubCategory",path3: path,path4: index.toString(),mail: mailx,) ));


          },
          child: Container(
                  height: 200,
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: new BorderRadius.circular(10)),

                  child:
                  Column(
                    children: <Widget>[
                      StreamBuilder(

                          stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            }
                            var userDocument = snapshot.data;
                            // picture1[index] = userDocument["pic1"];
                            return   Container(
                              height: MediaQuery.of(context).size.width*0.7,
                               width: MediaQuery.of(context).size.width*0.5,

                              child:  ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(userDocument["pic1"],

                                  fit: BoxFit.cover,
                                ) ,
                              ),
                            );
                          }
                      ),
                      StreamBuilder(
                          stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            }
                            var userDocument = snapshot.data;
                            // picture1[index] = userDocument["pic1"];
                            return     Container(
                              padding: EdgeInsets.only(left: 5),

                              child:  Text(userDocument["name1"],maxLines: 1,style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,

                              ),
                              ),
                            );
                          }
                      ),
                      StreamBuilder(
                          stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return new Text("Loading");
                            }
                            var userDocument = snapshot.data;
                            // picture1[index] = userDocument["pic1"];
                            return Container(
                              padding: EdgeInsets.only(left: 5),

                              child: Text(userDocument["name2"],maxLines: 1,style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600 ,
                                  fontFamily: "Raleway",
                                  color: Colors.white
                              ),
                              ) ,
                            );
                          }
                      ),
                      Container(
                        color: Colors.black54,
                        alignment: Alignment.center,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            StreamBuilder(
                                stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return new Text("Loading");
                                  }
                                  var userDocument = snapshot.data;
                                  // picture1[index] = userDocument["pic1"];

                                  var price =  int.parse(userDocument["price"]);
                                  assert(price is int);
                                  var offer = int.parse(userDocument["offer"]);
                                  assert(offer is int);
                                  var finalprice = (price*offer)/100;
                                  var finalpricexx = price-finalprice;
                                  var finalpricexxx=  finalpricexx.round();

                                  return   Container(
                                    //padding: EdgeInsets.only(left: 10),
                                    child: Text("₹"+finalpricexxx.toString(),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,

                                    ),
                                    ),
                                  );
                                }
                            ),
                            StreamBuilder(
                                stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return new Text("Loading");
                                  }
                                  var userDocument = snapshot.data;

                                  return     Container(
                                    //padding: EdgeInsets.only(left: 10),
                                    child: Text(userDocument["price"],style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.white,
                                        decorationThickness: 2
                                    ),
                                    ),
                                  );
                                }
                            ),

                            StreamBuilder(
                                stream: Firestore.instance.collection('Category').document('SubCategory').collection(path).document("a"+index.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return new Text("Loading");
                                  }
                                  var userDocument = snapshot.data;
                                  // picture1[index] = userDocument["pic1"];
                                  return   Container(

                                    //padding: EdgeInsets.only(left: 10),
                                    child: Text(userDocument["offer"]+"%off",style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,

                                    ),
                                    ),
                                  );
                                }
                            ),



                          ],
                        ),
                      ),

                    ],
                  )


              ),

        );
      }
      ),
    );
  }


}
