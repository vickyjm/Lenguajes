module Imagen
  ( hSplit, vSplit
  , colorPromedio
  )
  where

import Graphics.Mosaico.Imagen (Color(Color, rojo, verde, azul), Imagen(Imagen, altura, anchura, datos))

elimFila 0 altura' cols = take (fromIntegral altura') cols
elimFila xIni altura' cols = take (fromIntegral altura') (drop (fromIntegral xIni) cols)

elimCol 0 anchura' cols = map (take (fromIntegral anchura')) cols
elimCol yIni anchura' cols = map (take (fromIntegral anchura')) (map (drop (fromIntegral yIni)) cols)

subImagen
  :: Integer -> Integer
  -> Integer -> Integer
  -> Imagen -> Imagen

subImagen xIni yIni anchura' altura' imagen = (Imagen anchura' altura' (color imagen))
		  where color (Imagen _ _ cols) = elimCol yIni anchura' (elimFila xIni altura' cols)


crearImg = 
    Imagen { anchura = 4, altura = 2, datos = [ [ Color { rojo = 1, verde = 35, azul = 250 }
              , Color { rojo = 2, verde = 25, azul = 0 }
              , Color { rojo = 3, verde = 0, azul = 250 }
              , Color { rojo = 4, verde = 3, azul = 100 }
              ]
              , [ Color { rojo = 5, verde = 2, azul = 3 }
              , Color { rojo = 6, verde = 5, azul = 6 }
              , Color { rojo = 7, verde = 0, azul = 9 }
              , Color { rojo = 8, verde = 1, azul = 1 }
              ]
            ]
      }

extraerI (Imagen _ _ cols) = cols 

hSplit :: Imagen -> (Imagen, Imagen)
hSplit (Imagen ancho alto cols) = (subImagen 0 0 ancho alto' imagen, subImagen alto' 0 ancho (alto-alto') imagen)
              where alto' = div alto 2
                    imagen = (Imagen ancho alto cols)

vSplit :: Imagen -> (Imagen, Imagen)
vSplit (Imagen ancho alto cols) = (subImagen 0 0 ancho' alto imagen, subImagen 0 ancho' (ancho-ancho') alto imagen)
              where ancho' = div ancho 2
                    imagen = (Imagen ancho alto cols)

extraerImg (i1, i2) = (extraerI i1, extraerI i2)

colorPromedio :: Imagen -> Color
colorPromedio = undefined
