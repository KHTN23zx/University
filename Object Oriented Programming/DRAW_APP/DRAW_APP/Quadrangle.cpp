#include "Quadrangle.h"

/*--------------------------------------------*
 *					Rectangle 				  *
 *--------------------------------------------*/

void _Rectangle::setPoints(double x, double y, double w, double h)
{
    points[0] = Point(x, y);
    points[1] = Point(x + w, y);
    points[2] = Point(x + w, y + h);
    points[3] = Point(x, y + h);
}




