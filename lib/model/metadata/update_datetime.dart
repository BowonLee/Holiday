class AppMetadata {
  final List<UpdateDatetime> lastUpdateTimeList;

  AppMetadata({required this.lastUpdateTimeList});
}

class UpdateDatetime {
  UpdateDatetime({required String typeName, required DateTime updateDatetime});
}
