#include <ctype.h>
#include <stdio.h>

/* All possible DFA states (ovals of diagram) */
enum StateType { NORMAL,
                 IN_STRING,
                 IN_CHAR,
                 IN_ESCAPE_STRING,
                 IN_ESCAPE_CHAR,
                 MAYBE_COMMENT,
                 IN_COMMENT,
                 MAYBE_END_COMMENT };

/* All possible exit states */
enum StateAccept { ACCEPT,
                   REJECT };

/* Mapping of DFA states to exit states */
const enum StateAccept typeToAccept[] =
    {ACCEPT,
     ACCEPT,
     ACCEPT,
     ACCEPT,
     ACCEPT,
     ACCEPT,
     REJECT,
     REJECT};

/* Global variables for storing current line and most recent comment block */
int lastCommentStartLine = -1;
int currentLine = 1;

/*
Function for handling normal state. If a quote is encountered, go to IN_STRING state. If a single quote is encountered, go to IN_CHAR state. If a forward slash is encountered, go to MAYBE_COMMENT state. Otherwise, stay in NORMAL state.

Print character to output unless transitioning to MAYBE_COMMENT state.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleNormalState(int c) {
    enum StateType state = NORMAL;
    if (c == '"') {
        putchar(c);
        state = IN_STRING;
    } else if (c == '\'') {
        putchar(c);
        state = IN_CHAR;
    } else if (c == '/') {
        state = MAYBE_COMMENT;
    } else {
        putchar(c);
    }
    return state;
};

/*
Function for handling IN_STRING state. If a quote is encountered, go to NORMAL state. If a backslash is encountered, go to IN_ESCAPE_STRING state. Otherwise, stay in IN_STRING state. 

Print character to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleInStringState(int c) {
    enum StateType state = IN_STRING;
    if (c == '"') {
        putchar(c);
        state = NORMAL;
    } else if (c == '\\') {
        putchar(c);
        state = IN_ESCAPE_STRING;
    } else {
        putchar(c);
    }
    return state;
};

/*
Function for handling IN_CHAR state. If a single quote is encountered, go to NORMAL state. If a backslash is encountered, go to IN_ESCAPE_CHAR state. Otherwise, stay in IN_CHAR state.

Print character to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleInCharState(int c) {
    enum StateType state = IN_CHAR;
    if (c == '\'') {
        putchar(c);
        state = NORMAL;
    } else if (c == '\\') {
        putchar(c);
        state = IN_ESCAPE_CHAR;
    } else {
        putchar(c);
    }
    return state;
};

/*
Function for handling IN_ESCAPE_STRING state. Enter IN_STRING state.

Print character to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleInEscapeStringState(int c) {
    putchar(c);
    return IN_STRING;
};

/*
Function for handling IN_ESCAPE_CHAR state. Enter IN_CHAR state.

Print character to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleInEscapeCharState(int c) {
    putchar(c);
    return IN_CHAR;
};

/*
Function for handling MAYBE_COMMENT state. If an asterisk is encountered, go to IN_COMMENT state. If a forward slash is encountered, go to MAYBE_COMMENT state. Otherwise, go to NORMAL state.

Print character to output unless entering IN_COMMENT state.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleMaybeCommentState(int c) {
    enum StateType state = NORMAL;
    if (c == '*') {
        putchar(' ');
        lastCommentStartLine = currentLine;
        state = IN_COMMENT;
    } else if (c == '/') {
        putchar('/');
        state = MAYBE_COMMENT;
    } else {
        putchar('/');
        putchar(c);
    }
    return state;
};

/*
Function for handling IN_COMMENT state. If an asterisk is encountered, go to MAYBE_END_COMMENT state. If a newline is encountered, stay in IN_COMMENT state. Otherwise, stay in IN_COMMENT state.

Print any newline to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleInCommentState(int c) {
    enum StateType state = IN_COMMENT;
    if (c == '*') {
        state = MAYBE_END_COMMENT;
    } else if (c == '\n') {
        putchar('\n');
        state = IN_COMMENT;
    }
    return state;
};

/*
Function for handling MAYBE_END_COMMENT state. If a forward slash is encountered, go to NORMAL state. If an asterisk is encountered, stay in MAYBE_END_COMMENT state. Otherwise, enter IN_COMMENT state.

Print any newline to output.

Arguments:
    c: current character
Returns:
    state: next DFA state
*/
handleMaybeEndCommentState(int c) {
    enum StateType state = IN_COMMENT;
    if (c == '/') {
        state = NORMAL;
    } else if (c == '*') {
        state = MAYBE_END_COMMENT;
    }
    return state;
};

/*
Main function that reads characters from input and processes to output them according to current DFA state. After processing all inputs, checks final state and exits program accordingly.

Returns:
    0 if accepting state, 1 if rejecting state
*/
int main(void) {
    int c;
    enum StateType state = NORMAL;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            currentLine++;
        }
        switch (state) {
        case NORMAL:
            state = handleNormalState(c);
            break;
        case IN_STRING:
            state = handleInStringState(c);
            break;
        case IN_CHAR:
            state = handleInCharState(c);
            break;
        case IN_ESCAPE_STRING:
            state = handleInEscapeStringState(c);
            break;
        case IN_ESCAPE_CHAR:
            state = handleInEscapeCharState(c);
            break;
        case MAYBE_COMMENT:
            state = handleMaybeCommentState(c);
            break;
        case IN_COMMENT:
            state = handleInCommentState(c);
            break;
        case MAYBE_END_COMMENT:
            state = handleMaybeEndCommentState(c);
            break;
        }
    };
    enum StateAccept finalState = typeToAccept[state];
    switch (finalState) {
    case ACCEPT:
        return 0;
    case REJECT:
        if (state == IN_COMMENT || state == MAYBE_END_COMMENT) {
            fprintf(stderr, "Error: line %d: unterminated comment\n", lastCommentStartLine);
        }
        return 1;
    }
};