import 'package:objectbox/objectbox.dart';
import 'package:secondbrain_app/data/models/document_chunk.dart';
import 'package:secondbrain_app/data/models/memory.dart';

@Entity()
class MemoryFile {
  int id;

  /// System generated unique name
  String autoName;

  /// Original name of the file
  String originalName;

  /// Internal persistent path
  String filePath;

  int sizeBytes;
  String mimeType;
  @Property(type: PropertyType.date)
  DateTime addedAt;

  final memory = ToOne<Memory>();
  final chunks = ToMany<DocumentChunk>();

  MemoryFile({
    this.id = 0,
    required this.autoName,
    required this.originalName,
    required this.filePath,
    required this.sizeBytes,
    required this.mimeType,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();
}
