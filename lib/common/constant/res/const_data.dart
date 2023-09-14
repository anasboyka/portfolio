import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/regular/testmodels/data_test.dart';
import 'package:portfolio/view/pages/homepage/contact/social_link.dart';
import 'package:url_launcher/url_launcher.dart';

List<DataTest> kcddataTestObjects = [
  DataTest(data1: 'data12', data2: 'test21', data3: 31, data4: 4.1),
  DataTest(data1: 'data13', data2: 'test22', data3: 32, data4: 4.2),
  DataTest(data1: 'data14', data2: 'test23', data3: 33, data4: 4.3),
  DataTest(data1: 'data15', data2: 'test24', data3: 34, data4: 4.4),
  DataTest(data1: 'data16', data2: 'test25', data3: 35, data4: 4.5),
];

List<SocialLink> socialLinks = [
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_email.png',
    ontapLink: () async {
      final Uri url =
          Uri.parse('mailto:$kcsEmail?subject=Greetings&body=Hello Anas, ');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsEmail,
  ),
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_whatsapp.png',
    ontapLink: () async {
      final Uri url = Uri.parse(kcsUrlWhatsapp);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsPhoneNum,
  ),
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_linkedin.png',
    ontapLink: () async {
      final Uri url = Uri.parse(kcsUrlLinkedIn);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsUsernameLinkedIn,
  ),
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_github.png',
    ontapLink: () async {
      final Uri url = Uri.parse(kcsUrlGithub);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsUsernameGithub,
  ),
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_instagram.png',
    ontapLink: () async {
      final Uri url = Uri.parse(kcsUrlInstagram);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsUsernameInstagram,
  ),
  SocialLink(
    iconAsset: 'assets/icon/4x/ic_twitter.png',
    ontapLink: () async {
      final Uri url = Uri.parse(kcsUrlTwitter);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    text: kcsUsernameTwitter,
  ),
];
