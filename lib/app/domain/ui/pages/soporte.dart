import 'package:flutter/material.dart';

class ContactInfo {
  final String phoneNumber;
  final String emailAddress;

  ContactInfo({
    required this.phoneNumber,
    required this.emailAddress,
  });
}

final ContactInfo contactInfo = ContactInfo(
  phoneNumber: '+1 234 567 890',
  emailAddress: 'Pichangasya@gmail.com',
);

class SoportePage extends StatelessWidget {
  const SoportePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/logo.jpeg'), // Agrega la imagen de la empresa aquí
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: const Text(
                '¡Contáctanos!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('Teléfono: ${contactInfo.phoneNumber}'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title:
                        Text('Correo Electrónico: ${contactInfo.emailAddress}'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '¿Problemas o preguntas? ¡Háganoslo saber!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Formulario para enviar problemas o preguntas
            Form(
              // Agrega tu lógica de formulario aquí
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    // Agrega controlador y validaciones según tus necesidades
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Correo Electrónico'),
                    keyboardType: TextInputType.emailAddress,
                    // Agrega controlador y validaciones según tus necesidades
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mensaje'),
                    maxLines: 5,
                    // Agrega controlador y validaciones según tus necesidades
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para enviar el formulario
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
