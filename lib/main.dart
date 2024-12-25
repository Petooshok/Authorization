import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Авторизация',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Логика входа
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вход выполнен!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Авторизация',
                    style: TextStyle(fontSize: isSmallScreen ? 24 : 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 90), // Нижний отступ от заголовка
                  SizedBox(
                    width: isSmallScreen ? screenWidth * 0.8 : 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Логин',
                        labelStyle: const TextStyle(color: Colors.grey), // Цвет шрифта
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // Убираем границы
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        fillColor: const Color.fromRGBO(240, 239, 244, 1), 
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите логин';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: isSmallScreen ? screenWidth * 0.8 : 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Пароль',
                        labelStyle: const TextStyle(color: Colors.grey), // Цвет шрифта
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // Убираем границы
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                         
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        fillColor: const Color.fromRGBO(240, 239, 244, 1), 
                        filled: true,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите пароль';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                 
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor:  const Color.fromARGB(210,11,107,254),
                    ),
                    const Text('Запомнить меня', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: isSmallScreen ? screenWidth * 0.8 : 300,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(210,11,107,254),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: const Text('Войти'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: isSmallScreen ? screenWidth * 0.8 : 300,
                    child: OutlinedButton(
                      onPressed: () {
                        // Логика для регистрации
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: const Text('Регистрация', style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Логика для восстановления пароля
                    },
                    child: const Text('Восстановить пароль', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}