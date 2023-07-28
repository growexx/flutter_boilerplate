import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String name = "user-details";
  static const String path = "/$name";
  bool showButton;

  UserDetailsScreen({
    this.showButton = true,
  });

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.username;
    // _emailController.text = widget.email;
    userRepository = Provider.of<UserRepository>(context, listen: false);
    setState(() {
      _nameController.text = userRepository.currentUser!.firstName!;
      _emailController.text = userRepository.currentUser!.email ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(builder: (context, userRepository, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: widget.showButton,
          title: Text('User Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Enable editing mode
                setState(() {
                  _isEditing ? false : true;
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
                    backgroundImage:
                        NetworkImage(userRepository.currentUser!.profileUrl!),
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
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
