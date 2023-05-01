import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_encrypted_sql/ModelProvider.dart';
import 'package:test_encrypted_sql/event_client.dart';

import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
//import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MyApp myApp = await MyApp.init();
  runApp(myApp);
}

class MyApp extends StatefulWidget {
  final EventClient eventClient;

  MyApp(this.eventClient);

  static Future<MyApp> init() async {
    final path = (await getApplicationSupportDirectory()).path;
    return MyApp(EventClient(path));
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  String resultText = '';

  @override
  void initState() {
    super.initState();
    try {
      _configureAmplify();
    } on Exception catch (e) {
      print('whatever');
    }
  }

  Future<void> _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    /*
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(datastorePlugin);
     */

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _submit() async {
    widget.eventClient.testSave(myController.text);

    await _displayStoredValues();
  }

  Future<void> _displayStoredValues() async {
    // get stored values
    final stored = (await widget.eventClient.testRetrieve(100)).toList();
    final printable = stored.join('\n');

    setState(() {
      resultText = printable;
    });
  }

  void _clear() async {
    await widget.eventClient.testClear();

    await _displayStoredValues();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text(
                resultText,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _displayStoredValues,
                child: Text('Request'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _clear,
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
