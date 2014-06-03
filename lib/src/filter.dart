part of streetlib;






applyFilters(Element layerElement, Map layer) {
  
  List<String> filters = new List();
     new Map.from(layer['filters']).forEach((String filterName, int value)
     {
     //blur is super expensive (seemed to cut my framerate in half)
       if(filterName == "blur")
         {
           filters.add('blur('+value.toString()+'px)');
         }
       if(filterName == "brightness")
         {
           if(value < 0) 
             filters.add('brightness(' + (1-(value/-100)).toString() +')');
           if (value > 0)
             filters.add('brightness(' + (1+(value/100)).toString() +')');
         }
       if(filterName == "contrast")
         {
           if (value < 0) 
             filters.add('contrast(' + (1-(value/-100)).toString() +')');
           if (value > 0)
             filters.add('contrast(' + (1+(value/100)).toString() +')');
         }
       if(filterName == "saturation")
         {
           if (value < 0) 
             filters.add('saturation(' + (1-(value/-100)).toString() +')');
           if (value > 0)
             filters.add('saturation(' + (1+(value/100)).toString() +')');
         }
     });
     layerElement.style.filter = filters.join(' ');
}