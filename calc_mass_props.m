function [mass, m_stator, m_rotor, j_rotor, r_phase] = calc_mass_props(g)

material_densities;
% fem_name = sprintf('test.fem');
% mi_saveas(fem_name);
% mi_analyze
% mi_loadsolution

%%% stator laminations %%%
mo_clearblock;
mo_groupselectblock(1);     
v_s_steel  = mo_blockintegral(10)*g.s.slots/g.n_s;
m_s_steel = v_s_steel*densities(g.s.material);

%%% windings %%%
mo_clearblock;
mo_groupselectblock(11);     
v_s_windings  = mo_blockintegral(10)*g.s.slots/g.n_s;
m_s_windings = v_s_windings*densities('Copper')*g.s.ff
% Still need to add in end-turn mass

%%% rotor steel %%%
mo_clearblock;
mo_groupselectblock(2); 
v_r_steel = mo_blockintegral(10)*2*g.r.ppairs/g.n_p;
m_r_steel = v_r_steel*densities(g.r.backiron_material);
j_r_steel = mo_blockintegral(24)*densities(g.r.backiron_material)*2*g.r.ppairs/g.n_p;

%%% rotor magnets %%%
mo_clearblock;
mo_groupselectblock(12); 
v_r_magnet = mo_blockintegral(10)*2*g.r.ppairs/g.n_p;
m_r_magnet = v_r_magnet*densities(g.r.magnet_type);
j_r_magnet = mo_blockintegral(24)*densities(g.r.magnet_type)*2*g.r.ppairs/g.n_p;




mo_clearblock;

m_stator = m_s_steel + m_s_windings;
m_rotor = m_r_steel + m_r_magnet
mass = m_stator + m_rotor;
j_rotor = j_r_steel + j_r_magnet;

end
