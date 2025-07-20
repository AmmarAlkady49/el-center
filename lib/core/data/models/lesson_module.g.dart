// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModule _$LessonModuleFromJson(Map<String, dynamic> json) => LessonModule(
      id: (json['id'] as num).toInt(),
      orderIndex: (json['orderIndex'] as num?)?.toInt(),
      moduleId: (json['moduleId'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      contentType: json['contentType'] as String?,
      durationInMinutes: (json['durationInMinutes'] as num?)?.toInt(),
      description: json['description'] as String?,
      isPublished: json['isPublished'] as bool?,
    );

Map<String, dynamic> _$LessonModuleToJson(LessonModule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderIndex': instance.orderIndex,
      'moduleId': instance.moduleId,
      'title': instance.title,
      'content': instance.content,
      'contentType': instance.contentType,
      'durationInMinutes': instance.durationInMinutes,
      'description': instance.description,
      'isPublished': instance.isPublished,
    };
