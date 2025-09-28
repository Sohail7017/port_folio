import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final List<String> points;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14,bottom: 14,left: 14), //  Shadow ke liye outer gap
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          // Primary shadow (bottom-right)
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(6, 6),
            blurRadius: 12,
            spreadRadius: 1,
          ),
          // Secondary light shadow (top-left)
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade50,
              child: Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          /// Title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.h),

          /// Subtitle
          Text(
            subTitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: points.length,
              itemBuilder: (_,index){
            return ListTile(
              minLeadingWidth: 2,
              leading: Icon(Icons.circle,size: 6,),
              title: Text(points[index],style: GoogleFonts.poppins(fontSize: 12),),
            );
          })
        ],
      ),
    );
  }
}
