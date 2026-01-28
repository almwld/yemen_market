import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/cubit/auth_cubit.dart';
import '../presentation/cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLogin = true;
  String role = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'تسجيل الدخول' : 'إنشاء حساب'),
        centerTitle: true,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                  ),
                ),
                const SizedBox(height: 16),

                if (!isLogin)
                  DropdownButton<String>(
                    value: role,
                    items: const [
                      DropdownMenuItem(
                        value: 'user',
                        child: Text('مستخدم'),
                      ),
                      DropdownMenuItem(
                        value: 'seller',
                        child: Text('تاجر'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        role = value!;
                      });
                    },
                  ),

                const SizedBox(height: 24),

                if (state is AuthLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      if (isLogin) {
                        context
                            .read<AuthCubit>()
                            .login(email, password);
                      } else {
                        context
                            .read<AuthCubit>()
                            .register(email, password, role);
                      }
                    },
                    child: Text(isLogin ? 'دخول' : 'تسجيل'),
                  ),

                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'ليس لديك حساب؟ أنشئ حسابًا'
                        : 'لديك حساب؟ تسجيل الدخول',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
