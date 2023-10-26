#pragma once

#include "Polygon.h"

class CrescentMoon : public _Polygon {
private:
    Point center;
    double radius;
public:
    CrescentMoon(Point center, double radius, double rotation_angle = 0, double scale_factor = 0.75);
};

