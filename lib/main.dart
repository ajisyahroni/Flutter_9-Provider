import 'package:flutter/material.dart';
import 'package:provider_state_management/application_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, value, _) => Text(
                'Provider State Management',
                style: TextStyle(color: value.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, value, _) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: value.color,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AB'),
                    Consumer<ApplicationColor>(
                        builder: (context, value, _) => Switch(
                            value: value.isLightBlue,
                            onChanged: (newValue) {
                              value.isLightBlue = newValue;
                            })),
                    Text('LB'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
