//静态列表
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ListSize 100
typedef char DataType;
typedef struct {
    DataType data;
    int cur;
} SLinkNode;
typedef struct {
    SLinkNode list[ListSize];
    int av;
} SLinkList;

/*----------function declare-------------*/
void InitSList(SLinkList *L);
int AssignNode(SLinkList L);
void FreeNode(SLinkList L, int pos);
void InsertSList(SLinkList *L, int i, DataType e);
void DeleteSList(SLinkList *L, int i, DataType *e);
void PrintSList(SLinkList L, int n);







/*---------function content----------------*/
void InitSList(SLinkList *L){
    int i;
    for(i=0; i<ListSize; i++){
        (*L).list[i].cur = i+1;
    }
    (*L).list[ListSize - 1].cur = 0;
    (*L).av = 1;
}

int AssignNode(SLinkList L){
    int i;
    i = L.av;
    L.av = L.list[i].cur;
    return i;
}

void FreeNode(SLinkList L, int pos){
    L.list[pos].cur = L.av;
    L.av = pos;
}

void InsertSList(SLinkList *L, int i, DataType e){
    int j, k, x;
    k = (*L).av;
    (*L).av = (*L).list[k].cur;
    (*L).list[k].data = e;
    j = (*L).list[0].cur;
    for(x=1; x<i-1; x++){
        j = (*L).list[j].cur;
    }
    (*L).list[k].cur = (*L).list[j].cur;
    (*L).list[j].cur = k;
}

void DeleteSList(SLinkList *L, int i, DataType *e){
    int j, k, x;
    j = (*L).list[0].cur;
    for(x=1;x<i-1;x++){
        j = (*L).list[j].cur;
    }
    k = (*L).list[j].cur;
    (*L).list[j].cur = (*L).list[k].cur;
    (*L).list[k].cur = (*L).av;
    *e = (*L).list[k].data;
    (*L).av = k;
}

void PrintSList(SLinkList L, int n){
    int j, k;
    k = L.list[0].cur;
    for(j=1; j<=n; j++){
        printf("%4c", L.list[k].data);
        k = L.list[k].cur;
    }
    printf("\n");
}

/*----------Main function--------*/
int main(){
    SLinkList L;
    int i, len;
    int pos;
    char e;
    DataType a[] = {'A', 'B', 'C', 'D', 'E', 'F', 'H'};
    len = sizeof(a)/sizeof(a[0]);
    //printf("%d", len);
    InitSList(&L);
    for(i=1;i<=len;i++){
        InsertSList(&L, i, a[i-1]);
    }
    printf("the elements in Static list: \n");
    PrintSList(L, len);
    printf("input the insert element and loc: \n");
    scanf("%c", &e);
    getchar();
    scanf("%d", &pos);
    getchar();
    InsertSList(&L, pos, e);
    printf("After insert : \n");
    PrintSList(L, len+1);
    printf("delete the element loc : ");
    scanf("%d", &pos);
    getchar();
    DeleteSList(&L, pos, &e);
    printf("The delete element is: ");
    printf("%c\n", e);
    printf("Now the List is : ");
    PrintSList(L, len);
    return 1;


}
