import 'package:flutter/cupertino.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_base.dart';

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static T of<T extends BlocBase>(BuildContext context) {
    final BlocProvider<T> _provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return _provider.bloc;
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
