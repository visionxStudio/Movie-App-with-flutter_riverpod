import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/src/common/constants/strings.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/models/search_categories.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SizedBox(
        height: _height,
        width: _width,
        child: Stack(
          children: [
            _backgroundWidget(height: _height, width: _width),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: _foregroundWidgets(height: _height, width: _width),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget({double? height, double? width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://loyolamaroon.com/wp-content/uploads/2021/03/Godzilla-v-Kong.jpg",
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidgets({required double height, required double width}) {
    return SafeArea(
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topbarWidget(height: height, width: width),
            MovieLists(),
          ],
        ),
      ),
    );
  }

  Widget _topbarWidget({required double height, required double width}) {
    return Container(
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SearchFieldWidget(),
          CategorySelectionWidget(),
        ],
      ),
    );
  }
}

class SearchFieldWidget extends ConsumerStatefulWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  _SearchFieldWidgetState createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends ConsumerState<SearchFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.50,
      height: height * 0.05,
      child: TextField(
        controller: _textEditingController,
        onSubmitted: (String input) {},
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white24,
          ),
          hintStyle: TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
          hintText: AppStrings.kSearch,
        ),
      ),
    );
  }
}

class CategorySelectionWidget extends StatefulWidget {
  const CategorySelectionWidget({Key? key}) : super(key: key);

  @override
  _CategorySelectionWidgetState createState() =>
      _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (value) {},
      items: const [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        ),
      ],
    );
  }
}

class MovieLists extends StatelessWidget {
  MovieLists({Key? key}) : super(key: key);
  final List<Movie> _movies = [
    Movie(
      backdropPath:
          'https://loyolamaroon.com/wp-content/uploads/2021/03/Godzilla-v-Kong.jpg',
      discription:
          "This is the best movie that you people will watch so please watch this movie and please enjoy alot.",
      isAdult: false,
      language: "En",
      name: "Dummy name",
      posterPath:
          "https://loyolamaroon.com/wp-content/uploads/2021/03/Godzilla-v-Kong.jpg",
      rating: 3,
      releaseDate: "2022/10/23",
    )
  ];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: SizedBox(
        height: height * 0.83 - 5,
        width: double.infinity,
        child: _movies.isNotEmpty
            ? ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  final Movie movie = _movies[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            movie.posterPath,
                            height: height * 0.25,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        SizedBox(
                          width: width * 0.5,
                          height: height * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '${movie.language} ${movie.releaseDate}',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    movie.rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              Text(
                                movie.discription,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
