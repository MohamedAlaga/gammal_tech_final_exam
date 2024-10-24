/// this file contains contact info entity
library;

import 'package:equatable/equatable.dart';

///class to handel contact info data model
///[userTag] user tag name like `@username`
///[link] contact info page link `https://www.example.com`
///[socialMedia] social media name like `twitter`
class ContactInfo extends Equatable{
  final String userTag;
  final String link;
  final String socialMedia;

  const ContactInfo({
    required this.userTag,
    required this.link,
    required this.socialMedia,
  });

  @override
  List<Object?> get props => [userTag, link, socialMedia];
}