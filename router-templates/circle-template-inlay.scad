
// the model's resolution
model_resolution = 50;


circle_template_inlay(
    dia = 11,
    bit_dia = 8,
    guide_dia = 30,
    guide_height = 8,
    size = 60,
    resolution = model_resolution);


// Hack a plunge router template using all parameters
// undef default values will be calculated/set automatically
module circle_template_inlay(
  dia,           // the circle's diameter
  bit_dia,       // the bit's diameter
  guide_dia,     // the template guide's diameter
  guide_height,  // the template guide's height
  guide_size,    // the base template's size (check according base template)
  resolution = model_resolution) {
    temp_dia = dia - bit_dia + guide_dia;
    if ((dia >= bit_dia) && (temp_dia < size-5)) {
        linear_extrude(height=guide_height) {
            difference() {
                square(size, center=true);
                circle(d = temp_dia);
            }
        }
    }
}
