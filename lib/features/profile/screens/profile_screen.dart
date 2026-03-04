import 'package:flutter/material.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/name_input_card.dart';
import '../widgets/language_selector.dart';
import '../widgets/continue_button.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
     
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints){
        return SingleChildScrollView(
            keyboardDismissBehavior:
            ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
            
                     GestureDetector(
                      onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(height: 30),
            
                  Text(
                    "Set Up Your Profile",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
            
                  SizedBox(height: 30),
            
                  ProfileAvatar(),
            
                  SizedBox(height: 25),
            
                  NameInputCard(),
            
                  SizedBox(height: 20),
            
                  LanguageSelector(),

                  SizedBox(height: 80),
           
                  ContinueButton(),
                ],
              ),
            ),
          );
          }
        ),
      ),
    );
  }
}