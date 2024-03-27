import 'package:flutter/material.dart';
import 'package:fluttercomicvine/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './svg/app_vectorial_images.dart';

class NavBar extends StatelessWidget {
  final int currentPageIndex;
  final void Function(int) setPageIndex;
  const NavBar({super.key, required this.currentPageIndex, required this.setPageIndex});

  // void setPageIndex(int index) {
  //   setState(() {
  //     currentPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(top: 11, bottom: 9),
      decoration: const BoxDecoration(
        color: AppColors.bottomBar,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3315232E),
            offset: Offset(2, 6),
            blurRadius: 20,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x286F8FEA),
            offset: Offset(4, 16),
            blurRadius: 52,
            spreadRadius: 0,
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _NavItem(
            onClick: setPageIndex,
            index: 0,
            svgPath: AppVectorialImages.navbarHome,
            label: 'Accueil',
            selected: currentPageIndex == 0,
          ),
          _NavItem(
            onClick: setPageIndex,
            index: 1,
            svgPath: AppVectorialImages.navbarComics,
            label: 'Comics',
            selected: currentPageIndex == 1,
          ),
          _NavItem(
            onClick: setPageIndex,
            index: 2,
            svgPath: AppVectorialImages.navbarSeries,
            label: 'Séries',
            selected: currentPageIndex == 2,
          ),
          _NavItem(
            onClick: setPageIndex,
            index: 3,
            svgPath: AppVectorialImages.navbarMovies,
            label: 'Films',
            selected: currentPageIndex == 3,
          ),
          _NavItem(
            onClick: setPageIndex,
            index: 4,
            svgPath: AppVectorialImages.navbarSearch,
            label: 'Recherche',
            selected: currentPageIndex == 4,
          )
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.svgPath, required this.label, bool? selected, required this.onClick, required this.index}) : selected=selected??false ;

  final String svgPath;
  final String label;
  final bool selected;
  final int index;
  final void Function(int) onClick;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) => onClick(index),
      child: Container(
        width: 68,
        height: 60,
        decoration: BoxDecoration(
          color: selected?AppColors.blue8:AppColors.transparent,
          borderRadius: BorderRadius.circular(23)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              svgPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(selected?AppColors.blue:AppColors.bottomBarTextColorNonChecked, BlendMode.srcIn),
            ),
            const SizedBox(height: 5,),
            Text(
              label,
              style: TextStyle(
                color: selected?AppColors.blue:AppColors.bottomBarTextColorNonChecked,
                fontFamily: 'Nunito',
                fontSize: 12,
              )
            )
          ],
        )
      )
    );
  }
}