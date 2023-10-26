#pragma once
#include "framework.h"
#include "Point.h"
#include "Shape.h"

#include <algorithm>
const double PI = atan(1) * 4;

/**
 *Ellipse*
 **/

class _Ellipse : public _Shape
{
protected:
	Point T;
	double xR, yR;
public:
	//constructor and destructor
	// constructor (parameters list) : list initializers { function body }
	// list initializers := field(value) | field{value}

	// std::tuple<n>(x1, x2,...,xn)
	_Ellipse(const Point& _t, std::pair<double, double> radius) : T(_t), xR(radius.first), yR(radius.second) {}
	_Ellipse(double xT = 700, double yT = 300, double a = 200, double b = 100) : T(xT, yT), xR(a) /*constructor*/, yR(b) {};
	~_Ellipse() {}
	//setter
	// void set(double xT, double yT) { T = Point(xT, yT); }
	void set(double xT, double yT) { T = Point(xT, yT); xR = 0; yR = 0; }

	// getter
	double getCenterX() const { return T.getX(); }
	double getCenterY() const { return T.getY(); }
	double getHorizontalRadius() const { return xR; }
	double getVerticalRadius() const { return yR; }

	//operation
	void move(double dx, double dy) override { T.move(dx, dy); }//override dinh nghia phuong thuc ao
	void scale(double s) override { xR *= s; yR *= s; }// nhan gan lai self-assignment
	void rotate(double rad) override { if (rad == 90 || rad == -90) { std::swap(xR, yR); } }
	//void draw(HDC hdc, COLORREF c = RGB(0, 100, 200)) const override { Ellipse(hdc, T.getX() - xR, T.getY() - yR, T.getX() + xR, T.getY() + yR); }
	void draw(HDC hdc, COLORREF c = RGB(0, 100, 200)) const override { Ellipse(hdc, T.getX() - xR, T.getY() - yR, T.getX() + xR, T.getY() + yR); }
	//check
	//check
	bool isPointInside(Point p) const override;
	bool isPointInLine(Point p) const override;
	//intersection
	bool intersection(_Shape* aS, HDC hdc, COLORREF c = RGB(156, 200, 30)) const override;
};

/**
 *Circle*
 **/

class _Circle : public _Ellipse
{
public:
	_Circle(double xT = 400, double yT = 400, double a = 150) : _Ellipse(xT, yT, a, a) {};
	~_Circle() {}
};