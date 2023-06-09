import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/utils/utilities.dart';
import '../models/custom_widgets.dart';
import 'package:tunesta/utils/variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final bool isPlaylistMadeHome = true;
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: CustomColors.colorShade0,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 140.0),
          child: CustomAppBar(scrollOffset: _scrollOffset),
        ),

        //body
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Introduction
                  Text(
                    "Welcome Joseph Joestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Gap(5),
                  Text(
                    "Here's some music to get you Started",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: CustomColors.colorShade4),
                  ),
                  Gap(10),
                ],
              ),
            ),

            // Artists List.
            // artists that are of same genre that user listens
            const ArtistsList(
              artistImage: CustomImages.imageDefault,
              artistName: "Artist Name",
              itemLength: 10,
            ),
            const Gap(40),

            // Recommended For You
            // Same Genre as user likes
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("Recommended for You",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const Gap(20),
            const GridB(
                gridMusicName: "Music Name",
                gridArtistName: "Artist Name",
                gridMusicIcon: CustomImages.imageDefault,
                gridNumber: 15,
                gridInRow: 3),
            const Gap(40),

            // Artists You Like
            // Shows the Followed Artists
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("Artists You Like",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const Gap(20),
            const ArtistsList(
                artistImage: CustomImages.imageDefault,
                artistName: "Artist Name",
                itemLength: 6),
            const Gap(40),

            // User Created Playlists
            isPlaylistMade
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Created Playlists",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  )
                : const Gap(0),
            isPlaylistMade ? const Gap(20) : const Gap(0),
            isPlaylistMade
                ? const AlbumsCard(
                    albumImage: CustomImages.imageDefault,
                    playlistName: "Playlist Name",
                    playlistCreator: "Joseph Joestar",
                    itemLength: 8)
                : const Gap(0),
            isPlaylistMade ? const Gap(40) : const Gap(0),

            // Top Charts
            // Playlisted of Most Trending Songs
            // Each Playlist will be of a particular genre
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("Top Charts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            const Gap(20),
            const AlbumsCard(
                albumImage: CustomImages.imageDefault,
                playlistName: "Playlist Name",
                playlistCreator: "",
                itemLength: 6),
            const Gap(40),
          ]),
        ));
  }
}
