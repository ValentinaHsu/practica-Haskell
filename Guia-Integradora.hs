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