function addsegment_group(start_point, end_point, propname, elementsize, groupno)
    mi_addsegment(start_point(1), start_point(2), end_point(1), end_point(2));
    mi_selectsegment((start_point(1)+end_point(1))/2, (start_point(2)+end_point(2))/2);
    mi_setsegmentprop(propname,elementsize, 0, 0, groupno);
end
