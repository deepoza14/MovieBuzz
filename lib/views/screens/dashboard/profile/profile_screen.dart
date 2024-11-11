import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false; // State for Dark Mode switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello World',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'helloworld@gmail.com',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade400),
              const SizedBox(height: 15),
              ProfileOptionRow(
                icon: IconlyLight.heart,
                title: 'Favourite',
              ),
              const SizedBox(height: 20),
              ProfileOptionRow(
                icon: IconlyLight.category,
                title: 'Movie Interest',
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'General',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProfileOptionRow(
                icon: IconlyLight.profile,
                title: 'Person Info',
              ),
              const SizedBox(height: 20),
              ProfileOptionRow(
                icon: IconlyLight.notification,
                title: 'Notification',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(IconlyLight.document),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Language',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ),
                  Text(
                    'English ( US )',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Icon(IconlyLight.show),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'About',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey.shade400),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProfileOptionRow(
                  icon: IconlyLight.infoSquare, title: 'Help Center'),
              const SizedBox(height: 20),
              ProfileOptionRow(
                  icon: IconlyLight.document, title: 'About Movie Buzz'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    IconlyLight.logout,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Logout',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
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

class ProfileOptionRow extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileOptionRow({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ],
    );
  }
}
