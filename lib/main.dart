import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );


    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(context, color, Icons.call, 'CALL'),
        _buildButtonColumn(context, color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(context, color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: ListView(
          children: [
                    Image.asset(
                      'images/lake.jpg',
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    titleSection,
                    buttonSection,
                    textSection
          ],
        ),
        ),
      );
  } //end of Build Widget
  Column _buildButtonColumn(BuildContext context, Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(iconSize: 30, icon: Icon(icon), color: color,
        onPressed: () async {
          switch(label){
            case 'CALL':
              {
                final call = Uri.parse('tel:+12899270116');
                if (await canLaunchUrl(call)) {
                  launchUrl(call);
                } else {
                  throw 'Could not launch $call';
                }

                break;
              }
            case 'ROUTE':
              {
                final web = Uri.parse(
                  'https://goo.gl/maps/8x8vWYiNa5cnNbEy7',
                );
                if (await canLaunchUrl(web)) {
                  launchUrl(web);
                } else {
                  throw 'Could not launch $web';
                }

                break;
              }
            case 'SHARE':
              {
                final email = Uri(
                  scheme: 'mailto',
                  path: 'adhish.malhotra@ontariotechu.net',
                  query: 'subject=Hello from your app&body=Lake Oeschinen is too far from Canada, not going there!',
                );
                if (await canLaunchUrl(email)) {
                  launchUrl(email);
                } else {
                  throw 'Could not launch $email';
                }
                break;
              }

          }
        },),

        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }


}

