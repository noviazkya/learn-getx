import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Tampilkan form edit profile
            },
          ),
          IconButton(
            icon: Icon(Icons.lock),
            onPressed: () {
              // Tampilkan form ubah password
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Tampilkan konfirmasi logout
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              // Data is still loading, show a loading indicator
              return Center(child: CircularProgressIndicator());
            } else {
              final userProfile = controller.user;
              return ListView(
                children: [
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ProfileView ${userProfile?['username']}',
                                style: TextStyle(fontSize: 20),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    userProfile?['imageUrl'] ?? ''),
                                radius: 25,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          _buildProfileTile('Name', userProfile?['username']),
                          Divider(),
                          _buildProfileTile('Email', userProfile?['email']),
                          Divider(),
                          // Add more profile information tiles as needed
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  ListTile _buildProfileTile(String title, String? value) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: title == 'Image URL'
          ? Image.network(value ?? '', height: 100, width: 100)
          : Text(value ?? 'Loading...'),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Lakukan logout
                controller.logout();
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
