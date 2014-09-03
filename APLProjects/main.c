//
//  main.c
//  APLProjects
//
//  Created by Dinesh Appavoo on 8/28/14.
//  Copyright (c) 2014 Dinesh Appavoo. All rights reserved.
//

#include <stdio.h>
void pointerExample();
int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    printf("Hi Dinesh\n");
    
    pointerExample();
    return 0;
}
void pointerExample()
{
    int a=43;
    int b=44;
    int* aPointer;
    int* bPointer;
    aPointer=&a;
    bPointer=&b;
    printf("%d\n",*aPointer);
    aPointer=bPointer;
    printf("%d\n",*aPointer);
    printf("%d\n",*bPointer);
    printf("%d\n",a);

    
}
