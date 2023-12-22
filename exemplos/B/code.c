#include <stdio.h>

int average(int *vs, int size) {
    int ans = 0;
    for(int i = 0; i < size; i++)
        ans += vs[i];
    
    return ans / size;
}

int main() {
    int size = 6;
    int vs[] = {1, 4, 3, 9, 12, 15};

    printf("%d\n", average(vs, size));

    return 0;
}