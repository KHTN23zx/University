#include <stdio.h>
#include <math.h>
#include <time.h>

void Swap(int *a, int *b)
{
	int temp;
	temp = *a;
	*a = *b;
	*b = temp;
}
int GetRandom(int min,int max){
	return rand()%(max-min+1)+min;
}
void bubbleSort(int a[], int n, int *comps, int *swaps)
{
	for(;n > 1;n--){
		for(int i = 0;i < n - 1;i++){

			(*comps)++;
			if(a[i+1] < a[i])
			{
				Swap(&a[i+1], &a[i]);
				(*swaps)++;
			}	
		}
		if((*swaps) == 0)
			break;
	}
}
void input(int a[],int n)
{
	for(int i=0;i<n;i++){
		a[i] = GetRandom(1,100 * n);
	}
}
void complexity(int a[],int s[],int x[], int n, int *compsAvg, int *swapsAvg)
{
	int comps = 0, swaps = 0, totalComps = 0,totalSwaps = 0;
	for(int i=0;i < 10000 ;i++){
		input(a,n);
		bubbleSort(a,n, &comps, &swaps);
		(s[swaps])++;
		(x[comps])++;
		totalComps += comps;
		totalSwaps += swaps;
		comps =0;
		swaps =0;
		
	}
	*compsAvg = totalComps/10000;
	*swapsAvg = totalSwaps/10000;
}
int main()
{	
	srand((unsigned int)time(NULL));
	int a[10];
	int n = 10,compsAvg = 0, swapsAvg = 0;int b = 70;
	int s[b];
	int x[b];
	for(int i=0;i< b;i++){
		s[i] = 0;
	}
	for(int i=0;i<b;i++){
		x[i] = 0;
	}
	complexity(a,s,x,n,&compsAvg,&swapsAvg);
	printf("\n%d",compsAvg);
	printf("\n%d",swapsAvg);
	printf("\n");
	for(int i=0;i < b;i++){
		printf("%d ",s[i]);
	}
	printf("\n");
	
	printf("\n");
	for(int i=0;i< b;i++){
		printf("%d ",x[i]);
	}
	return 1;
}
