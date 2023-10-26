#pragma once

#define _USE_MATH_DEFINES

#include "Semicircle.h"

#include <vector>
#include <cmath>

Semicircle::Semicircle(Point center, double radius, double rotation_angle)
    : center(center.getX(), center.getY()), radius(radius) {
    size_t n_angles = 180;
    std::vector<Point> pointsOfCircle(n_angles + 1);
    for (int angle = 0; angle <= n_angles; angle++) {
        double radian = angle * M_PI / 180;
        double x = radius * std::cos(radian);
        double y = radius * std::sin(radian);
        pointsOfCircle[angle] = Point(center.getX() + x, center.getY() + y);
    }

    this->vertices = pointsOfCircle.size();
    points = new Point[vertices];
    for (int i = 0; i < vertices; i++)
        this->points[i].set(pointsOfCircle[i].getX(), pointsOfCircle[i].getY());

    if (rotation_angle != 0) {
        this->rotate(center, rotation_angle);
    }
}