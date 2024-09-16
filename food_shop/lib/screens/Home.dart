import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50.0,left: 20.0 ,bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/wave.png",height: 30.0,width: 30.0, fit: BoxFit.cover, ),
                      SizedBox(width: 10.0,),
                      Text(
                        "hey rocky",
                        style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight:FontWeight.bold ),

                      ),

                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                    "Eat fresh fruits  and try \nto be healthy ",
                    style: TextStyle(color: Colors.black26,fontSize: 20.0,fontWeight:FontWeight.w500 ),
                  ),

                ],
              ),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  Image.asset("assets/images/userPic.jpg",height: 60.0,width: 60.0, fit: BoxFit.cover, ),

              ),
            ),


            ],
          ),
           SizedBox(height: 20.0,),
           Container(
             margin: EdgeInsets.only(right: 20.0),
             padding: EdgeInsets.only(left: 20.0,top: 5.0,bottom: 5.0),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(color: Color(0xfff5f5f5),borderRadius: BorderRadius.circular(10),),
             child: TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,hintText: "Search Grocery",suffixIcon: Icon(Icons.search_outlined)
               ),
             ),
           ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Selling",
                style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight:FontWeight.bold ),

              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                "See All",
                style: TextStyle(color: Colors.black26,fontSize: 15.0,fontWeight:FontWeight.w600 ),

              ),
              ),

            ],
          ),
          SizedBox(height: 20.0,),
          Container(
            height: 265,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
            Container(
              padding: EdgeInsets.only(top: 9.0,left: 15.0),
              decoration: BoxDecoration(color: Color(0xffffe08e),borderRadius: BorderRadius.circular(30.0)),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Orange",
                    style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight:FontWeight.bold ),

                  ),
                  Text(
                    "\$3.99",
                    style: TextStyle(color: Colors.black54,fontSize: 18.0,fontWeight:FontWeight.w500 ),

                  ),
                  Image.asset("assets/images/orange.png",height: 150.0,width: 150.0, fit: BoxFit.cover, ),


                   Container(
                     padding: EdgeInsets.all(10.0),
                     margin: EdgeInsets.only(left: 120.0),
                     child: Icon(Icons.add,color:Colors.deepOrange, size: 30.0,),
                     decoration: BoxDecoration(color: Color(0xffffeab8), borderRadius: BorderRadius.circular(30.0)),

                   ),

                ],
              ) ,
            ),
              SizedBox(width: 20.0,),
              Container(
                padding: EdgeInsets.only(top: 9.0,left: 15.0),
                decoration: BoxDecoration(color: Color(0xffffe3e5),borderRadius: BorderRadius.circular(30.0)),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apple",
                      style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight:FontWeight.bold ),

                    ),
                    Text(
                      "\$4.99",
                      style: TextStyle(color: Colors.black54,fontSize: 18.0,fontWeight:FontWeight.w500 ),

                    ),
                    Image.asset("assets/images/apple.png",height: 150.0,width: 150.0, fit: BoxFit.cover, ),


                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 120.0),
                      child: Icon(Icons.add,color:Colors.pink, size: 30.0,),
                      decoration: BoxDecoration(color: Color(0xffffeee3), borderRadius: BorderRadius.circular(30.0)),

                    ),

                  ],
                ) ,
              )
            ],

          ),
          ),
            SizedBox(height: 20.0,),
          Text(
            "Near You",
            style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight:FontWeight.bold ),

          ),
            Text(
              "30+ shops",
              style: TextStyle(color: Colors.black54,fontSize: 18.0,fontWeight:FontWeight.w500 ),

            ),
            SizedBox(height: 10.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:  Image.asset("assets/images/shope1.jpg",height: 90.0,width: 90.0, fit: BoxFit.cover, ),

                ),
                SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Health Kitchen",
                      style: TextStyle(color: Colors.black,fontSize: 15.0,fontWeight:FontWeight.bold ),

                    ),
                    SizedBox(height: 3.0,),
                    Text(
                      "9:00am-8:00pm",
                      style: TextStyle(color: Colors.black54,fontSize: 14.0,fontWeight:FontWeight.w500 ),

                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.black,),
                        Text(
                          "5.4 |",
                          style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight:FontWeight.bold ),

                        ),
                        Icon(Icons.location_on),
                        Text(
                          "1.3km",
                          style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight:FontWeight.bold ),

                        ),
                      ],
                    )
                  ],
                )

              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:  Image.asset("assets/images/shope2.jpg",height: 90.0,width: 90.0, fit: BoxFit.cover, ),

                ),
                SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balaji Food Traders",
                      style: TextStyle(color: Colors.black,fontSize: 15.0,fontWeight:FontWeight.bold ),

                    ),
                    SizedBox(height: 3.0,),
                    Text(
                      "9:00am-7:00pm",
                      style: TextStyle(color: Colors.black54,fontSize: 14.0,fontWeight:FontWeight.w500 ),

                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.black,),
                        Text(
                          "5.0 |",
                          style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight:FontWeight.bold ),

                        ),
                        Icon(Icons.location_on),
                        Text(
                          "1.5km",
                          style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight:FontWeight.bold ),

                        ),
                      ],
                    )
                  ],
                )

              ],
            )
        ],),
      ),
    );
  }
}