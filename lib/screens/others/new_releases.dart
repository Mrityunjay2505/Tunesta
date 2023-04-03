import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/album_and_artist_page.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class NewReleasesPage extends StatelessWidget {
  const NewReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: CustomColors.colorShade2,
          elevation: 0,
          expandedHeight: 150,
          floating: true,
          pinned: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              "New Releases",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [CustomColors.colorShade2, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A Special album which contains new released Songs
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AlbumPage(
                                    playlistItemNo: 7,
                                    playlistImage: CustomImages.imageDefault)));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage(CustomImages.imageDefault),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Gap(20),
                    const Text(
                      "New Releases",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(40),

              // Albums and Singles newly released
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Albums and Singles",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(25),
              const AlbumsCard(
                albumImage: CustomImages.imageDefault,
                playlistName: "Playlist Name",
                playlistCreator: "ArtistName",
                itemLength: 6,
              ),
              const Gap(40),

              // New Released Songs
              const GridB(
                gridMusicName: "Music Name",
                gridArtistName: "ArtistName",
                gridMusicIcon: CustomImages.imageDefault,
                gridNumber: 8,
                gridInRow: 3,
              ),
              const Gap(50),
            ]),
          ),
        ),
      ]),
    );
  }
}