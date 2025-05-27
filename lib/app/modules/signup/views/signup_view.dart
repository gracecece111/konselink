import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/routes/app_pages.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Logo dan nama aplikasi
              Row(
                children: [
                  Image.asset(
                    'assets/logo/logo-splash.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'KonseLink',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF84B547),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Heading dan Subheading
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Ayo buat akun Anda!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D5555),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Temukan dukungan yang\nAnda butuhkan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFF5D5555),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Green Card Form tanpa animasi
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                decoration: BoxDecoration(
                  color: const Color(0xFFB4D678),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField('Nama Panjang', _fullNameController),
                      const SizedBox(height: 12),
                      _buildTextField('Nama Panggilan', _nickNameController),
                      const SizedBox(height: 12),
                      _buildTextField('Email', _emailController, keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 12),
                      _buildTextField('Password', _passwordController, obscureText: _obscurePassword, isPassword: true),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val!;
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Color(0xFFB4D678),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigasi ke halaman login
                            Get.toNamed(Routes.LOGIN);
                          }
                        },

                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/button/signup-gepeng.png',
                              height: 48,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Text(
                        'Anda sudah punya akun?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Color(0xFF5D5555),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Tombol back tanpa animasi
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/button/back.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: (value) => (value == null || value.isEmpty) ? 'Field tidak boleh kosong' : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ],
    );
  }
}
