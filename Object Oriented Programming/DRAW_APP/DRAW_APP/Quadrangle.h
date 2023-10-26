#pragma once
#include "Polygon.h"

/**
 *Rectangle*
 **/

class _Rectangle : public _Polygon
{
public:
	//constructor and destructor
	_Rectangle(double x = 50, double y = 100, double w = 150, double h = 100) : _Polygon(4) { setPoints(x, y, w, h); }
	~_Rectangle() {}
	//setter
	void setPoints(double x, double y, double w, double h);
};

/**
 *Square*
 **/

class _Square : public _Rectangle
{
public:
	//constructor and destructor
	_Square(double x = 50, double y = 100, double e = 150) : _Rectangle(x, y, e, e) {}
	~_Square() {}
};

