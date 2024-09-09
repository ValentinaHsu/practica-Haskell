double :: Integer -> Integer double x = x + x

--Ej 1 --a) 
f :: Integer -> Integer 
f 1 = 8 
f 4 = 131 
f 16 = 16

--b) g :: 
Integer ->Integer 
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

{-i) digitoUnidades: dado un numero entero, extrae su dıgito de las unidades.-} 
digitoUnidades :: Integer -> Integer 
digitoUnidades n = mod n 10

--Ej 4 b) {-todoMenor: dadas dos tuplas R × R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.-} 
todoMenor :: (Float, Float) -> (Float, Float) -> Bool 
|{-todoMenor x y |(fst x) > (fst y) && (snd x) > (snd y) = True | otherwise = False-} 
--todoMenor (a,b) (c.d) =
