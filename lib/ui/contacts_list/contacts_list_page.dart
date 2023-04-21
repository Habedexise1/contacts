// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_field
import 'package:contact_app/data/contact.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late final List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(
      50,
      (index) {
        return Contact(
          name: faker.person.firstName() + ' ' + faker.person.lastName(),
          email: faker.internet.freeEmail(),
          phoneNumber: faker.randomGenerator.integer(1000000).toString(),
        );
      },
    );
  }

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
              trailing: IconButton(
                onPressed: () {
                  setState(
                    () {
                      _contacts[index].isFavorite =
                          !_contacts[index].isFavorite;
                      _contacts.sort(((a, b) {
                        if (a.isFavorite) {
                          // contact will be before contact two
                          return -1;
                        } else if (b.isFavorite) {
                          //contact will be after contact two
                          return 1;
                        } else {
                          //the position doesnt change
                          return 0;
                        }
                      }));
                    },
                  );
                },
                icon: Icon(
                    _contacts[index].isFavorite
                        ? Icons.star
                        : Icons.star_border,
                    color: _contacts[index].isFavorite
                        ? Colors.amber
                        : Colors.grey),
              ),
            );
          }),
          itemCount: _contacts.length,
        ));
  }
}
