import 'package:weather_app/domain/enum/enum_position_item_type.dart';

class PositionItem {
  PositionItem(
    this.type,
    this.displayValue,
  );

  final PositionItemType type;
  final String displayValue;
}
