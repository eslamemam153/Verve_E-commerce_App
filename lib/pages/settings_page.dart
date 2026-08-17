import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.greenAccent,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Settings", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "GENERAL",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight(500)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text("Notification"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: Icon(Icons.card_giftcard_outlined),
            title: Text("Coupons"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: Icon(Icons.delete_outlined),
            title: Text("Delete account"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "FEEDBACK",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight(500)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.warning_amber_rounded),
            title: Text("Report a bug"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
          ListTile(
            leading: Icon(Icons.send_outlined),
            title: Text("Send feedback"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(indent: 20, endIndent: 20),
        ],
      ),
    );
  }
}
