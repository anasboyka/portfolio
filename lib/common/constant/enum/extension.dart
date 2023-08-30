import 'package:portfolio/common/constant/enum/enum.dart';

extension KnowledgeEx on Knowledge {
  String get text {
    switch (this) {
      case Knowledge.skills:
        return "Skills";
      case Knowledge.softwareUsed:
        return "Software used";
    }
  }
}

extension ProjCategoryEx on ProjCategory {
  String get text {
    switch (this) {
      case ProjCategory.featured:
        return "Featured";
      case ProjCategory.recent:
        return "Recent";
      case ProjCategory.all:
        return "All";
      case ProjCategory.mobileApp:
        return "Mobile Apps";
      case ProjCategory.electronic:
        return "Electronics";
    }
  }

  static ProjCategory fromString(String value) {
    switch (value) {
      case "Featured":
        return ProjCategory.featured;
      case "Recent":
        return ProjCategory.recent;
      case "All":
        return ProjCategory.all;
      case "Mobile Apps":
        return ProjCategory.mobileApp;
      case "Electronics":
        return ProjCategory.electronic;
      default:
        return ProjCategory.all;
    }
  }
}
