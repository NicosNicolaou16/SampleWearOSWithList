import 'package:equatable/equatable.dart';
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';

abstract class ShipDetailsStates extends Equatable {
  const ShipDetailsStates();

  @override
  List<Object> get props => [];
}

class ShipDetailsInitialState extends ShipDetailsStates {}

class ShipDetailsLoadingState extends ShipDetailsStates {}

class ShipDetailsLoadedState extends ShipDetailsStates {
  ShipsEntity? shipsEntity;

  ShipDetailsLoadedState({
    required this.shipsEntity,
  });
}

class ShipDetailsErrorState extends ShipDetailsStates {
  final String? error;
  final int? statusCode;

  const ShipDetailsErrorState({
    this.error,
    this.statusCode,
  });
}
