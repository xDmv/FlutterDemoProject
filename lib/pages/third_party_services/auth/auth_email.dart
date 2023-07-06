import 'dart:io';

import 'package:example_app/generated/l10n.dart';
import 'package:example_app/utils/disposables_mixin.dart';
import 'package:example_app/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthEmailPage extends StatefulWidget {
  const AuthEmailPage({super.key});

  static const path = '/email_auth';

  @override
  State<AuthEmailPage> createState() => _AuthEmailPageState();
}

class _AuthEmailPageState extends State<AuthEmailPage>
    with DisposablesMixin<AuthEmailPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailCtr = createCtrl();
  late final TextEditingController _pwCtr = createCtrl();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    final avatarUrl = user?.photoURL ??
        'https://www.pngitem.com/pimgs/m/581-5813504_avatar-dummy-png-transparent-png.png';
    var displayName = user?.displayName ?? '';
    displayName = displayName.isEmpty ? '???' : displayName;
    final isAuth = user != null;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).authorization)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Visibility(
                  visible: !isAuth,
                  child: Column(
                    children: [
                      /// Email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: S.of(context).email,
                          labelText: S.of(context).email,
                        ),
                        controller: _emailCtr,
                        validator: (val) =>
                            Validators.emailValidator(val, context),
                      ),
                      const SizedBox(height: 10),

                      /// Password
                      TextFormField(
                        validator: (val) =>
                            Validators.passwordValidator(val, context),
                        controller: _pwCtr,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: S.of(context).password,
                          labelText: S.of(context).password,
                        ),
                      ),

                      const SizedBox(height: 36),

                      /// Login button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signIn,
                          child: Text(S.of(context).login),
                        ),
                      ),

                      /// SignUp button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signUp,
                          child: Text(S.of(context).signup),
                        ),
                      ),
                      const SizedBox(height: 30),

                      if (Platform.isAndroid)
                        SizedBox(
                          width: double.infinity,
                          child: SignInButton(
                            Buttons.Google,
                            text: S.of(context).loginWithGoogle,
                            onPressed: _signInWithGoogle,
                          ),
                        ),

                      if (Platform.isIOS)
                        SizedBox(
                          width: double.infinity,
                          child: SignInButton(
                            Buttons.Apple,
                            text: S.of(context).loginWithApple,
                            onPressed: () {},
                          ),
                        ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isAuth,
                  child: Column(
                    children: [
                      const SizedBox(height: 36),

                      SizedBox(
                        height: 120,
                        width: 120,
                        child: FadeInImage(
                          image: NetworkImage(avatarUrl),
                          placeholder: const AssetImage('assets/logo.png'),
                        ),
                      ),

                      const SizedBox(height: 8),
                      Text("ID: ${user?.uid}"),
                      const SizedBox(height: 8),
                      Text("Email: ${user?.email}"),
                      const SizedBox(height: 8),
                      Text("Display Name: $displayName"),
                      const SizedBox(height: 36),

                      /// Logout button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await _auth.signOut();
                            setState(() {});
                          },
                          child: Text(S.of(context).logout),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    final fieldsIsValid = _formKey.currentState?.validate() ?? false;
    if (fieldsIsValid) {
      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: _emailCtr.text.trim(),
          password: _pwCtr.text.trim(),
        );

        final authResult = await _auth.signInWithCredential(credential);
        final _user = authResult.user;

        print("User Name: ${_user?.displayName}");
        print("User Email ${_user?.email}");

        _showSnackBar(S.of(context).authorizationWasSuccessful);
        setState(() {});
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          _showSnackBar(S.of(context).thePasswordIsInvalidOrTheUserDoesNotHave);
          print(
              'The password is invalid or the user does not have a password.');
        } else if (e.code == 'user-not-found') {
          _showSnackBar(S
              .of(context)
              .thereIsNoUserRecordCorrespondingToThisIdentifierThe);
          print(S
              .of(context)
              .thereIsNoUserRecordCorrespondingToThisIdentifierThe);
        } else if (e.code == 'too-many-requests') {
          _showSnackBar(
              S.of(context).weHaveBlockedAllRequestsFromThisDeviceDueTo);
          print(S
              .of(context)
              .thereIsNoUserRecordCorrespondingToThisIdentifierThe);
        } else {
          _showSnackBar(S.of(context).someError);
        }
      } catch (e) {
        _showSnackBar(S.of(context).someError);

        print(e);
      }
    }
  }

  Future<void> _signUp() async {
    final fieldsIsValid = _formKey.currentState?.validate() ?? false;
    if (fieldsIsValid) {
      try {
        final credential = await _auth.createUserWithEmailAndPassword(
          email: _emailCtr.text.trim(),
          password: _pwCtr.text.trim(),
        );

        _showSnackBar(S.of(context).signUpWasSuccessful);
        setState(() {});
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showSnackBar(S.of(context).thePasswordProvidedIsTooWeak);
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          _showSnackBar(S.of(context).theAccountAlreadyExistsForThatEmail);
          print('The account already exists for that email.');
        }
      } catch (e) {
        _showSnackBar(S.of(context).someError);
        print(e);
      }
    }
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    final googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final authResult = await _auth.signInWithCredential(credential);
    final _user = authResult.user;
    assert(!(_user?.isAnonymous ?? false));

    print("User Name: ${_user?.displayName}");
    print("User Email ${_user?.email}");
    setState(() {});
  }
}
