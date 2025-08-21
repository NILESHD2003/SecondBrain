import 'package:objectbox/objectbox.dart';
import 'package:secondbrain_app/data/models/memory_file.dart';

@Entity()
class Memory {
  int id;

  String name;
  String description;
  @Property(type: PropertyType.date)
  DateTime createdAt;

  final files = ToMany<MemoryFile>();

  Memory({
    this.id = 0,
    required this.name,
    required this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
