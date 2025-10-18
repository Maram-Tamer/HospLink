import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool showCurrent = false;
  bool showNew = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreenColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: AppColors.primaryGreenColor,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: const [
                  Text(
                    "Set Your Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Update your password regularly to keep\n"
                    "your account secure.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Current Password"),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: currentPasswordController,
                    obscureText: !showCurrent,
                    decoration: InputDecoration(
                      hintText: "Enter current password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showCurrent ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () =>
                            setState(() => showCurrent = !showCurrent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text("New Password"),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: newPasswordController,
                    obscureText: !showNew,
                    decoration: InputDecoration(
                      hintText: "Enter new password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showNew ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () => setState(() => showNew = !showNew),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text("Confirm New Password"),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !showConfirm,
                    decoration: InputDecoration(
                      hintText: "Re-enter new password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          showConfirm ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () =>
                            setState(() => showConfirm = !showConfirm),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Add save password logic
                      },
                      child: const Text(
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
}
