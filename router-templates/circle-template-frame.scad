
// the model's resolution
model_resolution = 50;


circle_template_frame(
    inlay_size = 60,
    frame_width = 40,
    guide_height = 8,
    resolution = model_resolution);


// Hack a plunge router template using all parameters
// undef default values will be calculated/set automatically
module circle_template_frame(
  inlay_dia,   // the size for matching inlays
  frame_width,  // the frame's width required for the guide template
  guide_height,  // the template guide's height
  resolution = model_resolution) {
    linear_extrude(height=guide_height) {
        difference() {
            union() {
                square(inlay_size+frame_width, center=true);
                rotate([0,0,45]) {
                    square([inlay_size+3*frame_width, frame_width/2], center=true);  
                }
                rotate([0,0,-45]) {
                    square([inlay_size+3*frame_width, frame_width/2], center=true);
                }
            }
            square(inlay_size, center=true);
        }
    }
}
