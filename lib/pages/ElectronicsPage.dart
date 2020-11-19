import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ElectronicsPage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement buildj

    return Scaffold(
      appBar: AppBar(title: Text("Electronics"),),
      body:  Container(
        height: MediaQuery.of(context).size.height,
           child: SingleChildScrollView(
            child: Column(
                children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg: "Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: Headphonecard(),
                    ),
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg: "Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: Earphonecard(),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg: "Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: Harddiskcard(),
                    ),
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg:"Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: Pendrivecard(),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg: "Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: PowerBankcard(),
                    ),
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsList(),),);
                         Fluttertoast.showToast(msg: "Data not found",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.teal,textColor: Colors.white);
                      },
                      child: Mobilecard(),
                    ),

                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }

}

class Headphonecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          Headphoneicon(),
          Headphonetext(),
        ],
      ),
    );
  }
}
class Headphoneicon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=new AssetImage("images/headphone.png");
    Image image=Image(image: assetImage,);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF394FC2),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(10),
      child:   image,

    );
  }

}
class Headphonetext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("HeadPhone",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}

class Earphonecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          Earphoneicon(),
          Earphonetext(),
        ],
      ),
    );
  }
}
class Earphoneicon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=new AssetImage("images/earphone.png");
    Image image=Image(image: assetImage,);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFE98929),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(10),
      child:   image,

    );
  }

}
class Earphonetext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Earphone",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}

class Harddiskcard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          Harddiskicon(),
          Harddisktext(),
        ],
      ),
    );
  }
}
class Harddiskicon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=new AssetImage("images/harddisk.png");
    Image image=Image(image: assetImage,);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFFA2F2F),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(15),
      child:   image,

    );
  }

}
class Harddisktext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Harddisk",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}

class Pendrivecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          Pendriveicon(),
          Pendrivetext(),
        ],
      ),
    );
  }
}
class Pendriveicon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=new AssetImage("images/pendrive.png");
    Image image=Image(image: assetImage,);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF009688),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(10),
      child:   image,

    );
  }

}
class Pendrivetext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Pendrive",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}

class PowerBankcard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          PowerBankicon(),
          PowerBanktext(),
        ],
      ),
    );
  }
}
class PowerBankicon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage=new AssetImage("images/powerbank.png");
    Image image=Image(image: assetImage,);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF7C46DB),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(10),
      child:   image,

    );
  }

}
class PowerBanktext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Powerbank",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}

class Mobilecard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFFe7e7e7),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
      ),
      child: Column(
        children: <Widget>[
          Mobilecon(),
          Mobiletext(),
        ],
      ),
    );
  }
}
class Mobilecon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF1CC423),
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      height: 70,
      width: 70,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(10),
      child: Icon(Icons.phone_android,size: 50,),

    );
  }

}
class Mobiletext extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Phone",textDirection: TextDirection.ltr,
        style: TextStyle(decoration: TextDecoration.none,
          fontSize: 20,
          color: Colors.teal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

}
