import 'package:block_pe/providers/theme_provider.dart';
import 'package:block_pe/screens/otp_input.dart';
import 'package:block_pe/utilities/error_dialog.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberInput extends StatefulWidget {
  const NumberInput({super.key});

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  late final TextEditingController _phoneNumber;
  Country _selectedCountry = Country.worldWide;

  @override
  void initState() {
    _phoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  void _openDropDown() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      countryListTheme: const CountryListThemeData(
        bottomSheetHeight: 500,
      ),
      onSelect: (Country country) {
        setState(
          () {
            _selectedCountry = country;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Number Verification"),
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggle();
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDark
                  ? Icons.toggle_on
                  : Icons.toggle_off,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _phoneNumber,
              keyboardType: TextInputType.number,
              enableSuggestions: false,
              onChanged: (value) {
                _phoneNumber.text = value;
              },
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      _openDropDown();
                    },
                    child: Text(
                      "${_selectedCountry.flagEmoji} + ${_selectedCountry.phoneCode}",
                      style: Provider.of<ThemeProvider>(context)
                          .theme
                          .textTheme
                          .labelMedium,
                    ),
                  ),
                ),
                label: const Text("Phone Number"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  _sendOTP(
                    context,
                    "+${_selectedCountry.phoneCode}${_phoneNumber.text}",
                  );
                },
                child: const Text("Verify your phone number"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendOTP(BuildContext context, String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          showErrorDialog(
            context,
            "An error occurred",
            error.message.toString(),
          );
        },
        codeSent: (verificationID, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                OTPInput(verificationID: verificationID);
                throw Exception("Null returned");
              },
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationID) {},
      );
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      if (e.code == '') {
        showErrorDialog(
          context,
          "An error occurred",
          "Try entering the OTP again",
        );
      }
    }
  }
}
