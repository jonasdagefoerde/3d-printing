// Global constants
print_comp = 0.1;  // compensation for (unwanted) additional material being extruded bei 3d printer


/*
  x = direction along the sheet material
  y = perpendicular to the direction along sheet edge
*/

/* jig for 30 mm thick sheet with an area that allows to mill through the entire sheet */
router_jig_edge_basis(
    sheet_width = 30,
    max_dim_x = 60,
    max_dim_y = 40,
    min_cutter_dim = 6,
    max_cutter_len = 40,
    copyring_dia = 13.8);


module router_jig_edge_basis(
  sheet_width = 30,     // the width of the sheet to attach the jig to
  max_dim_x = 60,       // max routing in direction of sheet
  max_dim_y = 40,       // max routing perpendicular to sheet direction
  min_cutter_dim = 6,   // smallest cutter to be taken into account
  max_cutter_len = 40,  // maximum cutter length sticking out of router chuck
  copyring_dia = 13.8,  // outer copying ring diameter
  ) {
    // fixed values derived from router dimensions and experience
    jig_h = 5;     // jig height (or strength)
    guide_h = 50;  // height of guides to hold the jig
    frame_w = 70;  // width of support area
    dia_to_add = copyring_dia-min_cutter_dim;
    inlay_x = ceil(max_dim_x+dia_to_add) + 2*print_comp;
    inlay_y = ceil(max_dim_y+dia_to_add) + 2*print_comp;
    echo("==============================");
    echo(str("Inlay dimensions: ", inlay_x-2*print_comp, " x ", inlay_y-2*print_comp));
    echo("==============================");
    outer_x = inlay_x+frame_w;
    outer_y = inlay_y+frame_w;
    difference() {
        union() {
            cube([outer_x, outer_y, jig_h], center=true);
            translate([0, (sheet_width+jig_h)/2, (guide_h+jig_h)/2]) cube([outer_x, jig_h, guide_h], center=true);
            translate([0, -(sheet_width+jig_h)/2, (guide_h+jig_h)/2]) cube([outer_x, jig_h, guide_h], center=true);
            translate([outer_x/2, sheet_width/2+jig_h, jig_h/2]) rotate([0, -90, 0])
                linear_extrude(height=outer_x) polygon(points = [[0, 0], [10, 0], [0, 10]]);
            translate([outer_x/2, -(sheet_width/2+jig_h), jig_h/2]) rotate([0, -90, 0])
                linear_extrude(height=outer_x) polygon(points = [[0, 0], [10, 0], [0, -10]]);
        }
        cube([inlay_x, inlay_y, jig_h], center=true);
        translate([0, 0, max_cutter_len/2]) cube([max_dim_x, outer_y, max_cutter_len-jig_h], center=true);
    }
}