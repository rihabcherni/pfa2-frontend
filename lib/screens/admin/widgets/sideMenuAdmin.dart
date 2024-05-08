import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_dashboard_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/admin_profile_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/teachers_admin_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/courses_admin_screen.dart';
import 'package:pfa_frontend/screens/admin/pages/students_admin_screen.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/size_config.dart';

class SideMenuAdmin extends StatelessWidget {
  const SideMenuAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.getInstance().screenHeight,
        decoration: BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/admin/mac-action.svg'),
                ),
              ),

              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.home,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminDashboardScreen(),
                        ));
                  }),
              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.school,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Students(),
                        ));
                  }),

              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.people,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Authors(),
                        ));
                  }),
              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.book_rounded,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Courses(),
                        ));
                  }),
              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  icon: Icon(
                    Icons.manage_accounts,
                    color: AppColors.iconGray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminProfileScreen(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
