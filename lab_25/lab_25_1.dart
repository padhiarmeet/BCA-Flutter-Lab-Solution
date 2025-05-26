import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: InsertUserPage(),
  ));
}

class InsertUserPage extends StatefulWidget {
  @override
  _InsertUserPageState createState() => _InsertUserPageState();
}

class _InsertUserPageState extends State<InsertUserPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  Map<String, dynamic>? insertedUser;
  bool isLoading = false;

  Future<void> insertUser(String name, String email) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://aaaaaaaaaaaaaaaaaa/users');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        insertedUser = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to insert")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Insert User')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                insertUser(nameController.text, emailController.text);
              },
              child: Text("Insert User"),
            ),
            SizedBox(height: 30),
            insertedUser != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Inserted Data:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("ID: ${insertedUser!['id']}"),
                Text("Name: ${insertedUser!['name']}"),
                Text("Email: ${insertedUser!['email']}"),
              ],
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
