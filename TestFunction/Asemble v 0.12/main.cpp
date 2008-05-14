/* 
 * File:   main.cpp
 * Author: perw
 * Created on 6 ����Ҥ� 2551, 11:53 �.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fstream.h>
#include <string.h>
struct buffer {
    char buff[10];
};

struct object {
    unsigned int addressdec;
    char address[10];
    char opcode[4];
    char operand[3];
    char operand2[3];
    char list[20];
}; // Line Object variable of Table

struct opcode {
    char op[2];
    int byte;
}; // Opcode variable Opcode and Byte length

struct SYMBOLS {
    unsigned int pc;
    char address[6];
    char name[15];
    int value;
    int objindex;
}; // Symbol variable of Table

struct HEX {
    char dataoperand[8];
    char hexa[4];
    char hexb[4];
    int  MODE;
    char addmode[3];
    opcode valueopcode;
}; //HEX operand
struct LINEBLOCK{
    char block1[25];
    char block2[25];
    char block3[25];
    char block4[25];
}; 
object obj[200]; // Table Line of Object File and List File
SYMBOLS symbol[25]; // Table of Symbol 
char LINES[128];     
int indexSymbol = 0; // index of Symbol table
int objindex = 0; // inde  of Object table
unsigned int PC = 0; // Address Counter

buffer contoreladdress(int value) {
    buffer buf;
    sprintf(buf.buff, "%02X", value);
    return buf;
}

buffer contoaddress(int value,int Mode) {
    buffer buf;
    if(Mode == 6)
    sprintf(buf.buff, "-%04X", value);
    else sprintf(buf.buff, "%04X", value);
    return buf;
}

int convertint(char c) {
    switch (c) {
        case '0':return 0;
            break;
        case '1':return 1;
            break;
        case '2':return 2;
            break;
        case '3':return 3;
            break;
        case '4':return 4;
            break;
        case '5':return 5;
            break;
        case '6':return 6;
            break;
        case '7':return 7;
            break;
        case '8':return 8;
            break;
        case '9':return 9;
            break;
        case 'A':return 10;
            break;
        case 'B':return 11;
            break;
        case 'C':return 12;
            break;
        case 'D':return 13;
            break;
        case 'E':return 14;
            break;
        case 'F':return 15;
            break;
    }
}

int findSymbolAddr(char line[]) {
    int i = 0;
    while (1) {
        if (strcmp(line, symbol[i].name) == 0) {
            printf("Addr :%d \n", symbol[i].pc);
            return symbol[i].pc;
        }else if (i >= 19) {
            printf("err \n");
            return 0; // Error none symbol
        }
        i++;
    }
}// Symbol Managment

int updateSymbolAddr(char symbi[]) {
    int i = 0;
    while (1) {
        if (strcmp(symbi, symbol[i].name) == 0) {
            int pcu = symbol[i].pc;       
            pcu = PC - pcu;
            symbol[i].pc = PC; 
            printf("PCU:%d PC: %d objindext :%d\n  rel:%s ", pcu, PC, symbol[i].objindex,contoreladdress(pcu).buff);
            strcpy(obj[symbol[i].objindex].operand, contoreladdress(pcu).buff);
            return 1;
        }else if (i >= 19) {
            return 0; // Error none symbol
        }
        i++;
    }
}

int relative(int symbolpc,HEX line) {
    int rel = 255;
    if ((PC > symbolpc) && (symbolpc != 0))
        rel = rel - (PC - symbolpc);
    else {
        symbol[indexSymbol].pc = PC+2;
        printf("inset symbol");
        symbol[indexSymbol].objindex = objindex+1;
        strcpy(symbol[indexSymbol].name,line.dataoperand);
        indexSymbol++;
        return 0;
    }
    return rel;
}

int findSymbolValue(char *symb) {
    int i = 0;
    while (1) {
        if (strcmp(symb, symbol[i].name) == 0) {
            return symbol[i].value;
        }else if (i >= 19) {
            return 0; // Error none symbol
        }
        i++;
    }
}

int updateSymbol(char symbols[]) {
    printf("Update :%s \n", symbols);
    if (updateSymbolAddr(symbols) == 0)
        strcpy(symbol[indexSymbol].name, symbols);
    printf("PC :%d \n", PC);
    symbol[indexSymbol].pc = PC;
    strcpy(symbol[indexSymbol].address, contoaddress(PC,0).buff);
    indexSymbol++;
    return 0;
}
HEX initianSymbol(HEX line){
    unsigned int pctmp;
    pctmp = findSymbolAddr(line.dataoperand);
    if(line.valueopcode.byte <=2){
     strcpy(line.hexa,contoreladdress(relative(pctmp,line)).buff);
    }else{
     char tmpaddress[5] ;
     strcpy(tmpaddress,contoaddress(pctmp,0).buff);
     line.hexa[0] = tmpaddress[0];
     line.hexa[1] = tmpaddress[1];
     line.hexb[0] = tmpaddress[2];
     line.hexb[1] = tmpaddress[3];
    }
    return line;
}// End Symbol Managment 

HEX deci(HEX hexoperand) {
    char operand[25];
    char nulls[3];
    strcpy(nulls,"  ");
    nulls[2]='\0';
    strcpy(operand,hexoperand.dataoperand);
    unsigned int tmpoperand = 0;
    unsigned int length = 0;
    length = strlen(operand);
    if (length <= 3) {
        tmpoperand = atoi(operand);
        sprintf(hexoperand.hexa, "%02X", tmpoperand);
        strcpy(hexoperand.hexb,nulls);
    }else {
        tmpoperand = atoi(operand);
        char tmp[5];
        sprintf(tmp, "%04X", tmpoperand);
        hexoperand.hexa[0] = tmp[0];
        hexoperand.hexa[1] = tmp[1];
        hexoperand.hexb[0] = tmp[2];
        hexoperand.hexb[1] = tmp[3];
        hexoperand.hexb[2] = '\0';
    }
    return hexoperand;
}

HEX hexi(HEX hexoperand) {
    char operand[25];
    strcpy(operand,hexoperand.dataoperand);
    int length = 0;
    unsigned int tmphex = 0;
    length = strlen(operand);

    if (length <= 2) {
        tmphex = convertint(operand[1]);
        sprintf(hexoperand.hexa, "%02X", tmphex);
         strcpy(hexoperand.hexb,"  "); 
        hexoperand.hexb[2] = '\0';
    }else if (length == 3) {
        tmphex = 256 * convertint(operand[1]);
        tmphex += convertint(operand[2]);
        sprintf(hexoperand.hexa, "%02X", tmphex);
        strcpy(hexoperand.hexb,"  "); 
        hexoperand.hexb[2] = '\0';
    }else if (length == 4) {
        tmphex = convertint(operand[1]);
        sprintf(hexoperand.hexa, "%02X", tmphex);
        hexoperand.hexb[0] = operand[2];
        hexoperand.hexb[1] = operand[3];
         hexoperand.hexb[2] = '\0';
    }else {
        hexoperand.hexa[0] = operand[1];
        hexoperand.hexa[1] = operand[2];
        hexoperand.hexb[0] = operand[3];
        hexoperand.hexb[1] = operand[4];
        hexoperand.hexb[2] = '\0';
    }
    return hexoperand;
}

HEX initiantVariable(HEX operand) {
    switch (operand.dataoperand[0]) {
        case '0':return deci(operand);
            break;
        case '1':return deci(operand);
            break;
        case '2':return deci(operand);
            break;
        case '3':return deci(operand);
            break;
        case '4':return deci(operand);
            break;
        case '5':return deci(operand);
            break;
        case '6':return deci(operand);
            break;
        case '7':return deci(operand);
            break;
        case '8':return deci(operand);
            break;
        case '9':return deci(operand);
            break;
        case '#':
            operand.dataoperand[0]='0';
            return deci(operand);
            break;
        case '$':
            return hexi(operand);
            break;
        case 'default': return initianSymbol(operand); break;
    }
    return operand;
}

int ischilSymbol(char as[]) {
    int length = strlen(as);
    char arr[length];
    strcpy(arr, as);
    return (arr[length - 1] == ':');
}

char *clearArray(char clrArray[]) { // Clear Array to NULL     etc.  clearArray("hello")>>>>>NULL
    int k = 0;
    while (k < strlen(clrArray)) {
        clrArray[k] = '\0';
        k++;
    }
    return clrArray;
}

char *toUpText(char inText[]) { // Convert form text lower to upper etc. "heLLo" ..."HELLO"	       etc.  toUpText("hello")>>>>"HELLO"
    char tempUpText[20];
    int i = 0;
    strcpy(tempUpText, clearArray(tempUpText));
    while (i < strlen(inText)) {
        tempUpText[i] = toupper(inText[i]); // Convert h to H , e to E, L to L, L to L, o to O
        i++;
    }
    tempUpText[i] = '\0'; //HELLO\0 form HELLO
    return tempUpText;
}
int inserttoLineObject(char opcode[],char operand[],char operand2[],int n, char line[],int Mode){
        objindex++;      
        strcpy(obj[objindex].opcode,opcode);
        strcpy(obj[objindex].operand,operand);
        strcpy(obj[objindex].operand2,operand2);
        strcpy(obj[objindex].address, contoaddress(PC,Mode).buff);
        strcpy(obj[objindex].list,LINES);        
        PC+=n;
}
int excuteMode(HEX line) {
    if(line.MODE ==5){
        line = initianSymbol(line);
        line.hexb[3]='\0';
        inserttoLineObject(line.valueopcode.op,line.hexa,line.hexb,line.valueopcode.byte,LINES,0);
    }else{
        line.hexb[3]='\0';
        inserttoLineObject(line.valueopcode.op,line.hexa,line.hexb,line.valueopcode.byte,LINES,0);
    }
}
opcode findOpcode(char code[], char addressmode[]) {
    opcode opc;
    FILE *fil;
    char ch0[5];
    char ch1[5];
    char ch2[3];
    char ch3[2];
    fil = fopen("6811_u3.txt", "r");
    if (fil != NULL) {
        while (!feof(fil)) {
            fscanf(fil, "%s %s %s %s", ch0, ch1, ch2, ch3);
            if ((strcmp(code, ch0) == 0) && (strcmp(addressmode, ch1) == 0)) {
                fclose(fil);
                strcpy(opc.op, ch2);
                opc.byte = convertint(ch3[0]);
                return opc;
                break; // printf("test %s",ch1);
            }
        }

    } else printf("no read");
    return opc;
}

HEX AnalyAddressingMode(char oper[]) {
    HEX hexline;
        strcpy(hexline.dataoperand,oper);
        strcpy(hexline.hexa,"  ");
        strcpy(hexline.hexb,"  ");
    if ((oper[0] == '\0') | (oper[0] == ';')) {
        hexline.MODE = 0;
        strcpy(hexline.addmode,"INH");
    }else if ((oper[1] == ',')||(oper[2]==',')||(oper[3]==',')) {  
        hexline.MODE = 1;
        strcpy(hexline.addmode,"IND");    
        hexline = initiantVariable(hexline);
    } else if (oper[0] == '#') {
        strcpy(hexline.dataoperand,oper);
        hexline.MODE = 1;
       strcpy(hexline.addmode,"IMM");
        hexline = initiantVariable(hexline);
    } else if (oper[0] == '$') {
        int i = strlen(oper);
        if (i <= 3) {
        hexline.MODE = 3;
        strcpy(hexline.addmode,"DIR");
        hexline = initiantVariable(hexline);
        }else{
        hexline.MODE = 4;
        strcpy(hexline.addmode,"EXT");
        hexline = initiantVariable(hexline);}
    }else {
        strcpy(hexline.dataoperand,oper);
        hexline.MODE = 5;
        strcpy(hexline.addmode,"REL");
    }
    return hexline;
}

LINEBLOCK linetoblock(char tx[]) {
    int i = 0;
    int ic = 0;
    int t = 0;
    char str[4][25];
    while (i < 25) {
        str[0][i] = '\0';
        str[1][i] = '\0';
        str[2][i] = '\0';
        str[3][i] = '\0';
        i++;
    }
    while (!(tx[t] == '\0')) {
        if (!isspace(tx[t])) {
            i = 0;
            while (!isspace(tx[t])) {
                str[ic][i] = tx[t];
                t++;
                i++;
            }
            ic++;
        }
        t++;
    }
    LINEBLOCK LINE;
    strcpy(LINE.block1,str[0]);
    strcpy(LINE.block2,str[1]);
    strcpy(LINE.block3,str[2]);
    strcpy(LINE.block4,str[3]);
    return LINE;
}

int insertoSymbolTable(char indexsymbol,char name[],char address[],int PC,int objindex){
        strcpy(symbol[indexsymbol].name, name);
        symbol[indexsymbol].pc = PC;
        strcpy(symbol[indexsymbol].address,address);
        symbol[indexsymbol].objindex = objindex;
}
int interpret(char line[]) {
    LINEBLOCK LINE;
    char nulls[3];
    strcpy(nulls,"  ");
    nulls[2]='\0';
    HEX hexline;
    LINE = linetoblock(line);
    if (strcmp(LINE.block1, "ORG") == 0) {
        unsigned int tmporg = 0;
        char tmp[6];
        strcpy(tmp,LINE.block2);
        tmporg += 4096 * convertint(tmp[1]);
        tmporg += 256 * convertint(tmp[2]);
        tmporg += 16 * convertint(tmp[3]);
        tmporg += convertint(tmp[4]);
        PC = tmporg;
    }else if (strcmp(LINE.block2, "DB") == 0) {
        strcpy(hexline.dataoperand,LINE.block3);
        hexline = initiantVariable(hexline);
        insertoSymbolTable(indexSymbol,LINE.block1,contoaddress(PC,6).buff,PC,objindex++);
        inserttoLineObject(hexline.hexa,hexline.hexb,nulls,1,LINES,6);
        indexSymbol++;
    } else if (strcmp(LINE.block2, "DW") == 0) {
        strcpy(hexline.dataoperand,LINE.block3);
        hexline = initiantVariable(hexline);
        insertoSymbolTable(indexSymbol,LINE.block1,contoaddress(PC,6).buff,PC,objindex++);
        inserttoLineObject(hexline.hexa,hexline.hexb,nulls,2,LINES,6);
        indexSymbol++;
    }else if (strcmp(LINE.block2, "DS") == 0) {
        insertoSymbolTable(indexSymbol,LINE.block1,contoaddress(PC,6).buff,PC,objindex++);
        PC += convertint(LINE.block3[0]);
        indexSymbol++;
    }else if(ischilSymbol(LINE.block1)){// true save to SYMBOL TABLE
        char strs[strlen(LINE.block1) - 1];
        strcpy(strs,LINE.block1);
        strs[strlen(strs) - 1] = '\0';
        updateSymbol(strs);
        char strsym[3];
        strcpy(strsym,LINE.block2);
        if (!((strsym[0] == '\0') || (strsym[0] == ';'))) {
            hexline = AnalyAddressingMode(LINE.block3);
            hexline.valueopcode = findOpcode(LINE.block2,hexline.addmode);
            excuteMode(hexline);
        }
    }else {
            hexline = AnalyAddressingMode(LINE.block2);
            hexline.valueopcode = findOpcode(LINE.block1,hexline.addmode);
            excuteMode(hexline);    }
    }
int main(int argc, char** argv) {
    FILE *pInFile;
    pInFile = fopen("testx.txt", "r");
    PC = 0;
    if (pInFile != NULL) {
        char line [ 128 ]; /* or other suitable maximum line size */
        while (fgets(line, sizeof line, pInFile) != NULL) /* read a line */ {
            strcpy(LINES,line);
            interpret(toUpText(line));
        }
        fclose(pInFile);
    }
    objindex++;
    strcpy(obj[objindex].address, contoaddress(PC,0).buff);
    strcpy(obj[objindex].opcode, "41");
    strcpy(obj[objindex].operand, "       ");
    FILE *p_out1;
    FILE *p_out2;
    p_out1 = fopen("outcode.txt", "w");
    p_out2 = fopen("outlist.txt", "w");
    if ((p_out1 != NULL) && (p_out2 != NULL)) {
        int index = 0;
        int i = 2;
        while (1) {
            fprintf(p_out1, "%s %s %s %s \n", obj[i].address, obj[i].opcode, obj[i].operand, obj[i].operand2);
            if (strcmp(obj[i].opcode, "41") == 0)
            {
                fprintf(p_out2, "\n%s %s %s %s // %s ", obj[i].address, obj[i].opcode, obj[i].operand, obj[i].operand2, obj[i].list);
                break;
            }else{
                fprintf(p_out2, "%s %s %s %s        // %s", obj[i].address, obj[i].opcode, obj[i].operand, obj[i].operand2, obj[i].list);
            }
            i++;
        }
        fclose(p_out1);
        fclose(p_out2);
    } else {
        printf("Create file Error");
    }
}