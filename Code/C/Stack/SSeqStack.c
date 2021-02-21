/* SSeqStack

共享栈

*/

#include <stdio.h>
#include <stdlib.h>
#define STACKSIZE 100
/*-----------define some struct-----------*/
typedef char DataType;
typedef struct {
    DataType stack[STACKSIZE];
    int top[2];
} SSeqStack;

/*-----------function declare------------*/
void InitSSeqStack(SSeqStack *S);
int PushStcak(SSeqStack *S, DataType e, int flag);
int PopStack(SSeqStack *S, DataType *e, int flag);
int GetTop(SSeqStack S, DataType *e, int flag);
int StackEmpty(SSeqStack S, int flag);



/*------------function content----------*/
void InitSSeqStack(SSeqStack *S){
    S->top[0] = 0;
    S->top[1] = STACKSIZE - 1;
}

int PushStcak(SSeqStack *S, DataType e, int flag){
    if(S->top[0] == S->top[1]){
        return 0;
    }
    switch(flag){
        case 0:
            S->stack[S->top[0]] = e;
            S->top[0]++;
            break;
        case 1:
            S->stack[S->top[1]] = e;
            S->top[1]--;
            break;
        default:
            return 0;
    }
    return 1;
}

int PopStcak(SSeqStack *S, DataType *e, int flag){
    switch(flag){
        case 0:
            if(S->top[0] == 0){
                return 0;
            }
            S->top[0]--;
            *e = S->stack[S->top[0]];
            break;
        case 1:
            if(S->top[1] == STACKSIZE - 1){
                return 0;
            }
            S->top[1]++;
            *e = S->stack[S->top[1]];
            break;
        default:
            return 0;
    }
    return 1;
}

int GetTop(SSeqStack S, DataType *e, int flag){
    switch(flag){
        case 0:
            if(S.top[0] == 0){
                return 0;
            }
            *e = S.stack[S.top[0]-1];
            break;
        case 1:
            if(S.top[1] == STACKSIZE - 1){
                return 0;
            }
            *e = S.stack[S.top[1]+1];
            break;
        default:
            return 0;
        
    }
    return 1;
}

int StackEmpty(SSeqStack S, int flag){
    switch(flag){
        case 0:
            if(S.top[0] == 0){
                return 1;
            }
            break;
        case 1:
            if(S.top[1] == STACKSIZE - 1){
                return 1;
            }
            break;
        default:
            return 0;
    }
    return 1;
}



/*---------main function------------*/
int main(){
    SSeqStack S;
    int i;
    DataType a[] = {'a', 'b', 'c', 'd', 'e'};
    DataType b[] = {'x', 'y', 'z', 'r'};
    DataType e1, e2;
    InitSSeqStack(&S);
    for(i=0; i<sizeof(a)/sizeof(a[0]); i++){
        if(PushStcak(&S, a[i], 0) == 0){
            printf("cant push in stack.\n");
            return 0;
        }
    }
    for(i=0; i<sizeof(b)/sizeof(b[0]); i++){
        if(PushStcak(&S, b[i], 1) == 0){
            printf("cant push in .\n");
            return 0;
        }
    }
    if(GetTop(S, &e1, 0) == 0){
        printf("nothing here.\n");
        return 0;
    }
    if(GetTop(S, &e2, 1) == 0){
        printf("nothing here.\n");
        return 0;
    }
    printf("left: %c        right:%c\n", e1, e2);
    printf("Left:");
    i = 0;
    while(!StackEmpty(S, 0)){
        printf("1");
        PopStcak(&S, &e1, 0);
        printf("%4c", e1);
    }
    printf("\n");
    while(StackEmpty(S, 1)){
        PopStcak(&S, &e2, 1);
        printf("%4c", e2);
    }
    printf("\n");
    return 0;
}