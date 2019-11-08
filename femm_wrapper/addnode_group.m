function addnode_group(point, propname, groupno)
    mi_addnode(point(1), point(2));
    mi_selectnode(point(1), point(2));
    mi_setnodeprop(propname, groupno);
end
