import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';

class EditProfileScreenH extends StatelessWidget {
  const EditProfileScreenH({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final locationController = TextEditingController();
    final nationalIdController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: theme.colorScheme.primary,
                ),
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(150),
                      Text("Name", style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Phone Number", style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          suffixIcon: Icon(Icons.edit, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Second Phone Number", style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter your second phone number",
                          suffixIcon: Icon(Icons.edit, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Office Email", style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          suffixIcon: Icon(Icons.edit, color: theme.colorScheme.onSurface.withOpacity(0.5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Description", style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: nationalIdController,
                        keyboardType: TextInputType.number,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Enter your Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // TODO: Save logic
                            },
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: MediaQuery.of(context).size.width / 2 - 45,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: theme.colorScheme.surface,
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(AppImages.hospitalPhoto4),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.surface,
                      radius: 16,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
