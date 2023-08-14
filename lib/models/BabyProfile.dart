/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the BabyProfile type in your schema. */
class BabyProfile extends amplify_core.Model {
  static const classType = const _BabyProfileModelType();
  final String id;
  final String? _name;
  final amplify_core.TemporalDate? _birthday;
  final String? _country;
  final int? _zipcode;
  final String? _gender;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  BabyProfileModelIdentifier get modelIdentifier {
      return BabyProfileModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDate get birthday {
    try {
      return _birthday!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get country {
    try {
      return _country!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get zipcode {
    return _zipcode;
  }
  
  String get gender {
    try {
      return _gender!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const BabyProfile._internal({required this.id, required name, required birthday, required country, zipcode, required gender, createdAt, updatedAt}): _name = name, _birthday = birthday, _country = country, _zipcode = zipcode, _gender = gender, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory BabyProfile({String? id, required String name, required amplify_core.TemporalDate birthday, required String country, int? zipcode, required String gender}) {
    return BabyProfile._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      birthday: birthday,
      country: country,
      zipcode: zipcode,
      gender: gender);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BabyProfile &&
      id == other.id &&
      _name == other._name &&
      _birthday == other._birthday &&
      _country == other._country &&
      _zipcode == other._zipcode &&
      _gender == other._gender;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BabyProfile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("birthday=" + (_birthday != null ? _birthday!.format() : "null") + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("zipcode=" + (_zipcode != null ? _zipcode!.toString() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BabyProfile copyWith({String? name, amplify_core.TemporalDate? birthday, String? country, int? zipcode, String? gender}) {
    return BabyProfile._internal(
      id: id,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      gender: gender ?? this.gender);
  }
  
  BabyProfile copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<amplify_core.TemporalDate>? birthday,
    ModelFieldValue<String>? country,
    ModelFieldValue<int?>? zipcode,
    ModelFieldValue<String>? gender
  }) {
    return BabyProfile._internal(
      id: id,
      name: name == null ? this.name : name.value,
      birthday: birthday == null ? this.birthday : birthday.value,
      country: country == null ? this.country : country.value,
      zipcode: zipcode == null ? this.zipcode : zipcode.value,
      gender: gender == null ? this.gender : gender.value
    );
  }
  
  BabyProfile.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _birthday = json['birthday'] != null ? amplify_core.TemporalDate.fromString(json['birthday']) : null,
      _country = json['country'],
      _zipcode = (json['zipcode'] as num?)?.toInt(),
      _gender = json['gender'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'birthday': _birthday?.format(), 'country': _country, 'zipcode': _zipcode, 'gender': _gender, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'birthday': _birthday,
    'country': _country,
    'zipcode': _zipcode,
    'gender': _gender,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<BabyProfileModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<BabyProfileModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final BIRTHDAY = amplify_core.QueryField(fieldName: "birthday");
  static final COUNTRY = amplify_core.QueryField(fieldName: "country");
  static final ZIPCODE = amplify_core.QueryField(fieldName: "zipcode");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BabyProfile";
    modelSchemaDefinition.pluralName = "BabyProfiles";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BabyProfile.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BabyProfile.BIRTHDAY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BabyProfile.COUNTRY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BabyProfile.ZIPCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: BabyProfile.GENDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _BabyProfileModelType extends amplify_core.ModelType<BabyProfile> {
  const _BabyProfileModelType();
  
  @override
  BabyProfile fromJson(Map<String, dynamic> jsonData) {
    return BabyProfile.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'BabyProfile';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [BabyProfile] in your schema.
 */
class BabyProfileModelIdentifier implements amplify_core.ModelIdentifier<BabyProfile> {
  final String id;

  /** Create an instance of BabyProfileModelIdentifier using [id] the primary key. */
  const BabyProfileModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'BabyProfileModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is BabyProfileModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}