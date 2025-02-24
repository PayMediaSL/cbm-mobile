import 'package:equatable/equatable.dart';

@Deprecated("About to be removed")
class CountryEntity extends Equatable {
  const CountryEntity({
    required this.countryName,
    required this.countryShortName,
    required this.countryCode,
    required this.countryFlag,
  });

  final String countryName;
  final String countryShortName;
  final String countryCode;
  final String countryFlag;

  @override
  List<Object?> get props => [
        countryName,
        countryShortName,
        countryCode,
        countryFlag,
      ];
  @override
  bool operator ==(dynamic other) =>
      other != null &&
      other is CountryEntity &&
      countryCode == other.countryCode;
}
