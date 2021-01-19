/*
    一元多项式：
        A_{n}(x) = a_{n}*x^n + a_{n-1}*x^{n-1} + ... + a_0
    采用链式存储：
    ((a_{n}, n), (a_{n-1}, n-1), ...(a_0, 0))
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct polyn{
    float coef;
    int expn;
    struct polyn *next;

} PolyNode, *PLinkList;

/*--------------function declare--------------*/
void Output(PLinkList head);
PLinkList CreatePolyn();
PolyNode *Reverse(PLinkList head);
PolyNode *MultiplyPolyn(PLinkList A, PLinkList B);







/*----------------------funcion content--------------*/
PLinkList CreatePolyn(){
    PolyNode *p, *q, *s;
    PolyNode *head = NULL;
    int expn2;
    float coef2;
    head = (PLinkList)malloc(sizeof(PolyNode));
    if(!head){
        return NULL;
    }
    head->coef = 0;
    head->expn = 0;
    head->next = NULL;
    do{
        printf("input the coef(until coef and exp is 0 end)");
        scanf("%f", &coef2);
        printf("input exp:");
        scanf("%d", &expn2);
        if((long)coef2 == 0 && expn2 == 0){
            break;
        }
        s = (PLinkList)malloc(sizeof(PolyNode));
        if(!s){
            return NULL;
        }
        s->expn = expn2;
        s->coef = coef2;
        q = head->next;
        p = head;
        while(q && expn2<q->expn){
            p = q;
            q = q->next;

        }
        if(q == NULL || expn2>q->expn){
            p->next = s;
            s->next = q;

        }
        else{
            q->coef += coef2;
        }
    } while(1);
    return head;
}

PolyNode *Reverse(PLinkList head){
    PolyNode *q, *r, *p=NULL;
    q = head->next;
    while(q){
        r = q->next;
        q->next = p;
        p = q;
        q = r;
    }
    head->next = p;
    return head;
}

PolyNode *MultiplyPolyn(PLinkList A, PLinkList B){
    PolyNode *pa, *Pb, *Pc, *u, *head;
    int k, maxExp;
    float coef;
    head = (PLinkList)malloc(sizeof(PolyNode));
    if(!head){
        return NULL;
    }
    head->coef = 0.0;
    head->expn = 0;
    head->next = NULL;
    if(A->next != NULL && B->next != NULL){
        maxExp = A->next->expn + B->next->expn;
    }
    else{
        return head;
    }
    Pc = head;
    B = Reverse(B);
    for(k=maxExp; k>=0; k--){
        pa = A->next;
        while(pa!=NULL && pa->expn>k){
            pa = pa->next;
        }
        Pb = B->next;
        while(Pb!=NULL && pa!=NULL && pa->expn + Pb->expn < k){
            Pb = Pb->next;
        }
        coef = 0.0;
        while(pa!=NULL && Pb!= NULL){
            if(pa->expn + Pb->expn == k){
                coef += pa->coef * Pb->coef;
                pa = pa->next;
                Pb = Pb->next;
            }
            else if(pa->expn + Pb->expn > k){
                pa = pa->next;
            }
            else{
                Pb = Pb->next;
            }
        }
        if(coef != 0.0){
            u = (PolyNode*)malloc(sizeof(PolyNode));
            u->coef = coef;
            u->expn = k;
            u->next = Pc->next;
            Pc->next = u;
            Pc = u;
        }
    }
    B = Reverse(B);
    return head;
}

void Output(PLinkList head){
    PolyNode *p = head->next;
    while(p){
        printf("%1.1f", p->coef);
        if(p->expn){
            printf("*x^%d", p->expn);
        }
        if(p->next && p->next->coef>0){
            printf("+");
        }
        p = p->next;
    }
}

/*-----------main function ------------*/
int main(){
    PLinkList A, B, C;
    A = CreatePolyn();
    printf("A(x)=");
    Output(A);
    printf("\n");
    B = CreatePolyn();
    printf("B(x) = ");
    Output(B);
    printf("\n");
    C = MultiplyPolyn(A, B);
    printf("C(x) = A(x)*B(x)=");
    Output(C);
    printf("\n");

}