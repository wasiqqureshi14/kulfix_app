import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/otp_provider.dart';

class OTPInputBoxes extends ConsumerStatefulWidget {
  const OTPInputBoxes({super.key});

  @override
  ConsumerState<OTPInputBoxes> createState() =>
      _OTPInputBoxesState();
}

class _OTPInputBoxesState
    extends ConsumerState<OTPInputBoxes> {

  final controllers =
      List.generate(6, (_) => TextEditingController());

  final focusNodes =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final notifier = ref.read(otpProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {

        return SizedBox(
          width: 48,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) {

              if (event is RawKeyDownEvent &&
                  event.logicalKey ==
                      LogicalKeyboardKey.backspace) {

                if (controllers[index].text.isEmpty &&
                    index > 0) {

                  focusNodes[index - 1].requestFocus();

                  controllers[index - 1].clear();
                  notifier.updateDigit(index - 1, '');
                }
              }
            },
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {

                notifier.updateDigit(index, value);

                /// ✅ Move forward
                if (value.isNotEmpty && index < 5) {
                  focusNodes[index + 1].requestFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}