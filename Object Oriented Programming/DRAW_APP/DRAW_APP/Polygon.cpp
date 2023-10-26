#include <iostream>
#include <algorithm>
#include "Polygon.h"

using namespace std;

Point _Polygon::pointsDefault[] = { Point(50, 50), Point(50, 150), Point(200,150) };

void _Polygon::setPoints(int n, Point* p)
{
	if (p == NULL)
	{
		points = new Point[vertices = n];
		memcpy(points, pointsDefault, n * sizeof(Point));
	}
	else
	{
		points = new Point[vertices = n];
		memcpy(points, p, n * sizeof(Point));
	}
}

Point _Polygon::getCenter() const
{
	double xx = 0, yy = 0;
	for (int i = 0; i < vertices; i++)
	{
		xx += points[i].getX();
		yy += points[i].getY();
	}
	return Point(xx / vertices, yy / vertices);
}

void _Polygon::move(double dx, double dy)
{
	for (int i = 0; i < vertices; i++)
		points[i].move(dx, dy);
}

void _Polygon::scale(Point Center, double s)
{
	for (int i = 0; i < vertices; i++)
		points[i].scale(Center, s);
}

void _Polygon::rotate(Point Center, double rad)
{
	for (int i = 0; i < vertices; i++)
		points[i].rotate(Center, rad);
}

#define MIN(x, y) (x < y ? x : y)
#define MAX(x, y) (x > y ? x : y)

bool _Polygon::isPointInside(Point p) const
{
	int count = 0;
	double xinters;
	Point p1, p2;
	for (int i = 0; i < vertices; i++)
	{
		p1 = points[i];
		p2 = points[(i + 1) % vertices];
		if (p.getY() > MIN(p1.getY(), p2.getY()) && p.getY() <= MAX(p1.getY(), p2.getY()))
			if (p.getX() <= MAX(p1.getX(), p2.getX()))
				if (p1.getY() != p2.getY())
				{
					xinters = (p.getY() - p1.getY()) * (p2.getX() - p1.getX()) / (p2.getY() - p1.getY()) + p1.getX();
					if (p1.getX() == p2.getX() || p.getX() < xinters)
						count++;
				}
	}
	return (count % 2 != 0);
}

bool _Polygon::isPointInLine(Point p) const
{
	double d;
	double epsilon = 0.01;
	for (int i = 0; i < vertices; i++)
	{
		d = p.distance(points[i]) + p.distance(points[(i + 1) % vertices]) - points[i].distance(points[(i + 1) % vertices]);
		if (fabs(d) <= epsilon)
			return true;
	}
	return false;
}

bool _Polygon::intersection(_Shape* aS, HDC hdc, COLORREF c) const
{
	bool check = false;
	double x_min = points[0].getX(), y_min = points[0].getY(), x_max = points[0].getX(), y_max = points[0].getY();
	for (int i = 1; i < vertices; i++)
	{
		if (x_min > points[i].getX())
			x_min = points[i].getX();
		if (x_max < points[i].getX())
			x_max = points[i].getX();
		if (y_min > points[i].getY())
			y_min = points[i].getY();
		if (y_max < points[i].getY())
			y_max = points[i].getY();
	}

	double x1_min = x_max;
	double y1_min = y_max;
	double x1_max = x_min;
	double y1_max = y_min;

	//for (double i = x_min; i <= x_max; i++)
	for (double x = x_min; x <= x_max; x++)
		for (double y = y_min; y <= y_max; y++)
		{
			Point p(x, y);
			if ((this->isPointInLine(p) && aS->isPointInside(p)) || (this->isPointInside(p) && aS->isPointInLine(p)) || (this->isPointInLine(p) && aS->isPointInLine(p)))
			{
				x1_min = min(x1_min, x);
				y1_min = min(y1_min, y);

				x1_max = max(x1_max, x);
				y1_max = max(y1_max, y);

				
				SetPixel(hdc, x, y, RGB(0, 0, 0));
				check = true;
			} else
			if (this->isPointInside(p) && aS->isPointInside(p))
			{
			
			}
			
		}

	if (check) {
		Point marker = Point((x1_min + x1_max) / 2, (y1_min + y1_max) / 2);
		marker.mark(hdc);
	}

	return check;
}

const int MAX_POINTS = 1000;

void _Polygon::draw(HDC hdc, COLORREF c) const
{
	static POINT apt[MAX_POINTS];
	for (int i = 0; i < vertices; i++)
	{
		apt[i].x = points[i].getX();
		apt[i].y = points[i].getY();
	}
	Polygon(hdc, apt, vertices);
}