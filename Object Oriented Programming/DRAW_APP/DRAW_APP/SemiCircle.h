#pragma once

#include "Polygon.h"

class Semicircle : public _Polygon {
private:
    Point center;
    double radius;
public:
    Semicircle(Point center, double radius, double rotation_angle = 0);
};