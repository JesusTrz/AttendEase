import 'package:flutter/material.dart';

class Folder {
  final String name;
  final List<Document> documents;

  Folder({required this.name, required this.documents});
}

class Document {
  final String title;
  final String content;

  Document({required this.title, required this.content});
}

class DocumentView extends StatelessWidget {
  final List<Folder> folders = [
    Folder(
      name: 'Carpeta 1',
      documents: [
        Document(title: 'Documento 1', content: 'Contenido del Documento 1'),
        Document(title: 'Documento 2', content: 'Contenido del Documento 2'),
        Document(title: 'Documento 3', content: 'Contenido del Documento 3'),
        Document(title: 'Documento 4', content: 'Contenido del Documento 4'),
      ],
    ),
    Folder(
      name: 'Carpeta 2',
      documents: [
        Document(title: 'Documento 1', content: 'Contenido del Documento 1'),
        Document(title: 'Documento 2', content: 'Contenido del Documento 2'),
        Document(title: 'Documento 3', content: 'Contenido del Documento 3'),
        Document(title: 'Documento 4', content: 'Contenido del Documento 4'),
      ],
    ),
    Folder(
      name: 'Carpeta 3',
      documents: [
        Document(title: 'Documento 1', content: 'Contenido del Documento 1'),
        Document(title: 'Documento 2', content: 'Contenido del Documento 2'),
        Document(title: 'Documento 3', content: 'Contenido del Documento 3'),
        Document(title: 'Documento 4', content: 'Contenido del Documento 4'),
      ],
    ),
    Folder(
      name: 'Carpeta 4',
      documents: [
        Document(title: 'Documento 1', content: 'Contenido del Documento 1'),
        Document(title: 'Documento 2', content: 'Contenido del Documento 2'),
        Document(title: 'Documento 3', content: 'Contenido del Documento 3'),
        Document(title: 'Documento 4', content: 'Contenido del Documento 4'),
      ],
    ),
    // Agrega más carpetas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentación y Recursos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: folders.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  folders[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FolderView(folder: folders[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class FolderView extends StatelessWidget {
  final Folder folder;

  FolderView({required this.folder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: folder.documents.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  folder.documents[index].title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DocumentDetailView(document: folder.documents[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DocumentDetailView extends StatelessWidget {
  final Document document;

  DocumentDetailView({required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document.title),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            document.content,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: DocumentView(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    ));
