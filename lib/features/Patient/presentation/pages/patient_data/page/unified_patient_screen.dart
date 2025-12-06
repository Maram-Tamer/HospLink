import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';

// ignore: must_be_immutable
class UnifiedPatientScreen extends StatefulWidget {
  UnifiedPatientScreen({super.key, this.HospitalId});
  String? HospitalId;
  @override
  State<UnifiedPatientScreen> createState() => _UnifiedPatientScreenState();
}

class _UnifiedPatientScreenState extends State<UnifiedPatientScreen> {
  bool isLoading = false;
  Uint8List? selectedImageBytes;
  final ImagePicker _picker = ImagePicker();

  String? _currentAddress;
  Position? _currentPosition;

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  String? _validateNationalId(String? value) {
    if (value == null || value.trim().isEmpty) return 'National ID is required';
    final trimmedValue = value.trim();
    if (trimmedValue.length != 14)
      return 'National ID must be exactly 14 digits';
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue))
      return 'National ID must contain only numbers';
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty)
      return 'Phone number is required';
    final trimmedValue = value.trim();
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue))
      return 'Phone number must contain only numbers';
    if (trimmedValue.length < 10)
      return 'Phone number must be at least 10 digits';
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.trim().isEmpty) return 'Age is required';
    final trimmedValue = value.trim();
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue))
      return 'Please enter a valid age';
    final age = int.tryParse(trimmedValue);
    if (age == null) return 'Please enter a valid age';
    return null;
  }

  Future<void> _pickImage(PatientCubit cubit) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );
      if (image != null) {
        final bytes = await image.readAsBytes();
        if (!mounted) return;
        setState(() {
          if (kIsWeb) {
            selectedImageBytes = bytes;
          } else {
            cubit.imagFeile = File(image.path);
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error picking image: $e'),
          backgroundColor: Colors.red));
    }
  }

  Future<void> _takePicture(PatientCubit cubit) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );
      if (image != null) {
        final bytes = await image.readAsBytes();
        if (!mounted) return;
        setState(() {
          if (kIsWeb) {
            selectedImageBytes = bytes;
          } else {
            cubit.imagFeile = File(image.path);
          }
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error taking picture: $e'),
          backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark ? Colors.white : AppColors.darkColor;
    final secondaryTextColor = isDark ? Colors.white70 : AppColors.greyColor;
    final fieldBackground =
        isDark ? AppColors.darkModeBackground : Colors.white;
    final scaffoldBackground =
        isDark ? AppColors.darkModeBackground : AppColors.blueLight2;
    final borderColor =
        isDark ? Colors.white12 : AppColors.greyColor.withValues(alpha: 0.3);
    final iconColor = isDark ? Colors.white70 : AppColors.greyColor;

    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientLoadingState) {
          showLoadingDialog(context);
        } else if (state is PatientSuccessState) {
          pop(context);
          pop(context);
        } else
          pop(context);
      },
      builder: (context, state) {
        var cubit = context.read<PatientCubit>();
        return Scaffold(
          backgroundColor: scaffoldBackground,
          appBar: AppBar(
            backgroundColor: scaffoldBackground,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: textColor),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Patient Data",
                style: AppFontStyles.getSize24(
                    fontColor: textColor, fontWeight: FontWeight.w600)),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===========================
                  ///  CHOOSE PATIENT DROPDOWN
                  /// ===========================
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: fieldBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<PatientType>(
                        value: cubit.selectedPatientType,
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down, color: iconColor),
                        style: AppFontStyles.getSize16(
                            fontColor: textColor, fontWeight: FontWeight.w500),
                        items: const [
                          DropdownMenuItem(
                              value: PatientType.iAmPatient,
                              child: Text("I am the patient")),
                          DropdownMenuItem(
                              value: PatientType.anotherPatient,
                              child: Text("patient is another person")),
                        ],
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(
                                () => cubit.selectedPatientType = newValue);
                          }
                        },
                      ),
                    ),
                  ),

                  const Gap(20),

                  /// ===========================
                  ///     PERSONAL DATA FIELDS
                  /// ===========================
                  if (cubit.selectedPatientType ==
                      PatientType.anotherPatient) ...[
                    _buildTextField(
                      "National ID",
                      cubit.nationalIdController,
                      "Enter 14-digit National ID",
                      textColor,
                      [
                        FilteringTextInputFormatter
                            .digitsOnly, // يسمح بالأرقام فقط
                        LengthLimitingTextInputFormatter(
                            14), // يمنع تجاوز 14 رقم
                      ],
                      validator: _validateNationalId,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField("Name", cubit.nameController,
                        "Enter full name", textColor, [],
                        validator: (v) => _validateRequired(v, "Name")),
                    const SizedBox(height: 16),
                    _buildTextField("Phone", cubit.phoneController,
                        "Enter phone number", textColor, [],
                        keyboardType: TextInputType.number,
                        validator: _validatePhone),
                    const SizedBox(height: 16),
                    Text("Gender",
                        style: AppFontStyles.getSize16(
                            fontColor: textColor, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Male"),
                            value: "Male",
                            groupValue: cubit.selectedGender,
                            onChanged: (value) =>
                                setState(() => cubit.selectedGender = value!),
                            activeColor: AppColors.primaryBlueColor,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Female"),
                            value: "Female",
                            groupValue: cubit.selectedGender,
                            onChanged: (value) =>
                                setState(() => cubit.selectedGender = value!),
                            activeColor: AppColors.primaryBlueColor,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                        "Age", cubit.ageController, "Enter age", textColor, [],
                        keyboardType: TextInputType.number,
                        validator: _validateAge),
                    const SizedBox(height: 16),
                  ],

                  /// ===========================
                  ///        ADDRESS FIELD
                  /// ===========================
                  Text("Address",
                      style: AppFontStyles.getSize16(
                          fontColor: textColor, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),

                  MainTextFormField(
                    label: 'Enter detailed address',
                    controller: cubit.addressController,
                    maxTextLines: 2,
                    validator: (v) => _validateRequired(v, "Address"),
                    ispassword: false,
                  ),
                  const SizedBox(height: 10),

                  /// 🔥 ADDED BUTTON UNDER ADDRESS
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await _getCurrentPosition();
                          await _getAddressFromLatLng(_currentPosition);
                          if (_currentAddress != null) {
                            cubit.addressController.text = _currentAddress!;
                          }
                        },
                        icon: const Icon(Icons.my_location),
                        label: Text("Use My current Location"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlueColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildBloodTypeField(
                      cubit, textColor, fieldBackground, borderColor),
                  _buildTextField(
                      "Case Description",
                      cubit.descriptionController,
                      "Write a detailed description of the case",
                      textColor,
                      [],
                      maxLines: 4,
                      validator: (v) =>
                          _validateRequired(v, "Case Description")),
                  const SizedBox(height: 16),

                  _buildImageUpload(
                      cubit, fieldBackground, textColor, secondaryTextColor),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          if (cubit.imagFeile != null) {
                            cubit.sendRequest(context, widget.HospitalId ?? '');
                          } else {
                            showMyDialog(context, 'Please upload image');
                          }
                        } else {
                          showMyDialog(context, 'Please enter all data');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2))
                          : Text("Submit",
                              style: AppFontStyles.getSize16(
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSize choosPatient(PatientCubit cubit, Color textColor,
      Color borderColor, Color fieldBackground, Color iconColor) {
    return const PreferredSize(
        preferredSize: Size.fromHeight(0), child: SizedBox());
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String hintText,
    Color textColor,
    List<TextInputFormatter>? inputFormat, {
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppFontStyles.getSize16(
                fontColor: textColor, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        MainTextFormField(
          inputFormat: inputFormat ?? [],
          label: hintText,
          controller: controller,
          maxTextLines: maxLines,
          validator: validator,
          keyboardType: keyboardType,
          ispassword: false,
        ),
      ],
    );
  }

  Widget _buildBloodTypeField(PatientCubit cubit, Color textColor,
      Color fieldBackground, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Blood Type",
            style: AppFontStyles.getSize16(
                fontColor: textColor, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue:
              cubit.selectedBloodType.isEmpty ? null : cubit.selectedBloodType,
          decoration: InputDecoration(
            hintText: "Select blood type",
            hintStyle: AppFontStyles.getSize14(
                fontColor: AppColors.greyColor, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.primaryBlueColor)),
            filled: true,
            fillColor: fieldBackground,
          ),
          items: Boold.map((String bloodType) => DropdownMenuItem<String>(
              value: bloodType, child: Text(bloodType))).toList(),
          onChanged: (String? newValue) {
            setState(() => cubit.selectedBloodType = newValue ?? '');
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageUpload(PatientCubit cubit, Color fieldBackground,
      Color textColor, Color secondaryTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Upload Image",
            style: AppFontStyles.getSize16(
                fontColor: textColor, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showImageSourceDialog(cubit),
          child: DottedBorder(
            color: secondaryTextColor,
            strokeWidth: 1,
            dashPattern: const [5, 3],
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(color: fieldBackground),
              child: (cubit.imagFeile != null || selectedImageBytes != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: kIsWeb
                          ? Image.memory(selectedImageBytes!,
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover)
                          : Image.file(cubit.imagFeile!,
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined,
                            size: 32,
                            color: secondaryTextColor.withOpacity(0.6)),
                        const SizedBox(height: 8),
                        Text("Tap to upload image",
                            style: AppFontStyles.getSize14(
                                fontColor: secondaryTextColor,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 4),
                        Text("PNG, JPG, GIF up to 10MB",
                            style: AppFontStyles.getSize14(
                                fontColor: secondaryTextColor.withOpacity(0.7),
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void _showImageSourceDialog(PatientCubit cubit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(cubit);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _takePicture(cubit);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ================================
  // Location functions
  // ================================
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 50,
      ),
    ).then((position) {
      setState(() => _currentPosition = position);
      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => log(e.toString()));
  }

  Future<void> _getAddressFromLatLng(Position? position) async {
    if (position == null) return;

    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((placemarks) {
      final place = placemarks[0];

      setState(() {
        String cleanStreet = place.street?.replaceAll(RegExp(r'\d+'), '') ?? '';

        _currentAddress = '${cleanStreet.trim()} ${place.thoroughfare ?? ''}\n'
            'Area: ${place.subAdministrativeArea ?? ''}\n'
            'City: ${place.locality ?? ''}\n'
            'Governorate: ${place.administrativeArea ?? ''}\n'
            'Country: ${place.country ?? ''}';
      });
      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => log(e.toString()));
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Location services are disabled. Please enable')),
      );
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied')),
      );
      return false;
    }

    return true;
  }
}
