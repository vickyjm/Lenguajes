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

subImagen xIni yIni anchura' altura' imagen = (Imagen anchura' altura' (colores imagen))
									where colores (Imagen x y cols) = if (xIni == 0) then elimCol (take (altura'-1) cols)
																	  else elimCol (take (altura'-1) (drop (xIni-1) cols))

										  elimCol m = if (yIni == 0) then map (take (anchura'-1) m)
										  			  else map (take (anchura'-1)) (map (drop (yIni-1))



hSplit :: Imagen -> (Imagen, Imagen)
hSplit = undefined

vSplit :: Imagen -> (Imagen, Imagen)
vSplit = undefined

colorPromedio :: Imagen -> Color
colorPromedio = undefined
