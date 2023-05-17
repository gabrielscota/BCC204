import 'package:theory_of_graphs/vertex.dart';

enum EdgeType { directed, undirected }

class Edge<T> {
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;

  Edge({
    required this.source,
    required this.destination,
    this.weight,
  });
}
