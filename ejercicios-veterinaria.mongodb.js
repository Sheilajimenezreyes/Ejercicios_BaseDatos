// 1. Obtener los animales que sean de tipo Perro y tengan un precio de 50.
// RESULTADO -> 1 Firulais
/*use ("clinica_veterinaria");
db.animales.find({
    tipo:"Perro",
    precio:50
})*/

// 2. Obtener el nombre y raza de los animales que sean mayores de 3 años y pesen menos de 10 kilos.
// RESULTADO -> 1 Canela, 2 Lucky, 3 Oreo
/*use ("clinica_veterinaria")
db.animales.find(
    {edad: {$gt: 3}, peso:{$lt:10}},
    {nombre:1, raza:1, _id:0}
)*/

// 3. Obtener nombre y raza de los perros que se han vacunado 3 veces en nuestra clínica.
// RESULTADO -> 1 Max, 2 Firulais
/*use ("clinica_veterinaria")
db.animales.find(
    {tipo: "Perro", historico_vacunas: {$size:3}},
    {nombre:1, raza:1, _id:0}
)*/

// 4. Obtener el nombre de los animales que tengan una consulta con el texto "Le duele la pata derecha".
// RESULTADO -> 1 Firulais
/*use ("clinica_veterinaria")
db.animales.find(
    {consulta:"Le duele la pata derecha"},
    {nombre:1, _id:0}
)*/

// 5. Obtener el nombre y raza de los animales que se han vacunado contra el Parvovirus.
// RESULTADO -> 1 Firulais, 2 Max, 3 Chichu
/*use ("clinica_veterinaria")
db.animales.find(
    {"historico_vacunas.tipo": "Parvovirus"},
    {nombre:1, raza:1, _id:0}
)*/

// 6. Obtener el nombre y raza de los animales vacunados en el año 2023.
// RESULTADO -> 1 Firulais, 2 Paco, 3 Max y 4 Bella
/*use("clinica_veterinaria")
db.animales.find(
    {"historico_vacunas.fechaVacuna": {$regex: "^2023"}},
    {nombre:1, raza:1, _id:0}
)*/

// 7. Obtener la consulta más reciente (fechaRegistro).
// RESULTADO -> Pérdida de apetito
/*use("clinica_veterinaria")
db.animales.find(
    {},
    {consulta:1, _id:0}
).sort({fechaRegistro: -1}).limit(1)*/

// 8. Obtener la cantidad de perros que se han vacunado contra el Moquillo.
// RESULTADO -> 4
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $match:{
            tipo:"Perro",
            "historico_vacunas.tipo": "Moquillo"
        }
    },
    {
        $count: "totalPerros"
    }
]
)*/

// 9. Obtener el nombre y raza de los animales que tengan una consulta con el texto "Le duele la pata derecha" y tengan un precio de 50.
// RESULTADO -> 1 Firulais
/*use ("clinica_veterinaria")
db.animales.find(
    {
        $and: [{consulta: "Le duele la pata derecha"}, {precio: 50}],
    },
    {nombre:1, raza:1, _id:0}
)*/

// 10. Obtener el nombre y raza de los animales que tengan una edad superior a 5 años o un precio superior a 50.
// RESULTADO -> 1 Paco, 2 Max, 3 Simba, 4 Bobby, 5 Bella y 6 Rocky
/*use ("clinica_veterinaria")
db.animales.find(
    {
        $or: [
            {edad: {$gt: 5}},
            {precio: {$gt: 50}},
        ],
    },
    {nombre:1, raza:1, _id:0}
)*/

// 11. Obtener nombre y cantidad de animales por tipo.
// RESULTADO -> PERRO -> 8  Y GATO -> 7
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $group: {
            _id: "$tipo",
            cantidad: {$sum: 1}
        }
    },
    {
        $project:{
            _id:0,
            tipo: "$_id",
            cantidad: 1
        }
    },
])*/

// 12. Obtener la media del precio de consultas de los animales de tipo Perro y mostrarlo con el símbolo de euro.
// RESULTADO -> 55€
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $match: {tipo: "Perro"},
    },
    {
    $group: {
        _id: null,
        mediaPrecio: {$avg: "$precio"} 
    }
},
{
    $project: {
      _id:0,
      mediaPrecio: {
        $concat: [
            {$toString: "$mediaPrecio"},
            "€"
        ]
      }
    }
}
])*/

// 13. Añadir un historial de vacunas a Paco con fecha actual y tipo de vacuna "Rabia Avanzada". 
// RECUERDA COMENTAR LA LINEA PARA NO EJECUTARLA DE NUEVO
/*use("clinica_veterinaria")
db.animales.updateOne(
    {nombre: "Paco"},
    {
        $push: {
            historico_vacunas:{
                tipo: "Rabia Avanzada", 
                fechaVacuna: "2026-07-30"
            }
        }
    }
)
*/
// 14. Eliminar a Paco de la base de datos. NO EJECUTAR ESTE COMANDO, SOLO ESCRIBIR
/*use("clinica_veterinaria")
db.animales.deleteOne(

    {nombre: "Paco"}
)*/
// 15. Obtener la media del historial de vacunas de los perros.
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $match: {tipo: "Perro"}
    },
    {
        $project: {
            numeroVacunas: {$size: "$historico_vacunas"}
        }
    },
    {
        $group: {
            _id: null,
            mediaVacunas: {$avg: "$numeroVacunas"}
        }
    }
])*/

// 16. Obtener el animal con más vacunas.
// RESULTADO -> 3 Firulais
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $project: { nombre: 1,
            numeroVacunas: {$size: "$historico_vacunas"}   
        }
    },
    {
        $sort: {numeroVacunas: -1}
    },
    {
        $limit: 1
    },
])*/

// 17. Buscar en notasAdicionales la palabra "dieta" y obtener el nombre y raza de los animales que la contengan.
// RESULTADO -> 1 Firulais, 2 Coco, 3 Canela
/*use("clinica_veterinaria")
db.animales.find(
    {
        notasAdicionales: {$regex: "dieta"},
    },
    {nombre:1, raza:1, _id:0}
)*/

// 18. Obtener el penúltimo animal más viejo.
// RESULTADO -> 1 Bobby
/*use("clinica_veterinaria")
db.animales.find(
    {},
    {nombre: 1, edad: 1, _id:0}).sort({edad: -1}).skip(1).limit(1)*/


// 19. Obtener los colores y la cantidad de animales que hay de cada uno, donde la cantidad sea superior a 1.
// RESULTADO -> 1 Blanco, 2 Blanco y marrón, 3 Atigrado y 4 negro
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $group: {
            _id: "$color",
            cantidad: {$sum: 1}
        }
    },
    {
        $match: {
            cantidad: {$gt: 1}
        }
        },
        {
            $project: {
                _id:0,
                color: "$_id",
                cantidad: 1
            }
        }
])*/

// 20. Eliminar el atributo precio del animal "Paco".
/*use("clinica_veterinaria")
db.animales.updateOne(
    {nombre: "Paco"},
    {
        $unset: {
            precio:""
        }
    }
)*/
// Se vuelve a meter el valor que habiamos borrado anteriormente para que
//en el ejercicio de abajo el total facturado salga el eseprado
/*use("clinica_veterinaria")
db.animales.updateOne(
    { nombre: "Paco" },
    {
        $set: {
            precio: 60
        }
    }
)*/

// 21. Calcular cuánto ha facturado la clínica en total.
// RESULTADO -> 720// CORREGIR NO ME SALE JEJE
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $group:{ _id: null,
        totalFacturado: {$sum: "$precio"}
            }
        }
])*/

// 22. Encontrar todos los perros ordenados por peso de forma descendente.
/*use("clinica_veterinaria")
db.animales.find(
    {
        tipo: "Perro"
    },
    {tipo:1, peso:1, _id:0}
).sort({peso: -1})*/

// 23. Encontrar el promedio del precio de consultas por tipo de animal, mostrando solo dos decimales.
/*use("clinica_veterinaria")
db.animales.aggregate([
    {
        $group: {
            _id: "$tipo",
            promedioPrecio:{$avg:"$precio"}
        }
    },
    
   {
      $project: {
            _id: 0,
            tipo: "$_id",
            promedioPrecio: { $round: ["$promedioPrecio", 2] }
        }
    }
])*/



