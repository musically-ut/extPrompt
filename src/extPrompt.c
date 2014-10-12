#include <R.h>
#include <Rinterface.h>
#include <stdio.h>
#include <time.h>

#define R_INTERFACE_PTRS 1

// This is the same length as defined in src/main/scan.c
#define CONSOLE_PROMPT_SIZE 256

extern int (*ptr_R_ReadConsole)(const char *, unsigned char *, int, int);
static int (*old_R_ReadConsole)(const char *, unsigned char *, int, int);

static int extPrompt_initialized = 0;

int extPrompt_ReadConsole(const char *old_prompt, unsigned char *buf, int len,
		 int addtohistory) {

    char replaced_prompt[CONSOLE_PROMPT_SIZE];
    const char *new_prompt;

    time_t t = time(NULL);
    struct tm *local_time = localtime(&t);

    if (local_time == NULL) {
        fprintf(stderr, "Unable to get local time.\n");
        new_prompt = old_prompt;
    } else {
        if (strftime(replaced_prompt, CONSOLE_PROMPT_SIZE, old_prompt, local_time) == 0) {
            // Either there was nothing to replace in the prompt or
            // there was an error in the string.
            new_prompt = old_prompt;
        } else {
            new_prompt = replaced_prompt;
        }
    }

    return (*old_R_ReadConsole)(new_prompt, buf, len, addtohistory);
}

void extPrompt_unload() {
    ptr_R_ReadConsole = old_R_ReadConsole;
    old_R_ReadConsole = NULL;
    extPrompt_initialized = 0;
}

void extPrompt() {
    if (extPrompt_initialized) { return; }

    old_R_ReadConsole = ptr_R_ReadConsole;
    ptr_R_ReadConsole = extPrompt_ReadConsole;

    extPrompt_initialized = 1;
}


