votosEnBlanco :: [(String, String)] -> [Int] -> Int ->Int 
votosEnBlanco _ votos cantTotalVotos = cantTotalVotos - sumaDeVotos votos

sumaDeVotos ::  [Int] -> Int
sumaDeVotos [] = 0
sumaDeVotos (x:xs) = x + sumaDeVotos xs

formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas ((presidente, vicepresidente):xs)
    | presidente == vicepresidente = False
    | hayRepetido presidente xs  = False
    | hayRepetido vicepresidente xs  = False
    | otherwise = formulasValidas xs

hayRepetido :: String -> [(String, String)] -> Bool
hayRepetido _[] = False
hayRepetido nombre((presidente, vicepresidente):xs)
    | nombre == presidente || nombre == vicepresidente = True 
    | otherwise = hayRepetido nombre  xs

{-
[("a","b"),("c","d"),("e","f")]
[("a","b"),("f","d"),("e","f")]
-}

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float

