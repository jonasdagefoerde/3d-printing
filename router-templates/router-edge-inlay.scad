// Global constants
print_comp = 0.1;  // compensation for (unwanted) additional material being extruded bei 3d printer


/*
  x = direction along the sheet material
  y = perpendicular to the direction along sheet edge
*/

/* The first printed edge jig did not include ceil() to not frame dimensions */
router_jig_inlay_circle(
    inlay_x = 67.9 - 2*print_comp,
    inlay_y = 47.9 - 2*print_comp,
    circle_dia = 18);

router_jig_inlay_circle(
    inlay_x = 67.9 - 2*print_comp,
    inlay_y = 47.9 - 2*print_comp,
    circle_dia = 18);


/* The first printed edge jig did not include rounded inlay frame dimensions */


/* Inlay for the router edge jig that will allow to mill a circle into an edge */
module router_jig_inlay_circle(
  inlay_x,    // outer x length
  inlay_y,    // outer y length
  circle_dia  // diameter of milled circle
  ) {
    // fixed values derived from router dimensions and experience
    jig_h = 5;  // jig height (or strength)
    difference() {
        cube([inlay_x, inlay_y, jig_h], center=true);
        cylinder(h=2*jig_h, d=circle_dia+2*print_comp, center=true);
    }
}


/* Inlay for the router edge jig that will allow to mill a circle into an edge */
module router_jig_inlay_rect(
  inlay_x,  // outer x length
  inlay_y,  // outer y length
  rect_x,   // milled length in x
  rect_y    // milled length in y
  ) {
    // fixed values derived from router dimensions and experience
    jig_h = 5;  // jig height (or strength)
    difference() {
        cube([inlay_x, inlay_y, jig_h], center=true);
        cube([rect_x, rect_y, 2*jig_h], center=true);
    }
}
