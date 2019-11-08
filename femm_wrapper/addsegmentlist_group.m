function addsegmentelist_group(points, propname, elementsize, groupno)
    for i = 1:size(points(:,1))
        mi_addsegment(points(i, 1), points(i, 2), points(i, 3), points(i, 4));
    end
    for i = 1:size(points(:,1))
        mi_selectsegment((points(i, 1)+points(i, 3))/2, (points(i, 2)+points(i, 4))/2);
    end
    mi_setsegmentprop(propname,elementsize, 0, 0, groupno);
end
