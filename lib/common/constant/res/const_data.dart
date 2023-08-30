import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/constant/res/const_asset.dart';
import 'package:portfolio/data/models/portfolio_file.dart';
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

List<PortfolioFile> kcdportfolios = [
  PortfolioFile(
    title: "General ICU: Clerking, Admission Criteria",
    assetPath: AssetPath.pdf_icu_general_icu,
    fileName: "General Icu",
  ),
  PortfolioFile(
    title: "CNS",
    assetPath: AssetPath.pdf_icu_cns,
    fileName: "CNS",
  ),
  PortfolioFile(
    title: "CVS",
    assetPath: AssetPath.pdf_icu_cvs,
    fileName: "CVS",
  ),
  PortfolioFile(
    title: "Respi",
    assetPath: AssetPath.pdf_icu_respi,
    fileName: "Respi",
  ),
  PortfolioFile(
    title: "GIT",
    assetPath: AssetPath.pdf_icu_git,
    fileName: "GIT",
  ),
  PortfolioFile(
    title: "Renal",
    assetPath: AssetPath.pdf_icu_renal,
    fileName: "Renal",
  ),
  PortfolioFile(
    title: "Acide-Base&Electrolyte",
    assetPath: AssetPath.pdf_icu_acid_base_electrolyte,
    fileName: "Acid-Base&Electrolyte",
  ),
  PortfolioFile(
    title: "Infectious Disease",
    assetPath: AssetPath.pdf_icu_infectious_disease,
    fileName: "Infectious Disease",
  ),
  PortfolioFile(
    title: "VTE prophylaxis",
    assetPath: AssetPath.pdf_icu_vte_prophylaxis,
    fileName: "VTE prophylaxis",
  ),
  PortfolioFile(
    title: "Pulmonary Embolism",
    assetPath: AssetPath.pdf_icu_pulmonary_embolism,
    fileName: "Pulmonary Embolism",
  ),
  PortfolioFile(
    title: "Simple OT Notes",
    assetPath: AssetPath.pdf_icu_simple_ot_notes,
    fileName: "Simple OT Notes",
  ),
];

List<PortfolioFile> kcdquickRefs = [
  PortfolioFile(
    title: "ACLS Quick Reference",
    assetPath: AssetPath.pdf_ref_acls,
    fileName: "ACLS Quick Reference",
  ),
  PortfolioFile(
    title: "Dose of Inotropes",
    assetPath:
        AssetPath.pdf_ref2_dose_of_inotropes_and_abg_interpretation_table,
    fileName: "Dose of Inotropes & ABG Interpretation Table",
  ),
  PortfolioFile(
    title: "ABG Interpretation Table",
    assetPath:
        AssetPath.pdf_ref2_dose_of_inotropes_and_abg_interpretation_table,
    fileName: "Dose of Inotropes & ABG Interpretation Table",
  ),
  PortfolioFile(
    title: "Inotrope Dilution",
    assetPath: AssetPath.pdf_ref_inotrope_dilution,
    fileName: "Inotrope Dilution",
  ),
  PortfolioFile(
    title: "Insulin Sliding Scale",
    assetPath: AssetPath.pdf_ref2_insulin_sliding_scale_and_cvl_anchoring,
    fileName: "Insulin Sliding Scale & CVL Anchoring",
  ),
  PortfolioFile(
    title: "Precedex table",
    assetPath: AssetPath.pdf_ref_precedex_table,
    fileName: "Precedex table",
  ),
  PortfolioFile(
    title: "CVL anchoring",
    assetPath: AssetPath.pdf_ref2_insulin_sliding_scale_and_cvl_anchoring,
    fileName: "Insulin Sliding Scale & CVL Anchoring",
  ),
  PortfolioFile(
    title: "Sugammadex",
    assetPath: AssetPath
        .pdf_ref4_sugammadex_and_isotonic_bicarb_dilution_and_nac_regime_and_h20_feeding_for_hypernatremia,
    fileName:
        "Sugammadex & Isotonic Bicarb Dilution & NAC Regime & H20 feeding for Hypernatremia",
  ),
  PortfolioFile(
    title: "Isotonic Bicarb Dilution",
    assetPath: AssetPath
        .pdf_ref4_sugammadex_and_isotonic_bicarb_dilution_and_nac_regime_and_h20_feeding_for_hypernatremia,
    fileName:
        "Sugammadex & Isotonic Bicarb Dilution & NAC Regime & H20 feeding for Hypernatremia",
  ),
  PortfolioFile(
    title: "Nac Regime",
    assetPath: AssetPath
        .pdf_ref4_sugammadex_and_isotonic_bicarb_dilution_and_nac_regime_and_h20_feeding_for_hypernatremia,
    fileName:
        "Sugammadex & Isotonic Bicarb Dilution & NAC Regime & H20 feeding for Hypernatremia",
  ),
  PortfolioFile(
    title: "H20 Feeding for Hypernatremia",
    assetPath: AssetPath
        .pdf_ref4_sugammadex_and_isotonic_bicarb_dilution_and_nac_regime_and_h20_feeding_for_hypernatremia,
    fileName:
        "Sugammadex & Isotonic Bicarb Dilution & NAC Regime & H20 feeding for Hypernatremia",
  ),
  PortfolioFile(
    title: "Antibiotic/Antimicrobial Dosage",
    assetPath: AssetPath.pdf_ref_antibiotic_dosage,
    fileName: "ANTIBIOTIC DOSAGE IN CRITICAL AREA",
  ),
  PortfolioFile(
    title: "Potassium Correction",
    assetPath: AssetPath.pdf_ref_potassium_correction,
    fileName: "Potassium Correction",
  ),
  PortfolioFile(
    title: "Calcium Correction",
    assetPath: AssetPath
        .pdf_ref2_calcium_correction_and_magnesium_phosphate_correction,
    fileName: "Calcium Correction & Magnesium or Phosphate Correction",
  ),
  PortfolioFile(
    title: "Magnesium/Phosphate Correction",
    assetPath: AssetPath
        .pdf_ref2_calcium_correction_and_magnesium_phosphate_correction,
    fileName: "Calcium Correction & Magnesium or Phosphate Correction",
  ),
  PortfolioFile(
    title: "Paediatric Vital Sign",
    assetPath: AssetPath.pdf_ref_paediatric_vital_sign,
    fileName: "Paediatric Vital Sign",
  ),
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
