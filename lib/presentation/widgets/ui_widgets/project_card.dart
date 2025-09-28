import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';
import 'package:sohail_portfolio/data/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final List<String> tech;

  const ProjectCard({Key? key, required this.project,required this.tech}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Thumbnail
          Container(
      height: MediaQuery.of(context).size.height*0.27 ,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(project.imageUrl))
            ),
          ),

          /// Title + Description + Buttons
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 6),
                Text(
                  project.description,
                  style: mTextStyle12(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 10),


            SizedBox(
              height: 15,
              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tech.length,
                  itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(tech[index],style: mTextStyle12(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
                );
              }),
            )
              ],
            ),
          )
        ],
      ),
    );
  }
}