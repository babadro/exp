(function(c){"function"===typeof define&&define.amd&&define.amd.jQuery&&!window.jQuery?define("polyfiller",["jquery"],c):c(jQuery)})(function(c){var z=c(document.scripts||"script"),n=c.event.special,A=c([]),f=window.Modernizr,r=window.asyncWebshims,B=f.addTest,w=parseFloat(c.browser.version,10),p=window.Object,y=Array.prototype.slice;"details"in f||B("details",function(){return"open"in document.createElement("details")});f.genericDOM=!!c("<video><div></div></video>")[0].innerHTML;f.advancedObjectProperties=
f.objectAccessor=f.ES5=!!("create"in p&&"seal"in p);var d={version:"1.8.5RC3",cfg:{useImportantStyles:!0,waitReady:!0,extendNative:!0,loadStyles:!0,basePath:function(){var a=z.filter('[src*="polyfiller.js"]'),a=a[0]||a.end()[a.end().length-1],a=(c.support.hrefNormalized?a.src:a.getAttribute("src",4)).split("?")[0];return a=a.slice(0,a.lastIndexOf("/")+1)+"shims/"}()},bugs:{},browserVersion:w,modules:{},features:{},featureList:[],setOptions:function(a,b){"string"==typeof a&&void 0!==b?o[a]=!c.isPlainObject(b)?
b:c.extend(!0,o[a]||{},b):"object"==typeof a&&c.extend(!0,o,a)},addPolyfill:function(a,b){var b=b||{},e=b.f||a;if(!k[e])k[e]=[],k[e].delayReady=0,d.featureList.push(e),o[e]={};k[e].push(a);b.options=c.extend(o[e],b.options);x(a,b);b.methodNames&&c.each(b.methodNames,function(a,b){d.addMethodName(b)})},polyfill:function(){var a=function(b){var e=[],d,h=function(){c("html").removeClass("loading-polyfills long-loading-polyfills");c(window).unbind(".lP");clearTimeout(d)};c.isReady||(e.push("loading-polyfills"),
c(window).bind("load.lP error.lP",h),d=setTimeout(function(){c("html").addClass("long-loading-polyfills")},600));q(b,h);o.useImportantStyles&&e.push("polyfill-important");e[0]&&c("html").addClass(e.join(" "));o.loadStyles&&s.loadCSS("styles/shim.css");a=c.noop};return function(b){var e=[],b=b||d.featureList;"string"==typeof b&&(b=b.split(" "));o.waitReady&&(c.readyWait++,q(b,function(){c.ready(!0)}));c.each(b,function(a,b){k[b]?(b!==k[b][0]&&q(k[b],function(){l(b,!0)}),e=e.concat(k[b])):(d.warn("could not find webshims-feature (aborted): "+
b),l(b,!0))});a(b);u(e)}}(),reTest:function(){var a,b,e=function(e,h){var g=m[h],d=h+"Ready",f;if(g&&!g.loaded&&!(g.test&&c.isFunction(g.test)?g.test([]):g.test)){n[d]&&delete n[d];if((f=k[g.f])&&!b)f.delayReady++,q(h,function(){f.delayReady--;l(g.f,f.callReady)});a.push(h)}};return function(d,h){b=h;"string"==typeof d&&(d=d.split(" "));a=[];c.each(d,e);u(a)}}(),isReady:function(a,b){if(k[a]&&0<k[a].delayReady){if(b)k[a].callReady=!0;return!1}a+="Ready";if(b){if(n[a]&&n[a].add)return!0;n[a]=c.extend(n[a]||
{},{add:function(b){b.handler.call(this,a)}});c.event.trigger(a)}return!(!n[a]||!n[a].add)||!1},ready:function(a,b,e){"string"==typeof a&&(a=a.split(" "));e||(a=c.map(c.grep(a,function(b){return!l(b)}),function(b){return b+"Ready"}));a.length?(e=a.shift(),c(document).one(e,function(){q(a,b,!0)})):b(c,d,window,document)},fixHTML5:function(a){return a},capturingEvents:function(a,b){document.addEventListener&&("string"==typeof a&&(a=[a]),c.each(a,function(a,j){var h=function(a){a=c.event.fix(a);b&&!a._isPolyfilled&&
d.capturingEventPrevented&&d.capturingEventPrevented(a);return c.event.handle.call(this,a)};n[j]=n[j]||{};!n[j].setup&&!n[j].teardown&&c.extend(n[j],{setup:function(){this.addEventListener(j,h,!0)},teardown:function(){this.removeEventListener(j,h,!0)}})}))},register:function(a,b){var e=m[a];if(e){if(e.noAutoCallback){var j=function(){b(c,d,window,document,void 0,e.options);l(a,!0)};e.d?q(e.d,j):j()}}else d.warn("can't find module: "+a)},c:{},loader:{addModule:function(a,b){m[a]=b;b.name=b.name||a;
if(!b.c)b.c=[];c.each(b.c,function(b,c){d.c[c]||(d.c[c]=[]);d.c[c].push(a)})},loadList:function(){var a=[],b=function(b,e){"string"==typeof e&&(e=[e]);c.merge(a,e);s.loadScript(b,!1,e)},e=function(b,e){if(l(b)||-1!=c.inArray(b,a))return!0;var d=m[b];if(d)if(d=d.test&&c.isFunction(d.test)?d.test(e):d.test)l(b,!0);else return!1;return!0},j=function(b,a){if(b.d&&b.d.length){var d=function(b,d){!e(d,a)&&-1==c.inArray(d,a)&&a.push(d)};c.each(b.d,function(b,a){m[a]?d(b,a):k[a]&&(c.each(k[a],d),q(k[a],function(){l(a,
!0)}))});if(!b.noAutoCallback)b.noAutoCallback=!0}};return function(h){var g,f=[],i,k,l=function(e,h){k=h;c.each(d.c[h],function(b,d){if(-1==c.inArray(d,f)||-1!=c.inArray(d,a))return k=!1});if(k)return b("combos/"+k,d.c[k]),!1};for(i=0;i<h.length;i++)g=m[h[i]],!g||e(g.name,h)?g||d.warn("could not find: "+h[i]):(g.css&&s.loadCSS(g.css),g.loadInit&&g.loadInit(),g.loaded=!0,j(g,h),f.push(g.name));for(i=0,h=f.length;i<h;i++)k=!1,g=f[i],-1==c.inArray(g,a)&&("noCombo"!=d.debug&&c.each(m[g].c,l),k||b(m[g].src||
g,g))}}(),makePath:function(a){if(-1!=a.indexOf("//")||0===a.indexOf("/"))return a;-1==a.indexOf(".")&&(a+=".js");o.addCacheBuster&&(a+=o.addCacheBuster);return o.basePath+a},loadCSS:function(){var a,b=[];return function(d){d=this.makePath(d);-1==c.inArray(d,b)&&(a=a||c("link, style")[0]||c("script")[0],b.push(d),c('<link rel="stylesheet" />').insertBefore(a).attr({href:d}))}}(),loadScript:function(){var a=[];return function(b,d,j){b=s.makePath(b);if(-1==c.inArray(b,a)){var h=function(){h=null;d&&
d();j&&("string"==typeof j&&(j=j.split(" ")),c.each(j,function(b,a){m[a]&&(m[a].afterLoad&&m[a].afterLoad(),l(!m[a].noAutoCallback?a:a+"FileLoaded",!0))}))};a.push(b);window.require?require([b],h):window.sssl?sssl(b,h):window.yepnope&&(yepnope.injectJs?yepnope.injectJs(b,h):yepnope({load:b,callback:h}))}}}()}};c.webshims=d;var w=("https:"==location.protocol?"https://":"http://")+"ajax.googleapis.com/ajax/libs/",C=w+"jqueryui/1.8.16/",o=d.cfg,k=d.features,l=d.isReady,q=d.ready,i=d.addPolyfill,m=d.modules,
s=d.loader,u=s.loadList,x=s.addModule,D={warn:1,error:1};d.addMethodName=function(a){var a=a.split(":"),b=a[1];1==a.length&&(b=a[0]);a=a[0];c.fn[a]=function(){return this.callProp(b,arguments)}};c.fn.callProp=function(a,b){var e;b||(b=[]);this.each(function(){var j=c.prop(this,a);if(j&&j.apply){if(e=j.apply(this,b),void 0!==e)return!1}else d.warn(a+" is not a method of "+this)});return void 0!==e?e:this};d.activeLang=function(){var a=navigator.browserLanguage||navigator.language||"";q("webshimLocalization",
function(){d.activeLang(a)});return function(b){if(b)if("string"==typeof b)a=b;else if("object"==typeof b){var c=arguments,j=this;q("webshimLocalization",function(){d.activeLang.apply(j,c)})}return a}}();c.each(["log","error","warn","info"],function(a,b){d[b]=function(a){if((D[b]&&!1!==d.debug||d.debug)&&window.console&&console.log)return console[console[b]?b:"log"](a)}});(function(){c.isDOMReady=c.isReady;if(c.isDOMReady)l("DOM",!0);else{var a=c.ready;c.ready=function(b){if(!0!==b&&!c.isDOMReady)document.body?
(c.isDOMReady=!0,l("DOM",!0),c.ready=a):setTimeout(function(){c.ready(b)},13);return a.apply(this,arguments)}}c(function(){l("DOM",!0);setTimeout(function(){l("WINDOWLOAD",!0)},9999)});c(window).load(function(){l("WINDOWLOAD",!0)})})();(function(){var a=[];c.extend(d,{addReady:function(b){var c=function(a,c){d.ready("DOM",function(){b(a,c)})};a.push(c);c(document,A)},triggerDomUpdate:function(b){if(!b||!b.nodeType)b&&b.jquery&&b.each(function(){d.triggerDomUpdate(this)});else{var e=b.nodeType;if(!(1!=
e&&9!=e)){var j=b!==document?c(b):A;c.each(a,function(a,c){c(b,j)})}}}});c.fn.htmlPolyfill=function(a){a=c.fn.html.call(this,a?d.fixHTML5(a):a);a===this&&c.isDOMReady&&this.each(function(){1==this.nodeType&&d.triggerDomUpdate(this)});return a};c.each(["after","before","append","prepend","replaceWith"],function(a,e){c.fn[e+"Polyfill"]=function(a){a=c(d.fixHTML5(a));c.fn[e].call(this,a);c.isDOMReady&&a.each(function(){1==this.nodeType&&d.triggerDomUpdate(this)});return this}});c.each(["insertAfter",
"insertBefore","appendTo","prependTo","replaceAll"],function(a,e){c.fn[e.replace(/[A-Z]/,function(a){return"Polyfill"+a})]=function(){c.fn[e].apply(this,arguments);d.triggerDomUpdate(this);return this}});c.fn.updatePolyfill=function(){d.triggerDomUpdate(this);return this};c.each(["getNativeElement","getShadowElement","getShadowFocusElement"],function(a,d){c.fn[d]=function(){return this}})})();(function(){var a=p.prototype.hasOwnProperty,b=["configurable","enumerable","writable"],e=function(a){for(var c=
0;3>c;c++)if(void 0===a[b[c]]&&("writable"!==b[c]||void 0!==a.value))a[b[c]]=!0},f=function(b){if(b)for(var c in b)a.call(b,c)&&e(b[c])};if(p.create)d.objectCreate=function(a,b,d){f(b);a=p.create(a,b);if(d)a.options=c.extend(!0,{},a.options||{},d),d=a.options;a._create&&c.isFunction(a._create)&&a._create(d);return a};p.defineProperty&&(d.defineProperty=function(a,b,c){e(c);return p.defineProperty(a,b,c)});if(p.defineProperties)d.defineProperties=function(a,b){f(b);return p.defineProperties(a,b)};
d.getOwnPropertyDescriptor=p.getOwnPropertyDescriptor;d.getPrototypeOf=p.getPrototypeOf})();x("jquery-ui",{src:C+"jquery-ui.min.js",test:function(){return!(!c.widget||!c.Widget)}});x("input-widgets",{src:"",test:function(){return!this.src||!(c.widget&&(!c.fn.datepicker||!c.fn.slider))}});x("swfobject",{src:w+"swfobject/2.2/swfobject.js",test:function(){return"swfobject"in window}});i("es5",{test:function(){if(!Function.prototype.bind)Function.prototype.bind=function(a){var b=this;if("function"!=typeof b)throw new TypeError;
var c=y.call(arguments,1),d=function(){if(this instanceof d){var f=function(){};f.prototype=b.prototype;var f=new f,g=b.apply(f,c.concat(y.call(arguments)));return null!==g&&p(g)===g?g:f}return b.apply(a,c.concat(y.call(arguments)))};return d};return f.ES5},c:[10,1]});i("dom-extend",{f:"dom-support",noAutoCallback:!0,d:["es5"],c:[10,9,12,17,16,8,1,19,11,13]});"localstorage"in f&&i("json-storage",{test:f.localstorage&&"sessionStorage"in window&&"JSON"in window,loadInit:function(){u(["swfobject"])},
noAutoCallback:!0,c:[14]});"geolocation"in f&&"localstorage"in f&&i("geolocation",{test:f.geolocation,options:{destroyWrite:!0},d:["json-storage"],c:[14,15]});(function(){if("canvas"in f){var a;i("canvas",{src:"excanvas",test:f.canvas,options:{type:"excanvas"},noAutoCallback:!0,loadInit:function(){var b=this.options.type;if(b&&-1!==b.indexOf("flash")&&(!window.swfobject||swfobject.hasFlashPlayerVersion("9.0.0")))window.FlashCanvasOptions=window.FlashCanvasOptions||{},a=FlashCanvasOptions,"flash"==
b?(c.extend(a,{swfPath:o.basePath+"FlashCanvas/"}),this.src="FlashCanvas/flashcanvas"):(c.extend(a,{swfPath:o.basePath+"FlashCanvasPro/"}),this.src="FlashCanvasPro/flashcanvas")},afterLoad:function(){d.addReady(function(a,d){c("canvas",a).add(d.filter("canvas")).each(function(){!this.getContext&&window.G_vmlCanvasManager&&G_vmlCanvasManager.initElement(this)});a==document&&l("canvas",!0)})},methodNames:["getContext"],d:["dom-support"]})}})();var t=f.input,v=f.inputtypes;if(t&&v)B("formvalidation",
function(){return!(!t.required||!t.pattern)}),d.validationMessages=d.validityMessages=[],d.inputTypes={},i("form-core",{f:"forms",d:["es5"],test:function(){if(this.options.lightweightDatalist&&!this.datalistLoaded)this.datalistLoaded=!0,m["form-datalist"].f="forms",d.reTest(["form-datalist"]);return!1},options:{placeholderType:"value",langSrc:"i18n/errormessages-",availabeLangs:"ar,ch-ZN,el,es,fr,he,hi,hu,it,ja,nl,pt-PT,ru".split(",")},methodNames:["setCustomValidity","checkValidity"],c:[3,2,59,17,
16,5,4,19]}),f.formvalidation?(i("form-extend",{f:"forms",src:"form-native-extend",test:function(a){return(m["form-number-date-api"].test()||-1==c.inArray("form-number-date-api",a||[]))&&!this.options.overrideMessages},d:["form-core","dom-support","form-message"],c:[18,7,59,5]}),i("form-dummy",{f:"forms",test:!0,loaded:!0,c:[2,3,21]})):(i("form-dummy",{f:"forms",test:!0,loaded:!0,c:[18,7,4,59,5]}),i("form-extend",{f:"forms",src:"form-shim-extend",d:["form-core","dom-support"],c:[3,2,21]})),i("form-message",
{f:"forms",test:function(a){return!(this.options.customMessages||!f.formvalidation||!m["form-extend"].test(a)||d.bugs.validationMessage)},d:["dom-support"],c:[3,2,21,59,17,5,4]}),d.addPolyfill("form-output",{f:"forms",test:"value"in document.createElement("output"),d:["dom-support"],c:[3,2,21]}),i("form-number-date-api",{f:"forms-ext",uiTest:function(){return v.range&&v.date&&v.time&&v.number},test:function(a){if(!this.addedForms&&a)this.addedForms=!0,-1==c.inArray("form-core",a)&&a.push("form-core");
return this.uiTest()&&!d.bugs.valueAsNumberSet},d:["forms","dom-support"],c:[18,7,6]}),i("form-number-date-ui",{f:"forms-ext",test:function(){return m["form-number-date-api"].test()&&!this.options.replaceUI},d:["forms","dom-support","form-number-date-api"],loadInit:function(){u(["jquery-ui"]);m["input-widgets"].src&&u(["input-widgets"])},options:{stepArrows:{number:1,time:1},calculateWidth:!0,slider:{},datepicker:{},langSrc:C+"i18n/jquery.ui.datepicker-",recalcWidth:!0},c:[18,7,6]}),t.list=f.datalist=
!!(t.list&&"HTMLDataListElement"in window),i("form-datalist",{f:"forms-ext",test:t.list,d:["form-core","dom-support"],c:[3,59,18,19,11]});i("details",{test:f.details,d:["dom-support"],options:{text:"Details"},c:[12,13,15]});if("audio"in f&&"video"in f)d.mediaelement={},i("mediaelement-core",{f:"mediaelement",noAutoCallback:!0,d:["swfobject","dom-support"],c:[10,9,12,17,16,8]}),i("mediaelement-swf",{f:"mediaelement",options:{hasToPlay:"any",preferFlash:!1,jwVars:{},jwParams:{},jwAttrs:{},changeJW:c.noop},
methodNames:["play","pause","canPlayType","mediaLoad:load"],d:["swfobject","dom-support"],test:function(){if(!f.audio||!f.video)return!1;var a=this.options,b=a.hasToPlay;return!((!window.swfobject||window.swfobject.hasFlashPlayerVersion("9.0.115"))&&(a.preferFlash||"any"!=b&&!f.video[b]&&!f.audio[b]))},c:[10,9]});z.filter("[data-polyfill-cfg]").each(function(){try{d.setOptions(c(this).data("polyfillCfg"))}catch(a){d.warn("error parsing polyfill cfg: "+a)}}).end().filter("[data-polyfill]").each(function(){d.polyfill(c.trim(c(this).data("polyfill")||
""))});r&&(r.cfg&&d.setOptions(r.cfg),r.lang&&d.activeLang(r.lang),"polyfill"in r&&d.polyfill(r.polyfill))});