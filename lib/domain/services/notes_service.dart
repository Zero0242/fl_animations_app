import '../domain.dart';

// * Se modifica un metodo en datasource, se modifica el mismo en repositorio
// * Las mismas funciones pero diferentes usos
// * El repositorio es el que debe ser instanciado en presentation
// * La fuente de datos es la que tiene el procedimiento o sea las funciones

/// Fuente de datos de las notas
abstract class NotesService {
  /// Carga las notas
  Future<List<Notes>> getNotes();

  /// Crear una nueva nota
  Future<Notes> addNote(Notes nota);

  /// Actualiza una nota y retorna su identificador
  Future<int> updateNote(Notes nota);

  /// Elimina la nota y retorna si fue eliminada o no
  Future<bool> removeNote(int id);
}
