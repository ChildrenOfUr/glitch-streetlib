glitch-streetlib
================

A dart package that takes a street.json file and renders a css3d street.

This package relies on the libld package.


First you specify a path to a 'street.json'(extention doesn't matter as long as it's properly formatted), and it is converted to a Map object.  
Then we insert, size, and color a container div element to the specifications in the document.  
This containing div needs to have a CSS3d perspective-origin property, which will be adjusted with the camera.  
Afterward, 'layer' divs are added to the containing div which are properly sized and given SVG filters as specified.  
Each layer in the street document contains a list of 'decos'.  
These must be inserted into the appropriate layers, set to absolute positioning with left and top both at 0, and must display the image corresponding to their 'filename' as documented.  
When they are added, they must be positioned using 'translate3d' CSS property.
