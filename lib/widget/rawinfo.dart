import 'package:flutter/material.dart';
import '../utils/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';

class RawInfo extends StatelessWidget {
  const RawInfo(
      {super.key,
      this.edition,
      required this.date,
      this.nbEpisodes,
      required this.imageURL,
      this.duree,
      this.numeroLivre,
      this.nomLivre});

  final String imageURL;
  final String? edition;
  final String date;
  final int? nbEpisodes;
  final String? duree;
  final String? numeroLivre;
  final String? nomLivre;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerLeft,
        child: Row(children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (nomLivre != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    nomLivre!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Nunito',
                                        fontStyle: FontStyle.italic),
                                  )
                                ]),
                              ],
                            ),
                          )
                        ],
                        if (edition != null) ...[
                          Row(children: [
                            Padding (
                              padding: const EdgeInsets.only(right: 5),
                              child : SvgPicture.asset(
                              AppVectorialImages.icPublisherBicolor,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),   
                              ),),
                            Text(
                              edition!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Nunito',
                              ),
                            )
                          ]),
                        ],
                        if (nbEpisodes != null) ...[
                          Row(
                            children: [
                              Padding (
                                padding: const EdgeInsets.only(right: 5),
                                child : SvgPicture.asset(
                                AppVectorialImages.icTvBicolor,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),   
                                ),),
                              Text(
                                '$nbEpisodes',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 17,
                                  fontFamily: 'Nunito',
                                ),
                              )
                            ],
                          ),
                        ],
                        if (numeroLivre != null) ...[
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [
                                  Padding (
                                    padding: const EdgeInsets.only(right: 5),
                                    child : SvgPicture.asset(
                                    AppVectorialImages.icBooksBicolor,
                                    height: 20,
                                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),   
                                    ),),
                                  Text(
                                    numeroLivre!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Nunito'),
                                  )
                                ],
                              ))
                        ],
                        if (duree != null) ...[
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [
                                  Padding (
                                    padding: const EdgeInsets.only(right: 5),
                                    child : SvgPicture.asset(
                                    AppVectorialImages.icMovieBicolor,
                                    height: 20,
                                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),   
                                    ),),
                                  Text(
                                    duree!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Nunito'),
                                  )
                                ],
                              ))
                        ],
                        Row(
                          children: [
                            Padding (
                              padding: const EdgeInsets.only(right: 5),
                              child : SvgPicture.asset(
                              AppVectorialImages.icCalendarBicolor,
                              height: 21,
                              colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),   
                              ),),
                            Text(
                              date,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Nunito',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ]),
      ),
    ]);
  }
}
