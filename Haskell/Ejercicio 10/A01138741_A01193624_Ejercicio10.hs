-- A01138741 Ana Isabel Cruz Ramos
-- A01193624 Diego Frías Nerio

-- Fibonacci
-- Funcion recursiva para calcular el termino n de fibonacci
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n - 1) + fib(n - 2)

-- Mayor
-- Funcion recursiva para obtener el mayor de una lista
mayor :: [Integer] -> Integer
mayor [n] =  n
mayor (x:xs) = 
  if x > mayor xs
    then x
  else mayor xs

-- Mezcla
-- Funcion que regresa la mezlca de dos listas ordenadas
mezcla :: [Integer] -> [Integer] -> [Integer]
mezcla [] [] = []
mezcla x [] = x
mezcla [] x = x
mezcla (x:xs) (y:ys) =
  if x < y
    then (x:mezcla xs (y:ys))
  else (y:mezcla (x:xs) ys)

-- Repetidos
-- Funcion que regresa los numeros que se repiten
repetidos :: [Integer] -> [Integer]
repetidos [] = []
repetidos [n] = []
repetidos (x:xs) = 
  if (elem x xs) && (not (elem x (repetidos xs)))
    then x:repetidos xs
  else repetidos xs

-- Función principal para evaluar las funciones
main :: IO ()
main = do
  print (fib 7)
  print (mayor [1, 4, 2])
  print (mezcla [-2, 1, 2, 4, 7, 13] [-5, -1, 0, 5, 7, 10])
  print (repetidos [1, 2, 3, 4, 3, 2, 1, 5, 9, 2, 3, 4])