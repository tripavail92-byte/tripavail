import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripavail/features/profile/widgets/contact_info_card.dart';
import 'package:tripavail/features/profile/widgets/payment_methods_card.dart';
import 'package:tripavail/features/profile/widgets/profile_header_card.dart';
import 'package:tripavail/utils/app_text_styles.dart';
import 'package:tripavail/utils/choose_photo_bottom_sheet.dart';
import 'package:tripavail/utils/profile_storage.dart';
import 'package:tripavail/utils/theme/constants/app_constants.dart';
import 'package:tripavail/utils/theme/constants/app_spacing.dart';
import 'package:tripavail/utils/theme/extension/role_theme_extension.dart';
import 'package:tripavail/widgets/app_scaffold.dart';
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

class PasswordData {
  String currentPassword;
  String newPassword;
  String confirmPassword;

  PasswordData({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isEditing = false;
  bool showChangePassword = false;

  late ProfileData profileData;
  late ProfileData editData;
  PasswordData passwordData = PasswordData();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'Maria Rodriguez',
      email: 'maria.rodriguez@gmail.com',
      phone: '+92 300 1234567',
      location: 'Lahore, Pakistan',
      address:
          'House 45, Block B, DHA Phase 5, Lahore, Punjab 54792',
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
      // Always refresh the edit buffer when toggling modes
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
      // Integrate backend update here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
    }
  }

  String? _validateName(String? val) {
    if (val == null || val.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  // Removed unused email validator; email edit moved out of About Me

  String? _validateBio(String? val) {
    if (val != null && val.length > 200) {
      return 'Bio must be under 200 characters';
    }
    return null;
  }

  // Removed inline password change validation; handled in dedicated form

  // Removed unused _updatePassword; password updates handled in _SecuritySettingsForm

  void _openPhotoSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      builder: (context) {
        return ChoosePhotoBottomSheet(
          onChooseFromLibraryPressed: () {
            Navigator.pop(context);
            // Handle gallery
          },
          onTakePhotoPressed: () {
            Navigator.pop(context);
            // Handle camera
          },
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
        (p.profileImage != null &&
            p.profileImage!.isNotEmpty) ||
        (p.avatarUrl != null && p.avatarUrl!.isNotEmpty);
    if (hasAvatar) {
      total += 10;
    }
    return total.clamp(0, 100);
  }

  // Removed old solid-color progress mapping in favor of app role gradient

  // Avatar UI moved to ProfileHeaderCard for narrower rebuild scope

  // Removed unused verification badge; verification shown in Contact Info card

  // Removed inline contact method row; contact info lives in its own card

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
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xFFDDDDDD),
      ),
    );
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
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              onSaved: (val) => editData.name = val ?? '',
              validator: _validateName,
            ),
          ),
          AppSpacing.v12(),
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
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
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

  // Removed unused inline security section; a dedicated screen is used instead

  // Header card moved into ProfileHeaderCard

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
            color: theme.textTheme.bodySmall?.color
                ?.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient:
                roleTheme?.primaryGradient ??
                AppRoleGradients.traveller,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _labeledField({
    required String label,
    required Widget field,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_labelWithAccent(label), field],
    );
  }

  // Contact rows moved into ContactInfoCard

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          profileData.dateOfBirth ?? DateTime(1992, 5, 15),
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
          profileData = profileData.copy()
            ..dateOfBirth = picked;
        }
      });
    }
  }

  // Contact card moved into ContactInfoCard

  // Navigation row moved into PaymentMethodsCard

  // Payment card moved into PaymentMethodsCard

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.contentMaxWidth,
              ),
              child: Padding(
                padding: AppSpacing.horizontalPadding(
                  context,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      AppSpacing.v24(),
                      ProfileHeaderCard(
                        name: profileData.name,
                        bio: profileData.bio,
                        joinDate: profileData.joinDate,
                        emailVerified:
                            profileData.emailVerified,
                        avatarUrl: profileData.avatarUrl,
                        completion: _calculateCompletion(
                          profileData,
                        ),
                        onChangePhoto: _openPhotoSheet,
                      ),
                      AppSpacing.v16(),
                      Card(
                        elevation: 2,
                        color: theme.colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          side: BorderSide(
                            color:
                                theme.brightness ==
                                    Brightness.dark
                                ? const Color(0xFF444444)
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Me',
                                style: AppTextStyle
                                    .headlineSmall,
                              ),
                              AppSpacing.v8(),
                              isEditing
                                  ? _buildEditMode()
                                  : _buildViewMode(),
                              AppSpacing.v8(),
                            ],
                          ),
                        ),
                      ),
                      AppSpacing.v16(),
                      ContactInfoCard(
                        email: profileData.email,
                        emailVerified:
                            profileData.emailVerified,
                        phone: profileData.phone,
                        phoneVerified:
                            profileData.phoneVerified,
                        address: profileData.address,
                        city: profileData.city,
                        locationVerified:
                            profileData.locationVerified,
                        dateOfBirth:
                            profileData.dateOfBirth,
                        onPickDob: _pickDob,
                        onVerifyPhone: () => Get.to(
                          () => _PhoneVerificationScreen(
                            phoneNumber: profileData.phone,
                            onVerified: () {
                              setState(() {
                                profileData =
                                    profileData.copy()
                                      ..phoneVerified =
                                          true;
                              });
                              Get.back();
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Phone verified',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      AppSpacing.v16(),
                      PaymentMethodsCard(
                        onWalletsTap: () => Get.to(
                          () =>
                              const _MobileWalletsScreen(),
                        ),
                        onCardsTap: () => Get.to(
                          () => const _PaymentCardsScreen(),
                        ),
                      ),
                      // Account Security removed (OTP login; no password)
                      AppSpacing.v24(),
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
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Mobile Wallets',
        showBackArrowIcon: true,
      ),
      child: Center(
        child: Text(
          'Coming soon',
          style: AppTextStyle.bodyLarge,
        ),
      ),
    );
  }
}

class _PaymentCardsScreen extends StatelessWidget {
  const _PaymentCardsScreen();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Cards',
        showBackArrowIcon: true,
      ),
      child: Center(
        child: Text(
          'Coming soon',
          style: AppTextStyle.bodyLarge,
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

class _PhoneVerificationScreenState
    extends State<_PhoneVerificationScreen> {
  String code = '';
  bool codeSent =
      true; // assume sent; integrate API to toggle

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: const PrimaryAppBar(
        title: 'Verify Phone',
        showBackArrowIcon: true,
      ),
      child: Padding(
        padding: AppSpacing.horizontalPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSpacing.v24(),
            Text(
              'We sent a 6-digit code to:',
              style: AppTextStyle.bodySmall.copyWith(
                color: theme.textTheme.bodySmall?.color
                    ?.withValues(alpha: 0.7),
              ),
            ),
            AppSpacing.v8(),
            Text(
              widget.phoneNumber,
              style: AppTextStyle.headlineSmall,
            ),
            AppSpacing.v24(),
            Center(
              child: OtpInput(
                length: 6,
                onChanged: (v) => setState(() => code = v),
                onCompleted: (v) =>
                    setState(() => code = v),
              ),
            ),
            AppSpacing.v24(),
            PrimaryButton(
              onPressed: () {
                if (code.length != 6) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Enter the 6-digit code',
                      ),
                    ),
                  );
                  return;
                }
                widget.onVerified();
              },
              title: 'Verify',
              height: 48,
            ),
            AppSpacing.v12(),
            TextButton(
              onPressed: codeSent
                  ? null
                  : () {
                      setState(() => codeSent = true);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text('Code resent'),
                        ),
                      );
                    },
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}

// Security settings removed (OTP login only).

// Widgets extracted to separate files under lib/features/profile/widgets/
// - ProfileHeaderCard
// - ContactInfoCard
// - PaymentMethodsCard
