import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  Future<void> addDocument(
      String collectionPath, Map<String, dynamic> data) async {
    try {
      print('Attempting to add document to $collectionPath');
      var docRef = await _firestore.collection(collectionPath).add(data);
      print('Document added with ID: ${docRef.id}');
    } catch (e) {
      print('Error adding document: $e');
      throw Exception('Error adding document: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getDocuments(String collectionPath) async {
    try {
      final querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception('Error fetching documents: $e');
    }
  }

  Future<void> updateDocument(
      String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).update(data);
    } catch (e) {
      throw Exception('Error updating document: $e');
    }
  }

  Future<void> deleteDocument(String collectionPath, String docId) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).delete();
    } catch (e) {
      throw Exception('Error deleting document: $e');
    }
  }

  Future<Map<String, dynamic>?> getDocumentById(
      String collectionPath, String docId) async {
    try {
      final docSnapshot =
          await _firestore.collection(collectionPath).doc(docId).get();
      return docSnapshot.exists ? docSnapshot.data() : null;
    } catch (e) {
      throw Exception('Error fetching document by ID: $e');
    }
  }

  Future<Map<String, dynamic>?> getDocumentByField(
      String collectionPath, String field, dynamic value) async {
    try {
      final querySnapshot = await _firestore
          .collection(collectionPath)
          .where(field, isEqualTo: value)
          .get();
      return querySnapshot.docs.isNotEmpty
          ? querySnapshot.docs.first.data()
          : null;
    } catch (e) {
      throw Exception('Error fetching document by field: $e');
    }
  }
}
