%%% Create Motor Geometry Struct %%%

g.depth =       15;      % axial length
g.s.slots =     78;     % stator slots
g.s.r1 =        48.8;     % tooth surface radius
g.s.r2 =        60.5;     % radius at tooth root
g.s.r3 =        63.5;     % backiron radius
g.s.t_pct =     .5088;     % tooth fill percent
g.s.tip_pct =   .814;      % tooth tip fill percent
g.s.tip_l =     .2;      % Tooth tip length
g.s.tip_angle = pi/4;   % Tooth tip flare angle
g.s.ff =        .8;     % Slot fill-factor

g.r.ppairs =    13;      % pole-pairs
g.r.r1 =        48.5;     % rotor surface radius
g.r.r2 =        41.7;     % back-iron radius, magnet side
g.r.r3 =        38.5;     % backiron radius
g.r.m_pct =     .99;     % Magnet fill percent

g.n_p = 1;              % number of poles to simulate
g.n_s = 3;              % number of slots to simulate

g.s.material = 'Hiperco-50';        % Stator steel type
g.s.t_lam = .4;                     % Stator lamination thickness
g.s.stacking_factor = .95;         % lamination stackign factor
g.r.magnet_type = 'N42';            % Rotor Magnet Type
g.r.backiron_material = 'Hiperco-50';   % Rotor Back Iron Material

g.s.imap = ['A', 'A', 'b', 'b', 'C', 'C'];%  phase current to slot mapping
g.s.span = 3;                               % number of slots spanned by each turn
g = calc_geometry(g);

 