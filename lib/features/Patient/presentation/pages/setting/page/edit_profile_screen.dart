import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final nationalIdController = TextEditingController();

  PatientModel? currentUser;
  bool isSaving = false;
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    currentUser = LocalHelper.getUserDataPatient();

    if (currentUser != null) {
      nameController.text = currentUser!.name ?? "";
      phoneController.text = currentUser!.phone ?? "";
      locationController.text = currentUser!.address ?? "";
      nationalIdController.text = currentUser!.nationalID ?? "";
    }
  }

  void showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const Gap(20),
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.primaryBlueColor,
                  ),
                  title: const Text("Take Photo"),
                  onTap: () {
                    Navigator.pop(context);
                    pickProfileImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo,
                      color: AppColors.primaryBlueColor),
                  title: const Text("Choose from Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    pickProfileImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickProfileImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: source);

    if (file == null) return;

    setState(() {
      pickedImage = File(file.path);
    });

    // Upload to Firebase Storage
    final url = await FirebaseServices.uploadPatientImage(
      currentUser!.uid!,
      pickedImage!,
    );

    currentUser!.imageUri = url;

    // Save locally
    LocalHelper.setUserDataPatient(currentUser!);

    // Save to Firestore
    await FirebaseServices.updatePatient(currentUser!);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          source == ImageSource.camera
              ? "Photo captured successfully"
              : "Profile picture updated",
        ),
      ),
    );
  }

  Future<void> saveProfile() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (currentUser == null) return;

    setState(() => isSaving = true);

    currentUser!
      ..name = nameController.text
      ..phone = phoneController.text
      ..address = locationController.text
      ..nationalID = nationalIdController.text;

    LocalHelper.setUserDataPatient(currentUser!);
    await FirebaseServices.updatePatient(currentUser!);

    setState(() => isSaving = false);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : AppColors.darkColor;
    final hintColor = isDark ? Colors.white54 : Colors.grey;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlueColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: currentUser == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.primaryBlueColor))
          : SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Gap(70),
                        Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage: pickedImage != null
                                      ? FileImage(pickedImage!)
                                      : (currentUser!.imageUri != null
                                          ? NetworkImage(
                                              currentUser!.imageUri!,
                                            )
                                          : const AssetImage(
                                                  AppImages.profileWelcom)
                                              as ImageProvider),
                                ),
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                    color: AppColors.primaryBlueColor,
                                  ),
                                  onPressed: showImageSourceDialog,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(40),
                        Form(
                          key: _formKey,
                          child: PatientData(
                            nameController: nameController,
                            phoneController: phoneController,
                            locationController: locationController,
                            nationalIdController: nationalIdController,
                            textColor: textColor,
                            hintColor: hintColor,
                          ),
                        ),
                        const Gap(30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: isSaving ? null : saveProfile,
                            child: isSaving
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }
}

class PatientData extends StatelessWidget {
  const PatientData({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.locationController,
    required this.nationalIdController,
    required this.textColor,
    required this.hintColor,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController locationController;
  final TextEditingController nationalIdController;
  final Color textColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name", style: TextStyle(color: textColor)),
        const Gap(5),
        TextFormField(
          controller: nameController,
          validator: (val) => val!.isEmpty ? "Name is required" : null,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: "Enter your name",
            hintStyle: TextStyle(color: hintColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const Gap(15),
        Text("Phone Number", style: TextStyle(color: textColor)),
        const Gap(5),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: (val) =>
              val!.length < 10 ? "Invalid phone number" : null,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: "Enter your phone number",
            hintStyle: TextStyle(color: hintColor),
            suffixIcon: Icon(Icons.edit, color: hintColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const Gap(15),
        Text("Address", style: TextStyle(color: textColor)),
        const Gap(5),
        TextFormField(
          controller: locationController,
          validator: (val) => val!.isEmpty ? "Address is required" : null,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: "Enter your address",
            hintStyle: TextStyle(color: hintColor),
            suffixIcon: Icon(Icons.edit, color: hintColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const Gap(15),
        Text("National ID", style: TextStyle(color: textColor)),
        const Gap(5),
        TextFormField(
          controller: nationalIdController,
          keyboardType: TextInputType.number,
          validator: (val) =>
              val!.length != 14 ? "National ID must be 14 digits" : null,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: "Enter your national ID",
            hintStyle: TextStyle(color: hintColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
