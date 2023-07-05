import 'dart:convert';

/// Entity to get any attachable of a Quickbooks entity
class QuickbooksAttachableEntity {
  String? id;
  String? syncToken;
  String? fileName;
  String? note;
  String? category;
  String? contentType;
  double? size;
  String? tempDownloadUri;
  String? thumbnailTempDownloadUri;

  /// Gets a valid [Uri] for the [tempDownloadUri]
  ///
  /// Returns null if [tempDownloadUri] is not a valid web address
  Uri? getTempDownloadUri() {
    if (tempDownloadUri == null) {
      null;
    }

    return Uri.tryParse(tempDownloadUri!);
  }

  /// Gets a valid [Uri] for the [thumbnailTempDownloadUri]
  ///
  /// Returns null if [thumbnailTempDownloadUri] is not a valid web address
  Uri? getThumbnailTempDownloadUri() {
    if (thumbnailTempDownloadUri == null) {
      null;
    }

    return Uri.tryParse(thumbnailTempDownloadUri!);
  }

  QuickbooksAttachableEntity({
    this.id,
    this.syncToken,
    this.fileName,
    this.note,
    this.category,
    this.contentType,
    this.size,
    this.tempDownloadUri,
    this.thumbnailTempDownloadUri,
  });

  QuickbooksAttachableEntity copyWith({
    String? id,
    String? syncToken,
    String? fileName,
    String? note,
    String? category,
    String? contentType,
    double? size,
    String? tempDownloadUri,
    String? thumbnailTempDownloadUri,
  }) {
    return QuickbooksAttachableEntity(
      id: id ?? this.id,
      syncToken: syncToken ?? this.syncToken,
      fileName: fileName ?? this.fileName,
      note: note ?? this.note,
      category: category ?? this.category,
      contentType: contentType ?? this.contentType,
      size: size ?? this.size,
      tempDownloadUri: tempDownloadUri ?? this.tempDownloadUri,
      thumbnailTempDownloadUri:
          thumbnailTempDownloadUri ?? this.thumbnailTempDownloadUri,
    );
  }

  /// If [withId] is true, will send the [id] in the map
  Map<String, dynamic> toMap({bool withId = true}) {
    return {
      if (withId) 'Id': id,
      'SyncToken': syncToken,
      'FileName': fileName,
      'Note': note,
      'Category': category,
      'ContentType': contentType,
      'Size': size,
      'TempDownloadUri': tempDownloadUri,
      'ThumbnailTempDownloadUri': thumbnailTempDownloadUri,
    };
  }

  factory QuickbooksAttachableEntity.fromMap(Map<String, dynamic> map) {
    return QuickbooksAttachableEntity(
      id: map['Id'],
      syncToken: map['SyncToken'],
      fileName: map['FileName'],
      note: map['Note'],
      category: map['Category'],
      contentType: map['ContentType'],
      size: map['Size']?.toDouble(),
      tempDownloadUri: map['TempDownloadUri'],
      thumbnailTempDownloadUri: map['ThumbnailTempDownloadUri'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksAttachableEntity.fromJson(String source) =>
      QuickbooksAttachableEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuickbooksAttachableEntity(Id: $id, SyncToken: $syncToken, FileName: $fileName, Note: $note, Category: $category, ContentType: $contentType, Size: $size, TempDownloadUri: $tempDownloadUri, ThumbnailTempDownloadUri: $thumbnailTempDownloadUri)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuickbooksAttachableEntity &&
        other.id == id &&
        other.syncToken == syncToken &&
        other.fileName == fileName &&
        other.note == note &&
        other.category == category &&
        other.contentType == contentType &&
        other.size == size &&
        other.tempDownloadUri == tempDownloadUri &&
        other.thumbnailTempDownloadUri == thumbnailTempDownloadUri;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        syncToken.hashCode ^
        fileName.hashCode ^
        note.hashCode ^
        category.hashCode ^
        contentType.hashCode ^
        size.hashCode ^
        tempDownloadUri.hashCode ^
        thumbnailTempDownloadUri.hashCode;
  }
}
