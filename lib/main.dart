import 'package:flutter/material.dart';
import './chat_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Chat'),
      ),
      // ignore: prefer_const_constructors
      drawer: Drawer(
        // Draw
        backgroundColor: Colors.white,
        child: ListView(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ednah'),
              accountEmail: Text('m.hussein@alustudent.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                foregroundColor: Colors.green,
              ),
            ),
            // Creating the list of items for the side menu
            ListTile(
              title: Text("Profile"),
            ),
            Divider(
              color: Colors.black26,
              height: 10.0,
            ),
            ListTile(
              title: Text("Chats"),
            ),
            ListTile(
              title: Text("Blocked"),
            ),
            ListTile(
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: Container(
        // not using a loop. instead builder will loop and read the data
        child: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: ((context, index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                const Divider(
                  height: 12.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        _model.datetime,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
                )
              ],
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("This is a floating button");
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
