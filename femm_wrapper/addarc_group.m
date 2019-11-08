function addarc_group(end_point, start_point, center_point, propname, maxseg, groupno)
    radius = .5*norm(center_point-start_point) + .5*norm(center_point-end_point);
    l = norm(start_point-end_point);
    angle = 2*radtodeg(asin(.5*l/radius));
    mi_addarc(start_point(1), start_point(2), end_point(1), end_point(2), angle, maxseg);
    center_direction = mean([start_point; end_point]) - center_point;
    center_direction = center_direction/norm(center_direction);
    arc_center = center_point + radius*center_direction;
        
    %mi_selectarcsegment((start_point(1)+end_point(1))/2, (start_point(2)+end_point(2))/2);
    mi_selectarcsegment(arc_center);
    maxsegdeg = angle/maxseg;
    mi_setarcsegmentprop(maxsegdeg, propname, 0, groupno);
end
