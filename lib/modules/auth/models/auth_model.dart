// lib/modules/auth/models/auth_model.dart

// Modelo de módulo
class Module {
  final String id;
  final String name;
  final List<String> permissions;

  Module({required this.id, required this.name, required this.permissions});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      permissions: List<String>.from(json['permissions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'permissions': permissions};
  }
}

// Modelo de usuario
class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final List<Module> modules;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.modules,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      modules: (json['modules'] as List<dynamic>? ?? [])
          .map((m) => Module.fromJson(m))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
}
