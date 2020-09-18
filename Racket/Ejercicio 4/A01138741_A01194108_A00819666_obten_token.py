# -*- coding: utf-8 -*-

# Implementación de un scanner mediante la codificación de un Autómata
# Finito Determinista como una Matríz de Transiciones
# Autor: Dr. Santiago Conant, Agosto 2014 (modificado en Agosto 2015)

import sys

# tokens
INT = 100  # Número entero
FLT = 101  # Número de punto flotante
OPB = 102  # Operador binario
LRP = 103  # Delimitador: paréntesis izquierdo
RRP = 104  # Delimitador: paréntesis derecho
END = 105  # Fin de la entrada $
ERR = 200  # Error léxico: palabra desconocida

# Tokens nuevos
OPA = 106  # Operador de asignación =
OPIF = 107 # Operador Condicional ?
OPE = 108  # Operador : Else
OPR = 112  # Operadores relacionales, <, >, >=, <=, ==
IDE = 109  # Identificadores, a - z
DIF = 110  # Operador de negacion !
LLI = 111 # Llave izquierda {
LLD = 112 # Llave derecha }


"""# Matriz de transiciones: codificación del AFD
# [renglón, columna] = [estado no final, transición]
# Estados > 99 son finales (ACEPTORES)
# Caso especial: Estado 200 = ERROR
# Caso especial: Estado 110 = DIF
#     dig   op      (     )   raro esp    .   =    ?   :   opr   !  letra  $   {    }           """
MT = [[   1, OPB, LRP, RRP,   4,   0, 4, 5,   OPIF,  OPE, 6, DIF, IDE,   END, LLD, LLI],# 0 inicial
      [   1, INT, INT, INT, INT, INT, 2, INT,  INT,  INT, INT, INT, INT, INT, ERR, ERR], # 1 enteros
      [   3, ERR, ERR, ERR,   4, ERR, 4, ERR,  ERR,  ERR, ERR, ERR, ERR, ERR, ERR, ERR], # 2 primer decimal flotante
      [   3, FLT, FLT, FLT, FLT, FLT, 4, FLT,  FLT,  FLT, FLT, FLT, FLT, FLT, ERR, ERR], # 3 decimales restantes flotante
      [ ERR, ERR, ERR, ERR,   4, ERR, 4, ERR,  ERR, ERR, ERR, ERR, ERR, ERR, ERR, ERR], # 4 error [ OPIF, OPB, OPA, OPR,   4, OPR, 4, OPR,  OPR, OPR, OPR, OPR, OPR, OPR, OPR, OPR], #
      [ OPA, OPA, OPA, ERR, ERR, OPA, ERR, OPR, ERR, ERR, OPR, ERR, OPA, OPA, OPA, OPA], # 5 igual
      [ OPR, ERR, OPR, ERR, ERR, OPR, ERR, OPR, ERR, ERR, ERR, ERR, OPR, OPR, OPR, OPR]] # 6 relacionales

# Filtro de caracteres: regresa el número de columna de la matriz de transiciones
# de acuerdo al caracter dado [   5, ERR, OPA, OPA, ERR, ERR, ERR, OPR, ERR, ERR, OPR, OPR, OPA, OPA]
def filtro(c):
    """Regresa el número de columna asociado al tipo de caracter dado(c)"""
    if c.isdigit():
       return 0
    elif c == '+' or c == '-' or c == '*' or c == '/':
        return 1
    elif c == '(':
        return 2
    elif c == ')':
        return 3
    elif c == ' ' or ord(c) == 9 or ord(c) == 10 or ord(c) == 13: # blancos
        return 5
    elif c == '.':
        return 6;
    elif c == '=':
        return 7
    elif c == '?':
        return 8
    elif c == ':':
        return 9
    elif c == '<' or c == '>' or c == '<=' or c == '>=' or c == '==':
        return 10
    elif c == '!':
        return 11
    elif c.isalpha():
        return 12
    elif c == '$':
        return 13
    elif c == '{':
        return 14
    elif c == '}':
        return 15
    else:
        return 4

_c = None    # siguiente caracter
_leer = True # indica si se requiere leer un caracter de la entrada estándar

# Función principal: implementa el análisis léxico
def obten_token():
    """Implementa un analizador léxico: lee los caracteres de la entrada estándar"""
    global _c, _leer
    edo = 0 # número de estado en el autómata
    lexema = "" # palabra que genera el token
    while (True):
        while edo < 100:    # mientras el estado no sea ACEPTOR ni ERROR
            if _leer: _c = sys.stdin.read(1)
            else: _leer = True
            edo = MT[edo][filtro(_c)]
            print("edo ", edo, "filtro", filtro(_c))
            if edo < 100 and edo != 0: lexema += _c
        if edo == INT:    
            _leer = False # ya se leyó el siguiente caracter
            print("Entero", lexema)
            return INT
        elif edo == FLT:   
            _leer = False # ya se leyó el siguiente caracter
            print("Flotante", lexema)
            return FLT
        elif edo == OPB:   
            lexema += _c  # el último caracter forma el lexema
            print("Operador", lexema)
            return OPB
        elif edo == LRP:   
            lexema += _c  # el último caracter forma el lexema
            print("Delimitador", lexema)
            return LRP
        elif edo == RRP:  
            lexema += _c  # el último caracter forma el lexema
            print("Delimitador", lexema)
            return RRP
        ########################################################
        elif edo == OPA:
            lexema += _c  # el último caracter forma el lexema
            print("Asignación", lexema)
            return OPA
        elif edo == OPR:
            lexema += _c  # el último caracter forma el lexema
            print("Relacional", lexema)
            return OPR
        elif edo == OPIF:
            lexema += _c  # el último caracter forma el lexema
            print("Condicional", lexema)
            return OPIF
        elif edo == OPE:
            lexema += _c  # el último caracter forma el lexema
            print("Condicional", lexema)
            return OPE
        elif edo == IDE:
            lexema += _c  # el último caracter forma el lexema
            print("Identificador", lexema)
            return IDE
        elif edo == DIF:
            lexema += _c
            print("Diferenciador", lexema)
            return DIF
        elif edo == LLI:
            lexema += _c
            print("Llave Izquierda", lexema)
            return LLI
        elif edo == LLD:
            lexema += _c
            print("Llave Derecha", lexema)
            return LLD
        ########################################################
        elif edo == END:
            print("Fin de expresion")
            return END
        elif edo == ERR:   
            leer = False # el último caracter no es raro
            print("ERROR! palabra ilegal", lexema)
            return ERR      
            
        
    

