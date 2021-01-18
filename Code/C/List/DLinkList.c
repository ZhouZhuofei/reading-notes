/*
    

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef char DataType;
typedef struct Node {
    DataType data;
    struct Node *prior;
    struct Node *next;
} DLinkNode, *DLinkList;

/*---------------function declare-------------*/
int InsertDList(DLinkList head, int i, DataType e);
DLinkNode *GetElem(DLinkList head, int n);
void PrintDList(DLinkList head);
int CreateDList(DLinkList head, int n);
int InitDList(DLinkList *head);
int DeleteDList(DLinkList head, int i, DataType e);




/*---------------function content--------------*/
int InitDList(DLinkList *head){
    *head = (DLinkList)malloc(sizeof(DLinkNode));
    if(!head){
        return -1;
    }
    (*head)->next = *head;
    (*head)->prior = *head;
    return 1;
}

int CreateDList(DLinkList head, int n){
    DLinkNode *s, *q;
    int i;
    DataType e;
    q = head;
    for(i=1;i<=n;i++){
        printf("input the %d elements: \n", i);
        e = getchar();
        s = (DLinkList)malloc(sizeof(DLinkNode));
        s->data = e;
        s->next = q->next;
        q->next = s;
        s->prior = q;
        head->prior = s;
        q = s;
        getchar();

    }
    return 1;

}

DLinkNode *GetElem(DLinkList head, int i){
    DLinkNode *p;
    int j;
    p = head->next;
    j = 1;
    while(p!=head && j<i){
        p =p->next;
        j++;
    }
    if(p==head || j>i){
        return NULL;
    }
    return p;
}

int InsertDList(DLinkList head, int i, DataType e){
    DLinkNode *p, *s;
    p = GetElem(head, i);
    if(!p){
        return 0;
    }
    s = (DLinkList)malloc(sizeof(DLinkNode));
    if(!s){
        return -1;
    }
    s->data = e;
    s->prior = p->prior;
    p->prior->next = s;
    s->next = p;
    p->prior = s;
    return 1;
}

void PrintDList(DLinkList head){
    DLinkNode *p;
    p = head->next;
    while(p != head){
        printf("%c", p->data);
        p = p->next;
    }
    printf("\n");
}

int DeleteDList(DLinkList head, int i, DataType e){
    DLinkNode *p;
    int j;
    p = head->next;
    j = 0;
    while(p!=head && j<i){
        p = p->next;
        j++;
    }
    if(j != i){
        printf("Error delete\n");
        return 0;
    }
    p->prior->next = p->next;
    p->next->prior = p->prior;
    free(p);
    return 1;
}
/*-----------------main function-----------*/
int main(){
    DLinkList h;
    int n, pos;
    char e;
    InitDList(&h);
    printf("input the nums of elements: \n");
    scanf("%d", &n);
    getchar();
    CreateDList(h, n);
    printf("the elements in List: \n");
    PrintDList(h);
    printf("pls input the insert elements and loc: \n");
    scanf("%c", &e);
    getchar();
    scanf("%d", &pos);
    InsertDList(h, pos, e);
    printf("\n");
    PrintDList(h);
    return 1;
}