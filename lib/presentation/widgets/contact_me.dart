/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 500,
      width: double.infinity,
      color: ColorConstant.darkBg,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Center(child: Text("Get In Touch",style: mTextStyle20(),)),
            Center(child: Text("Ready to bring your mobile app idea to life? Let's discuss your project and create something amazing together.",style: mTextStyle14(),)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 25,
                  children: [
                    _socialCard(
                        icon: Icons.mail_outline,
                        title: "Email",
                        subTitle: "sohailkhan19102@gmail.com"
                    ),
                    _socialCard(
                        icon: Icons.phone,
                        title: "Phone",
                        subTitle: "+91-7017367537"
                    ),
                    _socialCard(
                        icon: Icons.place_outlined,
                        title: "Location",
                        subTitle: "Selaqui, Dehradun, Uttarakhand, India, 248197"
                    ),
                  ],
                )

              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _socialCard({required IconData icon, required String title,required String subTitle}){
    return Row(
      spacing: 14,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 0.05.sh,
          width: 0.03.sw,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Icon(icon,color: ColorConstant.accent,size: 30,)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(title,style: mTextStyle14(fontWeight: FontWeight.bold),),
            Text(subTitle,style: mTextStyle12(),),
          ],
        )
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:sohail_portfolio/core/helper/input_validation.dart';
import 'package:sohail_portfolio/data/repository/contact_repository.dart';
import 'package:sohail_portfolio/presentation/widgets/custom_text_field.dart';

import '../../core/constant/color_constant.dart';

class ContactMe extends StatefulWidget {
  final VoidCallback onCall;
  final VoidCallback onlinkedin;
  final VoidCallback onWhatsapp;
  final VoidCallback onInsta;
  const ContactMe({super.key,required this.onCall,required this.onInsta,required this.onlinkedin,required this.onWhatsapp});

  @override
  State<ContactMe> createState() => _ContactMeState();

  /// Info Tile Widget
  static Widget _infoTile(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstant.lightBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: ColorConstant.endColor),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:  mTextStyle14(
                    fontWeight: FontWeight.w500)),
            Text(subtitle, style:  mTextStyle12()),
          ],
        )
      ],
    );
  }

  /// Form Field Widget
  static Widget _formField(String label, String hint, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.endColor, width: 1.5),
        ),
      ),
    );
  }

  /// Social Icon Widget
  static Widget _socialIcon(String image,VoidCallback onPressed) {
    return GestureDetector(
      onTap:onPressed,
      child: Image.asset(image,width: 30,height: 30,),
    );
  }
}

class _ContactMeState extends State<ContactMe> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.whiteColor,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),

      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// -------- TOP TEXT --------
              Center(
                child: Text(
                  "Get In Touch",
                  style: mTextStyle22(
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.blackColor),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Ready to bring your mobile app idea to life? Let's discuss your project and create something amazing together.",
                  textAlign: TextAlign.center,
                  style: mTextStyle14( color: Colors.black87),
                ),
              ),
              const SizedBox(height: 30),

              /// -------- MAIN CONTENT (LEFT + RIGHT) --------
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// LEFT SIDE
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: isMobile ? 0 : 40,
                          bottom: isMobile ? 30 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContactMe._infoTile(Icons.email, "Email",
                              "Sohailkhan19102@gmail.com"),
                          const SizedBox(height: 20),
                          ContactMe._infoTile(Icons.phone, "Phone", "+91 7017367537"),
                          const SizedBox(height: 20),
                          ContactMe._infoTile(Icons.location_on, "Location",
                              "Dehradun,Uttarakhand,India,248197"),
                          const SizedBox(height: 30),
                           Text(
                            "Connect With Me",
                            style: mTextStyle22(
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            spacing: 15,
                            children: [
                              ContactMe._socialIcon("assets/images/mobile.png",widget.onCall),
                              ContactMe._socialIcon("assets/images/linkedin.png",widget.onlinkedin),
                              ContactMe._socialIcon("assets/images/whatsapp.png",widget.onWhatsapp),
                               ContactMe._socialIcon("assets/images/instagram.png",widget.onInsta),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// RIGHT SIDE (FORM)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          // Main shadow (bottom-right)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2,
                            offset: const Offset(6, 6),
                          ),
                          // Light shadow (top-left)
                          BoxShadow(
                            color: Colors.white.withOpacity(0.8),
                            blurRadius: 6,
                            spreadRadius: -2,
                            offset: const Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: Form(
                       key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                                label: "Name",
                                hint: "Enter your name",
                                controller: nameController,
                                validator: InputValidation.name,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              label: "Email",
                              hint: "Enter your email",
                              controller: emailController,
                              validator: InputValidation.email,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              keyboardType: TextInputType.phone,
                              label: "Phone number",
                              hint: "Enter your phone....",
                              controller: phoneController,
                              validator: InputValidation.phone,
                            ),

                            const SizedBox(height: 15),
                            CustomTextField(
                              label: "Subject",
                              hint: "Enter your subject",
                              controller: subjectController,
                              validator: InputValidation.subject,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              label: "Message",
                              hint: "Enter your message...",
                              maxLines: 3,
                              controller: messageController,
                              validator: InputValidation.message,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: ColorConstant.endColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () async{
                                  if(_formKey.currentState!.validate()){

                                    setState(() => isLoading = true); // start loading

                                    // simulate delay 2-3 sec
                                    await Future.delayed(const Duration(seconds: 2));

                                    // Call sendMessage function
                                    await ContactRepository.sendMessage(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      subject: subjectController.text,
                                      message: messageController.text,
                                    );

                                    setState(() => isLoading = false); // stop loading

                                    // Show success message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content: Text(
                                          "Thank you for contacting me! I will reach out to you soon.",
                                          style:mTextStyle14(color: ColorConstant.whiteColor) ,
                                        ),
                                        backgroundColor: Colors.green,
                                        duration: Duration(seconds: 3),
                                      ),
                                    );

                                    // Clear form (optional)
                                    _formKey.currentState!.reset();
                                    nameController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    subjectController.clear();
                                    messageController.clear();


                                  }
                                },
                                child: isLoading?Center(child: CircularProgressIndicator(color: ColorConstant.whiteColor,)):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    const Icon(Icons.send, color: ColorConstant.whiteColor),
                                    Text(
                                      "Send Message",
                                      style: mTextStyle16(
                                          color: ColorConstant.whiteColor),
                                    ),
                                  ],
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
