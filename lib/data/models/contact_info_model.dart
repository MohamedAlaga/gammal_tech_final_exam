/// The model class is used to convert the contacts json data to the entity object and vice versa.
library;

import 'package:gammal_tech_final_exam/domain/entities/contact_info.dart';

/// class to convert ContactInfo json data to dart object and vice versa
class ContactInfoModel extends ContactInfo{
  const ContactInfoModel({
    required super.link,
    required super.socialMedia,
    required super.userTag,
  });

  /// convert json data to dart object
  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      userTag: json['userTag'],
      link: json['link'],
      socialMedia: json['socialMedia'],
    );
  }
  /// convert dart object to json data
  Map<String, dynamic> toJson() {
    return {
      'userTag': userTag,
      'link': link,
      'socialMedia': socialMedia,
    };
  }
}