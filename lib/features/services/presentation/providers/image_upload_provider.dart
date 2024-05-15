import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceImageFileCropped = StateProvider.autoDispose<File?>((ref) => null);
