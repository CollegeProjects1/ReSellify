import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  static String verify = "";
  static String phonenumber = "";
  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  bool _isPhoneNumberVisible = true;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AssetImage resellAssest = AssetImage("images/resellify12.jpeg");
    Image image1 = Image(
      image: resellAssest,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFFDAEAFD),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, right: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcomepage');
                    },
                    child: Text("SKIP"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: image1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 5, right: 5),
                child: Container(
                  height: 480,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 30, left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Login to get started",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0XFF140A8C),
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                        child: _isPhoneNumberVisible
                            ? _buildPhoneNumberField()
                            : _buildEmailField(),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: 30, right: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isPhoneNumberVisible =
                                      !_isPhoneNumberVisible;
                                  _phoneController.clear();
                                  _emailController.clear();
                                });
                              },
                              child: Text(
                                _isPhoneNumberVisible
                                    ? 'Use Email-ID'
                                    : 'Use Phone Number',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: 80, bottom: 30, left: 20, right: 20),
                        color: Color(0xFFA9D6FF),
                        child: OutlinedButton(
                          onPressed: () async {
                            login.phonenumber = _phoneController.text;
                            print(_isPhoneNumberVisible
                                ? _phoneController.text
                                : _emailController.text);

                            await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '+91' + _phoneController.text,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  login.verify = verificationId;
                                  Navigator.pushNamed(context, '/pin');
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {});

                            Navigator.pushNamed(
                              context,
                              _isPhoneNumberVisible ? '/pin' : '/welcomepage',
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side:
                                BorderSide(width: 1, color: Color(0xFF0A8575)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("CONTINUE"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFFA9D6FF),
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixText: '+91',
        labelText: 'Phone Number',
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
