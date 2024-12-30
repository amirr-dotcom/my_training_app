

import 'package:flutter/foundation.dart';

abstract class IAppService {
  bool getKIsWeb();
  bool getKDebugMode();
}

class AppService implements IAppService {
  @override
  bool getKIsWeb() {
    return kIsWeb;
  }

  @override
  bool getKDebugMode() {
    return kDebugMode;
  }
}