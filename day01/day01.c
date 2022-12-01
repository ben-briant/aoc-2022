#include <stdio.h>
#include <stdlib.h>

int comp(const void *a, const void *b) {
    int *c = a;
    int *d = b;
    return *c < *d;
}

int main(void) {
    int elves[1000] = {0};
    char buf[100];
    int max_sum = 0;
    int curr_elf = 0;
    while (fgets(buf, 100, stdin)) {
        if (buf[0] != '\n') {
            elves[curr_elf] += atoi(buf);
        } else {
            curr_elf++;
        }
    }
    qsort(elves, curr_elf, sizeof(int), comp);

    printf("%d\n", elves[0] + elves[1] + elves[2]);
}
