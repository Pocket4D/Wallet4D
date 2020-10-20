import 'package:dva_dart/dva_dart.dart';
import 'package:pocket4d/pocket4d.dart';

import './models/models.dart' as models;

final DvaStore store = DvaStore(models: [models.homeModel, p4dAppModel]);
