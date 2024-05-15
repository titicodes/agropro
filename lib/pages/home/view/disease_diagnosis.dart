import 'package:agropro/utils/app_navbar.dart';
import 'package:flutter/material.dart';

class DiagnosepageWidget extends StatefulWidget {
  const DiagnosepageWidget({super.key});

  @override
  State<DiagnosepageWidget> createState() => _DiagnosepageWidgetState();
}

class _DiagnosepageWidgetState extends State<DiagnosepageWidget> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;

        return Scaffold(
          backgroundColor: const Color(0xFFECF0EA),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.1),
            child: AppBar(
              backgroundColor: const Color(0xFFECF0EA),
              automaticallyImplyLeading: true,
              title: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 380, 0),
                child: Text(
                  'Diagnose',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFF6FBD53),
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              elevation: 4,
            ),
          ),
          body: SafeArea(
              top: true,
              bottom: false,
              child: Stack(
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.86, -0.97),
                    child: Text(
                      'see More',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF6FBD53),
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.89, -0.98),
                    child: Text(
                      'Common diseases',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.94, -0.96),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF6FBD53),
                      size: 13,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.04, -0.83),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white, // Replace with your desired color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Frame 1000009180.png',
                            width: 120,
                            height: 122,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.98, -0.82),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white, // Replace with your desired color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Frame 1000009181.png',
                            width: 120,
                            height: 122,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.92, -0.8),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white, // Replace with your desired color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/Frame 1000009179.png',
                          width: 120,
                          height: 122,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                 const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0,10,0,0),
                    child: Align(
                      alignment: AlignmentDirectional(0.88, -0.45),
                      child: Text(
                        'Agaricomycetes',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0,10,0,0),
                    child:  Align(
                      alignment: AlignmentDirectional(-0.9, -0.44),
                      child: Text(
                        'Abiotic',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsetsDirectional.fromSTEB(0,10,0,0),
                    child:  Align(
                      alignment: AlignmentDirectional(-0.12, -0.45),
                      child: Text(
                        'Alternaria',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.03, -0.09),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Container(
                        width: 352,
                        height: 234,
                        decoration: BoxDecoration(
                          color:
                              Colors.white, // Replace with your desired color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Group 1000001925 (1).png',
                            width: 300,
                            height: 222,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 350, 0, 0),
                    child: Align(
                      alignment: const AlignmentDirectional(-0.15, 0.67),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                        child: Container(
                          width: 342,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xFFECF0EA),
                          ),
                          child: Stack(
                            children: [
                              const Align(
                                alignment: AlignmentDirectional(0, -0.85),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Take photos to find out what is infecting your plants and get treatment tips to get it healthy.',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-0.12, 0.29),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(323, 45),
                                    backgroundColor: const Color(0xFF6FBD53),
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    textStyle: const TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                    ),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Diagnose plant',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(70,540,0,0),
                    child: CustomBottomNavBar(currentIndex: 1, onTap: (int ) {  },),
                  )
                ],
              )),
        );
      },
    );
  }
}