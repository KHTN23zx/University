#pragma once
#include "framework.h"

class Point
{
	double x, y;
public:
	//constructor and destructor
	Point(double xx = 0, double yy = 0) : x(xx), y(yy) {}
	~Point() {}
	//setter
	void set(double xx, double yy) { x = xx; y = yy; }
	//getter
	double getX() const { return x; }
	double getY() const { return y; }
	//operation
	void move(double dx, double dy) { x += dx; y += dy; }
	void scale(Point center, double tile);
	void rotate(Point T, double rad);
	//paint
	//void mark(HDC hdc, int size = 5, COLORREF c = RGB(0, 0, 0));
	 void mark(HDC hdc, int size = 5) const;
	//other method
	double distance(Point a) const;
	Point setVector(Point b) const;
    //
	


};