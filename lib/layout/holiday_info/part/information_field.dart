part of '../holiday_info_layout.dart';

class _InformationField extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _InformationField({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "${consecutiveHolidays.title}${getPostfix(consecutiveHolidays.title)} ${consecutiveHolidays.dateList.length} 동안 이어집니다.")
      ],
    );
  }

  String getPostfix(String word) {
    // 한글 자모 분리 코드 범위
    final int baseCode = 44032;
    final int finalCode = 55203;

    // 받침 개수
    final int numFinals = 28;

    // 주어진 단어의 마지막 글자
    int lastChar = word.runes.last;

    // 한글 범위 확인
    if (lastChar < baseCode || lastChar > finalCode) {
      throw ArgumentError('입력된 단어가 한글이 아닙니다.');
    }

    // 받침 여부 판단
    int finalIndex = (lastChar - baseCode) % numFinals;

    // 받침이 있으면 '은', 없으면 '는'
    return finalIndex > 0 ? '은' : '는';
  }
}
