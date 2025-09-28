import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';
import 'package:sohail_portfolio/core/constant/web_utils.dart';
import 'package:sohail_portfolio/presentation/widgets/ui_widgets/project_card.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.lightGrey,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Heading
          Text(
            "Featured Projects",
            style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),

          /// Subtitle
          Text(
            "Some of my recent Flutter projects showcasing different aspects of mobile development",
            textAlign: TextAlign.center,
            style: mTextStyle16(color: ColorConstant.blackColor.withOpacity(0.7)),
          ),
          const SizedBox(height: 30),


          LayoutBuilder(builder: (context,contraints){
            print("--------------Screen width: ${contraints.maxWidth}-------");

            if(contraints.maxWidth<800){
              return Column(
                children: WebUtils.projects
                    .map(
                      (project) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ProjectCard(project: project,tech: ["Flutter",'Dart',"Firebase"],),
                  ),
                )
                    .toList(),
              );
            }else{
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4/3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: contraints.maxWidth<1300?2: 3),
                    itemCount: WebUtils.projects.length,

                    itemBuilder: (_,index){
                      return ProjectCard(
                          project: WebUtils.projects[index],
                          tech: ["Flutter",'Dart','Firebase'],
                      );
                    });
            }
          }),

          /// Responsive Layout
       /*   LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              debugPrint("--------------Screen Size: $width---------");

              int crossAxisCount = 1;
              double spacing = 20;

              if (width >= 1100) {
                // Desktop → 3 cards per row
                crossAxisCount = 3;
              } else if (width >= 700) {
                // Tablet → 2 cards per row
                crossAxisCount = 2;
              } else {
                // Mobile → 1 card per row (list)
                crossAxisCount = 1;
              }

              // Mobile → simple Column
              if (crossAxisCount == 1) {
                return Column(
                  children: WebUtils.projects
                      .map(
                        (project) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ProjectCard(project: project),
                    ),
                  )
                      .toList(),
                );
              }

              // Dynamic card width based on available screen width
              final totalSpacing = spacing * (crossAxisCount - 1);
              final cardWidth = (width - totalSpacing) / crossAxisCount;
              final cardHeight = cardWidth * 3 / 4; // Aspect ratio 4/3

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: cardWidth / cardHeight,
                ),
                itemCount: WebUtils.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: WebUtils.projects[index]);
                },
              );
            },
          )*/
        ],
      ),
    );
  }
}
