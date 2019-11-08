function theta_elec = rotate_rotor(theta, g)
mi_clearselected()
mi_selectgroup(2); 
mi_moverotate([0, 0], -theta/g.r.ppairs);
end
