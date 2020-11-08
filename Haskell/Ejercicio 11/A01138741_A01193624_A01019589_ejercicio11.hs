-- A01138741 Ana Isabel Cruz Ramos
-- A01193624 Diego Frías Nerio
-- A01019589 Ernesto Ramirez

-- Ejercicio 11

-- 1. Obtener la matrícula y máxima calificación de un alumno
-- Función auxiliar para obtener el primer elemento de una tupla
first :: (Int,String,[Int]) -> Int
first (a,_,_) = a 

-- Función auxiliar para obtener el tercer elemento de una tupla
thrd :: (Int,String,[Int]) -> [Int]
thrd (_,_,a) = a

-- Función auxiliar que obtiene el mayor de una lista de enteros
mayor :: [Int] -> Int
mayor [n] =  n
mayor (x:xs) =
  if x > mayor xs
    then x
  else mayor xs

maxima :: [(Int, String, [Int])] -> [(Int, Int)]
maxima [] = []
maxima (x:xs) = ((first x),(mayor (thrd x))):(maxima xs)

-- 2. Tipo de dato que permita mostrar y comparar cuerpos geométricos
data Cuerpo = Cilindro Float Float Float | Cubo Float Float | Esfera Float Float deriving (Eq)

-- 2. Obtener la densidad de un cuerpo 
densidad :: Cuerpo -> Float
densidad (Cilindro masa altura radio) = masa / (pi * altura * (radio * radio))
densidad (Cubo masa largo) = masa / (largo * largo * largo)
densidad (Esfera masa radio) = masa / (4/3 * pi * (radio * radio * radio))

-- 3. Obtener una lista con los valores pares de los nodos de un árbol binario
data AB e = N (AB e) e (AB e) | AV deriving (Show)

pares :: AB Int -> [Int]
pares AV = []
pares (N l e r) = 
  if (mod e 2) > 0 
  then (pares l) ++ [] ++ (pares r) 
  else (pares l) ++ [e] ++ (pares r)

-- 4. Elimina todas las repeticiones de un valor de una lista anidada
data LA e = L [LA e] | E e deriving (Show, Eq)

-- Funciones Auxiliar para Construir una Lista Anidada
cons :: LA a -> LA a -> LA a
cons (L[]) y = L[y]
cons x (L[]) = L[x]
cons x y = L[x,y]

-- Funcion Elimina
elimina :: (Eq e) => e -> LA e -> LA e
elimina _ (L []) = (L [])
elimina a (L (E x:xs)) =
   if x == a 
    then (elimina a (L xs))
   else
    cons (E x) (elimina a (L xs))
elimina a (L (l:xs)) = cons (elimina a (l)) (elimina a (L xs))

main :: IO()
main = do
  -- 1 -- done
  print (maxima [(111111, "Jorge Perez",[100,100,100]),
        (222222,"Gloria Flores",[90,80,95]),
        (333333,"Ramiro Mendez",[90,60,90])]) -- [(111111,100),(222222,95),(333333,90)]
  
  -- 2 -- done
  print ((Cilindro 20 10 2) == (Cilindro 20 10 2)) -- True
  print ((Cubo 20 10) == (Esfera 20 10)) -- False

  print (densidad (Cilindro 1000 10 2)) -- 7.957747
  print (densidad (Cubo 1000 10)) -- 1.0
  print (densidad (Esfera 1000 10)) -- 0.2387324

  -- 3 -- done
  print (pares AV) -- []
  print (pares (N (N (N AV 2 AV) 5 (N AV 7 AV)) 8 (N AV 9 (N (N AV 11 AV) 16 AV)))) -- [8,2,16]

  -- 4 -- done
  print (elimina 3 (L [E 1,L [E 2,E 3],E 4])) -- L [E 1,L [E 2],E 4]
  print (elimina 'a' (L [E 'a', L [E 'b',E 'a'], E 'a'])) -- L [L [E ‘b’]]