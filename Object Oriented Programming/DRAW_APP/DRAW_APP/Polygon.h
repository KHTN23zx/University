#pragma once
#include "framework.h"
#include "Point.h"
#include "Ellipse.h"


class _Polygon : public _Shape
{
protected:
	int vertices;
	Point* points;
public:
	//Constructor and Destructor
	static Point pointsDefault[];
	_Polygon(int num_vers = 4, Point* p = NULL) : vertices(num_vers) { setPoints(num_vers, p); }
	~_Polygon() { delete[] points; }
	//setter
	virtual void setPoints(int n, Point* p);
	//getter
	Point getCenter() const;
	//operation
	void move(double dx, double dy) override;
	void scale(Point Center, double s);
	void scale(double s) override { scale(getCenter(), s); }
	void rotate(Point Center, double rad);
	void rotate(double rad) override { rotate(getCenter(), rad); }
	//check
	bool isPointInside(Point p) const override;
	bool isPointInLine(Point p) const override;
	//other method
	bool intersection(_Shape* aS, HDC hdc, COLORREF c = RGB(156, 200, 30)) const override;
	void draw(HDC hdc, COLORREF c = RGB(0, 100, 100)) const override;
};

