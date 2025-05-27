import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselink/app/routes/app_pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A7C59),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Logo dan nama apli
                      // kasi
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
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Heading
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Selamat datang kembali!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Masukkan akun Anda untuk\nmelanjutkan.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Card Form di tengah dan lebih kecil
Center(
  child: ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 400),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFFB4D678),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Email', _emailController,
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildTextField('Password', _passwordController,
                obscureText: _obscurePassword, isPassword: true),
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
                  activeColor: Color(0xFFB4D678),
                  checkColor: Colors.white,
                ),
                Text(
                  'Remember Me',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF5D5555),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFB4D678),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  print('Login with $email and $password');
                  Get.offAllNamed(Routes.MOOD);
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/button/login-gepeng.png',
                    height: 48,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Anda belum punya akun?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Color(0xFF5D5555),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.SIGNUP),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB4D678),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),


const SizedBox(height: 40),

                      // Tombol back
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
          },
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
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: (value) =>
              (value == null || value.isEmpty) ? 'Field tidak boleh kosong' : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEFEFEF),
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ],
    );
  }
}
