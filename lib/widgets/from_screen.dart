import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _gender;
  String _option = 'Option 1';
  bool _agree = false;
  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_agree) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please accept terms')));
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form Submitted Successfully!')),
      );
    }
  }

  InputDecoration customDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Title
                  const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Please fill the form",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),

                  /// Name
                  TextFormField(
                    controller: _nameController,
                    decoration: customDecoration("Full Name", Icons.person),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Enter your name" : null,
                  ),
                  const SizedBox(height: 15),

                  /// Age
                  TextFormField(
                    controller: _ageController,
                    decoration: customDecoration("Age", Icons.cake),
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Enter age";
                      int? age = int.tryParse(v);
                      if (age == null) return "Enter valid number";
                      if (age < 18) return "Must be 18+";
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  /// Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: customDecoration("Password", Icons.lock)
                        .copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                    validator: (v) =>
                        v != null && v.length >= 6 ? null : "Min 6 characters",
                  ),
                  const SizedBox(height: 15),

                  /// Gender Dropdown
                  DropdownButtonFormField<String>(
                    value: _gender,
                    decoration: customDecoration("Gender", Icons.people),
                    items: const [
                      DropdownMenuItem(value: 'Male', child: Text('Male')),
                      DropdownMenuItem(value: 'Female', child: Text('Female')),
                    ],
                    onChanged: (v) => setState(() => _gender = v),
                    validator: (v) => v == null ? "Select gender" : null,
                  ),
                  const SizedBox(height: 20),

                  /// Radio Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Select Option",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Option 1",
                        groupValue: _option,
                        activeColor: Colors.blue,
                        onChanged: (v) => setState(() => _option = v!),
                      ),
                      const Text("Option 1"),
                      Radio<String>(
                        value: "Option 2",
                        groupValue: _option,
                        activeColor: Colors.blue,
                        onChanged: (v) => setState(() => _option = v!),
                      ),
                      const Text("Option 2"),
                    ],
                  ),

                  /// Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _agree,
                        activeColor: Colors.blue,
                        onChanged: (v) {
                          setState(() {
                            _agree = v!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "I agree to terms & conditions",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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
