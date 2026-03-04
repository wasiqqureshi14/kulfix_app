import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/auth/presentation/providers/phone_auth_provider.dart';
import 'package:kulfix/features/auth/presentation/providers/country_provider.dart';
import 'package:kulfix/features/auth/presentation/screens/otp/otp_screen.dart';
import 'package:kulfix/features/auth/presentation/widgets/phone_input_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PhoneLoginScreen extends ConsumerStatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  ConsumerState<PhoneLoginScreen> createState() =>
      _PhoneLoginScreenState();
}

class _PhoneLoginScreenState
    extends ConsumerState<PhoneLoginScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(countriesProvider);
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(phoneAuthProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),

              const SizedBox(height: 15),

              Center(
                child: Column(
                  children: [

                 

                    Text(
                      "Enter your phone number to get started.",
                      style:
                          TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const PhoneInputCard(),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: state.isValid
                      ? () async {

                          final phoneState =
                              ref.read(phoneAuthProvider);

                          final fullPhone =
                              "${phoneState.selectedCountry.dialCode}${phoneState.phone}";

                          /// ✅ Send OTP (non-blocking feel)
                          await Supabase.instance.client.auth
                              .signInWithOtp(
                            phone: fullPhone,
                          );

                          if (!context.mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  OTPScreen(phone: fullPhone),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "SEND VERIFICATION CODE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}