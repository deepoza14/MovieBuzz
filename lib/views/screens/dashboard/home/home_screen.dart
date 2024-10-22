import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_buzz/views/screens/dashboard/home/widgets/best_movies_screen.dart';
import 'package:movies_buzz/views/screens/dashboard/home/widgets/trendingnow_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: Text(
          "Movie Buzz",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          TrendingNowScreen(),
          const SizedBox(height: 15),
          BestMoviesScreen()
        ],
      ),
    );
  }
}
