import 'package:flutter/material.dart';
import '../utils/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';



class Popular extends StatelessWidget {
  const Popular(
      {super.key,
      required this.title,
      this.edition,
      this.nbEpisodes,
      required this.date,
      required this.rank,
      required this.imageURL,
      this.nomLivre,
      this.numeroLivre,
      this.duree,
      required this.onClick});

  final String title;
  final String? edition;
  final String? nbEpisodes;
  final String date;
  final String rank;
  final String imageURL;
  final String? nomLivre;
  final String? numeroLivre;
  final String? duree;
  final void Function(PointerDownEvent) onClick;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onClick,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                color: AppColors.section,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imageURL,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          )
                        )
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                if (nomLivre != null) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
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
                                              fontStyle: FontStyle.italic,
                                              overflow: TextOverflow.ellipsis
                                            ),
                                          )
                                        ]),
                                      ],
                                    ),
                                  )
                                ],
                                if (edition != null) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding (
                                              padding: EdgeInsets.only(right: 5),
                                              child : SvgPicture.asset(
                                              AppVectorialImages.icPublisherBicolor,
                                              colorFilter: ColorFilter.mode(AppColors.white50, BlendMode.srcIn),   
                                              ),),                                     
                                            Text(
                                              edition!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'Nunito'),
                                            )
                                          ]
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                                if (nbEpisodes != null) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        Padding (
                                              padding: EdgeInsets.only(right: 5),
                                              child : SvgPicture.asset(
                                              AppVectorialImages.icTvBicolor,
                                              colorFilter: ColorFilter.mode(AppColors.white50, BlendMode.srcIn),   
                                              ),),
                                        Text(
                                          nbEpisodes!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontFamily: 'Nunito'
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                                if (numeroLivre != null) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Padding (
                                          padding: EdgeInsets.only(right: 5),
                                          child : SvgPicture.asset(
                                          AppVectorialImages.icBooksBicolor,
                                          height: 20,
                                          colorFilter: ColorFilter.mode(AppColors.white50, BlendMode.srcIn),   
                                          ),),
                                        Text(
                                          numeroLivre!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontFamily: 'Nunito'
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                                if (duree != null) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40, bottom: 5),
                                    child: Row(
                                      children: [
                                        Padding (
                                          padding: EdgeInsets.only(right: 5),
                                          child : SvgPicture.asset(
                                          AppVectorialImages.icMovieBicolor,
                                          height: 18,
                                          colorFilter: ColorFilter.mode(AppColors.white50, BlendMode.srcIn),   
                                          ),),
                                        Text(
                                          duree!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontFamily: 'Nunito'
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                ],
                                Row(
                                  children: [
                                    Padding (
                                      padding: EdgeInsets.only(right: 5),
                                      child : SvgPicture.asset(
                                      AppVectorialImages.icCalendarBicolor,
                                      height: 21,
                                      colorFilter: ColorFilter.mode(AppColors.white50, BlendMode.srcIn),   
                                      ),),
                                    Text(
                                      date,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Nunito'
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Stack(
                      children: [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            rank,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.ideographic
                            ),
                            textAlign: TextAlign.center
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}

class PopularSkeleton extends StatefulWidget {
  const PopularSkeleton({super.key});

  @override
  State<PopularSkeleton> createState() => _PopularSkeletonState();
}

class _PopularSkeletonState extends State<PopularSkeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _colorTween = ColorTween(
      begin: AppColors.section,
      end: AppColors.section50,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: _colorTween.value,
            ),
          );
        }
      )
    );
  }
}