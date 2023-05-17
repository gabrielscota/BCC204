import 'package:theory_of_graphs/edge.dart';
import 'package:theory_of_graphs/graph.dart';
import 'package:theory_of_graphs/vertex.dart';

class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(index: _nextIndex, data: data);
    _nextIndex++;

    // Add vertex to the graph and create an empty list of connections
    _connections[vertex] = [];
    return vertex;
  }

  @override
  void addEdge(Vertex<E> source, Vertex<E> destination, {EdgeType edgeType = EdgeType.undirected, double? weight}) {
    _connections[source]?.add(Edge(source: source, destination: destination, weight: weight));

    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(Edge(source: destination, destination: source, weight: weight));
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    final match = edges(source).where((edge) => edge.destination == destination);

    if (match.isEmpty) return null;

    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();

    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) => edge.destination).join(', ');

      result.writeln('$vertex -> $destinations');
    });

    return result.toString();
  }
}
