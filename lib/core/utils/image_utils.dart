import 'dart:convert';
import 'dart:typed_data';

/// This function runs in background isolate means in separate memory so won't bloc main thread
Map<String, dynamic> processImageInIsolate(Uint8List bytes) {
  final base64Str = base64Encode(bytes);

  return {'base64': base64Str};
}

Uint8List decodeBase64(String base64Str) {
  return base64Decode(base64Str);
}

String encodeToBase64(Uint8List bytes) {
  return base64Encode(bytes);
}
