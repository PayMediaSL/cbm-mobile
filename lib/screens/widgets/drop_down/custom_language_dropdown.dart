// // ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace

// import 'package:app/helpers/colors.dart';
// import 'package:app/helpers/language_constants.dart';
// import 'package:app/helpers/text_styles.dart';
// import 'package:app/services/screen_size_calculator.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// class CustomLanguageDropdown extends StatefulWidget {
//   final double dropdownHeight;
//   final double? dheight;
//   final double? dwidth;
//   final Color fillColor;
//   final Color borderColor;
//   final Color? dropDownFillColor;
//   final double dropDownBorderRadius;

//   CustomLanguageDropdown({
//     this.dropdownHeight = 50.0,
//     this.fillColor = Colors.white,
//     this.borderColor = Colors.blue,
//     this.dheight,
//     this.dwidth,
//     this.dropDownFillColor,
//     this.dropDownBorderRadius = 25.0,
//   });

//   @override
//   _CustomLanguageDropdownState createState() => _CustomLanguageDropdownState();
// }

// class _CustomLanguageDropdownState extends State<CustomLanguageDropdown> {
//   // late String _selectedValue;
//   late Locale _selectedLocale;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _selectedValue = widget.initialValue;
//   // }

//   @override
//   void didChangeDependencies() {
//     _selectedLocale = context.locale;

//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtils.init(context);
//     return Container(
//       decoration: BoxDecoration(
//         color: widget.dropDownFillColor ?? HexColor("#E5E7EB"),
//         borderRadius: BorderRadius.circular(widget.dropDownBorderRadius),
//       ),
//       height: widget.dheight ?? ScreenUtils.height * 0.5,
//       width: widget.dwidth ?? ScreenUtils.width * 0.3,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: DropdownButton<Locale>(
//           value: _selectedLocale,
//           isExpanded: true,
//           icon: Icon(Icons.arrow_drop_down),
//           iconSize: 25,
//           dropdownColor: widget.fillColor,
//           items: supportedLanguages.map((lang) {
//             return DropdownMenuItem<Locale>(
//               value: lang['locale'],
//               child: Text(lang['name'] as String),
//             );
//           }).toList(),

//           //! Need to Change Once State Managemnet Fixed
//           onChanged: (Locale? locale) {
//             if (locale != null) {
//               setState(() {
//                 _selectedLocale = locale;
//                 context.setLocale(locale);
//               });
//             }
//           },
//           style: commonTextStyle.copyWith(color: HexColor("#475569")),
//           underline: SizedBox(), // Hides the default underline
//           isDense: true,
//           itemHeight: widget.dropdownHeight, // Adjust dropdown height
//         ),
//       ),
//     );
//   }
// }

//! State Management Change
import 'package:app/helpers/language_constants.dart';
import 'package:app/providers/other_provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/text_styles.dart';
import 'package:app/services/screen_size_calculator.dart';

class CustomLanguageDropdown extends StatelessWidget {
  final double dropdownHeight;
  final double? dheight;
  final double? dwidth;
  final Color fillColor;
  final Color borderColor;
  final Color? dropDownFillColor;
  final double dropDownBorderRadius;

  CustomLanguageDropdown({
    this.dropdownHeight = 50.0,
    this.fillColor = Colors.white,
    this.borderColor = Colors.blue,
    this.dheight,
    this.dwidth,
    this.dropDownFillColor,
    this.dropDownBorderRadius = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    final localeProvider = Provider.of<LocaleProvider>(context);
    final _selectedLocale = localeProvider.selectedLocale;

    return Container(
      decoration: BoxDecoration(
        color: dropDownFillColor ?? HexColor("#E5E7EB"),
        borderRadius: BorderRadius.circular(dropDownBorderRadius),
      ),
      height: dheight ?? ScreenUtils.height * 0.5,
      width: dwidth ?? ScreenUtils.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: DropdownButton<Locale>(
          value: _selectedLocale,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 25,
          dropdownColor: fillColor,
          items: supportedLanguages.map((lang) {
            return DropdownMenuItem<Locale>(
              value: lang['locale'],
              child: Text(lang['name'] as String),
            );
          }).toList(),
          onChanged: (Locale? locale) {
            if (locale != null) {
              localeProvider.changeLocale(locale);
              context.setLocale(locale);
            }
          },
          style: commonTextStyle.copyWith(color: HexColor("#475569")),
          underline: SizedBox(), // Hides the default underline
          isDense: true,
          itemHeight: dropdownHeight, // Adjust dropdown height
        ),
      ),
    );
  }
}
