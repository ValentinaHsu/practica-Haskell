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


