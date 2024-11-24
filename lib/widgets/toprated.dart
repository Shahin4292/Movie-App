import 'package:flutter/material.dart';

import '../utils/text_modified.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({super.key, required this.topRated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Top Rated Movies',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRated.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          const SizedBox(height: 5),
                          modified_text(
                              size: 15,
                              text: topRated[index]['title'] ?? 'Loading')
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
