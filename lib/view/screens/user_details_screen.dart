import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_manager/component/responsive/widget/responsive_helper.dart';
import 'package:flutter_boilerplate/app_manager/helper/navigation/navigation_helper.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/screens.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserDetailsScreen extends StatefulWidget {
  static const String name = "user-details";
  static const String path = "/$name";
  bool showButton;

  UserDetailsScreen({
    super.key,
    this.showButton = true,
  });

  @override
  // ignore: library_private_types_in_public_api
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
      _nameController.text = userRepository.currentUser!.firstName != null
          ? userRepository.currentUser!.firstName!
          : 'John';
      _emailController.text = userRepository.currentUser!.email != null
          ? userRepository.currentUser!.email!
          : 'Doe';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget editWidget = Padding(
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
                backgroundImage: NetworkImage(userRepository.currentUser!.profileUrl != null
                    ? userRepository.currentUser!.profileUrl!
                    : 'https://picsum.photos/200/300'),
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
              hintText: 'Name',
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
              hintText: 'Email',
              fillColor: Colors.white,
              filled: true,
            ),
          )
        ],
      ),
    );

    return Consumer<UserRepository>(builder: (context, userRepository, child) {
      return Scaffold(
          appBar: AppBar(
            leading: widget.showButton
                ? IconButton(
                    onPressed: () {
                      NavigationHelper.pushNamed(
                          context, DrawerNavigation.name);
                    },
                    icon: const Icon(Icons.arrow_back_sharp))
                : Container(),
            automaticallyImplyLeading: widget.showButton,
            title: Text('User Details',style: Theme.of(context).textTheme.headlineSmall),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  NavigationHelper.pushNamed(context, EditProfileScreen.name);
                  // Enable editing mode
                  setState(() {
                    _isEditing ? false : true;
                  });
                },
              ),
            ],
          ),
          body: ResponsiveHelperWidget(
            mobile: editWidget,
            desktop: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: editWidget,
              ),
            ),
          ));
    });
  }
}
