# Image Gallery

The Image gallery template includes a collapsed and expanded states.

## Collapsed

### `init()`

This initializes the unit by: 

* Setting up the `Nav - Expand` call.
* Setting up the automatic slideshow function.
* Handling whether the unit has one or multiple slides.

## Expanded

### `init()`

This positions and initializes elements of the Image gallery.

* `init_arrows()`

Positions the arrows and adds the `MOUSE_DOWN` event.

* `initSlideshow()`

Positions each slide and the dots.

* `intro()`

Shows the intro animation.

* `auto()`

Sets up the automatic slideshow function, if the user interacts with the unit it will cancel the `auto()`.
