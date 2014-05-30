library main;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import "package:angular_flow_type/angular_flow_type.dart";

class MyAppModule extends Module {
  MyAppModule(){
    install(new FlowTypeModule());
  }
}

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) => print(r.message));
  applicationFactory().addModule(new MyAppModule()).run();
}
