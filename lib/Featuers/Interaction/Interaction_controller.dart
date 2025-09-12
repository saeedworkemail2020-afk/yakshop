import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Featuers/Interaction/Interaction__services.dart';
import 'package:amozeshyar/Featuers/Interaction/interaction_model.dart';

class InteractionController {
  late ScreenSize _screenSize;
  late InteractionModel _model;
  late Interactionservices _services;
  InteractionController() {
    _screenSize = ScreenSize();
    _model = InteractionModel();
    _services = Interactionservices();
  }
  ScreenSize get screenSize => _screenSize;
  InteractionModel get model => _model;
  Interactionservices get services => _services;
}
