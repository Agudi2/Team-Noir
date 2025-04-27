function calculate_initial_speed(x1, y1, x2, y2, _friction) {
    var dist = point_distance(x1, y1, x2, y2);
    var _speed = sqrt(2 * _friction * dist);
    return _speed;
}