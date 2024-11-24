import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  final String apiKey = '808d181f4ea96902bfb2168fa14a6335';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MDhkMTgxZjRlYTk2OTAyYmZiMjE2OGZhMTRhNjMzNSIsIm5iZiI6MTczMjQxNjM1Ny4wMzc3NjQ1LCJzdWIiOiI2NzQyOGQwZGFhYjcyMmJmYTdjOTAyOTIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.rcTbm5DP3vfgNn_I0zTTEIyQoMlKMylVQBl3DueRRSo';

  loadMovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));
    Map trendingMovie = await tmdbWithCustomLogs.v3.trending.getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Movie App",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
