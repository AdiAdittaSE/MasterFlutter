import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/login_img.png'),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            'Welcome',
            style: TextStyle(fontSize: 24),
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter User Name',
                    labelText: 'User Name',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, child: Text('Login')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
