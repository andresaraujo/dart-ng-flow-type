Flow Type for Angular.dart
=================
Directive for changing the font-size based on a specific element's width. It is based on [FlowType.js](https://github.com/simplefocus/FlowType.JS). See [demo](http://andresaraujo.github.io/dart-ng-flow-type/) (resize window)

 

## Usage

Import and register the module:

    import "package:angular_flow_type/ng_flow_type.dart";

    class MyAppModule extends Module {
        MyAppModule() {
            install(new FlowTypeModule());
        }
    }

Use the directive:

    <div flow-type ft-min-font="12" ft-max-font="40" ft-font-ratio="35"></div>  

