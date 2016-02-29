
// the model's resolution
model_resolution = 50;


circle_template_frame(
    inlay_size = 140,
    frame_width = 15,
    guide_height = 8,
    resolution = model_resolution);


// Hack a plunge router template using all parameters
// undef default values will be calculated/set automatically
module circle_template_frame(
  inlay_dia,   // the size for matching inlays
  frame_width,  // the frame's width required for the guide template
  guide_height,  // the template guide's height
  resolution = model_resolution) {
    frame_len = inlay_size+2*frame_width;
    linear_extrude(height=guide_height) {
        difference() {
            union() {
                square(frame_len, center=true);
                rotate([0,0,45]) {
                    square([sqrt(2)*frame_len+frame_width, frame_width], center=true);  
                }
                rotate([0,0,-45]) {
                    square([sqrt(2)*frame_len+frame_width, frame_width], center=true);
                }
            }
            square(inlay_size, center=true);
        }
    }
}
