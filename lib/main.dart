import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  List<MenuItem> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  MenuItem item = menuItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.description),
                      trailing: Text('\$${item.price}'),
                      onTap: () {
                        setState(() {
                          _cartItems.add(item);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Cart (${_cartItems.length} items):'),
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  MenuItem item = _cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _cartItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text('Place Order'),
              onPressed: () {
                if (_cartItems.isEmpty) {
                  // Display an error message
                } else {
                  // Call the API to place the order
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String name;
  String description;
  double price;

  MenuItem(
      {required this.name, required this.description, required this.price});
}

final List<MenuItem> menuItems = [
  MenuItem(
      name: 'Hamburger',
      description: 'Juicy beef patty with lettuce, tomato, and cheese',
      price: 8.99),
  MenuItem(
      name: 'Pizza',
      description: 'Thin crust pizza with your choice of toppings',
      price: 10.99),
  MenuItem(
      name: 'Salad',
      description: 'Fresh greens with assorted vegetables and dressing',
      price: 6.99),
  // Add more menu items as needed
];

















// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Train Timetable App',
//       home: TrainTimetableScreen(),
//     );
//   }
// }

// class TrainTimetableScreen extends StatefulWidget {
//   @override
//   _TrainTimetableScreenState createState() => _TrainTimetableScreenState();
// }

// class _TrainTimetableScreenState extends State<TrainTimetableScreen> {
//   final Map<String, String> _timetable = {
//     '6:00 AM': 'Train 1',
//     '7:30 AM': 'Train 2',
//     '9:00 AM': 'Train 3',
//     '10:30 AM': 'Train 4',
//     '12:00 PM': 'Train 5',
//     '1:30 PM': 'Train 6',
//     '3:00 PM': 'Train 7',
//     '4:30 PM': 'Train 8',
//     '6:00 PM': 'Train 9',
//     '7:30 PM': 'Train 10',
//     '9:00 PM': 'Train 11',
//     '10:30 PM': 'Train 12',
//   };

//   String _recognizedText = '';
//   stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;

//   Future<void> _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize();
//       if (available) {
//         setState(() {
//           _isListening = true;
//         });
//         _speech.listen(
//           onResult: (result) => setState(() {
//             _recognizedText = result.recognizedWords;
//           }),
//         );
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//         _speech.stop();
//       });
//     }
//   }

//   String _getTrain(String time) {
//     String train = _timetable[time] ?? 'No train found';
//     return train;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Train Timetable App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Press the button and say the time',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24.0,
//               ),
//             ),
//             SizedBox(height: 32.0),
//             FloatingActionButton(
//               onPressed: _listen,
//               child: Icon(_isListening ? Icons.mic_off : Icons.mic),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               _recognizedText,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               _getTrain(_recognizedText),
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
