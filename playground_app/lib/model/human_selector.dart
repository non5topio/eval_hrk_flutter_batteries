enum StudentSelector {
  id(displayName: 'ID'),
  name(displayName: 'Name'),
  cgpa(displayName: 'CGPA');

  const StudentSelector({required this.displayName});

  final String displayName;
}
