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







pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 && not (repetido x (pares xs)) = x:(pares xs)
             | otherwise = pares xs  
 
repetido :: Integer -> [Integer] -> Bool
repetido _[] = False
repetido e (x:xs) = e == x || repetido e xs

{-Una reconocida empresa de comercio electr´onico nos pide desarrollar un sistema de stock de mercader´ıa. El conjunto de
mercader´ıas puede representarse con una secuencia de nombres de los productos, donde puede haber productos repetidos. El
stock puede representarse como una secuencia de tuplas de dos elementos, donde el primero es el nombre del producto y el
segundo es la cantidad que hay en stock (en este caso no hay nombre de productos repetidos). Tambi´en se cuenta con una
lista de precios de productos representada como una secuencia de tuplas de dos elementos, donde el primero es el nombre
del producto y el segundo es el precio.-}

productos :: [String] ->[(String, Int)]
productos [] = [(" ",0)]
productos (x:xs) = (x, contar x (xs)) : productos (eliminar x xs)

contar:: String -> [String] -> Int
contar _[] = 0
contar producto (x:xs) | producto == x = 1 + contar producto xs
                       | otherwise = contar producto xs

eliminar:: String -> [String] -> [String]
eliminar _[] = []
eliminar producto (x:xs) | producto == x = eliminar producto xs
                         | otherwise = x: eliminar producto xs





module Test where 

    import Test.HUnit
    import MisFunciones

    run = runTestTT testsFibo
    runPares = runTestTT testPares

    testsPares = test : [
        "Pares" ~: (pares [2,4,6,7,3,9]) ~?= [2,4,6],
        "ParesRepetidos"[2,3,5,6,7,4,7,4,2,9,7,10] ~?= [6,4,2,10]
    ]

    testProductos = test:[
        "Productos" ~: (productos ["tomate", "banana", "papa", "banana", "papa"]) ~?= (["tomate":1,"banana": 2, "papa":2])
    ]


