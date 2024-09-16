import 'package:flutter/material.dart';
import 'Home.dart'; // Import the Home Screen

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, left: 21.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/landingPage.jpg"),
            SizedBox(height: 30.0),
            Text(
              "Order your \nfavorites fruits",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "Eat fresh fruits  and try to be healthy",
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to Home Screen when "Next" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffffcc4f),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
