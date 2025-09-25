enum HiveTypes {
  // Products module
  categories(0),
  product(1),

  // Users module
  user(100),
  profile(101);

  final int id;
  const HiveTypes(this.id);
}
