import 'package:get_it/get_it.dart';
import 'package:holiday/client/metadata_client.dart';
import 'package:holiday/database/hive_helper.dart';
import 'package:logger/logger.dart';

/// 최종 업데이트 일자와 같은 메타데이터 관리
/// 앱 시작 시 최초로 검사하여 이후 작업 사항을 결정한다.
/// 앱 내부에 저장 된 사항들을 확인한 뒤 업데이가 필요한 사항을 확인 후 반환한다.
///
/// 값은 한번에 모두 셋팅하는 것이 아닌 하나 씩 관리해야 한다.
/// put - key / value 방식을 사용하여 저장을 하며, key는 서버에서 받는 typeName 으로 value는 updatetime으로 잡는다.
///

MetadataRepository metadataRepositoryProvider() {
  final client = GetIt.instance.get<MetaDataClient>();
  MetadataRepository holidayRepository = MetadataRepository(client: client);
  return holidayRepository;
}

class MetadataRepository {
  final MetaDataClient client;

  MetadataRepository({required this.client});

  setMetaDataList() async {
    final result = await client.getMetadataList();

    Logger().i(result);
    for (var element in result) {
      HiveHelper().metaBox?.put(element.typeName, element.updateDateTime);
    }

    return result;
  }
}
