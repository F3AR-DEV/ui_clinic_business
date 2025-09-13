import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String phone;

  const UserRow({
    super.key,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          const Expanded(child: CircleAvatar(child: Icon(Icons.person))),
          Expanded(child: Text(name)),
          Expanded(child: Text(username)),
          Expanded(child: Text(email)),
          Expanded(child: Text(phone)),
          Expanded(
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
