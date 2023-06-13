import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class DocumentHive extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late DateTime? updateDateTime;

  @HiveField(3)
  late String? pathFile = "";

  @HiveField(4)
  late int? attachmentId;

  @HiveField(5)
  late bool? isLoading = false;

  @HiveField(6)
  late String? extensionFile = '.pdf';

  @HiveField(7)
  late String? typeDocument;

  @HiveField(8)
  late bool? isArchive = false;

  @HiveField(9)
  late String? accessBar;

  @HiveField(10)
  late String? author;

  @HiveField(11)
  late String? responsible;

  @HiveField(12)
  late String? loader;

  @HiveField(13)
  late String? signedUser;

  @HiveField(14)
  late String? agreedUser;

  @HiveField(15)
  late String? approvedUser;

  @HiveField(16)
  late DateTime? createDateTime;

  @HiveField(17)
  late DateTime? introductionDateTime;

  @HiveField(18)
  late DateTime? periodValidity;

  @HiveField(19)
  late String? number;

  @HiveField(21)
  late String? pathFileListFamiliarized = "";

  @HiveField(22)
  late int? typeSignatureAgreed;
}
