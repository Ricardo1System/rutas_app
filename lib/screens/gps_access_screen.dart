import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutas_app/blocs/blocs.dart';


class GpsAccessScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // child: _AccessButton(),
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnable? const _EnableGpsMessage(): const _AccessButton();
            // return _AccessButton();
          },
        ),
     ),
   );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
          color: Colors.black,
          shape: const StadiumBorder(),
          splashColor: Colors.transparent,
          onPressed: () {
            final gpsBloc=BlocProvider.of<GpsBloc>(context);
            // final gpsBloc=context.read<GpsBloc>();
            gpsBloc.askGpsAccess();
          },
          child: const Text('Solicitas acceso', style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Debe habilitar el GPS', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),);
  }
}