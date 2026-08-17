import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileLeading(),
          SizedBox(height: 10),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("eslamvip892@gamil.com"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.mobile_screen_share_outlined),
            title: Text("Mobile"),
            subtitle: Text("01236596897"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.facebook),
            title: Text("Facebook"),
            subtitle: Text("Eslam Emam"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.hub_outlined),
            title: Text("GitHub"),
            subtitle: Text("eslamemam153"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.link_rounded),
            title: Text("Linked-in"),
            subtitle: Text("in/eslam-emam153"),
          ),
        ],
      ),
    );
  }
}

class ProfileLeading extends StatelessWidget {
  const ProfileLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blueAccent, Colors.deepOrangeAccent],
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 25, color: Colors.white),
              ),
              Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Icon(Icons.settings, size: 25, color: Colors.white),
            ],
          ),

          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage("assets/images/Profile.jpg"),
            ),
          ),
          Column(
            children: [
              Text(
                "Eslam Emam",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Software Engineer",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1000", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 5),
              Text(
                "Follower",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 40,
                child: VerticalDivider(color: Colors.white, thickness: 1.5),
              ),

              SizedBox(width: 10),

              Text("1200", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(width: 5),
              Text(
                "Following",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
