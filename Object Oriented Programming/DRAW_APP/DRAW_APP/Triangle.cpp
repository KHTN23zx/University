#include "Triangle.h"

Point _Triangle::pointsDefault_Tri[] = { Point(500,400), Point(200,550), Point(700,550) };

void _Triangle::setPoints(Point* p)
{
	if (p == NULL)
	{
		points = new Point[3];
		memcpy(points, pointsDefault_Tri, 3 * sizeof(Point));
	}
	else
	{
		points = new Point[3];
		memcpy(points, p, 3 * sizeof(Point));
	}
}