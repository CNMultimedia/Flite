﻿package {	import flash.display.MovieClip;	import flash.system.Security;	import com.condenast.AssetsLoader;	public class Main extends MovieClip{		public namespace flite = "http://www.flite.com/ad/v3/component/namespace";		private var _key:String;		private var _api:Object;		private var _config:Object;		private var _state:String;		private var _children:Array;		private var assets_loader:AssetsLoader;		private var loaded:Boolean = false;				/*** For testing purposes ***/		private var debug:Boolean = (loaderInfo.loaderURL.split('file:////').length == 2); // true -> local | false -> live			public function Main() {			Security.allowDomain("*");			if(debug){assets_loader = new  AssetsLoader(_api, _config); addChild(assets_loader); assets_loader.init(debug);} 		}			flite function initialize(resources:Object):void {			_api = resources.api;			_config = resources.config;			assets_loader = new  AssetsLoader(_api, _config); 			assets_loader.alpha = 0;			addChild(assets_loader);				}				flite function stateChange(info:Object):void {			switch(info.state){				case 'enabled':				assets_loader.setMetrics(info.trigger);				if(!loaded){					assets_loader.init(debug);					loaded = true;				}				assets_loader.alpha = 1;				break;			}		}	}}