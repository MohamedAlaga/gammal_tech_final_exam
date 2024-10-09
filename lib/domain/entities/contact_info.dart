import 'package:equatable/equatable.dart';

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