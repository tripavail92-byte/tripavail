import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/profile/widgets/contact_info_card.dart';
import 'package:tripavail/features/profile/widgets/payment_methods_card.dart';
import 'package:tripavail/features/profile/widgets/profile_header_card.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/choose_photo_bottom_sheet.dart';
import 'package:tripavail/utils/profile_storage.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/extension/role_theme_extension.dart';
import 'package:tripavail/widgets/otp_input.dart';
import 'package:tripavail/widgets/primary_appbar.dart';
import 'package:tripavail/widgets/primary_button.dart';

class ProfileData {
  String name;
  String email;
  String phone;
  String location;
  String address;
  String city;
  String bio;
  bool emailVerified;
  bool phoneVerified;
  bool locationVerified;
  String joinDate;
  DateTime? dateOfBirth;
  String? avatarUrl;
  String? profileImage;

  ProfileData({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.address,
    required this.city,
    required this.bio,
    required this.emailVerified,
    required this.phoneVerified,
    required this.locationVerified,
    required this.joinDate,
    this.dateOfBirth,
    this.avatarUrl,
    this.profileImage,
  });

  ProfileData copy() {
    return ProfileData(
      name: name,
      email: email,
      phone: phone,
      location: location,
      address: address,
      city: city,
      bio: bio,
      emailVerified: emailVerified,
      phoneVerified: phoneVerified,
      locationVerified: locationVerified,
      joinDate: joinDate,
      dateOfBirth: dateOfBirth,
      avatarUrl: avatarUrl,
      profileImage: profileImage,
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  late ProfileData profileData;
  late ProfileData editData;

  final _formKey = GlobalKey<FormState>();

  // Spacing multipliers
  static const double _spacingSmall = 0.01;
  static const double _spacingMedium = 0.015;
  static const double _spacingLarge = 0.02;
  static const double _spacingXLarge = 0.03;
  static const double _horizontalPadding = 0.08;
  static const double _maxContentWidth = 560.0;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'Maria Rodriguez',
      email: 'maria.rodriguez@gmail.com',
      phone: '+92 300 1234567',
      location: 'Lahore, Pakistan',
      address: 'House 45, Block B, DHA Phase 5, Lahore, Punjab 54792',
      city: 'Lahore',
      bio: 'Travelling the world one step at a time.',
      emailVerified: true,
      phoneVerified: false,
      locationVerified: false,
      joinDate: 'Jan 2023',
      dateOfBirth: DateTime(1992, 5, 15),
      avatarUrl: null,
      profileImage: null,
    );
    editData = profileData.copy();
    _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    final saved = await ProfileStorage.readLocation();
    if (saved.lat != null && saved.lng != null) {
      setState(() {
        profileData = profileData.copy()
          ..city = saved.city ?? profileData.city
          ..location = saved.label ?? profileData.location;
      });
    }
  }

  void _toggleEdit() {
    setState(() {
      editData = profileData.copy();
      isEditing = !isEditing;
    });
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      setState(() {
        profileData = editData.copy();
        isEditing = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile updated')));
    }
  }

  String? _validateName(String? val) {
    if (val == null || val.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validateBio(String? val) {
    if (val != null && val.length > 200) {
      return 'Bio must be under 200 characters';
    }
    return null;
  }

  void _openPhotoSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      builder: (context) {
        return ChoosePhotoBottomSheet(
          onChooseFromLibraryPressed: () => Navigator.pop(context),
          onTakePhotoPressed: () => Navigator.pop(context),
        );
      },
    );
  }

  int _calculateCompletion(ProfileData p) {
    int total = 0;
    if (p.name.isNotEmpty) total += 15;
    if (p.email.isNotEmpty && p.emailVerified) total += 15;
    if (p.phone.isNotEmpty && p.phoneVerified) total += 15;
    if (p.address.isNotEmpty) total += 15;
    if (p.location.isNotEmpty) total += 10;
    if (p.bio.isNotEmpty && p.bio.length >= 20) total += 10;
    if (p.dateOfBirth != null) total += 10;
    final hasAvatar =
        (p.profileImage != null && p.profileImage!.isNotEmpty) ||
        (p.avatarUrl != null && p.avatarUrl!.isNotEmpty);
    if (hasAvatar) total += 10;
    return total.clamp(0, 100);
  }

  Widget _buildViewMode() {
    final theme = Theme.of(context);
    return Text(
      profileData.bio,
      style: AppTextStyle.bodyMedium.copyWith(
        color: theme.textTheme.bodyMedium?.color,
      ),
    );
  }

  Widget _buildEditMode() {
    final theme = Theme.of(context);
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
    );
    final screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          _labeledField(
            label: 'Full Name',
            field: TextFormField(
              initialValue: editData.name,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.name],
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder.copyWith(
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
              ),
              onSaved: (val) => editData.name = val ?? '',
              validator: _validateName,
            ),
          ),
          SizedBox(height: screenHeight * _spacingMedium),
          _labeledField(
            label: 'About Me',
            field: TextFormField(
              initialValue: editData.bio,
              textInputAction: TextInputAction.newline,
              maxLines: 4,
              maxLength: 200,
              autofillHints: const [AutofillHints.nickname],
              decoration: InputDecoration(
                hintText: 'Tell us a bit about yourself',
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder.copyWith(
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
              ),
              onSaved: (val) => editData.bio = val ?? '',
              validator: _validateBio,
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelWithAccent(String label) {
    final theme = Theme.of(context);
    final roleTheme = theme.extension<RoleThemeExtension>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: roleTheme?.primaryGradient ?? AppRoleGradients.traveller,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _labeledField({required String label, required Widget field}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_labelWithAccent(label), field],
    );
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: profileData.dateOfBirth ?? DateTime(1992, 5, 15),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        final theme = Theme.of(context);
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: const Color(0xFFE11D48),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isEditing) {
          editData = editData.copy()..dateOfBirth = picked;
        } else {
          profileData = profileData.copy()..dateOfBirth = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'My Profile',
        showBackArrowIcon: true,
        centerTitle: true,
        actions: [
          if (!isEditing)
            TextButton(
              onPressed: _toggleEdit,
              child: Text(
                'Edit',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (isEditing)
            TextButton(
              onPressed: _saveProfile,
              child: Text(
                'Save',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = MediaQuery.of(context).size;
          final screenHeight = size.height;
          final screenWidth = size.width;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * _horizontalPadding,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: screenHeight * _spacingXLarge),
                      ProfileHeaderCard(
                        name: profileData.name,
                        bio: profileData.bio,
                        joinDate: profileData.joinDate,
                        emailVerified: profileData.emailVerified,
                        avatarUrl: profileData.avatarUrl,
                        completion: _calculateCompletion(profileData),
                        onChangePhoto: _openPhotoSheet,
                      ),
                      SizedBox(height: screenHeight * _spacingLarge),
                      Card(
                        elevation: 2,
                        color: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFF444444)
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Me',
                                style: AppTextStyle.headlineSmall,
                              ),
                              SizedBox(height: screenHeight * _spacingSmall),
                              isEditing ? _buildEditMode() : _buildViewMode(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * _spacingLarge),
                      ContactInfoCard(
                        email: profileData.email,
                        emailVerified: profileData.emailVerified,
                        phone: profileData.phone,
                        phoneVerified: profileData.phoneVerified,
                        address: profileData.address,
                        city: profileData.city,
                        locationVerified: profileData.locationVerified,
                        dateOfBirth: profileData.dateOfBirth,
                        onPickDob: _pickDob,
                        onVerifyPhone: () => Get.to(
                          () => _PhoneVerificationScreen(
                            phoneNumber: profileData.phone,
                            onVerified: () {
                              setState(() {
                                profileData = profileData.copy()
                                  ..phoneVerified = true;
                              });
                              Get.back();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Phone verified')),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * _spacingLarge),
                      PaymentMethodsCard(
                        onWalletsTap: () =>
                            Get.to(() => const _MobileWalletsScreen()),
                        onCardsTap: () =>
                            Get.to(() => const _PaymentCardsScreen()),
                      ),
                      SizedBox(height: screenHeight * _spacingXLarge),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MobileWalletsScreen extends StatelessWidget {
  const _MobileWalletsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Mobile Wallets',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Coming soon', style: AppTextStyle.bodyLarge),
        ),
      ),
    );
  }
}

class _PaymentCardsScreen extends StatelessWidget {
  const _PaymentCardsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Cards', showBackArrowIcon: true),
      body: SafeArea(
        child: Center(
          child: Text('Coming soon', style: AppTextStyle.bodyLarge),
        ),
      ),
    );
  }
}

class _PhoneVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback onVerified;

  const _PhoneVerificationScreen({
    required this.phoneNumber,
    required this.onVerified,
  });

  @override
  State<_PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<_PhoneVerificationScreen> {
  String code = '';
  bool codeSent = true;

  // Spacing multipliers
  static const double _spacingSmall = 0.01;
  static const double _spacingMedium = 0.015;
  static const double _spacingXLarge = 0.03;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final horizontalPadding = (size.width * 0.08).clamp(16.0, 28.0);

    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Verify Phone',
        showBackArrowIcon: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * _spacingXLarge),
              Text(
                'We sent a 6-digit code to:',
                style: AppTextStyle.bodySmall.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * _spacingSmall),
              Text(widget.phoneNumber, style: AppTextStyle.headlineSmall),
              SizedBox(height: screenHeight * _spacingXLarge),
              Center(
                child: OtpInput(
                  length: 6,
                  onChanged: (v) => setState(() => code = v),
                  onCompleted: (v) => setState(() => code = v),
                ),
              ),
              SizedBox(height: screenHeight * _spacingXLarge),
              PrimaryButton(
                onPressed: () {
                  if (code.length != 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter the 6-digit code')),
                    );
                    return;
                  }
                  widget.onVerified();
                },
                title: 'Verify',
                height: 48,
              ),
              SizedBox(height: screenHeight * _spacingMedium),
              TextButton(
                onPressed: codeSent
                    ? null
                    : () {
                        setState(() => codeSent = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code resent')),
                        );
                      },
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
