function addblocklabel(point, blockname,automesh,meshsize,incirc,magdir,group,turns)    
    mi_clearselected
    mi_addblocklabel(point(1), point(2));          
    mi_selectlabel(point(1), point(2)); 
    mi_setblockprop(blockname,automesh,meshsize,incirc,magdir,group,turns);
end
