function addarclist_group(points, propname, maxseg, groupno)
    arc_midpoints = [];
    for i = 1:size(points(:,1))
        radius = .5*norm(points(i,5:6)-points(i,1:2)) + .5*norm(points(i,5:6)-points(i,3:4));
        l = norm(points(i,1:2)-points(i,3:4));
        angle = radtodeg(asin(l/radius));
        %round(angle/maxdegseg);
        mi_addarc(points(i,3), points(i,4), points(i,1), points(i,2), angle, maxseg);
        center_direction = mean([points(i,1:2); points(i,3:4)]) - points(i,5:6);
        center_direction = center_direction/norm(center_direction);
        arc_center = points(i,5:6) + radius*center_direction;
        arc_midpoints = [arc_midpoints;arc_center];
    end
    for i = 1:size(points(:,1))
        %mi_selectarcsegment((points(i,1)+points(i,3))/2, (points(i,2)+points(i,4))/2);
        mi_selectarcsegment(arc_midpoints(i,1), arc_midpoints(i, 2));
    end
    mi_setarcsegmentprop(angle/maxseg, propname, 0, groupno);
%     for i = 1:size(points(:,1));
%         addarc_group(points(i, 1:2), points(i, 3:4), points(i,5:6), propname, maxseg, groupno); 
%     end

end
