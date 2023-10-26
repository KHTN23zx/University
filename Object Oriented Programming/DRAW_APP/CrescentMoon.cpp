#pragma once

#define _USE_MATH_DEFINES

#include "CrescentMoon.h"

#include <cmath>
#include <vector>

CrescentMoon::CrescentMoon(Point center, double radius, double rotation_angle, double scale_factor)
    : center(center.getX(), center.getY()), radius(radius) {
    double dx = 0.5 * radius;

    double thetaX = (1 - scale_factor * scale_factor) * (radius * radius) / (2 * dx) + dx / 2;
    int theta = (int)std::ceil((std::acos(thetaX / radius) / M_PI) * 180);

    size_t n_outerPoints = (360 - theta) - theta + 1;
    std::vector<Point> outerPoints(n_outerPoints);
    int phi;

    for (int i = 0, phi = theta; phi <= 360 - theta; i++, phi++) {
        double x = radius * std::cos(phi / 180.0 * M_PI);
        double y = radius * std::sin(phi / 180.0 * M_PI);
        outerPoints[i].set(center.getX() + x, center.getY() + y);
    }

    double scaled_radius = scale_factor * radius;
    double psiX = thetaX - dx;
    double psi = (int)std::floor((std::acos(psiX / scaled_radius) / M_PI) * 180);

    size_t n_innerPoints = (360 - psi) - psi + 1;
    std::vector<Point> innerPoints(n_innerPoints);

    for (int i = 0, phi = 360 - psi; phi >= psi; i++, phi--) {
        double x = scaled_radius * std::cos(phi / 180.0 * M_PI) + dx;
        double y = scaled_radius * std::sin(phi / 180.0 * M_PI);
        innerPoints[i].set(center.getX() + x, center.getY() + y);
    }

    this->vertices = innerPoints.size() + outerPoints.size();
    this->points = new Point[vertices];

    for (int i = 0; i < innerPoints.size(); i++)
        this->points[i].set(innerPoints[i].getX(), innerPoints[i].getY());
    for (int i = innerPoints.size(); i < vertices; i++) {
        Point p = outerPoints[i - innerPoints.size()];
        this->points[i].set(p.getX(), p.getY());
    }

    if (rotation_angle != 0) {
        this->rotate(center, rotation_angle);
    }
}