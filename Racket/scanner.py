# Implementación de un scanner mediante la codificación de un Autómata
# Finito Determinista como una Matríz de Transiciones
# Autor: Dr. Santiago Conant, Agosto 2014 (modificado en Agosto 2015)

# Ejercicio 3
# Integrantes:
# Ana Isabel Cruz Ramos, A01138741
# Sergio Eduardo Vega Guzmán, A01194108
# José Alejandro Myrick Asturias, A00819666

import sys

# tokens
INT = 100  # Número entero
FLT = 101  # Número de punto flotante
OPB = 102  # Operador binario
LRP = 103  # Delimitador: paréntesis izquierdo
RRP = 104  # Delimitador: paréntesis derecho
END = 105  # Fin de la entrada

OPA = 106  # Operador de asignación =
OPIF = 107  # Operador Condicional ?
OPE = 108 # Operador : Else
OPR = 112  # Operadores relacionales, <, >, >=, <=, ==
IDE = 109  # Identificadores, a - z
DIF = 110  # Operador de negacion !

ERR = 200  # Error léxico: palabra desconocida

"""# Matriz de transiciones: codificación del AFD
# [renglón, columna] = [estado no final, transición]
# Estados > 99 son finales (ACEPTORES)
# Caso especial: Estado 200 = ERROR
# Caso especial: Estado 110 = DIF
#     dig   op      (     )   raro esp    .   =    ?   :   opr   !  letra  $           """
MT = [[   1, OPB, LRP, RRP,   4,   0, 4, 5,   OPIF,  OPE, 6, DIF, IDE, END], # 0 inicial
      [   1, INT, INT, INT, INT, INT, 2, INT,  INT,  INT, INT, INT, INT, INT], # 1 enteros
      [   3, ERR, ERR, ERR,   4, ERR, 4, ERR,  ERR,  ERR, ERR, ERR, ERR, ERR], # 2 primer decimal flotante
      [   3, FLT, FLT, FLT, FLT, FLT, 4, FLT,  FLT,  FLT, FLT, FLT, FLT, FLT], # 3 decimales restantes flotante
      [ ERR, ERR, ERR, ERR,   4, ERR,  4, ERR,  ERR,  ERR, ERR, ERR, ERR, ERR], # 4 error
      [ OPA, OPA, OPA, ERR, ERR, OPA, ERR, OPR, ERR, ERR, OPR, ERR, OPA, OPA], # 5 igual
      [ OPR, ERR, OPR, ERR, ERR, OPR, ERR, OPR, ERR, ERR, ERR, ERR, OPR, OPR]] # 6 relacionales

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
    else:
        return 4

# Función principal: implementa el análisis léxico
def scanner():
    """Implementa un analizador léxico: lee los caracteres de la entrada estándar"""
    edo = 0 # número de estado en el autómata
    lexema = "" # palabra que genera el token
    tokens = []
    leer = True # indica si se requiere leer un caracter de la entrada estándar
    while (True):
        while edo < 100:    # mientras el estado no sea ACEPTOR ni ERROR
            if leer: c = sys.stdin.read(1)
            else: leer = True
            edo = MT[edo][filtro(c)]
            if edo < 100 and edo != 0: lexema += c
        if edo == INT:    
            leer = False # ya se leyó el siguiente caracter
            print("Entero", lexema)
        elif edo == FLT:   
            leer = False # ya se leyó el siguiente caracter
            print("Flotante", lexema)
        elif edo == OPB:   
            lexema += c  # el último caracter forma el lexema
            print("Operador", lexema)
        elif edo == LRP:   
            lexema += c  # el último caracter forma el lexema
            print("Delimitador", lexema)
        elif edo == RRP:  
            lexema += c  # el último caracter forma el lexema
            print("Delimitador", lexema)
        #####################################################
        elif edo == OPA:
            lexema += c  # el último caracter forma el lexema
            print("Asignación", lexema)
        elif edo == OPR:
            lexema += c  # el último caracter forma el lexema
            print("Relacional", lexema)
        elif edo == OPIF or edo == OPE:
            lexema += c  # el último caracter forma el lexema
            print("Condicional", lexema)
        elif edo == IDE:
            lexema += c  # el último caracter forma el lexema
            print("Identificador", lexema)
        elif edo == DIF:
            lexema += c
            print("Diferenciador", lexema)
        #####################################################
        elif edo == ERR:   
            leer = False # el último caracter no es raro
            print("ERROR! palabra ilegal", lexema)
        tokens.append(edo)
        if edo == END: return tokens
        lexema = ""
        edo = 0

scanner()

            
        
    

