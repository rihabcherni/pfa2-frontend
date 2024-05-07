class Cours {
  final int id;
  final String titre;
  final List<Content> contents;
  final String description;
  final String cours_photo;
  final DateTime date;
  final double rating;
  final int numRated;
  final String categorie;
  final String niveau;

  Cours({
    required this.id,
    required this.titre,
    required this.contents,
    required this.description,
    required this.cours_photo,
    required this.date,
    required this.rating,
    required this.numRated,
    required this.categorie,
    required this.niveau,
  });

  factory Cours.fromJson(Map<String, dynamic> json) {
    return Cours(
      id: json['id'] ?? 0, // Handle null by providing default value
      titre: json['titre'] ?? '', // Handle null by providing empty string
      contents: (json['contents'] as List<dynamic>?)?.map((contentJson) {
            final contentType = ContentType.values[contentJson['contentType']];
            switch (contentType) {
              case ContentType.Text:
                return ContenuTexte.fromJson(contentJson);
              case ContentType.Image:
                return ContenuImage.fromJson(contentJson);
              case ContentType.Video:
                return ContenuVideo.fromJson(contentJson);
              case ContentType.Audio:
                return ContenuAudio.fromJson(contentJson);
              default:
                throw Exception('Unknown content type: $contentType');
            }
          }).toList() ??
          [], // Handle null by providing empty list
      description:
          json['description'] ?? '', // Handle null by providing empty string
      cours_photo:
          json['cours_photo'] ?? '', // Handle null by providing empty string
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(), // Handle null by providing current date
      rating: json['rating']?.toDouble() ??
          0.0, // Handle null by providing default value
      numRated: json['numRated'] ?? 0, // Handle null by providing default value
      categorie:
          json['categorie'] ?? '', // Handle null by providing empty string
      niveau: json['niveau'] ?? '', // Handle null by providing empty string
    );
  }
}

enum ContentType {
  Text,
  Image,
  Video,
  Audio,
}

abstract class Content {
  final int id;
  final String titre;
  final String description;
  final int lessonId;

  Content({
    required this.id,
    required this.titre,
    required this.description,
    required this.lessonId,
  });
}

class ContenuTexte extends Content {
  final String texte;

  ContenuTexte({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.texte,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuTexte fromJson(contentJson) {
    return ContenuTexte(
      id: contentJson['id'] ?? 0, // Handle null by providing default value
      titre:
          contentJson['titre'] ?? '', // Handle null by providing empty string
      description: contentJson['description'] ??
          '', // Handle null by providing empty string
      lessonId: contentJson['lessonId'] ??
          0, // Handle null by providing default value
      texte:
          contentJson['texte'] ?? '', // Handle null by providing empty string
    );
  }
}

class ContenuImage extends Content {
  final String imageUrl;

  ContenuImage({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.imageUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuImage fromJson(contentJson) {
    return ContenuImage(
      id: contentJson['id'] ?? 0, // Handle null by providing default value
      titre:
          contentJson['titre'] ?? '', // Handle null by providing empty string
      description: contentJson['description'] ??
          '', // Handle null by providing empty string
      lessonId: contentJson['lessonId'] ??
          0, // Handle null by providing default value
      imageUrl: contentJson['imageUrl'] ??
          '', // Handle null by providing empty string
    );
  }
}

class ContenuVideo extends Content {
  final String videoUrl;

  ContenuVideo({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.videoUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuVideo fromJson(contentJson) {
    return ContenuVideo(
      id: contentJson['id'] ?? 0, // Handle null by providing default value
      titre:
          contentJson['titre'] ?? '', // Handle null by providing empty string
      description: contentJson['description'] ??
          '', // Handle null by providing empty string
      lessonId: contentJson['lessonId'] ??
          0, // Handle null by providing default value
      videoUrl: contentJson['videoUrl'] ??
          '', // Handle null by providing empty string
    );
  }
}

class ContenuAudio extends Content {
  final String audioUrl;

  ContenuAudio({
    required int id,
    required String titre,
    required String description,
    required int lessonId,
    required this.audioUrl,
  }) : super(
            id: id, titre: titre, description: description, lessonId: lessonId);

  static ContenuAudio fromJson(contentJson) {
    return ContenuAudio(
      id: contentJson['id'] ?? 0, // Handle null by providing default value
      titre:
          contentJson['titre'] ?? '', // Handle null by providing empty string
      description: contentJson['description'] ??
          '', // Handle null by providing empty string
      lessonId: contentJson['lessonId'] ??
          0, // Handle null by providing default value
      audioUrl: contentJson['audioUrl'] ??
          '', // Handle null by providing empty string
    );
  }
}
