import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/route/router_constants.dart';
import 'package:fitness_app/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _showEditProfile = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: ProfileCustomAppBar(
        title: _showEditProfile ? "Edit Profile" : "My Profile",
        onBack: _showEditProfile
            ? () => setState(() => _showEditProfile = false)
            : null,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 60.h),
            if (_showEditProfile)
              _buildEditProfileFields()
            else
              _buildProfileList(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppConstants.authPurple,
          ),
          padding: EdgeInsets.only(bottom: 40.h),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage("assets/images/ic_women.png"),
              ),
              Text(
                "Madison Smith",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "madison@example.com",
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -40.h,
          left: 24.w,
          right: 24.w,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFF8E7CF0),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildStatItem("75 Kg", "Weight")),
                _buildVerticalDivider(),
                Expanded(child: _buildStatItem("28", "Years Old")),
                _buildVerticalDivider(),
                Expanded(child: _buildStatItem("1.65 CM", "Height")),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(height: 36.h, width: 1.w, color: AppConstants.cWhite);
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white60, fontSize: 11.sp),
        ),
      ],
    );
  }

  Widget _buildProfileList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          _buildMenuItem(
            Icons.person,
            "Profile",
            onTap: () => setState(() => _showEditProfile = true),
          ),
          _buildMenuItem(
            Icons.star,
            "Favorite",
            onTap: () async {
              await GoRouter.of(context).push(RouterConstants.favoritesView);
            },
          ),
          _buildMenuItem(
            Icons.lock,
            "Privacy Policy",
            onTap: () {},
          ),
          _buildMenuItem(
            Icons.settings,
            "Settings",
            onTap: () {},
          ),
          _buildMenuItem(
            Icons.headset_mic,
            "Help",
            onTap: () {},
          ),
          _buildMenuItem(
            Icons.logout,
            "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileFields() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileField(
            label: "Full Name",
            controller: _nameController,
            icon: Icons.person_outline,
            hintText: "Madison Smith",
          ),
          SizedBox(height: 16.h),
          _buildProfileField(
            label: "Email",
            controller: _emailController,
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            hintText: "madison@example.com",
          ),
          SizedBox(height: 16.h),
          _buildProfileField(
            label: "Phone Number",
            controller: _phoneController,
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            hintText: "+123 567 89000",
          ),
          SizedBox(height: 16.h),
          _buildProfileField(
            label: "Date of Birth",
            controller: _dobController,
            icon: Icons.calendar_today_outlined,
            keyboardType: TextInputType.datetime,
            hintText: "01/05/199X",
          ),
          SizedBox(height: 16.h),
          _buildProfileField(
            label: "Weight",
            controller: _weightController,
            icon: Icons.calendar_today_outlined,
            keyboardType: TextInputType.datetime,
            hintText: "75Kg",
          ),
          SizedBox(height: 16.h),

          _buildProfileField(
            label: "Height",
            controller: _heightController,
            icon: Icons.calendar_today_outlined,
            keyboardType: TextInputType.datetime,
            hintText: "165 CM",
          ),
          SizedBox(height: 24.h),
          Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              height: 30.h,
              child: ElevatedButton(
                onPressed: () => setState(() => _showEditProfile = false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.authAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(
                  "Update Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildProfileField({
    required String hintText,
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppConstants.authPurple,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.white, fontSize: 15.sp),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppConstants.cWhite,
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 16.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Color(0xFF3A3A3A)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppConstants.authPurple,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: const BoxDecoration(
            color: Color(0xFFB1A1F8),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20.r),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.yellow,
          size: 14.r,
        ),
      ),
    );
  }
}

class ProfileCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileCustomAppBar({
    required this.title,
    super.key,
    this.onBack,
  });

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstants.authPurple,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppConstants.authAccent,
          size: 14.sp,
        ),
      ),
      titleSpacing: 0,
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(color: AppConstants.cWhite, fontSize: 16.sp),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
