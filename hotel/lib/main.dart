import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
  /*
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
  */
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey.shade100,
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a bSlue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        buttonColor: Colors.purple,
        //primaryColor: Colors.black54,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      ///*
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an error! ${snapshot.error.toString()}");
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            return MyHomePage(title: "MAD Hotel");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      //*/
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          //margin: const EdgeInsets.all(100.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: 225,
                    child: ElevatedButton(
                      //textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HotelList()),
                        );
                      },
                      child: const Text('List Hotels', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: ElevatedButton(
                    onPressed: () {
                      createData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateBooking()),
                        //MaterialPageRoute(builder: (context) => BookingList()),
                        //MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    child: const Text('Create Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Update Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DeleteBookingList()),
                      );
                    },
                    child: const Text('Delete Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelList()),
            );
          },
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final dbBooking = FirebaseDatabase.instance.reference().child("Booking");
  final dbGuests = FirebaseDatabase.instance.reference().child("Guests");
  final dbHotels = FirebaseDatabase.instance.reference().child("Hotels");
  DatabaseReference dbRooms = FirebaseDatabase.instance.reference().child("Rooms").child("H1");

  dynamic _guest = '';
  dynamic _hotel = '';
  dynamic _room = '';
  dynamic _sDate;
  DateTime _inDate;
  dynamic _eDate;

  List<DropdownMenuItem<dynamic>> guestList = [];
  List<DropdownMenuItem<dynamic>> hotelList = [];
  List<DropdownMenuItem<dynamic>> roomList = [];
  int index = 0;
  bool disableDropdown = true;

  String _dateCount;
  String _range;


  @override
  void initState() {
    _dateCount = '';
    _range = '';
    super.initState();
  }
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _sDate = DateFormat('MM/dd/yyyy').format(args.value.startDate).toString();
        _inDate = args.value.startDate;
        _eDate = DateFormat('MM/dd/yyyy').format(args.value.endDate ?? args.value.startDate).toString();
        _range =
            DateFormat('MM/dd/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('MM/dd/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      }
      //print("range: " + _range.toString());
      //print("sDate: " + _sDate.toString());
      //print("eDate: " + _eDate.toString());
    });
  }
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
            future: dbGuests.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                guestList.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                //print(snapshot.data.value);
                index = 0;
                values.forEach((key, values) {
                  guestList.add(
                    DropdownMenuItem<dynamic>(
                      child: Text(values["Name"]),
                      value: key,
                    )
                  );
                  index++;
                });
                return DropdownButtonFormField(
                  items: guestList,
                  hint: Text("Select a guest"),
                  onChanged: (value) {
                    setState(() {
                      _guest = value;
                    });
                  },
                );
              }
              return CircularProgressIndicator();
            }),
          FutureBuilder(
            future: dbHotels.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                hotelList.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                //print(snapshot.data.value);
                index = 0;
                values.forEach((key, values) {
                  hotelList.add(
                    DropdownMenuItem<dynamic>(
                      child: Text(values["hName"]),
                      value: key,
                    )
                  );
                  index++;
                });
                return DropdownButtonFormField(
                  items: hotelList,
                  hint: Text("Select a hotel"),
                  onChanged: (value) {
                    setState(() {
                      _hotel = value;
                      disableDropdown = false;
                      dbRooms = FirebaseDatabase.instance.reference().child("Rooms").child(_hotel);
                    });
                    //_loadRooms(_hotel);
                  },
                );
              }
              return CircularProgressIndicator();
            }),
          FutureBuilder(
            future: dbRooms.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                roomList.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                //print(snapshot.data.value);
                index = 0;
                values.forEach((key, values) {
                  roomList.add(
                      DropdownMenuItem<dynamic>(
                        child: Text(values["price"].toString()),
                        value: key,
                      )
                  );
                  index++;
                });
                return DropdownButtonFormField(
                  items: roomList,
                  hint: Text("Select a room price"),
                  disabledHint: Text("Select a hotel first"),
                  //value: guestList[0].value,
                  onChanged: disableDropdown ? null : (value) {
                    setState(() {
                      _room = value;
                    });
                  },
                );
              }
              return CircularProgressIndicator();
            }),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now(),
                  DateTime.now(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.purple),
              ),
              onPressed: () async {
                bool dateValid = false;
                bool fieldValid = false;


                if (_sDate == _eDate) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Check-In and Check-Out dates can not be the same')));
                } else if (_inDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Check-In date can not be before today')));
                } else {
                  dateValid = true;
                }
                if (_guest == '' || _hotel == '' || _room == '') {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Please select all fields')));
                } else {
                  fieldValid = true;
                }
                if (dateValid && fieldValid) {
                  DataSnapshot snap = await dbBooking.once();
                  //print(snap.value);
                  Map<dynamic, dynamic> resultList = snap.value;
                  dynamic count = resultList.length + 1;
                  print(count);
                  //print(resultList.keys);
                  dbBooking.child("B" + count.toString()).set({
                    'eDate': _eDate,
                    'guest': _guest,
                    'hotel': _hotel,
                    'room': _room,
                    'sDate': _sDate,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                }
                // Validate returns true if the form is valid, or false
                // otherwise.
                /*
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
                */
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Create Booking';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(accentColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class HotelList extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("Hotels");
  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel List"),
      ),
      body: Center(
        child: Container(
        margin: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //final dbRef = FirebaseDatabase.instance.reference().child("pets");
                FutureBuilder(
                    future: dbRef.once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        print(snapshot.data.value);
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: InkWell(
                                  splashColor: Colors.purple.withAlpha(30),
                                  onTap: () {
                                    //print('Card tapped.');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(lists[index]["hName"]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                      return CircularProgressIndicator();
                    }),
                Card(
                  //height: 100,
                  child: InkWell(
                    splashColor: Colors.purple.withAlpha(30),
                    onTap: () {
                      //print('Card tapped.');
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Go back'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

class BookingList extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking List"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                  future: dbRef.once(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      lists.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      values.forEach((key, values) {
                        lists.add(values);
                      });
                      return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: InkWell(
                              splashColor: Colors.purple.withAlpha(30),
                              onTap: () {
                                 //print('Card tapped.');
                              },
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Guest: " + lists[index]["guest"]),
                                      Text("Hotel: " + lists[index]["hotel"]),
                                      Text("Room: " + lists[index]["room"]),
                                      Text("Check-In: " + lists[index]["sDate"]),
                                      Text("Check-Out: " + lists[index]["eDate"]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              Card(
                //height: 100,
                child: InkWell(
                  splashColor: Colors.purple.withAlpha(30),
                  onTap: () {
                    //print('Card tapped.');
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Go back'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteBookingList extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  List<Map<dynamic, dynamic>> lists = [];
  List<String> keys = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Booking"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                  future: dbRef.once(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      lists.clear();
                      keys.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      print(snapshot.data.value);
                      print(values);
                      dynamic key = snapshot.data.key;
                      values.forEach((key, values) {
                        lists.add(values);
                        keys.add(key);
                      });
                      //lists.map((values) => keys);
                      print(lists);
                      print(keys);
                      return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: InkWell(
                              splashColor: Colors.purple.withAlpha(30),
                              onTap: () {
                                //print('Card tapped.');
                              },
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      //backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () {
                                      deleteConfirmation(context, keys[index]);
                                      //setState((){});
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        //Text("Index: " + '$index'),
                                        Text("Guest: " + lists[index]["guest"]),
                                        Text("Hotel: " + lists[index]["hotel"]),
                                        Text("Room: " + lists[index]["room"]),
                                        Text("Check-In: " + lists[index]["sDate"]),
                                        Text("Check-Out: " + lists[index]["eDate"]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              Card(
                //height: 100,
                child: InkWell(
                  splashColor: Colors.purple.withAlpha(30),
                  onTap: () {
                    //print('Card tapped.');
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Go back'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void deleteConfirmation(BuildContext context, dynamic key) {
  //Cancel Button
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  //Delete Button
  Widget deleteButton = TextButton(
    child: Text("Delete"),
    onPressed: () {
      deleteBooking(key);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      //setState((){});
      //context.reassemble();
    },
  );

  //Alert Dialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete Booking"),
    content: Text("Are sure you want to delete booking: " + key.toString() + "? This can not be undone."),
    actions: [
      cancelButton,
      deleteButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void deleteBooking(dynamic key) {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  dbRef.child(key).remove();
}

void createData() {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  dbRef.child("B3").set({
    'eDate': '03/11/21',
    'guest': 'G1',
    'hotel': 'H5',
    'room': 'R1',
    'sDate': '03/10/21'
  });
}

void deleteData() {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  dbRef.child('B3').remove();
}
