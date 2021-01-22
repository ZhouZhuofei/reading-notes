#include <stdio.h>
#include <stdlib.h>
#define STACKSIZE 100
typedef char DataType;
typedef struct {
    DataType stack[STACKSIZE];
    int top;
} SeqStack;

/*---------function declare--------------*/
void InitStack(SeqStack *S);
int StackEmpty(SeqStack S);
int GetTop(SeqStack S, DataType *e);
int PushStack(SeqStack *S, DataType e);
int PopStack(SeqStack *S, DataType *e);
void ClearStack(SeqStack *S);
int StackLength(SeqStack S);



/*-----------function content--------------*/
void InitStack(SeqStack *S){
    S->top = 0;
}
int StackEmpty(SeqStack S){
    if(S.top == 0){
        return 1;
    }
    else{
        return 0;
    }
}
int GetTop(SeqStack S, DataType *e){
    if(S.top <= 0){
        printf("the stack is empty. \n");
        return 0;
    }
    else{
        *e = S.stack[S.top - 1];
        return 1;
    }
}
int PushStack(SeqStack *S, DataType e){
    if(S->top >= STACKSIZE){
        printf("the stack can't add elementsi in\n");
        return 0;
    }
    else{
        S->stack[S->top] = e;
        S->top++;
        return 1;
    }
}
int PopStack(SeqStack *S, DataType *e){
    if(S->top == 0){
        printf("no elements in the stack now, can't push. \n");
        return 0;
    }
    else{
        S->top--;
        *e = S->stack[S->top];
        return 1;
    }
}

int StackLength(SeqStack S){
    return S.top;
}

void ClearStack(SeqStack *S){
    S->top = 0;
}




