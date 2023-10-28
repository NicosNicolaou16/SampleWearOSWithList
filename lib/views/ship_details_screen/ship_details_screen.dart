import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';
import 'package:samplewearoswithlist/utils/alerts_dialog/alerts_dialog.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_events/ship_details_events.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_states/ship_details_states.dart';
import 'package:wear/wear.dart';

class ShipDetailsScreen extends StatefulWidget {
  final String shipId;

  const ShipDetailsScreen({Key? key, required this.shipId}) : super(key: key);

  @override
  State<ShipDetailsScreen> createState() => _ShipDetailsScreenState();
}

class _ShipDetailsScreenState extends State<ShipDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => ShipDetailsBloc(ShipDetailsInitialState()),
          child: BlocConsumer<ShipDetailsBloc, ShipDetailsStates>(
            listener: (context, state) {
              if (state is ShipDetailsErrorState) {
                AlertsDialog.showAlertDialog(state.error ?? "", context);
              }
            },
            builder: (context, state) {
              if (state is ShipDetailsInitialState) {
                context
                    .read<ShipDetailsBloc>()
                    .add(ShipDetailsLocalQuery(widget.shipId));
              } else if (state is ShipDetailsLoadedState) {
                return _mainView(state, context);
              } else if (state is ShipDetailsLoadingState) {
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

  Widget _mainView(ShipDetailsLoadedState state, BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        var screenSize = MediaQuery.of(context).size;
        if (shape == WearShape.square) {
          screenSize = Size(_boxInsetLength(screenSize.width / 2),
              _boxInsetLength(screenSize.height / 2));
        }
        double screenHeight = screenSize.height;
        double screenWidth = screenSize.width;
        return Stack(
          children: [
            _imageView(
              state.shipsEntity,
              screenHeight,
              screenWidth,
            ),
            _infoView(
              state.shipsEntity,
              screenHeight,
              screenWidth,
            ),
          ],
        );
      },
    );
  }

  Widget _imageView(
      ShipsEntity? shipsEntity, double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      alignment: Alignment.topCenter,
      child: CachedNetworkImage(
        imageUrl: shipsEntity?.image ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.image),
        height: 250,
        width: 250,
      ),
    );
  }

  Widget _infoView(
      ShipsEntity? shipsEntity, double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 40),
      child: Text(
        shipsEntity?.shipName ?? "",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
    );
  }
}
