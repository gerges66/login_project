import 'package:auth_app/core/utils/api_service.dart';
import 'package:auth_app/core/utils/constants.dart';
import 'package:auth_app/features/home/view/home_view.dart';

import 'package:auth_app/features/login/data/repositories/repo_impl.dart';
import 'package:auth_app/features/login/view_model/cubit/login/login_cubit.dart';
import 'package:auth_app/features/login/view_model/cubit/login/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {


//     return BlocProvider(
//         create: (context) => LoginCubit(
//               loginRepo: LoginRepoImplemention(ApiService(Dio())),
//               child: Scaffold(
//                 body: BlocConsumer<LoginCubit,LoginState>(
//                   listener: (context, state) {
//                   if(state is SuccessLogin){
//                   SnackBar(content: Text("login success"),duration: Duration(seconds: 1),backgroundColor: Colors.cyanAccent,);
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
//                   } else if(state is FailureLogin){
//                      SnackBar(content: Text("login Faluire"),duration: Duration(seconds: 1),backgroundColor: Colors.cyanAccent,);
//                   }else{
//                      SnackBar(content: Text("loading"),duration: Duration(seconds: 1),backgroundColor: Colors.cyanAccent,);
//                   }

//                   },
//                   builder: (context, state) {
//                     var c = context.read<LoginCubit>();

//                     return SingleChildScrollView(
//                       child: Form(
//                         key: c.formKey,
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 250,
//                             ),
//                             Center(
//                                 child: Text(
//                               "Login page",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.w600),
//                             )),
//                             Image.asset(
//                               img,
//                               width: 140,
//                               height: 140,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               child: TextFormField(
//                                 controller: c.emailController,
//                                 validator: (data) {
//                                   if (data!.isEmpty) {
//                                     return 'field is required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: "email",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 12,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: TextFormField(
//                                 controller: c.passwordController,
//                                 validator: (data) {
//                                   if (data!.isEmpty) {
//                                     return 'field is required';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   hintText: "password",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // TextButton(
//                             //     style: ButtonStyle(
//                             //       backgroundColor: WidgetStatePropertyAll(Colors.blue),
//                             //     ),
//                             //     onPressed: () {
//                             //        // if (globalKey.currentState!.validate()) {
//                             //        if(_formKey.currentState!.validate()) {

//                             //        }

//                             //     },
//                             //     child: Text(
//                             //       "Login",
//                             //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                             //     ))
//                             SizedBox(
//                               height: 12,
//                             ),
//                             c.isLoading == false
//                                 ? CustomButton(c: c)
//                                 : CircularProgressIndicator(),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ));
return BlocProvider<LoginCubit>(
  create: (context) => LoginCubit(loginRepo: LoginRepoImplemention(ApiService(Dio()))),
  child: 

  Scaffold(
    body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLogin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login success"),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.cyanAccent,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        } else if (state is FailureLogin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Failure"),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.cyanAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Loading"),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.cyanAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        final c = context.read<LoginCubit>();
        return SingleChildScrollView(
          child: Form(
            key: c.formKey,
            child: Column(
              children: [
                SizedBox(height: 250),
                Center(
                  child: Text(
                    "Login page",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                Image.asset(
                  img,
                  width: 140,
                  height: 140,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: c.emailController,
                    validator: (data) {
                      if (data!.isEmpty) return 'Field is required';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: c.passwordController,
                    validator: (data) {
                      if (data!.isEmpty) return 'Field is required';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                c.isLoading == false
                    ? CustomButton(c: c)
                    : CircularProgressIndicator(),
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


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.c,
  });

  final LoginCubit c;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // specify the width
      height: 50, // specify the height
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: () {
          // if (c.formKey.currentState!.validate()) {
          //   c.loginUser();
          // }
          c.loginValidate();

        },
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // change the text color
          ),
        ),
      ),
    );
  }
}
