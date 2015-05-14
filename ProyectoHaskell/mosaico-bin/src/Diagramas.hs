module
  Diagramas
  ( rectánguloImagen
  , Orientación(Horizontal, Vertical)
  , dividir
  , caminar
  , sustituir
  )
  where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo), Rectángulo(Rectángulo, color, imagen))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos))

import Imagen (colorPromedio, hSplit, vSplit,crearImg)

rectánguloImagen :: Imagen -> Rectángulo
rectánguloImagen img = (Rectángulo (colorPromedio img) img)

data Orientación
  = Horizontal
  | Vertical
  deriving Show

-- HOLA VICKY espero que te sientas mejor :D.
-- la parte de f1 y f2 esta dando un error de tipos por Hoja y no lo logro arreglar
-- Lo otro es que dice que devuelve Maybe Diagrama,pero no se que tipo de diagrama quiere 
-- asi que en principio estoy suponiendo que quiere dos hojas con lo que se dividio
-- pero no se si esa es la idea, o que.
dividir :: Orientación -> Rectángulo -> Maybe Diagrama
dividir o (Rectángulo prom (Imagen anch alt cols)) = case o of Horizontal -> 
                                                                  if alt < 2 then Nothing
                                                                  else Just (f1 (hSplit (Imagen anch alt cols)))
                                                               Vertical ->
                                                                  if anch < 2 then Nothing
                                                                  else Just (f2 (vSplit (Imagen anch alt cols)))
                                                where f1 (img1,img2) = ((Hoja (rectánguloImagen img1)) (:-:) (Hoja (rectánguloImagen img2)))
                                                      f2 (img1,img2) = ((Hoja (rectánguloImagen img1)) (:|:) (Hoja (rectánguloImagen img2)))

caminar :: [Paso] -> Diagrama -> Maybe Diagrama
caminar = undefined

sustituir :: Diagrama -> [Paso] -> Diagrama -> Diagrama
sustituir = undefined
