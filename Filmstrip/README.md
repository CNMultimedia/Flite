# Filmstrip

The Filmstrip unit template offers 3 kinds of experience in one ad: Image Gallery, Video Gallery, Content Panel.

In the code, due to the fixed header and footer of the unit, it is separated a little differently.

## `init_header()`

In this function, we initialize the header or top content of the unit. 

First we lay out the labels or titles for each section.

Note: we are not using the masking way to setup the labels since it's causing an issue in old browsers.

Then we add `MOUSE_DOWN` events to the `up_arrow` and the `down_arrow`. 

## `init_content()`

This is where we setup the container for each experience.

### `init_image_gallery()`

We lay out all the parts of the gallery, then setup all the slides and the navigation elements.

### `init_video_gallery()`

Same thing as the image gallery, except in this function we also setup the 'vp' component.

### `addNav()`

Both image gallery and video gallery are using the same type of navigation hence the use of 'addNav()'.

This function initializes all the elements of the navigation: the arrows and the dots.  


