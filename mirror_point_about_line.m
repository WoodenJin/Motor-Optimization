function m_point = mirror_point_about_line(point, line_vector)    
    u = line_vector/norm(line_vector);
    theta = atan2(u(2), u(1));
    R = [cos(2*theta) sin(2*theta); sin(2*theta) -cos(2*theta)];
    m_point = R*point;

end
