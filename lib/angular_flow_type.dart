library angular_flow_type;

import 'dart:async';
import 'dart:html' as html;
import 'package:angular/angular.dart';

/**
 * Directive for changing the font-size based on a specific element's width.
 *
 * ## Example
 *
 *  <div flow-type></div>
 */
@Decorator(selector: "[flow-type]",
map: const {
  'ft-min-font'   : '=>minFontSize',
  'ft-max-font'   : '=>maxFontSize',
  'ft-min-width'  : '=>minWidth',
  'ft-max-width'  : '=>maxWidth',
  'ft-font-ratio' : '=>fontRatio'
})
class FlowTypeDirective{
  //final Scope   _scope = null;
  html.Element _element;
  html.Window  _window = null;
  
  num minFontSize = 0;
  num maxFontSize = 9999;
  num maxWidth    = 9999;
  num minWidth    = 1;
  num fontRatio   = 35;
    
  FlowTypeDirective(this._element, this._window){//this._element, this._scope, this._window){
    _window.onResize.listen((_) => resize());
    scheduleMicrotask(() {
        resize();
    });
  }
  
  resize(){
    var elw   = _element.offsetWidth;
    var width = elw > maxWidth ? maxWidth : elw < minWidth ? minWidth : elw;
    
    var fontBase = width / fontRatio;
    var fontSize = fontBase > maxFontSize ? maxFontSize : fontBase < minFontSize ? minFontSize : fontBase;
    
    _element.style.fontSize = "${fontSize}px";
  }
}

/// Module which installs the flow-type directive
class FlowTypeModule extends Module {
  FlowTypeModule() {
    bind(FlowTypeDirective);
  }
}