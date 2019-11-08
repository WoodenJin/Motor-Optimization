function addnodelist_group(points, propname, groupno)
    for i = 1:size(points(:,1))
        mi_addnode(points(i, 1), points(i, 2));
    end
    for i = 1:size(points(:,1))
        mi_selectnode(points(i, 1), points(i, 2));
    end
    mi_setnodeprop(propname, groupno);
end
