%%% Create Motor Geometry Struct %%%

g.depth =       8;      % axial length
g.s.slots =     36;     % stator slots
g.s.r1 =        40.5;     % tooth surface radius
g.s.r2 =        31.5;     % radius at tooth root
g.s.r3 =        29.3;     % backiron radius
g.s.t_pct =     .28;     % tooth fill percent
g.s.tip_pct =   .707;      % tooth tip fill percent
g.s.tip_l =     .5;      % Tooth tip length
g.s.tip_angle = pi/24;   % Tooth tip flare angle
g.s.ff =        .5;     % Slot fill-factor

g.r.ppairs =    21;      % pole-pairs
g.r.r1 =        40.7;     % rotor surface radius
g.r.r2 =        42.02;     % back-iron radius, magnet side
g.r.r3 =        43.42;     % backiron radius
g.r.m_pct =     .62;     % Magnet fill percent

g.n_p = 7;              % number of poles to simulate
g.n_s = 6;              % number of slots to simulate

g.s.material = 'M-19 Steel';        % Stator steel type
g.s.t_lam = .2;                     % Stator lamination thickness
g.s.stacking_factor = .928;         % lamination stackign factor
g.r.magnet_type = 'N42';            % Rotor Magnet Type
g.r.backiron_material = '1018 Steel';   % Rotor Back Iron Material

g.s.imap = ['A','A','a','B','b','b','B','c','C','C','c','A'];
g.s.span = 1;      % number of slots spanned by each turn (typically 1 for concentrated winding, 3 for distributed

g = calc_geometry(g);

 