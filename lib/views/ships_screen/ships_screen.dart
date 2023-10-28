import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewearoswithlist/data/models/ships/ships_data_model.dart';
import 'package:samplewearoswithlist/utils/alerts_dialog/alerts_dialog.dart';
import 'package:samplewearoswithlist/views/ships_screen/ships_bloc.dart';
import 'package:samplewearoswithlist/views/ships_screen/ships_events/ships_events.dart';
import 'package:samplewearoswithlist/views/ships_screen/ships_states/ships_states.dart';
import 'package:wear/wear.dart';

import '../ship_details_screen/ship_details_screen.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({Key? key}) : super(key: key);

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Ships List",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        ),
        body: BlocProvider(
          create: (_) => ShipsBloc(ShipsInitialState()),
          child: BlocConsumer<ShipsBloc, ShipsStates>(
            listener: (context, state) {
              if (state is ShipsErrorState) {
                AlertsDialog.showAlertDialog(state.error ?? "", context);
              }
            },
            builder: (context, state) {
              if (state is ShipsInitialState) {
                context.read<ShipsBloc>().add(ShipsFetchData());
                context.read<ShipsBloc>().add(ShipsFromLocalDatabase());
              } else if (state is ShipsLoadedState) {
                return _mainView(state, context);
              } else if (state is ShipsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  double _boxInsetLength(double radius) => radius * 1.4142;

  Widget _mainView(ShipsLoadedState state, BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        var screenSize = MediaQuery.of(context).size;
        if (shape == WearShape.square) {
          screenSize = Size(_boxInsetLength(screenSize.width / 2),
              _boxInsetLength(screenSize.height / 2));
        }
        double screenHeight = screenSize.height;
        double screenWidth = screenSize.width;
        return _listOfShips(
          state.shipsDataModelList,
          screenHeight,
          screenWidth,
        );
      },
    );
  }

  Widget _listOfShips(
    List<ShipsDataModel> shipsDataModelList,
    double screenHeight,
    double screenWidth,
  ) {
    return ListView.builder(
        itemCount: shipsDataModelList.length,
        itemBuilder: (context, index) {
          ShipsDataModel shipsDataModel = shipsDataModelList[index];
          return _cardView(
            shipsDataModel,
            screenHeight,
            screenWidth,
          );
        });
  }

  Widget _cardView(
      ShipsDataModel shipsDataModel, double screenHeight, double screenWidth) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShipDetailsScreen(
                    shipId: shipsDataModel.shipsEntity.id ?? "-1",
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: 200,
          child: Text(
            shipsDataModel.shipsEntity.shipName ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
