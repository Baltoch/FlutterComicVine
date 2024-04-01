import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
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
    return Row(children: [
      SizedBox(
          width: 94.87,
          height: 127,
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
            padding: const EdgeInsets.only(left: 15, top: 12),
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
                          child: Text(
                            nomLivre ?? '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          )),
                    ],
                    if (edition != null) ...[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(
                                AppVectorialImages.icPublisherBicolor,
                                height: 15,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                              ),
                            ),
                            Text(
                              edition ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400),
                            )
                          ])),
                    ],
                    if (nbEpisodes != null) ...[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(
                                  AppVectorialImages.icTvBicolor,
                                  height: 15,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.white, BlendMode.srcIn),
                                ),
                              ),
                              Text(
                                nbEpisodes == null
                                    ? ''
                                    : '$nbEpisodes épisodes',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 11,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )),
                    ],
                    if (numeroLivre != null) ...[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(
                                  AppVectorialImages.icBooksBicolor,
                                  height: 20,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.white, BlendMode.srcIn),
                                ),
                              ),
                              Text(
                                numeroLivre == null ? '' : 'N° $numeroLivre',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ))
                    ],
                    if (duree != null) ...[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(
                                  AppVectorialImages.icMovieBicolor,
                                  height: 20,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.white, BlendMode.srcIn),
                                ),
                              ),
                              Text(
                                duree == null ? '' : '$duree minutes',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ))
                    ],
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SvgPicture.asset(
                                AppVectorialImages.icCalendarBicolor,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                              ),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          )),
    ]);
  }
}
