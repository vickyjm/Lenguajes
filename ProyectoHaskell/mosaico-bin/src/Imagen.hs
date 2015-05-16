module Imagen
  ( hSplit, vSplit
  , colorPromedio
  , crearImg
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
    Imagen { anchura = 4, altura = 1, datos = [ [ Color { rojo = 0, verde = 0, azul = 0 }
              , Color { rojo = 0, verde = 0, azul = 0 }
              , Color { rojo = 0, verde = 0, azul = 0 }
              , Color { rojo = 0, verde = 0, azul = 0 }
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


promAux1 :: (Num a) => (a,a,a) -> Color -> (a,a,a)
promAux1 (x, y, z) (Color p q s) = (r, v, a)
                where r = fromIntegral(p) + x
                      v = fromIntegral(q) + y
                      a = fromIntegral(s) + z

promAux2 :: (Num a) => [Color] -> (a,a,a)
promAux2 ls = foldl promAux1 (0,0,0) ls

promAux3 :: (Num a) => (a,a,a) -> [Color] -> (a,a,a)
promAux3 t l = sumaTupla t (promAux2 l) 
        where sumaTupla (a,b,c) (d,e,f) = (a + d, b + e, c + f)

colorPromedio :: Imagen -> Color
colorPromedio (Imagen ancho alto cols) = aux (foldl promAux3 (0,0,0) cols)
                    where aux (r,v,a) = (Color (round(fromIntegral(r)/fromIntegral(alto*ancho))) 
                                               (round(fromIntegral(v)/fromIntegral(alto*ancho))) 
                                               (round(fromIntegral(a)/fromIntegral(alto*ancho))))