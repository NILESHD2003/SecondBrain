import 'package:objectbox/objectbox.dart';
import 'package:secondbrain_app/data/models/memory_file.dart';
import 'dart:typed_data';

@Entity()
class DocumentChunk {
  int id;

  /// Raw chunk content (e.g. 200–500 tokens)
  String content;

  /// Order of chunk in file
  int chunkIndex;

  /// Store embedding with HNSW index
  @Property(type: PropertyType.floatVector)
  @HnswIndex(dimensions: 768, distanceType: VectorDistanceType.cosine)
  @Property(type: PropertyType.byteVector)
  late Float32List embedding;

  final memoryFile = ToOne<MemoryFile>();

  DocumentChunk({
    this.id = 0,
    required this.content,
    required this.chunkIndex,
    required this.embedding,
  });
}
