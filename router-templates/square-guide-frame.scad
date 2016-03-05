
// the model's resolution
model_resolution = 50;

/*
circle_guide_frame(
    inlay_size = 140,
    frame_width = 15,
    guide_height = 8,
    resolution = model_resolution);*/


circle_guide_frame(
    inlay_size = 30,
    frame_width = 5,
    guide_height = 8,
    resolution = model_resolution);


// Hack a plunge router template using all parameters
// undef default values will be calculated/set automatically
module circle_guide_frame(
  inlay_size,    // the size for matching inlays
  frame_width,   // the frame's width required for the guide template
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
            // increase the inlay size to adjust for expanding material
            square(inlay_size+0.4, center=true);
        }
    }
}
