import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  DynamicPage({super.key});

  buildcolumn() => Column(
    children: [
      Image.asset('images/post1.jpg'),
      const SizedBox(height: 10),
      const Text(
        'Starberry Pavlova', 
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.all(15),
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 19),
        ),
      ),
    ],
  );



  String description = 
  'Pavlova is a meringue-based desert named after the Russian  ballerina'
  'Anna Pavlova. Pavlova featuresa a crisp crust and soft, light inside, '
  'topppes with fruit and whipped cream.';

  buildNewRow() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/photo_male_1.jpg'
      ),
    ],
  );

  buildStar(int rating, int numreviews) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i=1; i <= rating; i++)
        const Icon(
          Icons.star,
          color: Colors.green,
          size: 24,
        ),

      for (int i=1; i <= (5 - rating); i++)
        const Icon(
          Icons.star,
          size: 24,
        ),
      const SizedBox(
        width: 20,
      ),

      const Text(
        '80 reviews',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ) ,
      )
    ],
  );

  buildicontab(iconval, title, time) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconval, color: Colors.green),
      const SizedBox(height: 10),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(
       time,
       style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );

  buildRowTabs() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildicontab(Icons.kitchen, 'PREP', '25 min'),
      buildicontab(Icons.timer, 'COOK', '1 hr'),
      buildicontab(Icons.kitchen, 'FEEDS', '4-6'),
    ],
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Icon Widget'),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            buildcolumn(),
            buildStar(2, 90),
            const SizedBox(height: 20),
            buildRowTabs(),
          ],
        ),
      ),
    );
  }
}