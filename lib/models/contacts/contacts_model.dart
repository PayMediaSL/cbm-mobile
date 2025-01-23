import 'package:equatable/equatable.dart';

class MyContact extends Equatable {
  final String? name;
  final String? mobileNumber;
  final int? hashValue;
  const MyContact({
    this.mobileNumber,
    this.name,
    this.hashValue,
  });

  @override
  List<Object?> get props => [name, mobileNumber, hashValue];
}
