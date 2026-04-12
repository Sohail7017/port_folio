import 'package:flutter/material.dart';
import 'package:sohail_portfolio/presentation/widgets/about_me_section.dart';
import 'package:sohail_portfolio/presentation/widgets/contact_me.dart';
import 'package:sohail_portfolio/presentation/widgets/featured_projects_section.dart';
import 'package:sohail_portfolio/presentation/widgets/footer_section.dart';
import 'package:sohail_portfolio/presentation/widgets/hero_section.dart';
import 'package:sohail_portfolio/presentation/widgets/services.dart';
import 'package:sohail_portfolio/presentation/widgets/web_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ScrollController _scrollController;

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }
  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Mobile: phone/WhatsApp, Web: new tab
      );
    } catch (e) {
      debugPrint("Could not launch $url: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: WebAppBar(
          onHomeTap: () => scrollToSection(homeKey),
          onAboutTap: () => scrollToSection(aboutKey),
          onServicesTap: () => scrollToSection(servicesKey),
          onProjectsTap: () => scrollToSection(projectsKey),
          onContactTap: () => scrollToSection(contactKey),
        ),
      ),
      body: WebSmoothScroll(
        controller: _scrollController,
        child: SingleChildScrollView(
          physics:  const ClampingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              Container(key: homeKey, child: HeroSection(onContact:()=> scrollToSection(contactKey) ,onWork:()=> scrollToSection(projectsKey) ,)),
              Container(key: aboutKey, child: const AboutMeSection()),
              Container(key: servicesKey, child: const Services()),
              Container(key: projectsKey, child: const FeaturedProjectsSection()),
              Container(key: contactKey, child: ContactMe(
                  onCall: (){
                    openLink("tel:+917017367537");
                  },
                  onInsta: (){
                    openLink("https://www.instagram.com/its_sk_official0?igsh=Y292djIyNHg3cWtu");
                  },
                  onlinkedin: (){
                    openLink("https://www.linkedin.com/in/sohail-khan-066751333");
                  },
                  onWhatsapp: (){
                    openLink("https://wa.me/917017367537"); // WhatsApp number


                  })),
              FooterSection(
                onHomeTap: () => scrollToSection(homeKey),
                onAboutTap: () => scrollToSection(aboutKey),
                onServicesTap: () => scrollToSection(servicesKey),
                onProjectsTap: () => scrollToSection(projectsKey),
                onContactTap: () => scrollToSection(contactKey),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
