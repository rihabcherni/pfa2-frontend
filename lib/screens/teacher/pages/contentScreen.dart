// content_screen.dart

import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/content.dart';
import 'package:pfa_frontend/models/teacher/cours.dart';

class ContentScreen extends StatefulWidget {
  final Function(Content) onContentAdded;

  ContentScreen({required this.onContentAdded});

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  Map<ContentType, bool> _expansionStates = {
    ContentType.Text: false,
    ContentType.Image: false,
    ContentType.Video: false,
    ContentType.Audio: false,
  };

  TextEditingController _mediaUrlController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _mediaUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Content'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExpansionPanel(
              title: 'Text',
              type: ContentType.Text,
            ),
            SizedBox(height: 20),
            _buildExpansionPanel(
              title: 'Image',
              type: ContentType.Image,
            ),
            SizedBox(height: 20),
            _buildExpansionPanel(
              title: 'Video',
              type: ContentType.Video,
            ),
            SizedBox(height: 20),
            _buildExpansionPanel(
              title: 'Audio',
              type: ContentType.Audio,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionPanel(
      {required String title, required ContentType type}) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _expansionStates[type] = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text(title),
                onTap: () {
                  setState(() {
                    _expansionStates[type] = !isExpanded;
                  });
                },
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                if (type != ContentType.Text) ...{
                  TextFormField(
                    controller: _mediaUrlController,
                    decoration: InputDecoration(
                      labelText: 'Media URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                },
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _addContent(type);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text(
                    'Add $title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          isExpanded: _expansionStates[type] ?? false,
        ),
      ],
    );
  }

  void _addContent(ContentType type) {
    String mediaUrl = _mediaUrlController.text.trim();
    String description = _descriptionController.text.trim();

    Content content;

    if (type == ContentType.Text) {
      content = ContenuTexte(
        id: 0, // Set appropriate ID
        titre: 'Text',
        description: description,
        lessonId: 0, // Set appropriate lesson ID
        texte: '', // Add text content
      );
    } else if (type == ContentType.Image) {
      content = ContenuImage(
        id: 0, // Set appropriate ID
        titre: 'Image',
        description: description,
        lessonId: 0, // Set appropriate lesson ID
        imageUrl: mediaUrl, // Add image URL
      );
    } else if (type == ContentType.Video) {
      content = ContenuVideo(
        id: 0, // Set appropriate ID
        titre: 'Video',
        description: description,
        lessonId: 0, // Set appropriate lesson ID
        videoUrl: mediaUrl, // Add video URL
      );
    } else if (type == ContentType.Audio) {
      content = ContenuAudio(
        id: 0, // Set appropriate ID
        titre: 'Audio',
        description: description,
        lessonId: 0, // Set appropriate lesson ID
        audioUrl: mediaUrl, // Add audio URL
      );
    } else {
      throw Exception('Unsupported content type');
    }

    widget.onContentAdded(content);

    // Clear text fields
    _mediaUrlController.clear();
    _descriptionController.clear();

    // Close the expansion panel
    setState(() {
      _expansionStates[type] = false;
    });
  }
}
