import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Core/service_config.dart';
import 'package:amozeshyar/Core/snackbarmodel.dart';
import 'package:amozeshyar/Featuers/Interaction/interaction__services.dart';
import 'package:amozeshyar/Featuers/Interaction/interaction_model.dart';

class InteractionController {
  late ScreenSize _screenSize;
  late InteractionModel _model;
  late Interactionservices _services;
  late SnackbarModel _snackbarModel;

  InteractionController() {
    _screenSize = ScreenSize();
    _model = InteractionModel();
    _services = Interactionservices(
      basestockUri: ServiceConfig.basestockUri,
      baseherdUri: ServiceConfig.baseherdUri,
      baseorderUri: ServiceConfig.baseorderUri,
      baseloadUri: ServiceConfig.baseloadUri,
      scaffoldkey: _model.interactionscaffoldkey,
    );
    _snackbarModel = SnackbarModel();
  }
  ScreenSize get screenSize => _screenSize;
  InteractionModel get model => _model;
  Interactionservices get services => _services;
  SnackbarModel get snackBar => _snackbarModel;
}
