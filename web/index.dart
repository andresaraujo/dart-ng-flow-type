
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
//import 'package:perf_api/perf_api.dart';

import "package:angular_flow_type/angular_flow_type.dart";

@MirrorsUsed(
    targets: const [
    ],
    override: '*'
)
import 'dart:mirrors';


class MyAppModule extends AngularModule {
  MyAppModule(){
    install(new FlowTypeModule());
  }
}

main(){  
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) => print(r.message));
  ngBootstrap(module: new MyAppModule());
}