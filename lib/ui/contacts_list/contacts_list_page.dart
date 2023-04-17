// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_field
import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  final List<Contact> _contacts = List.generate(
    50,
    (index) {
      return Contact(
        name: faker.person.firstName() + ' ' + faker.person.lastName(),
        email: faker.internet.freeEmail(),
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(_contacts[index].name),
              subtitle: Text(_contacts[index].email),
            );
          }),
          itemCount: _contacts.length,
        ));
  }
}
