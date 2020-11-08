
--INTEGRANTES
-- Isabel Cruz A01138741
-- Héctor Díaz  A01176866
-- Edgar Salazar A01338798

--EJERCICIO 1
resto_col :: [[a]] -> [[a]]
resto_col lista = map (\l -> tail l) lista


--EJERCICIO 2
sumaMatriz :: (Num a, Foldable t) => [t a] -> a
sumaMatriz matriz = sum (map (\l -> sum l) matriz)


--EJERCICIO 3
trans :: [[t]] -> [[t]]
trans matriz = map (\(x, y) -> [x, y]) (zip (head matriz) (head (tail matriz)))


--EJERCICIO 4
aplicaAux :: (Eq t1, Num t1) => t1 -> t1 -> (t -> t) -> t -> t
aplicaAux counter n funcion elemento =
    if counter == n then funcion elemento
    else funcion (aplicaAux (counter+1) n funcion elemento)

aplicaN :: (t -> t) -> Integer -> t -> t
aplicaN = \funcion n -> (\x -> (aplicaAux 1 n funcion x))


--EJERCICIO 5
secuencia :: Int -> [Int] 
secuencia n = until ( \lista -> (length lista) >= n ) ( \lista -> lista ++ [ (last lista) + 1 ] ) [1]


