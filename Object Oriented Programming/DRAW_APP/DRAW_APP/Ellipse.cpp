#include "Ellipse.h"
#include "Polygon.h"

#include <algorithm>

using namespace std;

/**
 *Ellipse*
 **/

bool _Ellipse::isPointInside(Point p) const
{
	double epsilon = 0.015;
	double dx = p.getX() - T.getX(), dy = p.getY() - T.getY();
	return (pow(dx / xR, 2) + pow(dy / yR, 2) - 1) < epsilon;
}

bool _Ellipse::isPointInLine(Point p) const
{
	double epsilon = 0.03;
	double dx = p.getX() - T.getX(), dy = p.getY() - T.getY();
	double x = pow(dx / xR, 2) + pow(dy / yR, 2) - 1;
	return (fabs(x) < epsilon);// chi so sanh bang khi phan so cua no co mau la luy thua cua (2 va 5)
}

bool _Ellipse::intersection(_Shape* aS, HDC hdc, COLORREF c) const
{
	bool check = 0;

	if (dynamic_cast<_Polygon*>(aS)) {
		return aS->intersection((_Shape*)this, hdc, c);
	}

	_Ellipse* ellipse2 = dynamic_cast<_Ellipse*>(aS);
	if (!ellipse2) return false;

	double x_min = min(T.getX() - xR, ellipse2->getCenterX() - ellipse2->getHorizontalRadius());
	double x_max = max(T.getX() + xR, ellipse2->getCenterX() + ellipse2->getHorizontalRadius());
	double y_min = min(T.getY() - yR, ellipse2->getCenterY() - ellipse2->getVerticalRadius());
	double y_max = max(T.getY() + yR, ellipse2->getCenterY() + ellipse2->getVerticalRadius());

	double x1min = x_max;
	double x1max = x_min;
	double y1min = y_max;
	double y1max = y_min;

	for (double i = T.getX() - xR; i <= T.getX() + xR; i++)
		for (double j = T.getY() - yR; j <= T.getY() + yR; j++)
		{
			Point t(i, j);
			if ((this->isPointInLine(t) && aS->isPointInside(t)) || (this->isPointInside(t) && aS->isPointInLine(t)) || (this->isPointInLine(t) && aS->isPointInLine(t)))
			{
				x1min = min(i, x1min);
				x1max = max(i, x1max);
				y1min = min(j, y1min);
				y1max = max(j, y1max);

				SetPixel(hdc, i, j, c);
				check = 1;
			}
			else

				if (this->isPointInside(t) && aS->isPointInside(t))
				{
					//SetPixel(hdc, i, j, c);

					//LineTo(hdc, i, j);
					check = 1;
				}//copy xuong


				/*if (this->isPointInLine(t) && aS->isPointInLine(t))
				{
					//SetPixel(hdc, i, j, c);
					Point plusSign = Point()
				}*/

		}

	if (check) {
		Point marker((x1min + x1max) / 2, (y1min + y1max) / 2);
		marker.mark(hdc);
	}

	return check;
}



// hàm setpixel dùng để tô màu , sửa hàm setpixel lại 
// hàm setROP2: tô màu đường viền
//https://docs.microsoft.com/en-us/windows/win32/api/wingdi/nf-wingdi-setpixel
/*
void Point::Mark(HDC hdc, int sz) const
{
	for (int i = -sz; i <= sz; i++)
		SetPixel(hdc, x + i, y, RGB(0, 0, 0));
	for (int i = -sz; i <= sz; i++)
		SetPixel(hdc, x, y + i, RGB(0, 0, 0));
}
*/