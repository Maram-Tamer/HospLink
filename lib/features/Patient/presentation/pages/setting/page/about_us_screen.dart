import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(leading: true, title: "About Us"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
            Text(
              "Digital Egypt Pioneers Initiative (DEPI) – Round 3",
              style: AppFontStyles.getSize24(
                fontColor: AppColors.primaryGreenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              "Project Title: Hosp Link",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.w600),
            ),
            const Gap(10),
            Text(
              "Instructor: Eng. Sayed Abdelaziz",
              style: AppFontStyles.getSize16(),
            ),
            const Gap(10),
            Text(
              "Team Members:",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.w600),
            ),
            const Gap(5),
            Text("1) Eslam Emad Ibrahim (Team Leader) 21060166"),
            Text("2) Maram Tamer Ahmed 21068498"),
            Text("3) Noor El Deen Ramadan Mohamed 21004493"),
            Text("4) Ahmed Gamal Ahmed Ibrahim 21072092"),
            Text("5) John Mikheal Foad 21056790"),
            Text("6) Marina Adel Younan 21015235"),
            const Gap(10),
            Text(
              "Track: Mobile Application Development (Flutter)",
              style: AppFontStyles.getSize16(fontWeight: FontWeight.w500),
            ),
            Text(
              "Date: November 2025",
              style: AppFontStyles.getSize16(),
            ),
            const Gap(20),

            // Project Idea
            Text(
              "Project Idea",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "This is a mobile application that helps patients find hospitals with available emergency beds quickly. "
              "The patient can send an emergency request through the app, attach a photo of the case, and write details about the incident. "
              "Hospitals can accept or reject the request after reviewing the photos and details. "
              "The goal is to save time and help patients reach the right hospital faster without moving between many hospitals.",
            ),
            const Gap(20),

            // Project Goal
            Text(
              "Project Goal",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "Many patients and their families waste time moving from one hospital to another to find an available emergency bed. "
              "This delay can be dangerous and sometimes life-threatening. "
              "Our app solves this problem by allowing patients to:\n"
              "• Send an emergency request directly.\n"
              "• Attach a photo of the patient/incident and write short details.\n"
              "• See which hospitals have available beds.\n"
              "• Receive quick responses from hospitals.",
            ),
            const Gap(20),

            // Target Users
            Text(
              "Target Users",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "• Patients: to send emergency requests with photos and case details.\n"
              "• Hospital management: to receive, review (photo + details), and respond to patient requests.",
            ),
            const Gap(20),

            // Tools & Technologies
            Text(
              "Tools & Technologies",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "• Frontend: Flutter\n"
              "• Backend / Database: Firebase (Firestore or Realtime Database)\n"
              "• Authentication: Firebase Auth\n"
              "• Local Storage: shared preferences (for small local settings like login state or last used hospital)\n"
              "• File / Image Storage: Cloudinary (store photos and files)\n"
              "• Design Tool: Figma\n"
              "• Git & GitHub: Used for version control and team collaboration\n"
              "• Trello: Used for project management and task tracking\n"
              "\nHow images & files work:\n"
              "When a patient attaches a photo, the app uploads the image to Cloudinary and stores the returned URL in Firebase. "
              "Hospitals open the request, view the image (via Cloudinary URL) and the details, then accept or reject the request.",
            ),
            const Gap(20),

            // Timeline
            Text(
              "Timeline (Project Plan)",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "Week 1-2: Analysis & Design - Collect requirements and design basic UI\n"
              "Week 3-5: Frontend Development - Build the app interface using Flutter (upload image flow included)\n"
              "Week 6-7: Backend Integration - Connect the app with Firebase and Cloudinary\n"
              "Week 8: Testing & Final Delivery - Test all functions and prepare final version",
            ),
            const Gap(20),

            // Stakeholder Analysis
            Text(
              "Stakeholder Analysis",
              style: AppFontStyles.getSize18(fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              "• User: The patient who uses the app to send emergency requests with photos and details\n"
              "• Hospital Management: The team that receives, reviews (photo + details), and manages the requests\n"
              "• Development Team: The group who developed the application\n"
              "• Academic Supervisor: The instructor or mentor who reviews the project",
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}
