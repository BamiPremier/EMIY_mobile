// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'controller/entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8577921925962329132),
      name: 'Second',
      lastPropertyId: const IdUid(2, 5232191579991675560),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6967007675200439425),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5232191579991675560),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6647434058635969284),
      name: 'YourDataModel',
      lastPropertyId: const IdUid(2, 1273037566979219464),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7887713066555158294),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1273037566979219464),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 4605572453813487812),
      name: 'Commande',
      lastPropertyId: const IdUid(4, 804397109421292826),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6427219783082250625),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4449592748689679866),
            name: 'codeCommande',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3908534320619472909),
            name: 'codeClient',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 804397109421292826),
            name: 'date',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 6229965148453259615),
      name: 'KeyUser',
      lastPropertyId: const IdUid(6, 862274313206509805),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5019319506708664959),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 307082937894865070),
            name: 'keySecret',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 9196018691887138555),
            name: 'codeCommunication',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1782358477161603803),
            name: 'token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6992175809345500904),
            name: 'codeParrainnage',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 862274313206509805),
            name: 'refreshToken',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 5966727748498028111),
      name: 'Lang',
      lastPropertyId: const IdUid(2, 4310959239022998272),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2089802773210397883),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4310959239022998272),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 5834183656708337881),
      name: 'Localisation',
      lastPropertyId: const IdUid(5, 7165721117595635223),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3555417633660237357),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2345811167816583375),
            name: 'ville',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5986609547917399797),
            name: 'long',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9135511340752186278),
            name: 'lat',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7165721117595635223),
            name: 'ip',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 3264819094062484586),
      name: 'Theme',
      lastPropertyId: const IdUid(2, 8796203273447964540),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2425594449038964183),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8796203273447964540),
            name: 'value',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 8051142099205652548),
      name: 'User',
      lastPropertyId: const IdUid(8, 2559476096599094924),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3217663169177255350),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2636140180940211833),
            name: 'nom',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8601597815636045740),
            name: 'prenom',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4543912782425174632),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3135015824533000993),
            name: 'profile',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1439098870373134709),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3804022484162881727),
            name: 'dateCreated',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2559476096599094924),
            name: 'userId',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(8, 8051142099205652548),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Second: EntityDefinition<Second>(
        model: _entities[0],
        toOneRelations: (Second object) => [],
        toManyRelations: (Second object) => {},
        getId: (Second object) => object.id,
        setId: (Second object, int id) {
          object.id = id;
        },
        objectToFB: (Second object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Second(id: idParam, name: nameParam);

          return object;
        }),
    YourDataModel: EntityDefinition<YourDataModel>(
        model: _entities[1],
        toOneRelations: (YourDataModel object) => [],
        toManyRelations: (YourDataModel object) => {},
        getId: (YourDataModel object) => object.id,
        setId: (YourDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (YourDataModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = YourDataModel(id: idParam, name: nameParam);

          return object;
        }),
    Commande: EntityDefinition<Commande>(
        model: _entities[2],
        toOneRelations: (Commande object) => [],
        toManyRelations: (Commande object) => {},
        getId: (Commande object) => object.id,
        setId: (Commande object, int id) {
          object.id = id;
        },
        objectToFB: (Commande object, fb.Builder fbb) {
          final codeCommandeOffset = fbb.writeString(object.codeCommande);
          final codeClientOffset = fbb.writeString(object.codeClient);
          final dateOffset = fbb.writeString(object.date);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, codeCommandeOffset);
          fbb.addOffset(2, codeClientOffset);
          fbb.addOffset(3, dateOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final codeCommandeParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, '');
          final codeClientParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = Commande(
              id: idParam,
              codeCommande: codeCommandeParam,
              codeClient: codeClientParam,
              date: dateParam);

          return object;
        }),
    KeyUser: EntityDefinition<KeyUser>(
        model: _entities[3],
        toOneRelations: (KeyUser object) => [],
        toManyRelations: (KeyUser object) => {},
        getId: (KeyUser object) => object.id,
        setId: (KeyUser object, int id) {
          object.id = id;
        },
        objectToFB: (KeyUser object, fb.Builder fbb) {
          final keySecretOffset = fbb.writeString(object.keySecret);
          final codeCommunicationOffset =
              fbb.writeString(object.codeCommunication);
          final tokenOffset = fbb.writeString(object.token);
          final codeParrainnageOffset = fbb.writeString(object.codeParrainnage);
          final refreshTokenOffset = fbb.writeString(object.refreshToken);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keySecretOffset);
          fbb.addOffset(2, codeCommunicationOffset);
          fbb.addOffset(3, tokenOffset);
          fbb.addOffset(4, codeParrainnageOffset);
          fbb.addOffset(5, refreshTokenOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final keySecretParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final codeCommunicationParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final tokenParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final codeParrainnageParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, '');
          final refreshTokenParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final object = KeyUser(
              keySecret: keySecretParam,
              codeCommunication: codeCommunicationParam,
              token: tokenParam,
              codeParrainnage: codeParrainnageParam,
              refreshToken: refreshTokenParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Lang: EntityDefinition<Lang>(
        model: _entities[4],
        toOneRelations: (Lang object) => [],
        toManyRelations: (Lang object) => {},
        getId: (Lang object) => object.id,
        setId: (Lang object, int id) {
          object.id = id;
        },
        objectToFB: (Lang object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Lang(name: nameParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Localisation: EntityDefinition<Localisation>(
        model: _entities[5],
        toOneRelations: (Localisation object) => [],
        toManyRelations: (Localisation object) => {},
        getId: (Localisation object) => object.id,
        setId: (Localisation object, int id) {
          object.id = id;
        },
        objectToFB: (Localisation object, fb.Builder fbb) {
          final villeOffset = fbb.writeString(object.ville);
          final longOffset = fbb.writeString(object.long);
          final latOffset = fbb.writeString(object.lat);
          final ipOffset = fbb.writeString(object.ip);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, villeOffset);
          fbb.addOffset(2, longOffset);
          fbb.addOffset(3, latOffset);
          fbb.addOffset(4, ipOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final villeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final longParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final latParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final ipParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = Localisation(
              ville: villeParam, long: longParam, lat: latParam, ip: ipParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Theme: EntityDefinition<Theme>(
        model: _entities[6],
        toOneRelations: (Theme object) => [],
        toManyRelations: (Theme object) => {},
        getId: (Theme object) => object.id,
        setId: (Theme object, int id) {
          object.id = id;
        },
        objectToFB: (Theme object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.value);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final valueParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = Theme(value: valueParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[7],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nomOffset = fbb.writeString(object.nom);
          final prenomOffset = fbb.writeString(object.prenom);
          final emailOffset = fbb.writeString(object.email);
          final profileOffset = fbb.writeString(object.profile);
          final phoneOffset = fbb.writeString(object.phone);
          final dateCreatedOffset = fbb.writeString(object.dateCreated);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nomOffset);
          fbb.addOffset(2, prenomOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, profileOffset);
          fbb.addOffset(5, phoneOffset);
          fbb.addOffset(6, dateCreatedOffset);
          fbb.addInt64(7, object.userId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final userIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          final nomParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final prenomParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final emailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final profileParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final phoneParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final dateCreatedParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, '');
          final object = User(
              userId: userIdParam,
              nom: nomParam,
              prenom: prenomParam,
              email: emailParam,
              profile: profileParam,
              phone: phoneParam,
              dateCreated: dateCreatedParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Second] entity fields to define ObjectBox queries.
class Second_ {
  /// see [Second.id]
  static final id = QueryIntegerProperty<Second>(_entities[0].properties[0]);

  /// see [Second.name]
  static final name = QueryStringProperty<Second>(_entities[0].properties[1]);
}

/// [YourDataModel] entity fields to define ObjectBox queries.
class YourDataModel_ {
  /// see [YourDataModel.id]
  static final id =
      QueryIntegerProperty<YourDataModel>(_entities[1].properties[0]);

  /// see [YourDataModel.name]
  static final name =
      QueryStringProperty<YourDataModel>(_entities[1].properties[1]);
}

/// [Commande] entity fields to define ObjectBox queries.
class Commande_ {
  /// see [Commande.id]
  static final id = QueryIntegerProperty<Commande>(_entities[2].properties[0]);

  /// see [Commande.codeCommande]
  static final codeCommande =
      QueryStringProperty<Commande>(_entities[2].properties[1]);

  /// see [Commande.codeClient]
  static final codeClient =
      QueryStringProperty<Commande>(_entities[2].properties[2]);

  /// see [Commande.date]
  static final date = QueryStringProperty<Commande>(_entities[2].properties[3]);
}

/// [KeyUser] entity fields to define ObjectBox queries.
class KeyUser_ {
  /// see [KeyUser.id]
  static final id = QueryIntegerProperty<KeyUser>(_entities[3].properties[0]);

  /// see [KeyUser.keySecret]
  static final keySecret =
      QueryStringProperty<KeyUser>(_entities[3].properties[1]);

  /// see [KeyUser.codeCommunication]
  static final codeCommunication =
      QueryStringProperty<KeyUser>(_entities[3].properties[2]);

  /// see [KeyUser.token]
  static final token = QueryStringProperty<KeyUser>(_entities[3].properties[3]);

  /// see [KeyUser.codeParrainnage]
  static final codeParrainnage =
      QueryStringProperty<KeyUser>(_entities[3].properties[4]);

  /// see [KeyUser.refreshToken]
  static final refreshToken =
      QueryStringProperty<KeyUser>(_entities[3].properties[5]);
}

/// [Lang] entity fields to define ObjectBox queries.
class Lang_ {
  /// see [Lang.id]
  static final id = QueryIntegerProperty<Lang>(_entities[4].properties[0]);

  /// see [Lang.name]
  static final name = QueryStringProperty<Lang>(_entities[4].properties[1]);
}

/// [Localisation] entity fields to define ObjectBox queries.
class Localisation_ {
  /// see [Localisation.id]
  static final id =
      QueryIntegerProperty<Localisation>(_entities[5].properties[0]);

  /// see [Localisation.ville]
  static final ville =
      QueryStringProperty<Localisation>(_entities[5].properties[1]);

  /// see [Localisation.long]
  static final long =
      QueryStringProperty<Localisation>(_entities[5].properties[2]);

  /// see [Localisation.lat]
  static final lat =
      QueryStringProperty<Localisation>(_entities[5].properties[3]);

  /// see [Localisation.ip]
  static final ip =
      QueryStringProperty<Localisation>(_entities[5].properties[4]);
}

/// [Theme] entity fields to define ObjectBox queries.
class Theme_ {
  /// see [Theme.id]
  static final id = QueryIntegerProperty<Theme>(_entities[6].properties[0]);

  /// see [Theme.value]
  static final value = QueryIntegerProperty<Theme>(_entities[6].properties[1]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[7].properties[0]);

  /// see [User.nom]
  static final nom = QueryStringProperty<User>(_entities[7].properties[1]);

  /// see [User.prenom]
  static final prenom = QueryStringProperty<User>(_entities[7].properties[2]);

  /// see [User.email]
  static final email = QueryStringProperty<User>(_entities[7].properties[3]);

  /// see [User.profile]
  static final profile = QueryStringProperty<User>(_entities[7].properties[4]);

  /// see [User.phone]
  static final phone = QueryStringProperty<User>(_entities[7].properties[5]);

  /// see [User.dateCreated]
  static final dateCreated =
      QueryStringProperty<User>(_entities[7].properties[6]);

  /// see [User.userId]
  static final userId = QueryIntegerProperty<User>(_entities[7].properties[7]);
}