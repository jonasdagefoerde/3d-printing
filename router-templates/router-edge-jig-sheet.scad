
router_edge_jig_sheet(max_cutter_len=40);


function num2str(number) = round(number) == number ? str(number, ".0") : str(number);

/* Dimensions according to first (not rounded) router edge jig */
module router_edge_jig_sheet(
  inner_len = 60,       // see inner_x
  outer_len = 138,      // see outer_x
  max_cutter_len = 40,  // maximum cutter length sticking out of router chuck
  sheet_th = 1.5        // sheet thickness 
) {
    // internal constants based on experience
    guide_h = 50;  // height of the jig's guides
    text_h = 0.6;  // amount of lowering the text from surface
    difference() {
        translate ([0, guide_h/2, sheet_th/2]) cube([outer_len, guide_h, sheet_th], center=true);
        translate([0, (max_cutter_len-5)/2, sheet_th/2]) cube([inner_len, max_cutter_len-5, sheet_th*2], center=true);
        
        translate([37, 15, sheet_th-text_h]) linear_extrude(height = sheet_th*2) text(num2str(sheet_th), font="Liberation Sans:style=Bold", size=13);
   }
}