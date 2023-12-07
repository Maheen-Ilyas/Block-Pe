import 'dart:io';
import 'package:block_pe/providers/theme_provider.dart';
import 'package:block_pe/utilities/logout_alert.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? _image;
  final String defaultImage = 'assets/user.png';
  ImagePicker picker = ImagePicker();

  _selectImage() async {
    var imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      return null;
    } else {
      _image = File(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Profile"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggle();
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDark
                  ? Icons.toggle_on
                  : Icons.toggle_off,
            ),
          ),
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Text(
                    "Menu",
                    style: Provider.of<ThemeProvider>(context)
                        .theme
                        .textTheme
                        .titleMedium,
                  ),
                ),
              ),
              ListTile(
                trailing: const Icon(Icons.logout),
                title: const Text("Log out"),
                onTap: () {
                  showLogOutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage(defaultImage) as ImageProvider<Object>,
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: IconButton(
                      onPressed: () async {
                        await _selectImage();
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
