import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';
import 'package:samplewearoswithlist/data/models/ships/ships_data_model.dart';
import 'package:samplewearoswithlist/data/repositories/ships_repository.dart';
import 'package:samplewearoswithlist/views/ships_screen/ships_bloc/ships_events.dart';
import 'package:samplewearoswithlist/views/ships_screen/ships_bloc/ships_states.dart';

class ShipsBloc extends Bloc<ShipsEvents, ShipsStates> {
  ShipsRepository shipsRepository = ShipsRepository();

  ShipsBloc(ShipsStates shipsStates) : super(shipsStates) {
    on<ShipsFetchData>(_onShipsFetched);
    on<ShipsFromLocalDatabase>(_shipsFromLocalDatabase);
  }

  Future<void> _onShipsFetched(ShipsFetchData event,
      Emitter<ShipsStates> emit,) async {
    emit(ShipsLoadingState());
    await shipsRepository.requestAndSaveDataLocal().then((value) async {
      List<ShipsDataModel> shipsDataModelList =
      await ShipsDataModel.createShipsDataModel(value);
      emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
    }).catchError((err) async {
      emit(const ShipsErrorState(
        error: "Something went wrong",
        statusCode: -1,
      ));
    });
  }

  Future<void> _shipsFromLocalDatabase(ShipsFromLocalDatabase event,
      Emitter<ShipsStates> emit,) async {
    emit(ShipsLoadingState());
    List<ShipsEntity> shipsEntityList =
    await ShipsEntity.getAllShips();
    List<ShipsDataModel> shipsDataModelList = await ShipsDataModel
        .createShipsDataModel(shipsEntityList);
    emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
  }
}
