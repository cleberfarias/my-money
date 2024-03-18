import 'package:flutter/material.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/colors/components/app_logo_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 140, left: 25, right: 25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogoTitle(
                  title: "Login",
                  iconSize: 80,
                  titleSize: 20,
                ),
                TextFormField(
                  enabled: true,
                  controller: loginController,
                  textAlign: TextAlign.start,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text("Login")),
                ),
                TextFormField(
                  enabled: true,
                  controller: passwordController,
                  textAlign: TextAlign.start,
                  autofocus: false,
                  obscureText: true,
                  decoration: const InputDecoration(label: Text("Senha")),
                ),
                Padding(padding: const EdgeInsets.only(top: 20, bottom: 10,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                    child: const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                   ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
