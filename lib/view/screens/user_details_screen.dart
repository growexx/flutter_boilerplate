import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String name = "user-details";
  static const String path = "/$name";
  bool showButton;

  UserDetailsScreen({super.key, 
    this.showButton = true,
  });

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
          title: const Text('User Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
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
          padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 16),
              const Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
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
