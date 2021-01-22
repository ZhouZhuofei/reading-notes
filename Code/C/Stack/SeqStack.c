
#include "SeqStack.h"

int main(){
    SeqStack S;
    int i;
    DataType a[] = {'a', 'b', 'c', 'd', 'e', 'f'};
    DataType e;
    InitStack(&S);
    for(i=0;i<sizeof(a)/sizeof(a[0]);i++){
        if(PushStack(&S, a[i]) == 0){
            printf("cant add more!\n");
            return 0;
        }
    }
    printf("output from stack: \n");
    if(PopStack(&S, &e) == 1){
        printf("%4c\n", e);
    }
    if(PopStack(&S, &e) == 1){
        printf("%4c\n", e);
    }
    printf("\n");
    printf("Now, the top element: ");
    if(GetTop(S, &e) == 0){
        printf("Null\n");
        return 0;
    }
    else{
        printf("%4c\n", e);
    }
    if(PushStack(&S, 'x') == 0){
        printf("error\n");
        return 0;
    }
    printf("the length of stack: %d\n", StackLength(S));
    while(!StackEmpty(S)){
        PopStack(&S, &e);
        printf("%4c", e);
    }
    printf("\n");
    return 1;
}