﻿package com.condenast{	import flash.display.Sprite;	import com.greensock.TimelineLite;	import com.greensock.TweenMax;	import com.greensock.easing.Quint;	import com.greensock.plugins.TweenPlugin; 	import com.greensock.plugins.ColorTransformPlugin; 	import flash.events.MouseEvent;	import com.rindra.utils.VP;	import com.rindra.events.VPEvent;	import flash.display.Shape;		public class Product extends Sprite {		private var _lib:Object;		private var _track:Function;		private var count:uint;		private var prefix:String;				private var left:Sprite;		private var content:Sprite;		private var image_gallery:Sprite;		private var image_gallery_slides:Sprite;			private var video_gallery:Sprite;		private var video_gallery_slides:Sprite;				private var content_gallery:Sprite;		private var footer:Sprite;		private var tabs:Sprite;		private var hover_mc:Sprite;		private var count_image:uint;		private var count_video:uint;				private var section:uint;				private var vp:VP;					private var firstplay:Boolean = true;				public function Product($lib:Object, $f:Function) {			_lib = $lib;			_track = $f;			init();		}				private function init():void{			//Your code goes here!			left = new Sprite;			content = new Sprite;			footer = new Sprite;						init_left();			init_content();						_lib.close.x = 575;						addChild(content);			addChild(left);			addChild(_lib.close);						_lib.close.buttonMode = true;			_lib.close.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				_track('message', 'close');			})						section = 0;						(function(){			 	content.y = -750; 				var t:TimelineLite = new TimelineLite({onComplete:show});				t.insert(TweenMax.from(tabs, .5, {x:-300, ease:Quint.easeOut}));				t.insert(TweenMax.from(_lib.headerIntroCopy, .5, {x:-300, ease:Quint.easeOut}), .1);				t.insert(TweenMax.from(_lib.logo, .5, {y:250, ease:Quint.easeOut}), .2);				t.insert(TweenMax.from(_lib.cta, .5, {y:250, ease:Quint.easeOut}), .3);			})();			//_track('custom', 'View_Image_1');			_track('click', 'Nav_Tab_'+(section+1));			TweenPlugin.activate([ColorTransformPlugin]);		}		private function init_left():void{			tabs = new Sprite;			var nav:Sprite = new Sprite;			_lib.tab1.x = 63;			_lib.tab2.x = 122;			_lib.headerIntroCopy.y = 41;			_lib.logo.y = 202;			_lib.cta.x = 111;			_lib.cta.y = 202;			nav.addChild(_lib.tab0);			nav.addChild(_lib.tab1);			nav.addChild(_lib.tab2);						tabs.addChild(_lib.tabsbg);			tabs.addChild(nav);			left.addChild(tabs);			left.addChild(_lib.headerIntroCopy);			left.addChild(_lib.logo);			left.addChild(_lib.cta);						nav.buttonMode = true;			nav.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				section = $e.target.toString().split('tab')[1].split(']')[0];				show();				_track('click', 'Nav_Tab_'+(section+1));			});			_lib.logo.buttonMode = true;			_lib.logo.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				prefix = 'Exit_CTA_logo';				_track('message', 'exit_logo');			});			_lib.cta.buttonMode = true;			_lib.cta.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				prefix = 'Exit_CTA_main';				_track('message', 'exit_cta');			});			/*_lib.down_arrow.addEventListener(MouseEvent.MOUSE_DOWN, function():void{				section = (section-1>=0)?section-1:2; show();				_track('click', 'arrows_click');			});*/		}		private function init_content():void{			image_gallery = new Sprite;			video_gallery = new Sprite;			content_gallery = new Sprite;						video_gallery.x = 222;			video_gallery.y = 0;						image_gallery.x = 222;			image_gallery.y = 250;						content_gallery.x = 222;			content_gallery.y = 500;						init_image_gallery();			init_video_gallery();			init_content_gallery();						content.addChild(image_gallery);			content.addChild(video_gallery);			content.addChild(content_gallery);								}		private function setup_gallery(gallery:Sprite, gallery_slides:Sprite, image:String, dsc:String, type:String):void{			//gallery_slides.x = 39;			var dots:Sprite = new Sprite;			var nav:Sprite = addNav(gallery, gallery_slides, dots, type);			//var slideshowbg_class:Class = Object(_lib.slideshowbg).constructor;			//var slideshowbg:Sprite = new slideshowbg_class();			//var dsc_mask:Shape = new Shape;			//dsc_mask.graphics.beginFill(0xff0000);			//dsc_mask.graphics.drawRect(0,0,378,34);			//dsc_mask.graphics.endFill();			for(var el in _lib){				if(el.split(image).length > 1){					var i:uint = uint(el.split(image)[1]);					_lib[el].x = 378*i;										gallery_slides.addChild(_lib[el]);										addDots(dots, i, type);				}			}									//dsc_mask.y = 168;			//slideshowbg.y = 202;			dots.x = (378-dots.width)/2;			dots.y = 202 + 20;			//gallery.addChild(dsc_mask);						gallery.addChild(gallery_slides);			//gallery.addChild(slideshowbg);			if(type == 'video') gallery.addChild(vp);			gallery.addChild(nav);			gallery.addChild(dots);			gallery.addChild(hover_mc);			clearDots(dots, type);		}		private function init_video_gallery():void{			vp = new VP('300x168', '',true, false, false, false);			vp.visible = false;			vp.x = 39;			var vpinit:Boolean = false;						video_gallery_slides = new Sprite;						hover_mc = new Sprite;			setup_gallery(video_gallery, video_gallery_slides, 'poster', 'caption', 'video');						vp.addEventListener(VPEvent.VIDEO_START, function($e:VPEvent):void{				if(!vpinit){					vp.addEventListener(VPEvent.VIDEO_10S, function(){ _track('custom', 'Video_'+(count_video+1)+'_10sec') });					vp.addEventListener(VPEvent.VIDEO_MIDPOINT, function(){ _track('custom', 'Video_'+(count_video+1)+'_Midpoint') });					vp.addEventListener(VPEvent.VIDEO_COMPLETE, function(){ _track('custom', 'Video_'+(count_video+1)+'_Complete') });					vp.addEventListener(VPEvent.VIDEO_REPLAY, function(){ _track('custom', 'Video_'+(count_video+1)+'_Replay') });					vpinit = true;				}			});						video_gallery_slides.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				vp.visible = true;				vp.loadNewVideo(_lib.rtmps[count_video]);				if(firstplay) vp.playVideo();				firstplay = false;				_track('custom', 'Video_'+(count_video+1)+'_Play');			});		}		private function init_content_gallery():void{			content_gallery.addChild(_lib.custom);		}		private function init_image_gallery(){			image_gallery_slides = new Sprite;						hover_mc = new Sprite;			setup_gallery(image_gallery, image_gallery_slides, 'image', 'dsc', 'image');		}		private function addNav(mc:Sprite, slides:Sprite, dots:Sprite, type:String):Sprite{			var nav_left_class:Class = Object(_lib.navLeft).constructor;			var nav_right_class:Class = Object(_lib.navRight).constructor;			var nav_left:Sprite = new nav_left_class();			var nav_right:Sprite = new nav_right_class();			var nav:Sprite = new Sprite;			var bg:Sprite = new Sprite;			bg.graphics.beginFill(_lib.arrows_background, .9);			bg.graphics.drawRect(0,0,33,168);			bg.graphics.endFill();			bg.graphics.beginFill(_lib.arrows_background, .9);			bg.graphics.drawRect(345,0,33,168);			bg.graphics.endFill();			nav_left.name = 'nav_left';			nav_right.name = 'nav_right';			nav_right.x = 363;			nav_right.y = 50;			nav_left.y = 50;			nav.buttonMode = true;			nav.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				switch(type){					case 'image':						switch($e.target.name){							case 'nav_right': if(count_image++<slides.numChildren-1){slide('image', dots)}else{count_image=0; slide('image', dots);}; _track('click', 'arrows_click'); break;							case 'nav_left': if(count_image-->0){slide('image', dots)}else{count_image=slides.numChildren-1; slide('image', dots);}; _track('click', 'arrows_click'); break;						}					break;					case 'video':						vp.visible = false;						vp.pauseVideo();						switch($e.target.name){							case 'nav_right': if(count_video++<slides.numChildren-1){slide('video', dots)}else{count_video=0; slide('video', dots);}; _track('click', 'arrows_click'); break;							case 'nav_left': if(count_video-->0){slide('video', dots)}else{count_video=slides.numChildren-1; slide('video', dots);}; _track('click', 'arrows_click'); break;						}					break;				}			});			//nav.addChild(bg);			nav.addChild(nav_left);			nav.addChild(nav_right);			mc.addChild(nav);						return nav;		}		private function addDots(dots:Sprite, id:uint, type:String):void{			var dot_on_class:Class = Object(_lib.dot_on).constructor;			var dot_off_class:Class = Object(_lib.dot_off).constructor;			var dot_on:Sprite = new dot_on_class();			var dot_off:Sprite = new dot_off_class();			var dot:Sprite = new Sprite;			dot.name = 'd'+id;			dot.mouseChildren = false;			dot.buttonMode = true;			dot_on.alpha = 0;			dot_on.name = 'dot_on';			dot_off.name = 'dot_off';			dot.addChild(dot_off);			dot.addChild(dot_on);					dot.x = 17*id;			dots.addChild(dot);			dot.addEventListener(MouseEvent.MOUSE_OVER, function($e:MouseEvent):void{				while(hover_mc.numChildren>0){					hover_mc.removeChildAt(hover_mc.numChildren-1);				}				var hover:Sprite = _lib['hover'+$e.target.name.split('d')[1]];				hover.x = mouseX-307;				hover.y = 143;				if(section != 0){					hover.y = 143 + 250;					hover_mc.addChild(hover);				}			});			dot.addEventListener(MouseEvent.MOUSE_OUT, function($e:MouseEvent):void{				 while(hover_mc.numChildren>0){					 hover_mc.removeChildAt(hover_mc.numChildren-1);				 }			});			dot.addEventListener(MouseEvent.MOUSE_DOWN, function($e:MouseEvent):void{				clearDots(dots, type);				vp.visible = false;				vp.pauseVideo();				switch(type){					case 'image': count_image = $e.target.name.split('d')[1]; break;					case 'video': count_video = $e.target.name.split('d')[1]; break;				}				slide(type, dots);			});		}				private function clearDots(dots:Sprite, type:String):void{			for(var i:uint; i<dots.numChildren; i++){				Sprite(dots.getChildAt(i)).getChildByName('dot_on').alpha = 0;			}			switch(type){				case 'image': Sprite(dots.getChildByName('d'+count_image)).getChildByName('dot_on').alpha = 1; break;				case 'video': Sprite(dots.getChildByName('d'+count_video)).getChildByName('dot_on').alpha = 1; break;			}		}					private function slide(gal_type:String, dots:Sprite):void{			clearDots(dots, gal_type);			switch(gal_type){				case 'image':				TweenMax.to(image_gallery_slides, .5, {x:-378*(count_image), ease:Quint.easeOut});								_track('custom', 'View_Image_'+(count_image+1));				break;				case 'video':				TweenMax.to(video_gallery_slides, .5, {x:-378*(count_video), ease:Quint.easeOut});								break;			}		}		private function show():void{			vp.visible = false;			vp.pauseVideo();			TweenMax.to(content, .5, {y:-250*section, ease:Quint.easeOut});			for(var i:uint=0; i<3; i++){				TweenMax.to(_lib['tab'+i], .1, {colorTransform:{tint:_lib.tab_disabled, tintAmount:1}});			}			TweenMax.to(_lib['tab'+section], .2, {colorTransform:{tint:_lib.tab_enabled, tintAmount:1}});			//_track('custom', 'Nav_Tab_'+(section+1));		}		public function _catch($e:*):void{			if($e.message.split('http://').length >= 2){				_track('navigateToURL', prefix + ((prefix == 'CTA - Image_')?(count+1):''), $e.message);			}		}	}}