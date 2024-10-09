import 'package:gammal_tech_final_exam/domain/entities/contact_info.dart';

class ContactInfoModel extends ContactInfo{
  const ContactInfoModel({
    required super.link,
    required super.socialMedia,
    required super.userTag,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      userTag: json['userTag'],
      link: json['link'],
      socialMedia: json['socialMedia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userTag': userTag,
      'link': link,
      'socialMedia': socialMedia,
    };
  }
}