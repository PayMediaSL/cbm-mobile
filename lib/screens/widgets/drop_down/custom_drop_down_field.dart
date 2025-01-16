import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/providers/other_provider/drop_down_provider.dart';
import 'package:app/services/screen_size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// class CustomDropdown extends StatelessWidget {
//   final String dropdownKey; // Unique key for each dropdown
//   final List<String> items;
//   final double? borderradius;
//   final double? dropdownheight; // List of items for the dropdown
//   final double? dropdownwidth;
//   final bool isHint;
//   final String? hint;

//   CustomDropdown(
//       {required this.dropdownKey,
//       required this.items,
//       this.borderradius,
//       this.dropdownwidth,
//       this.hint,
//       this.isHint = true,
//       this.dropdownheight});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DropdownProvider>(
//       builder: (context, provider, child) {
//         return Container(
//           padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
//           height: dropdownheight ?? ScreenUtils.height * 0.055,
//           width: dropdownwidth ?? ScreenUtils.width,
//           decoration: BoxDecoration(
//             color: AppColors.primaryWhiteColor,
//             border: Border.all(color: AppColors.onBoardActiveColor),
//             borderRadius:
//                 BorderRadius.circular(borderradius ?? UI.borderRadiusTextField),
//           ),
//           child: Center(
//             child: DropdownButton<String>(
//               icon: Icon(Icons.arrow_drop_down),
//               style:
//                   commonTextStyle.copyWith(color: AppColors.primaryBlackColor),
//               underline: SizedBox(), // Hides the default underline
//               isDense: true,
//               isExpanded: true,
//               value: provider.getSelectedValue(dropdownKey).isEmpty
//                   ? null
//                   : provider.getSelectedValue(dropdownKey),
//               hint: isHint
//                   ? Text(
//                       hint ?? "Select an option",
//                       style: TextStyle(
//                         fontFamily: "exo2",
//                         color: AppColors.textFieldHintColor,
//                         fontSize: 14.sp,
//                       ),
//                     )
//                   : null,
//               onChanged: (newValue) {
//                 if (newValue != null) {
//                   provider.updateSelectedValue(dropdownKey, newValue);
//                 }
//               },
//               items: items.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class CustomDropdown extends StatelessWidget {
  final String dropdownKey; // Unique key for each dropdown
  final List<String> items;
  final double? borderradius;
  final double? dropdownheight;
  final double? dropdownwidth;
  final bool isHint;
  final String? hint;
  final FormFieldValidator<String>? validator;
  // final AutovalidateMode? autovalidateMode;
  final bool? autovalidate;

  CustomDropdown(
      {required this.dropdownKey,
      required this.items,
      this.borderradius,
      this.dropdownwidth,
      this.hint,
      this.isHint = true,
      this.dropdownheight,
      this.validator,
      // this.autovalidateMode = AutovalidateMode.disabled,
      this.autovalidate});

  @override
  Widget build(BuildContext context) {
    return Consumer<DropdownProvider>(
      builder: (context, provider, child) {
        return FormField<String>(
          validator: validator,
          autovalidateMode:
              autovalidate == null ? null : AutovalidateMode.onUserInteraction,
          builder: (formFieldState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  height: dropdownheight ?? ScreenUtils.height * 0.055,
                  width: dropdownwidth ?? ScreenUtils.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    border: Border.all(
                      color: formFieldState.hasError
                          ? AppColors.primaryRedColor
                          : AppColors.onBoardActiveColor,
                    ),
                    borderRadius: BorderRadius.circular(
                        borderradius ?? UI.borderRadiusTextField),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.arrow_drop_down),
                      style: commonTextStyle.copyWith(
                          color: AppColors.primaryBlackColor),
                      underline: SizedBox(), // Hides the default underline
                      isDense: true,
                      isExpanded: true,
                      value: provider.getSelectedValue(dropdownKey).isEmpty
                          ? null
                          : provider.getSelectedValue(dropdownKey),
                      hint: isHint
                          ? Text(
                              hint ?? "Select an option",
                              style: TextStyle(
                                fontFamily: "exo2",
                                color: AppColors.textFieldHintColor,
                                fontSize: 14.sp,
                              ),
                            )
                          : null,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          provider.updateSelectedValue(dropdownKey, newValue);
                          formFieldState.didChange(newValue); // Notify state
                        }
                      },
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                if (formFieldState.hasError)
                  Padding(
                    padding: EdgeInsets.only(top: 3.sp, left: 12.sp),
                    child: Text(
                      formFieldState.errorText ?? '',
                      style: TextStyle(
                          color: AppColors.primaryRedColor, fontSize: 11.sp),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
