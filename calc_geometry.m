function g = calc_geometry(params)
    g = params;

%%% Intermediate values for drawing %%%

%%% Stator %%%
    g.s.theta = 2*pi/g.s.slots;
    s1 = sin(g.s.theta);
    c1 = cos(g.s.theta);
    s2 = sin(g.s.theta/2);
    c2 = cos(g.s.theta/2);

    theta_tooth = g.s.theta*g.s.t_pct;
    theta_tip = g.s.theta*g.s.tip_pct;
    
    g.s.p1 = [0, g.s.r1];
    g.s.p2 = [g.s.r1*sin(theta_tooth/2), g.s.r1*cos(theta_tooth/2)];
    g.s.p3 = [g.s.p2(1), sqrt(g.s.r2^2 - (g.s.p2(1))^2)];
    g.s.p4 = [g.s.r2*s2, g.s.r2*c2];
    g.s.p5 = [g.s.r3*s2, g.s.r3*c2];
    g.s.p6 = [0, g.s.r3];
    g.s.p7 = [g.s.r1*s2, g.s.r1*c2];

    %%% 1 if inrunner, -1 if outrunner %%%
    g.s.sign = g.s.r1<g.s.r3;   
    if(g.s.sign == 0)
        g.s.sign = -1;
    end
    
    g.s.p1 = [0, g.s.r1];
    g.s.p2 = [g.s.r1*sin(theta_tip/2), g.s.r1*cos(theta_tip/2)];
    g.s.p3 = g.s.p2 + g.s.sign*[0, g.s.tip_l];
    g.s.p4 = [g.s.r1*sin(theta_tooth/2), g.s.p3(2) + g.s.sign*tan(g.s.tip_angle)*(g.s.p3(1)-g.s.r1*sin(theta_tooth/2))];
    g.s.p5 = [g.s.p4(1), sqrt(g.s.r2^2 - (g.s.p4(1))^2)];
    g.s.p6 = [g.s.r2*s2, g.s.r2*c2];
    g.s.p7 = [g.s.r3*s2, g.s.r3*c2];
    g.s.p8 = [0, g.s.r3];
    g.s.p9 = [norm(g.s.p3)*s2, norm(g.s.p3)*c2];

    g.s.pointlist = [g.s.p1; g.s.p2; g.s.p3; g.s.p4; g.s.p5; g.s.p6; g.s.p9];
    g.s.boundary_point = [g.s.p8];
    
    %%% start, end %%%
    g.s.segmentlist = [g.s.p2, g.s.p3;
                       g.s.p3, g.s.p4;
                       g.s.p4, g.s.p5;
                       g.s.p3, g.s.p9;
                       g.s.p6, g.s.p9;
                       ];
    %%% start, end, center
    g.s.arclist = [g.s.p1, g.s.p2, [0, 0];
                   g.s.p5, g.s.p6, [0, 0];
                   %g.s.p8, g.s.p7, [0, 0];
                   ];

%%% Rotor %%%
    g.r.theta = pi/g.r.ppairs;
    g.r.theta_pole = g.r.theta*g.r.m_pct;
    
    theta_gap = g.r.theta-g.r.theta_pole;
    
    s1 = sin(g.r.theta);
    c1 = cos(g.r.theta);
    s2 = sin(g.r.theta/2);
    c2 = cos(g.r.theta/2);
    s3 = sin(g.r.theta_pole/2);
    c3 = cos(g.r.theta_pole/2);
    s4 = sin(theta_gap/2);
    c4 = cos(theta_gap/2);
    
    g.r.p1 = [0, g.r.r3];
    g.r.p2 = [g.r.r3*s2, g.r.r3*c2];
    g.r.p3 = [g.r.r2*s2, g.r.r2*c2];
    g.r.p4 = [0, g.r.r2];
    g.r.p5 = [g.r.r1*s2, g.r.r1*c2];
    g.r.p6 = [g.r.r1*s4, g.r.r1*c4];
    g.r.p7 = [g.r.p6(1), sqrt(g.r.r2^2 - g.r.p6(1)^2)];
    
    g.r.pointlist = [g.r.p3; g.r.p4; g.r.p5; g.r.p6;, g.r.p7];
    g.r.boundary_point = g.r.p1;
    
    g.r.segmentlist = [g.r.p6, g.r.p7];
    
    g.r.arclist = [g.r.p4, g.r.p7, [0, 0];
                   g.r.p7, g.r.p3, [0, 0];
                   g.r.p6, g.r.p5, [0, 0];
                   ]
               
    g.r_airgap =  mean([g.s.r1, g.r.r1]);
    

end