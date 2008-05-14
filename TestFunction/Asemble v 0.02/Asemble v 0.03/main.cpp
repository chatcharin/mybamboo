/* 
 * File:   main.cpp
 * Author: perw
 *
 * Created on 6 ����Ҥ� 2551, 11:53 �.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fstream.h>
#include <cstdio>
#include <string.h>
#include <string.h>
#include <string.h>

/*
 * 
 */
struct buffer {
    char buff[10];
};
buffer buf;

struct object {
    unsigned int addressdec;
    char address[10];
    char opcode[4];
    char operand[3];
    char operand2[3];
    char list[20];
};

struct opcode {
    char op[2];
    int byte;
};

struct SYMBOLS {
    unsigned int pc;
    char address[6];
    char name[15];
    int value;
    int index; 
};

SYMBOLS symbol[20];
int indexSymbol = 0;
char valext2[2];
unsigned int PC;
int objindex;
object obj[200];
int MODE;
char direc[2];
int val, val2;
char symb[15];
char lin[20];
buffer contoreladdress(int value) {
    buffer buf;
    sprintf(buf.buff, "%02X", value);
    return buf;
}
buffer contoaddress(int value) {
    buffer buf;
    sprintf(buf.buff, "%04X", value);
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

int findSymbolAddr() {
    printf("Find :%s \n",symb);
    int i = 0;
    while (1) {
        if (strcmp(symb, symbol[i].name) == 0) {
            printf("Addr :%d \n",symbol[i].pc);
            return symbol[i].pc;
        }else if (i >= 19) {
            printf("err \n");
            return 0; // Error none symbol
        }
        i++;
    }
}
int updateSymbolAddr(char symbi[]) {
    int i = 0;
    while (1) {
        if (strcmp( symbi,symbol[i].name) == 0) {
            
            int pcu = symbol[i].pc;
            printf("PCU:%d PC: %d objindext :%d\n ",pcu,PC,symbol[i].index);
            pcu = PC - pcu;
            symbol[i].pc=PC;
            strcpy(obj[symbol[i].index].operand,contoreladdress(pcu).buff);
            return 1;
        }else if (i >= 19) {
            return 0; // Error none symbol
        }
        i++;
    }
}
int relative(int symbolpc){
    int rel = 255;
    if((PC>symbolpc) && (symbolpc != 0))
    rel =rel-(PC-symbolpc)-1;
    else {
        symbol[indexSymbol].pc =PC;
        printf("inset symbol");
        symbol[indexSymbol].index = objindex;
        strcpy(symbol[indexSymbol].name,symb);
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
int update(char symbols[]){
    printf("Update :%s \n",symbols);
     if(updateSymbolAddr(symbols)==0)
       strcpy(symbol[indexSymbol].name,symbols);
         printf("PC :%d \n",PC);    
       symbol[indexSymbol].pc = PC;
       strcpy(symbol[indexSymbol].address,contoaddress(PC).buff); 
       indexSymbol++;
       return 0;
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
        //     printf("alive");
        while (!feof(fil)) {
            fscanf(fil, "%s %s %s %s", ch0, ch1, ch2, ch3);
            if ((strcmp(code, ch0) == 0) && (strcmp(addressmode, ch1) == 0)) {
                fclose(fil);
                strcpy(opc.op, ch2);
                opc.byte = convertint(ch3[0]);
                // printf("char %c \n", ch3[0]);
                return opc;
                break; // printf("test %s",ch1);
            }
        }

    } else printf("no read");
    return opc;
}

int conint(char con[]) {
    int length = strlen(con);
    char arr[length];
    strcpy(arr, con);
    arr[0] = '0';
    return atoi(arr);
}
int value;

buffer contostr(int value) {
    buffer buf;
    sprintf(buf.buff, "%02X", value);
    return buf;
}


int IMM(char opc[], int n) {
    // printf("insert %s %d \n",opc,n);
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].operand, contostr(val).buff);
    strcpy(obj[objindex].operand2, "");
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}
char valext[2];

int EXT(char opc[], int n) {
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].operand, valext);
    strcpy(obj[objindex].operand2,valext2);
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}

int INH(char opc[], int n) {
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    strcpy(obj[objindex].operand, "");
    strcpy(obj[objindex].operand2, "");
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}

int REL(char opc[], int n) {
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    int tmp =findSymbolAddr();
    printf("sym :%d \n",tmp);
    strcpy(obj[objindex].operand,contoreladdress(relative(tmp)).buff);
    strcpy(obj[objindex].operand2, "");
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}

int DIR(char opc[], int n) {
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    strcpy(obj[objindex].operand, direc);
    strcpy(obj[objindex].operand2, "");
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}
char indc[3];
int IND(char opc[], int n) {// NOt complet
    objindex++;
    obj[objindex].addressdec = PC;
    strcpy(obj[objindex].opcode, opc);
    strcpy(obj[objindex].operand, indc);
    strcpy(obj[objindex].operand2, "");
    strcpy(obj[objindex].address, contoaddress(PC).buff);
    strcpy(obj[objindex].list, lin);
    PC += n;
    return 0;
}

int excuteMode(char opc[], int n) {
    switch (MODE) {
        case 0:INH(opc, n);
            break;
        case 1:IND(opc, n);
            break;
        case 2:IMM(opc, n);
            break;
        case 3:DIR(opc, n);
            break;
        case 4:EXT(opc, n);
            break;
        case 5:REL(opc, n);
            break;
    }
}

char *isAddressMode(char oper[]) {
    if ((oper[0] == '\0') | (oper[0] == ';')) {
        MODE = 0;
        val = 0;
        val2 = 0;
        return "INH"; // inherent check
    }else if (oper[1]==',') {
        MODE = 1;
        strcpy(indc,"00");
        indc[1] = oper[0];
        return "IND";
    }if(oper[2]==','){
        MODE = 1;
        strcpy(indc,"00");
        indc[0] = oper[0];
        indc[1] = oper[1];
        val2 = 0;
        return "IND";
    } else if (oper[0] == '#') {
        MODE = 2;
        value = conint(oper);
        return "IMM";
    } else if (oper[0] == '$') {
        int i = strlen(oper);
        if (i <= 3) {
            MODE = 3;
            
            direc[0] = oper[1];
            direc[1] = oper[2];
            return "DIR";
        }
        MODE = 4;
        strcpy(valext,"00");
        valext[0]=oper[1];
        valext[1]=oper[2];
    //    printf("test ext1 %s \n",valext[0]);
         strcpy(valext2,"00");
        valext2[0] = oper[3];
        valext2[1] = oper[4];
        //  printf("test ext1 %s \n",valext[1]);
        return "EXT";
    }else {
        MODE = 5;
        strcpy(symb,oper);
        return "REL";
    }
}

char str[4][20];

int linetoblock(char tx[]) {
    int i = 0;
    int ic = 0;
    int t = 0;
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
    return 0;
}

int ischilSymbol(char as[]) {
    int length = strlen(as);
    char arr[length];
    strcpy(arr, as);
    return  (arr[length - 1] == ':');
}
int indextstr;
int sym;

int interpret(char line[]) {
    int i = 0;
    indextstr = 0;
    while (i < 20) {
        str[0][i] = '\0';
        str[1][i] = '\0';
        str[2][i] = '\0';
        str[3][i] = '\0';
        i++;
    }
    linetoblock(line);
    int n = 0;
    //    printf("symbol %d \n", ischilSymbol(str[0]));
    if(strcmp(str[n],"ORG")==0){
        unsigned int tmporg=0;
        char tmp[6];
        strcpy(tmp,str[n+1]);
        tmporg +=4096*convertint(tmp[1]); 
        tmporg +=256*convertint(tmp[2]); 
        tmporg +=16*convertint(tmp[3]); 
        tmporg +=convertint(tmp[4]);
        PC = tmporg;
    }else if(strcmp(str[n+1],"DB")==0){
        strcpy(symbol[indexSymbol].name,str[n]);
        symbol[indexSymbol].pc = PC;
        // add data
        PC++;
        indexSymbol++;
    }
    else if(strcmp(str[n+1],"DW")==0){
        strcpy(symbol[indexSymbol].name,str[n]);
        symbol[indexSymbol].pc = PC;
        // add data
        PC+=2;
        indexSymbol++;
    }else if(strcmp(str[n+1],"DS")==0){
        strcpy(symbol[indexSymbol].name,str[n]);
        symbol[indexSymbol].pc = PC;
        char tmpds[2];
        strcpy(tmpds,str[n+2]);
        PC+=convertint(tmpds[0]);
        indexSymbol++;
    }
    else if (ischilSymbol(str[n]))// true save to SYMBOL TABLE
    {    
        //add Symbol to Table
        char strs[strlen(str[n])-1];
        strcpy(strs,str[n]);
        strs[strlen(strs)-1]='\0';
         update(strs);
         char strsym[3];
         strcpy(strsym,str[n+1]);
         if(!((strsym[0]=='\0')||(strsym[0]==';'))){ 
        opcode op = findOpcode(str[n + 1], isAddressMode(str[n + 2]));     
        excuteMode(op.op, op.byte);
         }
        printf("address:%s %s %s %s   ; %s \n", obj[objindex].address, obj[objindex].opcode, obj[objindex].operand, obj[objindex].operand2, obj[objindex].list);

    }else {
        opcode op = findOpcode(str[n], isAddressMode(str[n + 1]));
        excuteMode(op.op, op.byte);
        printf("address:%s %s %s %s   ; %s \n", obj[objindex].address, obj[objindex].opcode, obj[objindex].operand, obj[objindex].operand2, obj[objindex].list);
    }
}
char *clearArray(char clrArray[]){ // Clear Array to NULL     etc.  clearArray("hello")>>>>>NULL
	 int k=0;
	 while(k<strlen(clrArray)){
		  clrArray[k]=NULL;
		  k++;
	 }
	 return clrArray;
}
char *toUpText(char inText[]){ // Convert form text lower to upper etc. "heLLo" ..."HELLO"	       etc.  toUpText("hello")>>>>"HELLO"
	char tempUpText[20];
	int i=0;

	strcpy(tempUpText,clearArray(tempUpText));

	while(i<strlen(inText)){
		tempUpText[i]=toupper(inText[i]); // Convert h to H , e to E, L to L, L to L, o to O
		i++;
	}
	tempUpText[i]='\0'; //HELLO\0 form HELLO
	return tempUpText;
}
int main(int argc, char** argv) {
    FILE *pInFile;
    pInFile = fopen("testx.txt", "r");
    char strLine [256]; // if your file has longer lines, make it bigger
    char CH[4][10];
    char tmp[10];
    PC = 0;
    char *mode;
    int indextstr = 0;
    if (pInFile != NULL) {
        char line [ 128 ]; /* or other suitable maximum line size */

        while (fgets(line, sizeof line, pInFile) != NULL) /* read a line */ {
            strcpy(lin, line);
            char text[128];
            strcpy(text, toUpText(line));
            interpret(text);
        }
        fclose(pInFile);
    }
    objindex++;
    strcpy(obj[objindex].address,contoaddress(PC).buff);
    strcpy(obj[objindex].opcode,"41");
    FILE *p_out1;
    FILE *p_out2;
    p_out1 = fopen("outcode.txt","w");
    p_out2 = fopen("outlist.txt","w");
     if((p_out1 != NULL)&&(p_out2 != NULL)){
    int index = 0;
    int i=0;
    while(1){
        fprintf(p_out1,"%s %s %s %s \n",obj[i].address,obj[i].opcode,obj[i].operand,obj[i].operand2);
        fprintf(p_out2,"%s %s %s %s // %s \n",obj[i].address,obj[i].opcode,obj[i].operand,obj[i].operand2,obj[i].list);
        if(strcmp(obj[i].opcode,"41")== 0)
            break;
        i++;
    }
    fclose(p_out1);
    fclose(p_out2);
    }
    else{
        printf("Create file Error");
        }
}

