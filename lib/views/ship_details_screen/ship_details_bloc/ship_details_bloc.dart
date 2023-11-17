import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc/ship_details_events.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc/ship_details_states.dart';

class ShipDetailsBloc extends Bloc<ShipDetailsEvents, ShipDetailsStates> {
  ShipDetailsBloc(ShipDetailsStates shipStates) : super(shipStates) {
    on<ShipDetailsLocalQuery>(_onShipsLocalSearch);
  }

  Future<void> _onShipsLocalSearch(
    ShipDetailsLocalQuery event,
    Emitter<ShipDetailsStates> emit,
  ) async {
    if (event.shipId != "-1") {
      ShipsEntity? shipsEntity = await ShipsEntity.getShipById(event.shipId);
      emit(ShipDetailsLoadedState(shipsEntity: shipsEntity));
    } else {
      emit(const ShipDetailsErrorState());
    }
  }
}
