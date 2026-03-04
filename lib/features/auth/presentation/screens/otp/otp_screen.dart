import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/auth/presentation/providers/otp_provider.dart';
import 'package:kulfix/features/auth/presentation/widgets/otp_input_boxes.dart';
import 'package:kulfix/features/profile/screens/profile_screen.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String phone;

  const OTPScreen({super.key, required this.phone});

  @override
  ConsumerState<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(otpProvider.notifier).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(otpProvider);
    final notifier = ref.read(otpProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Verify Your Number",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Enter the 6-digit code sent to ${widget.phone}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 40),

                    const OTPInputBoxes(),

                    const SizedBox(height: 30),

                    Center(
                      child: Column(
                        children: [
                          Text(
                            state.formattedTime, // ✅ fixed timer
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text("Time Remaining"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

Center(
  child: state.canResend
      ? TextButton(
          onPressed: () {
            ref
                .read(otpProvider.notifier)
                .resendOTP(widget.phone);
          },
          child: state.isResending
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
        )
      : Text(
          "Didn't receive code?",
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
),

                    const SizedBox(height: 60),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {

                          if (!state.isComplete) return;

                          final success =
                              await notifier.verifyOTP(widget.phone);

                          if (success && context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const ProfileSetupScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "VERIFY & CONTINUE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}