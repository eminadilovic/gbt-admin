import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_request.freezed.dart';
part 'worker_request.g.dart';

@freezed
class WorkerRequest with _$WorkerRequest {
  factory WorkerRequest({
    @JsonKey(name: 'worker_id') required String userId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'profile_image') required String profileImage,
    //@JsonKey(name: 'services') required List<Services> services,
    //@JsonKey(name: 'reservations') required List<Reservation> reservations,
  }) = _WorkerRequest;

  factory WorkerRequest.fromJson(Map<String, dynamic> json) => _$WorkerRequestFromJson(json);

  factory WorkerRequest.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return WorkerRequest.fromJson(data);
  }
}
