longitud :: [t] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo [x]=x 
ultimo (_:xs)= ultimo xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

--2)ej5
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar elem (x:xs)
    | elem == x = xs
    | otherwise = x: quitar elem xs

--3)ej1
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = sumatoria xs + x

--ej2
productoria :: [Int] -> Int
productoria [] = 0
productoria (x:xs) = productoria x * xs 

--ej3
maximo :: [Int] -> Int
maximo (x:[]) = x
maximo (x:y:xs) 
        |x > y = maximo(x:xs)    
        |otherwise = maximo (y:xs)

--ej4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN num [] = []
sumarN num (x:xs) = sumarN x+num


--4) ejb
ordenar :: [Int] -> [Int]
ordenar[] =[] 
ordenar l = ordenar(quitar(max_l) l) ++ [max_l]
        where max_l = maximo l 

