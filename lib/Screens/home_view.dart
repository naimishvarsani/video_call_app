// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_app/Utilities/colors.dart';
import 'package:http/http.dart' as http;
import 'package:video_app/Utilities/common_widget.dart';
import 'package:video_app/Utilities/images.dart';

import '../Models/organic_image_model.dart';

Future<OrganicImage> fetchdata() async {
  final response = await http.get(
    Uri.parse(
        'https://leo1m.com/api/all_apps_list/chatzo_app/girltalk_image.php'),
  );

  if (response.statusCode == 200) {
    return OrganicImage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<OrganicImage> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      body: Center(
        child: FutureBuilder<OrganicImage>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: snapshot.data!.data!.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return containBox(
                        image: snapshot.data!.data![index].image,
                        name: snapshot.data!.data![index].name);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget containBox({image, name}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.bgcolor,
            ),
            child: CommonWidget()
                .robotoText(text: name, textColor: AppColors.textWhitecolor),
          ),
          Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.bgcolor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(15))),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(AppImage.icons + "video.png")))
        ],
      ),
    );
  }
}
