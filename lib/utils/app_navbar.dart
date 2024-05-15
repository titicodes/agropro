import 'package:flutter/material.dart';

import '../pages/home/view/camera_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 70,
          width: 345,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    child: const Icon(
                      Icons.family_restroom,
                      color: Color(0xFF303030),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CamerapageWidget(),
                          ));
                    },
                  ),
                  label: 'Forum',
                  backgroundColor: const Color.fromARGB(255, 16, 15, 15),
                ),
                const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Icon(
                      Icons.house_outlined,
                      color: Color(0xFF303030),
                    ),
                  ),
                  label: 'My fam',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    child: const Icon(
                      Icons.perm_identity_rounded,
                      color: Color(0xFF303030),
                    ),
                  ),
                  label: 'Identity',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_hospital,
                    color: Color(0xFF303030),
                  ),
                  label: 'Diagnose',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_3_outlined,
                    color: Color(0xFF303030),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
