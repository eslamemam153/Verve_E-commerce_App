import 'package:flutter/material.dart';

class ProfileLeadingWidget extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const ProfileLeadingWidget({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [colorScheme.primary, colorScheme.secondary],
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onBackPressed,
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: colorScheme.onPrimary,
                ),
              ),
              Text(
                "Profile",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.settings, size: 25, color: colorScheme.onPrimary),
            ],
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundColor: colorScheme.onPrimary,
            radius: 50,
            child: const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage("assets/images/Profile.jpg"),
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              Text(
                "Eslam Emam",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Software Engineer",
                style: TextStyle(
                  color: colorScheme.onPrimary.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "3982",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "Followers",
                style: TextStyle(
                  color: colorScheme.onPrimary.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                height: 25,
                child: VerticalDivider(
                  color: colorScheme.onPrimary.withOpacity(0.5),
                  thickness: 1.5,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                "748",
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "Following",
                style: TextStyle(
                  color: colorScheme.onPrimary.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
