
// the model's resolution
model_resolution = 50;

square_inlay_basis(
    size = 30.26,
    guide_height = 5,
    resolution = model_resolution);


// Hack a plunge router template using all parameters
// undef default values will be calculated/set automatically
module square_inlay_basis(
  size,   // the size for matching inlays
  height,  // the template guide's height
  resolution = model_resolution) {
    linear_extrude(height=guide_height) {
        difference() {
            square(size, center=true);
            square(size-10, center=true);
        }
    }
}
