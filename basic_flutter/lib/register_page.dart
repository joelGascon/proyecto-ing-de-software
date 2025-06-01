import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  DateTime? _birthDate;
  String? _email;
  String? _password;
  String? _confirmPassword;

  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final initialDate = _birthDate ?? DateTime(2000, 1, 1);
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Selecciona tu fecha de nacimiento',
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }


final Color customOrange = const Color(0xFFFF9800);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.orange[600],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Nombre
                TextFormField(
                  style: TextStyle(color: Colors.orange[900]),
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                  onSaved: (value) => _firstName = value?.trim(),
                ),
                SizedBox(height: 20),

                // Apellido
                TextFormField(
                  style: TextStyle(color: Colors.orange[900]),
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor ingresa tu apellido';
                    }
                    return null;
                  },
                  onSaved: (value) => _lastName = value?.trim(),
                ),
                SizedBox(height: 20),

                // Fecha de nacimiento
                TextFormField(
                  controller: _dateController,
                  style: TextStyle(color: Colors.orange[900]),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.orange[600]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (_birthDate == null) {
                      return 'Por favor selecciona tu fecha de nacimiento';
                    }
                    return null;
                  },
                  onTap: () => _selectDate(context),
                ),
                SizedBox(height: 20),

                // Correo electrónico
                TextFormField(
                  style: TextStyle(color: Colors.orange[900]),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.orange[600]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                      return 'Correo no válido';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                SizedBox(height: 20),

                // Contraseña
                TextFormField(
                  style: TextStyle(color: Colors.orange[900]),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.orange[600]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),
                SizedBox(height: 20),

                // Confirmar contraseña
                TextFormField(
                  style: TextStyle(color: Colors.orange[900]),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    labelStyle: TextStyle(color: Colors.orange[700]),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[400]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[700]!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.orange[600]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor confirma tu contraseña';
                    }
                    if (value != _password) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                  onSaved: (value) => {},
                ),
                SizedBox(height: 32),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.orange[600],
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _submit,
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Registro completado para $_firstName $_lastName ($_email)'),
        backgroundColor: Colors.orange[600],
      ));
      Navigator.pop(context);
    }
  }
}