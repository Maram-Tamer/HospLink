import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MainAppBar(
        leading: true,
        title: "About Us",
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ----------------------- PAGE TITLE -----------------------
            Text(
              "Digital Egypt Pioneers Initiative (DEPI) – Round 3",
              style: AppFontStyles.getSize24(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.onSurface,       // theme responsive
              ),
            ),
            const Gap(10),

            // ----------------------- PROJECT TITLE -----------------------
            Text(
              "Project Title: Hosp Link",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: theme.colorScheme.primary,          // theme responsive
              ),
            ),

            const Gap(10),

            // ----------------------- INSTRUCTOR -----------------------
            Text(
              "Instructor: Eng. Sayed Abdelaziz",
              style: AppFontStyles.getSize16(
                fontColor: theme.colorScheme.onSurface,        // theme responsive
              ),
            ),

            const Gap(10),

            // ----------------------- TEAM MEMBERS -----------------------
            Text(
              "Team Members:",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: theme.colorScheme.primary,          // theme responsive
              ),
            ),
            const Gap(5),

            // normal text auto-adapts in theme
            Text(
              "1) Eslam Emad Ibrahim (Team Leader) 21060166",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              "2) Maram Tamer Ahmed 21068498",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              "3) Noor El Deen Ramadan Mohamed 21004493",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              "4) Ahmed Gamal Ahmed Ibrahim 21072092",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              "5) John Mikheal Foad 21056790",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            Text(
              "6) Marina Adel Younan 21015235",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(10),

            Text(
              "Track: Mobile Application Development (Flutter)",
              style: AppFontStyles.getSize16(
                fontWeight: FontWeight.w500,
                fontColor: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              "Date: November 2025",
              style: AppFontStyles.getSize16(
                fontColor: theme.colorScheme.onSurface,
              ),
            ),

            const Gap(20),

            // ----------------------- PROJECT IDEA -----------------------
            Text(
              "Project Idea",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "This is a mobile application that helps patients find hospitals "
              "with available emergency beds quickly. The patient can send "
              "an emergency request, attach a photo, and write case details. "
              "Hospitals can accept or reject the request after reviewing it.",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(20),

            // ----------------------- PROJECT GOAL -----------------------
            Text(
              "Project Goal",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "Many patients waste time moving between hospitals trying to "
              "find available emergency beds. Our app solves this problem by:\n"
              "• Sending an emergency request directly\n"
              "• Attaching a photo & case details\n"
              "• Showing hospitals with available beds\n"
              "• Receiving quick hospital responses",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(20),

            // ----------------------- TARGET USERS -----------------------
            Text(
              "Target Users",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "• Patients\n"
              "• Hospital management",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(20),

            // ----------------------- TOOLS & TECH -----------------------
            Text(
              "Tools & Technologies",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "• Flutter\n"
              "• Firebase\n"
              "• Firebase Auth\n"
              "• Shared Preferences\n"
              "• Cloudinary\n"
              "• Figma\n"
              "• GitHub\n"
              "• Trello",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(20),

            // ----------------------- TIMELINE -----------------------
            Text(
              "Timeline (Project Plan)",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "Week 1–2: Analysis & Design\n"
              "Week 3–5: Frontend Development\n"
              "Week 6–7: Backend Integration\n"
              "Week 8: Testing & Final Delivery",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(20),

            // ----------------------- STAKEHOLDER -----------------------
            Text(
              "Stakeholder Analysis",
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.primary,
              ),
            ),
            const Gap(5),

            Text(
              "• Patient\n"
              "• Hospital management\n"
              "• Development team\n"
              "• Academic supervisor",
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),

            const Gap(40),
          ],
        ),
      ),
    );
  }
}
