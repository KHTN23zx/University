#pragma once
#include "Polygon.h"

class _Triangle : public _Polygon
{
public:
	//constructor and destructor
	static Point pointsDefault_Tri[3];
	_Triangle(Point* p = NULL) : _Polygon(3) { setPoints(p); }
	~_Triangle() {}
	//setter
	void setPoints(Point* p);

};
