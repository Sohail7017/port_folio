
import 'package:sohail_portfolio/data/models/project_model.dart';

class WebUtils{

  static const String firstPara = "I'm a dedicated Flutter Frontend Developer who specializes in crafting beautiful, responsive, and animated mobile applications for both Android and iOS. My strength lies in designing smooth user experiences with clean, modern UI and eye-catching transitions — all using Flutter’s powerful widget system.";
  static const String secondPara = "After completing my B.Sc. in Information Technology, I enhanced my skills with a Flutter Certification from WsCube Tech, where I gained hands-on experience in building production-ready UI components, managing state, and integrating responsive layouts.";
  static const String serviceTitle = "I provide end-to-end Flutter development solutions — from building new apps to improving existing ones — ensuring quality, performance, and user satisfaction.";



  static const List<Map<String, dynamic>> servicesData = [
    {
      "title": "Flutter App Development",
      "subTitle":
      "Custom mobile & web apps built with Flutter for Android, iOS, and Web. Optimized for performance, scalability, and a seamless user experience.",
      "image": "assets/images/app_devlop1.png",
      "points": [
        "Cross-platform apps for Android, iOS, and Web",
        "High performance & scalable solutions",
        "Clean architecture & maintainable code"
      ]
    },
    {
      "title": "Flutter UI/UX Design",
      "subTitle":
      "Pixel-perfect, responsive, and beautiful designs that adapt flawlessly across devices. Focused on user engagement and intuitive navigation.",
      "image": "assets/images/uiux.png",
      "points": [
        "Responsive layouts for all screen sizes",
        "Interactive & user-friendly design",
        "Custom themes & design systems"
      ]
    },
    {
      "title": "API & Backend Integration",
      "subTitle":
      "Integration of REST APIs, Firebase, Node.js, and payment gateways. Secure, fast, and reliable solutions to power your app’s functionality.",
      "image": "assets/images/api.png",
      "points": [
        "REST API & Firebase integration",
        "Secure authentication & payments",
        "Real-time database & cloud storage"
      ]
    },
    {
      "title": "Bug Fixing & Maintenance",
      "subTitle":
      "Diagnosing and fixing issues in existing Flutter projects. Regular updates and optimizations to keep your app running smoothly.",
      "image": "assets/images/bug-fix.png",
      "points": [
        "Crash & error debugging",
        "Performance optimization",
        "Continuous updates & support"
      ]
    },
    {
      "title": "Feature Enhancements",
      "subTitle":
      "Adding new features and functionalities to existing apps. Improving app performance, UI, and overall user experience.",
      "image": "assets/images/feature_enhance.png",
      "points": [
        "New feature development",
        "UI improvements & redesigns",
        "Performance & stability enhancements"
      ]
    },
    {
      "title": "App Deployment",
      "subTitle":
      "Seamless deployment of your apps to Google Play Store and Apple App Store. Ensuring compliance, optimization, and smooth publishing process.",
      "image": "assets/images/deployment.png",
      "points": [
        "Play Store & App Store release management",
        "App signing & versioning",
        "Handling updates & store compliance"
      ]
    },
  ];

  static List<ProjectModel> projects = [
    ProjectModel(
      title: "Cloberi - Ecommerce App",
      description:
      "A modern ecommerce app focused on shopping for clothes with product catalog, cart, and secure payments.",
      imageUrl:
      "https://images.unsplash.com/photo-1674027392857-9aed6e8ecab9?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

    ),
    ProjectModel(
      title: "iGYM Member App",
      description:
      "A fitness membership app for gym users where they can purchase subscriptions, track workouts, and order supplements.",
      imageUrl:
      "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",

    ),
    ProjectModel(
      title: "iGYM Partner App",
      description:
      "An app designed for gym owners to manage gyms and multiple branches with members, plans, and staff features.",
      imageUrl:
      "https://images.unsplash.com/photo-1633433155491-ce18307bc690?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

    ),
    ProjectModel(
      title: "Creche App",
      description:
      "A childcare monitoring solution where parents can track their kids' activities. AI detects and notifies parents about kids’ activities in daycare.",
      imageUrl:
      "https://images.unsplash.com/photo-1588072432836-e10032774350?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",

    ),
    ProjectModel(
      title: "Atech ERP",
      description:
      "An ERP system for schools and colleges where teachers and students have dedicated roles to manage academics effectively.",
      imageUrl:
      "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

    ),
    ProjectModel(
      title: "AI Resume Builder",
      description:
      "An AI-powered resume builder where users can generate professional resumes instantly with multiple modern templates.",
      imageUrl:
      "https://plus.unsplash.com/premium_photo-1661288470388-c5006797bdff?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
  ];


  static List<String> techImages = [
    "assets/svg/flutter.svg",
    "assets/svg/Dart.svg",
    "assets/svg/java.svg",
    "assets/svg/firebase.svg",
    "assets/svg/Razorpay_logo.svg",
    "assets/svg/android_studio.svg",
    "assets/svg/github.svg",
    "assets/svg/rest_api.svg"

  ];
}