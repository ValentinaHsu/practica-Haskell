***Practica de Haskell - UBA 2024***

-- [("hola","chau"),("como","estas"),("pedro","jj")]
relacionesValidas:: [(String, String)] -> Bool
relacionesValidas [(a,b)] = True
relacionesValidas ((a,b):xs)
        |relacionesSinRepetir a b xs == True = relacionesValidas xs
        |relacionesSinRepetir a b xs  == False = False

-- relacionesSinRepetir a b xs && relacionesValidas xs

relacionesSinRepetir :: String -> String -> [(String, String)] -> Bool
relacionesSinRepetir a b((c,d):xs)
        |componentesDiferentes a b c d == True = True 
        |componentesDiferentes a b c d == False = False 
        |otherwise = relacionesSinRepetir a b xs 

componentesDiferentes :: String -> String -> String -> String -> Bool
componentesDiferentes a b c d
        |a == b || c == d || (a == d && b == c) || (a == c && b == d)= False
        |otherwise = True
 Ejercicio 1
Para empezar a diseñar la novedosa y rupturista red social Y el famoso Elio Mark nos ha pedido que desarrollemos algunas funciones básicas, que tendrán como objetido representar algunas relaciones e interacciones entre los usuarios. Para esto nos envió las siguientes especificaciones en lenguaje semiformal y nos pidió que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en Introducción a la Programación de Exactas-UBA.

problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.

problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
}

problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
}

problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}
