import 'package:theory_of_graphs/edge.dart';
import 'package:theory_of_graphs/vertex.dart';

abstract class Graph<E> {
  // Return all vertices of graph
  Iterable<Vertex<E>> get vertices;

  // Create vertex and adds it to the graph
  Vertex<E> createVertex(E data);

  // Connect two vertices in the graph
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType,
    double? weight,
  });

  // Return a list of outgoing edges from a specific vertex
  List<Edge<E>> edges(Vertex<E> source);

  // Method to define weight of some edge
  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  );
}
