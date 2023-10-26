#pragma once
#include "framework.h"
#include "Point.h"

class _Shape
{
public:
	virtual void move(double dx, double dy) = NULL;
	virtual void scale(double s) = NULL;
	virtual void rotate(double rad) = NULL;
	virtual bool isPointInside(Point p) const = NULL;
	virtual bool isPointInLine(Point p) const = NULL;
	virtual bool intersection(_Shape* aS, HDC hdc, /*HPEN pen,*/ COLORREF c = RGB(156, 200, 30)) const = NULL;
	virtual void draw(HDC hdc, COLORREF c = RGB(0, 100, 100)) const = NULL;
};