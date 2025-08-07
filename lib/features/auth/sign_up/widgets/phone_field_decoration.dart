import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:readback/core/constants/app_text_style.dart';

import '../../../../core/constants/app_colors.dart';

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
  // prefix: Container(
  //   width: 1,
  //   height: 10,
  //   color: AppColors.error1,
  //   margin: EdgeInsets.only(right: 5),
  // ),
  counter: const Offstage(),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.error1, width: .6),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.gray100,
      width: .6,
    ),
    borderRadius: BorderRadius.circular(16).r,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray100, width: .6),
    borderRadius: BorderRadius.circular(16).r,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.white, width: .6),
    borderRadius: BorderRadius.circular(16).r,
  ),
  filled: true,
  fillColor: AppColors.white,
  hintText: '000000000',
  hintStyle: kBodyRegularRegular.copyWith(color: AppColors.gray200),
  // errorStyle: const TextStyle(height: 0),
  errorStyle:kBodySmallRegular.copyWith(color: AppColors.error1),
  errorMaxLines: 1,
  
);

PickerDialogStyle pickerDialogStyle = PickerDialogStyle(
  searchFieldCursorColor: AppColors.gray900,
  searchFieldInputDecoration: searchInputDecoration,
  listTileDivider: Divider(color: AppColors.gray200),
  countryCodeStyle: kBodyMedium.copyWith(color: AppColors.gray950),
  countryNameStyle: kBodyMedium.copyWith(color: AppColors.gray950),
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
);

final searchInputDecoration = InputDecoration(
  hintText: 'searchCountry',
  hintStyle: kBodyMedium.copyWith(color: AppColors.gray300),
  prefixIcon: Icon(Icons.search, color: Colors.grey),
  filled: true,
  fillColor: AppColors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray100, width: .6),
    borderRadius: BorderRadius.circular(10).r,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(color: AppColors.gray100, width: .6),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: BorderSide(color: AppColors.gray100, width: .6),
  ),
);
