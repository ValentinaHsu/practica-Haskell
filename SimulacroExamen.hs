-- [("hola","chau"),("como","estas"),("pedro","jj")]
{-MI SOLUCION: UNA CAGADA :)
relacionesValidas:: [(String, String)] -> Bool
--relacionesValidas [(a,b)] = True
relacionesValidas ((a,b):xs) = relacionesSinRepetir a b xs && relacionesValidas xs

        -- |relacionesSinRepetir a b xs == True = relacionesValidas xs
        -- |relacionesSinRepetir a b xs  == False = False

relacionesSinRepetir :: String -> String -> [(String, String)] -> Bool
relacionesSinRepetir a b((c,d):xs)
        |componentesDiferentes a b c d == True = True 
        |componentesDiferentes a b c d == False = False 
        |otherwise = relacionesSinRepetir a b xs 

componentesDiferentes :: String -> String -> String -> String -> Bool
componentesDiferentes a b c d
        |a == b || c == d || (a == d && b == c) || (a == c && b == d)= False
        |otherwise = True
-}

{- PROBAR 
todos diferentes [("a","b"),("c","d"),("d","e")]
uno repetido [("a","b"),("c","d"),("a","b")]
repetido alrevez [("a","b"),("c","d"),("b","a")]
igual [("a","b"),("c","d"),("a","a")]
-}

relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs)
    | a==b = False
    | hayDuplicados (a,b) xs = False 
    | otherwise = relacionesValidas xs

hayDuplicados:: (String, String) -> [(String, String)] -> Bool
hayDuplicados _ [] = False
hayDuplicados (a,b) ((c,d):xs) = ((a == c && b == d) || (a == d && b == c)) || hayDuplicados (a,b) xs


personas:: [(String, String)] -> [String]
personas nombres = eliminarDuplicados(obtenerPersonas nombres)

obtenerPersonas :: [(String, String)] -> [String]
obtenerPersonas [] = []  
obtenerPersonas ((a, b):xs) = a : b : obtenerPersonas xs

eliminarDuplicados :: [String] ->  [String]
eliminarDuplicados [] = []
eliminarDuplicados (x:xs) = x: eliminarDuplicados (eliminar x xs)

eliminar ::  String -> [String] ->  [String]
eliminar _[] = []
eliminar nombre(x:xs)
    |nombre == x = eliminar nombre xs
    |otherwise = x:  eliminar nombre xs


amigosDe :: String -> [(String, String)] -> [String]
amigosDe persona relaciones = eliminar persona (buscarAmigos persona relaciones)

buscarAmigos :: String -> [(String, String)] -> [String]
buscarAmigos _[] = []
buscarAmigos persona((a,b):xs)
    | persona == a || persona == b = a : b : buscarAmigos persona xs
    | otherwise = buscarAmigos persona xs

{-problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas
   de relaciones (o alguno de ellos si hay empate)}
}
-}

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = " "
personaConMasAmigos persona = masApariciones (apariciones (obtenerPersonas persona))

masApariciones :: [(String , Int)] -> String
masApariciones [] = " "
masApariciones [x] = fst x
masApariciones (x:xs)
    | snd x >= snd (head xs) = masApariciones (x: tail xs) 
    | otherwise = masApariciones xs

apariciones :: [String] -> [(String , Int)]
apariciones [] = []
apariciones (x:xs) = (x, conteo x (x:xs)) : apariciones (eliminar x xs)

-- obtenerPersonas:: [(String, String)] -> [String]
-- obtenerPersonas [] = []  
-- obtenerPersonas ((a, b):xs) = a : b : obtenerPersonas xs

conteo :: String -> [String] -> Int
conteo _[] = 0
conteo persona (x:xs) 
    | persona == x = 1 + conteo persona xs
    | otherwise = conteo persona xs






