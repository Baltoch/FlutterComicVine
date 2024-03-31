import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttercomicvine/svg/app_vectorial_images.dart';
import '../utils/appcolors.dart';

class AppSearchBar extends StatelessWidget {
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;

  const AppSearchBar({super.key, this.onAppPrivateCommand, this.onChanged, this.onEditingComplete, this.onSubmitted, this.onTap, this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 34),
      decoration: const BoxDecoration(
        color: AppColors.bgSearch,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35), 
          bottomRight: Radius.circular(35)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recherche",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 30
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onAppPrivateCommand: onAppPrivateCommand,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onSubmitted: onSubmitted,
            onTap: onTap,
            onTapOutside: onTapOutside,
            style: const TextStyle(
              color: AppColors.white50,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
              fontSize: 17,
              textBaseline: TextBaseline.ideographic
            ),
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AppVectorialImages.navbarSearch),
                  const SizedBox(width: 17),
                ],
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 20,
                maxWidth: 50,
                maxHeight: 20,
              ),
              hintText: "Comic, film, serie...",
              hintStyle: const TextStyle(
                color: AppColors.white50,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                fontSize: 17,
                textBaseline: TextBaseline.ideographic
              ),
              contentPadding: const EdgeInsets.only(left: 17, right: 17, top: 14, bottom: 14),
              fillColor: AppColors.background,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.transparent
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.transparent
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.transparent
                )
              ),
            ),
            cursorColor: AppColors.navtext,
          )
        ],
      )
    );
  }
  
}