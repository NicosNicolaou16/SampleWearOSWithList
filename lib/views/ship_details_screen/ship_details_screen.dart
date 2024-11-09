import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewearoswithlist/data/database/entities/ships_entity.dart';
import 'package:samplewearoswithlist/utils/alerts_dialog/alerts_dialog.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc/ship_details_bloc.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc/ship_details_events.dart';
import 'package:samplewearoswithlist/views/ship_details_screen/ship_details_bloc/ship_details_states.dart';

class ShipDetailsScreen extends StatefulWidget {
  final String shipId;
  final double screenHeight;
  final double screenWidth;

  const ShipDetailsScreen(
      {Key? key,
      required this.shipId,
      required this.screenHeight,
      required this.screenWidth})
      : super(key: key);

  @override
  State<ShipDetailsScreen> createState() => _ShipDetailsScreenState();
}

class _ShipDetailsScreenState extends State<ShipDetailsScreen> {
  _init(BuildContext context) {
    context.read<ShipDetailsBloc>().add(ShipDetailsLocalQuery(widget.shipId));
  }

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
              return _states(state, context);
            },
          ),
        ),
      ),
    );
  }

  Widget _states(ShipDetailsStates state, BuildContext context) {
    if (state is ShipDetailsInitialState) {
      _init(context);
    } else if (state is ShipDetailsLoadedState) {
      return _mainView(state, context);
    } else if (state is ShipDetailsLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container();
  }

  Widget _mainView(ShipDetailsLoadedState state, BuildContext context) {
    return Stack(
      children: [
        _imageView(
          state.shipsEntity,
          widget.screenHeight * 2,
          widget.screenWidth * 2,
        ),
        _infoView(
          state.shipsEntity,
          widget.screenHeight,
          widget.screenWidth,
        ),
      ],
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
