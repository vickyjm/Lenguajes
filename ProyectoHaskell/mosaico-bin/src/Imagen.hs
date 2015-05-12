module Imagen
  ( hSplit, vSplit
  , colorPromedio
  )
  where

import Graphics.Mosaico.Imagen (Color(Color, rojo, verde, azul), Imagen(Imagen, altura, anchura, datos))



subImagen
  :: Integer -> Integer
  -> Integer -> Integer
  -> Imagen -> Imagen

subImagen xIni yIni anchura' altura' imagen = (Imagen anchura' altura' (color imagen))
		  where color (Imagen _ _ cols) = if (xIni == 0) then elimCol (take (fromIntegral(altura'-1)) cols)
											else elimCol (take (fromIntegral(altura'-1)) (drop (fromIntegral(xIni-1)) cols))
												 where elimCol m = if (yIni == 0) then (map (take (fromIntegral(anchura'-1))) m)
										  			               else (map (take (fromIntegral(anchura'-1))) (map (drop (fromIntegral(yIni-1))) m))


crearImg = 
    Imagen { anchura = 4, altura = 2, datos = [ [ Color { rojo = 14, verde = 35, azul = 250 }
              , Color { rojo = 75, verde = 25, azul = 0 }
              , Color { rojo = 120, verde = 0, azul = 250 }
              , Color { rojo = 0, verde = 3, azul = 100 }
              ]
              , [ Color { rojo = 14, verde = 35, azul = 250 }
              , Color { rojo = 75, verde = 25, azul = 0 }
              , Color { rojo = 120, verde = 0, azul = 250 }
              , Color { rojo = 0, verde = 3, azul = 100 }
              ]
            ]
      }

hSplit :: Imagen -> (Imagen, Imagen)
hSplit = undefined

vSplit :: Imagen -> (Imagen, Imagen)
vSplit = undefined

colorPromedio :: Imagen -> Color
colorPromedio = undefined
