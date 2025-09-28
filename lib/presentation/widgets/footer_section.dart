import 'package:flutter/material.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';

class FooterSection extends StatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactTap;

  const FooterSection({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onServicesTap,
    this.onProjectsTap,
    this.onContactTap,
  });

  @override
  State<FooterSection> createState() => _FooterSectionState();

  /// Social Icon Widget
  static Widget _socialIcon(IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white70, size: 18),
      ),
    );
  }

  /// Footer Link Widget (ab dynamic onTap lega)
  static Widget _footerLink(String text, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
    );
  }
}

class _FooterSectionState extends State<FooterSection> {
  final int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B1221), // Dark background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ---------- MAIN CONTENT ----------
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  /// LEFT (Logo + Bio + Socials)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Sohail",
                            style: mTextStyle20(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Dev",
                                style: mTextStyle20(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Passionate Flutter developer creating beautiful, performant\n"
                              "mobile applications. Let's bring your ideas to life with cutting-edge technology.",
                          style: mTextStyle12(color: Colors.white70),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 12,
                          children: [
                            FooterSection._socialIcon(Icons.linked_camera),
                            FooterSection._socialIcon(Icons.code),
                            FooterSection._socialIcon(Icons.alternate_email),
                            FooterSection._socialIcon(Icons.camera_alt),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: isMobile ? 30 : 0, width: isMobile ? 0 : 50),

                  /// MIDDLE (Quick Links)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Quick Links",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        FooterSection._footerLink("Home", onTap: widget.onHomeTap),
                        FooterSection._footerLink("About", onTap: widget.onAboutTap),
                        FooterSection._footerLink("Services", onTap: widget.onServicesTap),
                        FooterSection._footerLink("Projects", onTap: widget.onProjectsTap),
                        FooterSection._footerLink("Contact", onTap: widget.onContactTap),
                      ],
                    ),
                  ),

                  SizedBox(height: isMobile ? 30 : 0, width: isMobile ? 0 : 50),

                  /// RIGHT (Contact Info)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Contact",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        Text("Sohailkhan19102@gmail.com",
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                        SizedBox(height: 8),
                        Text("+91 7017367537",
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                        SizedBox(height: 8),
                        Text("Dehradun,Uttarakhand,India",
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Divider(color: Colors.white30, thickness: 0.5),

              /// ---------- COPYRIGHT ----------
              const SizedBox(height: 15),
              Text(
                "© $currentYear Sohail Khan. All rights reserved.",
                style: const TextStyle(color: Colors.white60, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
