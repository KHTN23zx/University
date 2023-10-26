// Draw_Objects_App.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "Draw_Objects_App.h"
#include "Shape.h"
#include "Polygon.h"
#include "Quadrangle.h"
#include "Triangle.h"
#include "Ellipse.h"
#include "Semicircle.h"
#include "CrescentMoon.h"

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
    _In_opt_ HINSTANCE hPrevInstance,
    _In_ LPWSTR    lpCmdLine,
    _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_DRAWOBJECTSAPP, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance(hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_DRAWOBJECTSAPP));

    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int)msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc = WndProc;
    wcex.cbClsExtra = 0;
    wcex.cbWndExtra = 0;
    wcex.hInstance = hInstance;
    wcex.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_DRAWOBJECTSAPP));
    wcex.hCursor = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wcex.lpszMenuName = MAKEINTRESOURCEW(IDC_DRAWOBJECTSAPP);
    wcex.lpszClassName = szWindowClass;
    wcex.hIconSm = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
    hInst = hInstance; // Store instance handle in our global variable

    HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

    if (!hWnd)
    {
        return FALSE;
    }

    ShowWindow(hWnd, nCmdShow);
    UpdateWindow(hWnd);

    return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE: Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//

LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    int wmId, wmEvent;
    PAINTSTRUCT ps;
    HDC hdc;
    //wchar
    static wchar_t szItsMessage[500] = L"";
    static wchar_t szInfor[1000] = L"";
    //brush and pen
    static HBRUSH hbr1, hbr2;
    static HPEN hPenDot, penBorder1, penBorder2, penBorder;
    //cursor
    static HCURSOR hCursorMove, hCursorCross;
    //variable
    static const int MAX_SHAPE = 50;
    static int xc, yc, px, py;
    static INT nCur = -1;
    int dx, dy, i;
    RECT rt;
    //objects
    static Point p[3] = { Point(200,200), Point(100, 450), Point(500,450) };
    static Point p2[3] = { Point(800,200), Point(600, 450), Point(1000,450) };
    static Point plg1[5] = { Point(200,200), Point(350, 200), Point(400, 300), Point(300, 300), Point(200, 350) };
    static Point plg2[6] = { Point(650,250), Point(750, 250), Point(800, 350), Point(700, 400), Point(600, 350), Point(600, 300) };
    static _Square A;
    static _Shape* aS[] = {
        new _Polygon(5, plg1),
        new _Ellipse(300,250,200,100),
        new _Rectangle(200, 100, 300, 200),
        new _Circle(200, 200, 150),
        new _Triangle(p),
        new _Square(100, 100, 200),
        new Semicircle(Point(200, 200), 100, 45),
        new CrescentMoon(Point(200, 200), 100, 180)
    };
    static _Shape* aS2[] = {
        new _Polygon(6, plg2),
        new _Ellipse(800,250,200,100),
        new _Rectangle(600, 100, 300, 200),
        new _Circle(600, 200, 150),
        new _Triangle(p2),
        new _Square(700, 100, 200),
        new Semicircle(Point(600, 200), 100, 75)
    };
    static int h = 0, h2 = 0;
    const int n = sizeof(aS) / sizeof(aS[0]), n2 = sizeof(aS2) / sizeof(aS2[0]);
    static _Shape* pS = aS[h];
    static _Shape* pS2 = aS2[h2];
    switch (message)
    {
    case WM_CREATE:
        GetClientRect(hWnd, &rt);
       // hbr1 = CreateSolidBrush(RGB(172, 172, 255));
       // hbr2 = CreateSolidBrush(RGB(249, 155, 221));
        hCursorMove = LoadCursor(NULL, IDC_SIZEALL);
        hCursorCross = LoadCursor(NULL, IDC_CROSS);
        penBorder = CreatePen(PS_SOLID, 4, RGB(0, 100, 0));
        penBorder1 = CreatePen(PS_SOLID, 2, RGB(0, 0, 160));
        penBorder2 = CreatePen(PS_SOLID, 2, RGB(183, 0, 183));
        break;
    case WM_LBUTTONDOWN:
        xc = GET_X_LPARAM(lParam); yc = GET_Y_LPARAM(lParam);
        if (aS[h]->isPointInside(Point(xc, yc)))
        {
            hdc = GetDC(hWnd);
            SelectObject(hdc, hPenDot);
            SetROP2(hdc, R2_NOTXORPEN);
            aS[h]->draw(hdc);
            SetCursor(hCursorMove);
            SetCapture(hWnd);
        }
        if (aS2[h2]->isPointInside(Point(xc, yc)))
        {
            hdc = GetDC(hWnd);
            SelectObject(hdc, hPenDot);
            SetROP2(hdc, R2_NOTXORPEN);
            aS2[h2]->draw(hdc);
            SetCursor(hCursorMove);
            SetCapture(hWnd);
        }
        break;
    case WM_MOUSEMOVE:
        if (GetCapture() == hWnd)
        {
            px = xc; py = yc;
            xc = GET_X_LPARAM(lParam); yc = GET_Y_LPARAM(lParam);
            dx = xc - px; dy = yc - py;
            if (pS->isPointInside(Point(px, py)))
            {
                hdc = GetDC(hWnd);
                SelectObject(hdc, hPenDot);
                SetROP2(hdc, R2_NOTXORPEN);
                aS[h]->draw(hdc);
                aS[h]->move(dx, dy);
                aS[h]->draw(hdc);
            }
            if (pS2->isPointInside(Point(px, py)))
            {
                hdc = GetDC(hWnd);
                SelectObject(hdc, hPenDot);
                SetROP2(hdc, R2_NOTXORPEN);
                aS2[h2]->draw(hdc);
                aS2[h2]->move(dx, dy);
                aS2[h2]->draw(hdc);
            }
        }
        break;
    case WM_LBUTTONUP:
        if (GetCapture() == hWnd)
        {
            ReleaseCapture();
            InvalidateRect(hWnd, NULL, TRUE);
        }
        break;
    case WM_COMMAND:
    {
        wmId = LOWORD(wParam);
        wmEvent = HIWORD(wParam);
        // Parse the menu selections:
        switch (wmId)
        {
        case IDM_ABOUT:
            DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
            break;
        case IDM_EXIT:
            DestroyWindow(hWnd);
            break;
        default:
            return DefWindowProc(hWnd, message, wParam, lParam);
        }
    }
    break;
    case WM_KEYDOWN:
        switch (wParam)
        {
        case VK_TAB:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                if (++h2 == n2) h2 = 0;
                pS2 = aS2[h2];
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else
            {
                if (++h == n) h = 0;
                pS = aS[h];
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_OEM_PLUS:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->scale(1.2);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else
            {
                pS->scale(1.2);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_OEM_MINUS:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->scale(1 / 1.2);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else
            {
                pS->scale(1 / 1.2);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case 0x4C:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->rotate(-90);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else
            {
                pS->rotate(-90);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case 0x52:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->rotate(90);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else
            {
                pS->rotate(90);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_LEFT:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->move(-10, 0);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else 
            {
                pS->move(-10, 0);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_RIGHT:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->move(10, 0);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else 
            {
                pS->move(10, 0);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_UP:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->move(0, -10);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else {
                pS->move(0, -10);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        case VK_DOWN:
            if (GetAsyncKeyState(VK_CONTROL))
            {
                pS2->move(0, 10);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
            else {
                pS->move(0, 10);
                InvalidateRect(hWnd, NULL, TRUE);
                break;
            }
        }
    case WM_PAINT:
    {
        hdc = BeginPaint(hWnd, &ps);
        // TODO: Add any drawing code that uses hdc here...
        GetClientRect(hWnd, &rt);
        swprintf_s(szInfor, L"Arrow keys (Move)  -  Tab key (Change object of shape 1)  -  '-' key (Zoom out)  -  '+' key (Zoom in)  -  'l' key (Rotate left)  -  'r' key (Rotate right)  -  'Ctrl + key' (Change to shape 2)");
        DrawText(hdc, szInfor, lstrlen(szInfor), &rt, DT_CENTER | DT_BOTTOM | DT_SINGLELINE);
        //draw object 1
        //SelectObject(hdc, hbr1);
        SelectObject(hdc, penBorder1);
        pS->draw(hdc);
        //draw object 2
        SelectObject(hdc, hbr2);
        SelectObject(hdc, penBorder2);
        pS2->draw(hdc);
        //intersect
        SelectObject(hdc, penBorder);
        if (pS2->intersection(pS, hdc))
            swprintf_s(szItsMessage, L"Intersect!");
        else
            swprintf_s(szItsMessage, L"Not intersect!");
        DrawText(hdc, szItsMessage, lstrlen(szItsMessage), &rt, DT_CENTER | DT_TOP);
        EndPaint(hWnd, &ps);
    }
    break;
    case WM_DESTROY:
        delete[] pS;
        delete[] pS2;
        DeleteObject(hbr1);
        DeleteObject(hbr2);
        DeleteObject(hPenDot);
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
