import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final workerImageFileCropped = StateProvider.autoDispose<File?>((ref) => null);
