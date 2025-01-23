
import 'country_entity.dart';

class CountryModel {
  String? countryName;
  String? countryShortName;
  String? countryCode;
  String? countryFlag;
  int? length;

  CountryModel({
    this.countryName,
    this.countryShortName,
    this.countryCode,
    this.countryFlag,
    this.length,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countryName: json['name'],
        countryShortName: json['shortName'],
        countryCode: json['code'],
        countryFlag: json['flag'],
        length: json['countryLength'],
      );

  @Deprecated('About to be removed with removing clean architecture')
  CountryEntity toEntity() => CountryEntity(
      countryName: countryName ?? '',
      countryShortName: countryShortName ?? '',
      countryCode: countryCode ?? '',
      countryFlag: countryFlag ?? '');

  @override
  bool operator ==(dynamic other) =>
      other != null &&
      other is CountryModel &&
      countryCode == other.countryCode;

  @override
  // ignore: unnecessary_overrides
  int get hashCode => super.hashCode;
}
