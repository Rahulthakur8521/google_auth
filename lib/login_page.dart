import 'package:flutter/material.dart';
import 'home_page.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  ValueNotifier userCredential = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignIn Screen'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: userCredential,
        builder: (context, value, child) {
          return (userCredential.value == '' || userCredential.value == null)
              ? Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 10),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: () async{
                        userCredential.value = await signInWithGoogle();
                        if(userCredential.value != null);
                        print(userCredential.value.user!.email);

                      }, child: Text('google')
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
              : Center(
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       clipBehavior: Clip.antiAlias,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(width: 1.5, color: Colors.black54),
            //       ),
            //       child: Image.network(
            //           userCredential.value.user!.photoURL.toString()),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Text(userCredential.value.user!.displayName.toString()),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //     Text(userCredential.value.user!.email.toString()),
            //     const SizedBox(
            //       height: 30,
            //     ),
            //     ElevatedButton(
            //       onPressed: () async {
            //         bool result = await signOutFromGoogle();
            //         if (result) userCredential.value = '';
            //       },
            //       child: const Text('Logout'),
            //     ),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
