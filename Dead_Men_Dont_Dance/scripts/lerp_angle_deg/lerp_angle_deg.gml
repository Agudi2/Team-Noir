function lerp_angle_deg(a, b, t) {
    var diff = ((b - a + 180) mod 360) - 180;
    return a + diff * t;
}