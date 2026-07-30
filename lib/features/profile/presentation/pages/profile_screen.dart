import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riwaq/core/constants/app_colors.dart';
import 'package:riwaq/core/constants/app_styles.dart';
import 'package:riwaq/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:riwaq/features/home/presentation/pages/main_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'محمد حسن',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+201100010001',
  );

  String? _selectedGender = 'ذكر';
  DateTime? _selectedDate = DateTime(2004, 10, 1);

  String get _formattedDate {
    if (_selectedDate == null) return '';
    return '${_selectedDate!.day.toString().padLeft(2, '0')}/'
        '${_selectedDate!.month.toString().padLeft(2, '0')}/'
        '${_selectedDate!.year}';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MainScreen()),
                );
              },
              child: const Icon(CupertinoIcons.arrow_right),
            ),
          ),
        ],
        title: const Text('حسابى'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Gap(20),
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(64),
                    child: Image.asset(
                      'assets/images/book5.jpg',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 4,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.camera,
                          size: 15,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),

            // المعلومات الاساسية
            Text(
              'المعلومات الاساسية',
              style: AppStyles.bold13.copyWith(
                color: AppColors.black.withValues(alpha: 0.8),
              ),
            ),
            const Gap(20),

            _buildLabel('الاسم كامل'),
            const Gap(10),
            CustomTextField(
              controller: _nameController,
              hintText: 'الاسم كامل',
            ),
            const Gap(20),

            _buildLabel('تاريخ الميلاد'),
            const Gap(10),
            _buildDropdownField(value: _formattedDate, onTap: _pickDate),
            const Gap(20),

            _buildLabel('الجنس'),
            const Gap(10),
            _buildDropdownField(
              value: _selectedGender ?? '',
              onTap: () => _showGenderSheet(context),
            ),
            const Gap(30),

            // معلومات التواصل
            Text(
              'معلومات التواصل',
              style: AppStyles.bold13.copyWith(
                color: AppColors.black.withValues(alpha: 0.8),
              ),
            ),
            const Gap(20),

            _buildLabel('رقم التلفون'),
            const Gap(10),
            CustomTextField(
              controller: _phoneController,
              hintText: 'رقم التلفون',
              keyboardType: TextInputType.phone,
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppStyles.bold13.copyWith(
        color: AppColors.black.withValues(alpha: 0.4),
        fontSize: 10,
      ),
    );
  }


  Widget _buildDropdownField({
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              CupertinoIcons.chevron_down,
              size: 16,
              color: AppColors.black.withValues(alpha: 0.4),
            ),
            Text(value, style: AppStyles.bold13.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  void _showGenderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['ذكر', 'أنثى'].map((gender) {
              return ListTile(
                title: Text(
                  gender,
                  textAlign: TextAlign.end,
                  style: AppStyles.bold13,
                ),
                onTap: () {
                  setState(() => _selectedGender = gender);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
