// ignore_for_file: unused_local_variable

import 'package:app/helpers/colors.dart';
import 'package:app/helpers/constants.dart';
import 'package:app/models/sign_up/country_model.dart';
import 'package:app/screens/widgets/icons/custom_icons.dart';
import 'package:app/utils/log_util.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileInputField extends StatefulWidget {
  const MobileInputField(
    this.controller, {
    super.key,
    this.onChanged,
    this.initialCountry,
    this.countryList = const <CountryModel>[],
    this.onCountryListLoaded,
    this.textInputAction,
    this.labelText,
    this.enableBorder,
    this.readOnly = false,
    this.autovalidate = false,
    this.validator,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final void Function(CountryModel? country, String value)? onChanged;
  final CountryModel? initialCountry;
  final List<CountryModel> countryList;
  final void Function(List<CountryModel> countries)? onCountryListLoaded;
  final TextInputAction? textInputAction;
  final bool? enableBorder;
  final String? labelText;
  final bool readOnly;
  final bool autovalidate;
  final String? Function(String? input)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<MobileInputField> createState() => _MobileInputFieldState();
}

class _MobileInputFieldState extends State<MobileInputField> {
  // final _registerRepo = locator<SignUpRepo>();
  CountryModel? _selectedCountry;
  Future<List<CountryModel>?>? _countryFuture;
  final int maxLength = 0;

  @override
  void initState() {
    super.initState();

    _selectedCountry ??= widget.initialCountry;
    // _countryFuture = _loadCountriesFuture();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged?.call(_selectedCountry, value);
      },
      validator: widget.validator,
      // validator: (text) => ValidationService.validateMobile(text,
      //     maxLength: _selectedCountry?.length,
      //     countryShortName: _selectedCountry?.countryShortName ?? ''),

      inputFormatters: widget.inputFormatters,
      keyboardType: TextInputType.phone,
      maxLength: _selectedCountry?.length ?? 10,
      decoration: InputDecoration(
        // labelText: widget.labelText ?? 'Enter your mobile number',
        labelStyle: TextStyle(color: AppColors.primaryBlackColor),
        // border: _getFieldBorder(),
        hintText: "eg 77 88 9998",
        enabledBorder: _getFieldEnableBorder(),
        focusedBorder: _getFieldBorder(),
        focusedErrorBorder: _getFieldBorder(),
        errorBorder: _getFieldBorder(),
        fillColor: AppColors.white,
        counterText: '',
        filled: true,
        hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textFieldHintColor,
            fontWeight: FontWeight.w400,
            fontFamily: "inter"),

        prefixIcon: widget.enableBorder ?? true
            ? FutureBuilder<List<CountryModel>?>(
                future: _countryFuture,
                builder: (context, snapshot) {
                  List<CountryModel> countries = <CountryModel>[];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          //! Need to Add Loader
                          // child: Loader(),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasData) {
                    countries = snapshot.data ?? [];
                  } else {
                    return ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Material(
                        color: AppColors.transparent,
                        child: IconButton(
                          //! Ned to Modify Using state Managemnet
                          onPressed: () {
                            setState(() {
                              _countryFuture = _loadCountriesFuture();
                            });
                          },
                          icon: Icon(ActionIcons.refresh),
                        ),
                      ),
                    );
                  }

                  _selectedCountry ??= countries.firstWhere(
                    (c) =>
                        c.countryCode ==
                        (_selectedCountry?.countryCode ?? '+94'),
                    orElse: () => CountryModel(
                      countryName: 'Sri Lanka',
                      countryShortName: 'SL',
                      countryCode: '+94',
                      countryFlag:
                          'https://www.countryflags.com/wp-content/uploads/maldives-flag-png-large.png',
                      length: 9,
                    ),
                  );
                  return DropdownButton<CountryModel>(
                    value: _selectedCountry,
                    underline: Container(),
                    onChanged: (CountryModel? newCountry) {
                      setState(() {
                        printLog(newCountry?.countryShortName);
                        _selectedCountry = newCountry;
                      });
                      // widget.onChanged?.call(dropdownValue);
                    },
                    items: countries.map<DropdownMenuItem<CountryModel>>(
                        (CountryModel country) {
                      return DropdownMenuItem<CountryModel>(
                        value: country,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 10),
                            CachedNetworkImage(
                              width: 24,
                              height: 16,
                              imageUrl: country.countryFlag ?? '',
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                  height: 13,
                                  width: 13,
                                  // child: Loader(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(BaseIcons.error),
                            ),
                            const SizedBox(width: UI.PADDING),
                            Text(country.countryCode ?? ''),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              )
            : null,

        // prefixIcon: _getDropDown(),
      ),
    );
  }

  OutlineInputBorder _getFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
          color: (widget.enableBorder ?? true
              ? AppColors.getStartedSubHeading
              : AppColors.getStartedSubHeading)),
    );
  }

  OutlineInputBorder _getFieldEnableBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(UI.borderRadiusTextField),
      borderSide: BorderSide(
          color: (widget.enableBorder ?? true
              ? AppColors.getStartedSubHeading
              : AppColors.getStartedSubHeading)),
    );
  }

  Future<List<CountryModel>?> _loadCountriesFuture() async {
    List<CountryModel>? list = [];

    if (widget.countryList.isNotEmpty) {
      return widget.countryList;
    }
    return null;

    // await _registerRepo.fetchCountryList(
    //   context,
    //   onSuccess: (countries) {
    //     list = countries;
    //     widget.onCountryListLoaded?.call(countries);
    //   },
    //   onFailed: (title, message, data) {
    //     list = null;
    //     showDefaultDialog(context, title, message);
    //   },
    // );

    // return list;
  }
}

class DropdownWidget<T> extends StatefulWidget {
  final List<T> items;
  final T initialValue;
  final Widget Function(BuildContext context, T country) childBuilder;
  final void Function(T? value)? onChanged;

  const DropdownWidget({
    super.key,
    required this.items,
    required this.initialValue,
    required this.childBuilder,
    this.onChanged,
  });

  @override
  State<DropdownWidget<T>> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>> {
  // T dropdownValue = null as T;
  T? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: dropdownValue,
      underline: Container(),
      onChanged: (T? newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        widget.onChanged?.call(dropdownValue);
      },
      items: widget.items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: widget.childBuilder.call(context, value),
        );
      }).toList(),
    );
  }
}
