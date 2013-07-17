# Tabbed

This units is composed of a collapsed state similar to the [Image Gallery](https://github.com/CNMultimedia/Flite/tree/master/ImageGallery) and an expanded state using the same functionalities of the [Filmstrip](https://github.com/CNMultimedia/Flite/tree/master/Filmstrip).

## Expanded

Here are couple of improvements on the initial Filmstrip code.

### Strucure

First, in the Tabbed unit the structure is simply `content` and `left`.

* `init_left()`

This initializes the navigation tabs and the ctas.

* `init_content()`

Same as Filmstrip.

* `setup_gallery()`

In order to avoid redundancies in the code. I created an extra function taking the type of gallery as parameter. This helps optimizing the initialization process of each gallery.
