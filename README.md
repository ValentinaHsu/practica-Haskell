# practica-Haskell

double :: Integer -> Integer 
double x = x + x

--Ej 1 --a) 
f :: Integer -> Integer 
f 1 = 8 
f 4 = 131 
f 16 = 16

--b) 
g :: Integer -> Integer 
g 8 = 16 
g 16 = 4 
g 131 = 1

--c) 
h :: Integer -> Integer 
h n = f(g n) 

k :: Integer -> Integer 
k n = g(f n)

--Ej2 
maximo :: Int -> Int -> Int -> Int 
maximo x y z | x >= y && x >= z = x 
             | y >= x && y >= z = y 
             | otherwise = z

--d) {-mismoIntervalo: dados dos numeros reales, indica si estan relacionados considerando la relacion de equivalencia en R cuyas clases de equivalencia son: (−∞, 3], (3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo. -} 
mismoIntervalo :: Int -> Int -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True 
                   | x > 3 && x <= 7 && y > 3 && y <= 7 = True 
                   | x > 7 && y > 7 = True 
                   | otherwise = False

--g) {-sumaDistintos: que dados tres numeros enteros calcule la suma sin sumar repetidos (si los hubiera).-} 
sumaDistintos :: Int -> Int -> Int -> Int 
sumaDistintos x y z | x == y && y == z = 0 
                    | x == y = z 
                    | x == z = y 
                    | otherwise = x+y+z

{-i) .-} 
digitoUnidades :: Integer -> Integer 
digitoUnidades n = mod n 1000

--Ej 4 b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool 
todoMenor x y |(fst x) > (fst y) && (snd x) > (snd y) = True
              | otherwise = False 
--todoMenor (a,b) (c.d) =


--Ej 2
parteEntera:: Float -> Integer
parteEntera x | x < 1 = 0
              | otherwise = parteEntera(x - 1) + 1

--Ej 3
{-esDivisible :: Integer ->Integer ->Bool       
esDivisible x y | x == 0 = True
                | x > 0 = EsDivisible(x - y)
                | otherwise = False   -}

--Ej 7
cantDigitos :: Int -> Int
cantDigitos n | n < 10 = n
              | otherwise = cantDigitos(div n 10) + 1

iesimoDigito :: Int ->Int ->Int
iesimoDigito n i = mod (div n (10^(cantDigitos(n)-i))) 10
-- | cantDigitos n == i = mod n 10
-- | otherwise = iesimoDigito (div n 10) i

--Ej 9  
esCapicua :: Integer ->Bool
esCapicua n | n < 10 = True
            | esCapicua(mod n 10 == div n (10^(cantDigitos(n)))) 
            | otherwise = False
