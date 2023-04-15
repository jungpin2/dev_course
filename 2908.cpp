// ConsoleApplication2.cpp : 이 파일에는 'main' 함수가 포함됩니다. 거기서 프로그램 실행이 시작되고 종료됩니다.
//

#include <iostream>
#include <string>
#include<algorithm>

using namespace std;


int main()
{
    int IN = 0;
    int OUT = 0;
    int INOUT = 0;
    int A[10];


     
    for (int i = 0; i < 10; i++) {
        cin >> OUT >> IN;

        INOUT = INOUT + IN - OUT;
        A[i] = INOUT;

    }

}
