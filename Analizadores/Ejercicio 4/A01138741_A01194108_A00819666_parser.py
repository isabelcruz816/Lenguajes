# Implementación de un parser
# Reconoce expresiones mediante la gramática:
# EXP -> EXP op EXP | EXP -> (EXP) | cte
# la cual fué modificada para eliminar ambigüedad a:
# EXP  -> cte EXP1 | (EXP) EXP1
# EXP1 -> op EXP EXP1 | vacío
# los elementos léxicos (delimitadores, constantes y operadores)
# son reconocidos por el scanner
#
# Autor: Dr. Santiago Conant, Agosto 2014 (modificado Agosto 2015)

import sys
import obten_token as scanner

# Empata y obtiene el siguiente token
def match(tokenEsperado):
    global token
    if token == tokenEsperado:
        token = scanner.obten_token()
    else:
        print(token)
        print(tokenEsperado)
        error("token equivocado")
    

# Función principal: implementa el análisis sintáctico
def parser():
    global token 
    token = scanner.obten_token() # inicializa con el primer token
    exp2()
    if token == scanner.END:
        print("Expresion bien construida!!")
    else:
        error("expresion mal terminada")

# Módulo que reconoce expresiones
def exp():
    if token == scanner.INT or token == scanner.FLT or token == scanner.IDE:
        match(token) # reconoce Constantes
        exp1()
    elif token == scanner.LRP:
        match(token) # reconoce Delimitador (
        exp()
        match(scanner.RRP)
        exp1()
    elif token == scanner.LLD:
        match(token)  # reconoce Llave izquierda
        exp()
        match(scanner.OPIF)
        exp()
        match(scanner.OPE)
        exp()
        match(scanner.LLI)
        match(scanner.END)
    else:
        error("expresión mal iniciada")

# Módulo auxiliar para reconocimiento de expresiones
def exp1():
    if token == scanner.OPB or token == scanner.OPR: 
        match(token) # reconoce operador
        exp()
        exp1()
            
# Modulo que reconce asignaciones
def exp2():
    if token == scanner.IDE:
        exp()
        match(scanner.OPA)
        exp()
    else:
        error("no es una asignacion")

# Termina con un mensaje de error
def error(mensaje):
    print("ERROR:", mensaje)
    sys.exit(1)

parser()
        
