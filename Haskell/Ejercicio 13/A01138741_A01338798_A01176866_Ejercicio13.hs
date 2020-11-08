-- EJERCICIO 13 Evaluacion perezosa
-- A01138741 Ana Isabel Cruz Ramos
-- A01338798 Edgar Rubén Salazar Lugo 
-- A01176866 Héctor Díaz

-- EJERCICIO 1
numberToArray :: Integral x => x -> [x]
numberToArray 0 = []
numberToArray x = numberToArray (x `div` 10) ++ [x `mod` 10]

digAux :: (Num t, Integral a) => [a] -> t
digAux [] = 0
digAux (primero:resto) 
    | even primero = 1 + digAux resto
    | otherwise = digAux resto

digpares :: (Num t, Integral a) => a -> t
digpares numero = digAux (numberToArray numero)


-- EJERCICIO 2
parimpar :: Integral a => [a] -> [[a]]
parimpar lista = [ [i | i <- lista, even i] ] ++ [ [p | p <- lista, odd p] ]

-- EJERCICIO 3
rango_where :: Ord b => [b] -> (b, b)
rango_where lista
  | (length lista) == 1  = (head lista, head lista)
  | otherwise = (izq, der) 
    where izq = minimum lista
          der = maximum lista

rango_let :: (Foldable t, Ord a) => t a -> (a, a)
rango_let lista =
  let izq = minimum lista
      der = maximum lista
  in (izq, der)

-- EJERCICIO 4
mclaurin :: Fractional p => p -> Int -> p
mclaurin n counter
  | counter == 0 = 0.0
  | counter == 1 = 1.0
  | otherwise = 1.0 + sum ( map (\x-> n^x) (take (counter-1) [1..]))



main :: IO()
main = do

  print( digpares 5)
  print( digpares 32465)

  print( parimpar[1, 2, 3, 4, 5] )
  print( parimpar[4, 8, 3, 9] )

  print (rango_where [95])
  print (rango_let [75.3, 60.4])
  print (rango_where [100, 89, 60])
  print (rango_let "hola")

  print (mclaurin 0.5 1)
  print (mclaurin 0.5 2)
  print (mclaurin 0.5 4)