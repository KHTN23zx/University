#include <iostream>
#include "Point.h"
#include <math.h>

const double PI = atan(1) * 4;

using namespace std;

const int MAX_POINTS = 1000;

double Point::distance(Point a) const
{
	double dx = this->getX() - a.getX(), dy = this->getY() - a.getY();
	return sqrt(dx*dx + dy*dy);
}

void Point::rotate(Point center, double rad)
{
	double cosa = cos(rad * PI / 180);
	double sina = sin(rad * PI / 180);
	double X = (x - center.x) * cosa - (y - center.y) * sina + center.x;
	y = (x - center.x) * sina + (y - center.y) * cosa + center.y;
	x = X;
}

void Point::scale(Point center, double tile)
{
	x = (x - center.getX()) * tile + center.getX();
	y = (y - center.getY()) * tile + center.getY();
}

void Point::mark(HDC hdc, int size) const
{
	for (int dx = -size; dx <= size; dx++)
		SetPixel(hdc, x + dx, y, RGB(0, 0, 0));
	for (int dy = -size; dy <= size; dy++)
		SetPixel(hdc, x, y + dy, RGB(0, 0, 0));
	//SetPixel(hdc, x, y, c);
	//LineTo(hdc, x, y);
	/*for (int i = 0; i < size; i++)
	{
		SetPixel(hdc, x - i, y, c);
		SetPixel(hdc, x + i, y, c);
		SetPixel(hdc, x, y - i, c);
		SetPixel(hdc, x, y + i, c);
	}*/
}

Point Point::setVector(Point b) const
{
	Point c;
	c.x = b.getX() - this->getX();
	c.y = b.getY() - this->getY();
	return c;
}
/*void MyPoint::Mark(HDC hdc, int sz) const
{
	for (int i = -sz; i <= sz; i++)
		SetPixel(hdc, x + i, y, RGB(0, 0, 0));
	for (int i = -sz; i <= sz; i++)
		SetPixel(hdc, x, y + i, RGB(0, 0, 0));
}*/
