{-Una reconocida empresa de comercio electr´onico nos pide desarrollar un sistema de stock de mercader´ıa. El conjunto de
mercader´ıas puede representarse con una secuencia de nombres de los productos, donde puede haber productos repetidos. El
stock puede representarse como una secuencia de tuplas de dos elementos, donde el primero es el nombre del producto y el
segundo es la cantidad que hay en stock (en este caso no hay nombre de productos repetidos). Tambi´en se cuenta con una
lista de precios de productos representada como una secuencia de tuplas de dos elementos, donde el primero es el nombre
del producto y el segundo es el precio.-}

productos :: [String] ->[(String, Int)]
productos [] = []
productos (x:xs) = (x, contar x (x:xs)) : productos (eliminar x xs)

contar:: String -> [String] -> Int
contar _[] = 0
contar producto (x:xs) | producto == x = 1 + contar producto xs
                       | otherwise = contar producto xs

eliminar:: String -> [String] -> [String]
eliminar _[] = []
eliminar producto (x:xs) | producto == x = eliminar producto xs
                         | otherwise = x: eliminar producto xs


stockDeProducto :: [(String, Int)] -> String -> String
stockDeProducto []_ = "0"
stockDeProducto ((nombre,cantidad):xs) producto
        | nombre == producto = "El producto '" ++ nombre ++ "' tiene '" ++ show cantidad ++ "' unidades en stock."
        | otherwise = stockDeProducto xs producto


{- [("manzana",3),("papitas",2),("mayonesa",1),("papel",3)] [("manzana",5.4),("papitas",6.50),("mayonesa", 10.0),("papel",5.0)]-}
dineroEnStock :: [(String, Int)] ->[(String, Float)] ->Float  
dineroEnStock []_ = 0
dineroEnStock ((nombre,cantidad):xs) precios = cantidadProducto * precioProducto + dineroEnStock xs precios
        where 
                precioProducto = buscarPrecio nombre precios
                cantidadProducto = fromIntegral cantidad

buscarPrecio :: String-> [(String, Float)] ->Float
buscarPrecio _[] = 0
buscarPrecio producto((nombre,precio):xs)
                |producto == nombre = precio 
                |otherwise = buscarPrecio producto xs 


aplicarOferta :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
aplicarOferta []_ = []
aplicarOferta ((nombre,cantidad)) precio 
                |



