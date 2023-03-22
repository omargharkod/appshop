import 'package:flutter/cupertino.dart';

class ArchiveTasks extends StatefulWidget {
  const ArchiveTasks({super.key});

  @override
  State<ArchiveTasks> createState() => _ArchiveTasksState();
}

class _ArchiveTasksState extends State<ArchiveTasks> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('archive'),
    );
  }
}
