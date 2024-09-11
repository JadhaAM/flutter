import 'package:flutter/material.dart';

class ResponsiveSliverApp extends StatelessWidget {
  @override
    final List<Color> colors = [
      Colors.amber,
      Colors.white,
      Colors.orange,
      Colors.orange,
      Colors.amber,
      Colors.white,
      Colors.amber,
      Colors.orange,
      Colors.amber,
    ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            // First SliverAppBar
            SliverAppBar(
              pinned: true,
              expandedHeight: 50.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'KindaCode.com',
                style: TextStyle(
                    color: Colors.white, 
                  ),
                  ),
                background: Container(color: const Color.fromARGB(255, 62, 13, 222)),
              ),
            ),
            SliverAppBar(
              pinned: true,
              expandedHeight: 50.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'First SliverAppBar',
                  style: TextStyle(
                    color: Colors.white, 
                  ),),
                background: Container(color: Colors.green),
              ),
            ),

            // Sliver for grid items
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(
                  color: Colors.blue,
                   height: 90,
                    margin:EdgeInsets.all(10.0),
                     
                     ),

                Container(
                  color: const Color.fromARGB(255, 142, 196, 221),
                   height: 90 ,
                    margin:EdgeInsets.all(10.0),
                   
                    ),
               
              ],
            ),
      
            // Second SliverAppBar
           SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 15, 
                      backgroundImage: AssetImage(
                        'assets/images/hero.png', 
                      ),
                    ),
                    SizedBox(height: 8), 
                    Text(
                      'Second SliverAppBar',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white, 
                      ),
                    ),
                  ],
                ),
                background: Container(color: Colors.orange),
              ),
            ),
            // Sliver for grid items below
            SliverGrid.count(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
            children: List.generate(colors.length, (index) {
              return Container(
                margin: EdgeInsets.fromLTRB(5, 25, 5, 15),
                
                decoration: BoxDecoration(
                  color: colors[index],
                  border: Border.all(
                    color: Colors.black, 
                    width: 0.8, 
                  ),
                ),
                child: Center(child: Text('Item $index')),
              );
            }),
          ),
       ],
        ),
      ),
    );
  }
}

void main() {
  runApp(ResponsiveSliverApp());
}
