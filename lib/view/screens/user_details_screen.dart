import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String name = "user-details";
  static const String path = "/$name";

  final String username;
  final String email;
  final String profileImageUrl;

  UserDetailsScreen({
    required this.username,
    required this.email,
    required this.profileImageUrl,
  });

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.username;
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        automaticallyImplyLeading: false,
        actions: [
          _isEditing
              ? IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    // Save edited details and update user information
                    // You can perform API calls or update data here
                    setState(() {
                      _nameController.text = widget.username;
                      _emailController.text = widget.email;
                      _isEditing = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Enable editing mode
                    setState(() {
                      _isEditing = true;
                    });
                  },
                ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement image picker logic here to change the profile image
                  // This will be triggered when the user taps on the profile image
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                  radius: 50,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            _isEditing
                ? TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  )
                : Text(
                    widget.username,
                    style: TextStyle(fontSize: 20),
                  ),
            SizedBox(height: 15),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            _isEditing
                ? TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  )
                : Text(
                    widget.email,
                    style: TextStyle(fontSize: 20),
                  ),
          ],
        ),
      ),
    );
  }
}
