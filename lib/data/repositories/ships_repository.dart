
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';
import 'package:samplewearoswithlist/domain/remote/ships_service.dart';

class ShipsRepository {
  final ShipsService _shipsService = ShipsService();

  Future<List<ShipsEntity>> requestAndSaveDataLocal() async {
    List<ShipsEntity>? shipsEntityList = await _shipsService.getShips();
    await saveShipOnLocalDatabase(shipsEntityList);
    return shipsEntityList;
  }

  Future<void> saveShipOnLocalDatabase(
      List<ShipsEntity>? shipsEntityList) async {
    if (shipsEntityList != null) {
      await ShipsEntity.saveShips(shipsEntityList);
    }
  }
}
