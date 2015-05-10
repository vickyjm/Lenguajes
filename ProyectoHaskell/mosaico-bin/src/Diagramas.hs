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

import Imagen (colorPromedio, hSplit, vSplit)



rectánguloImagen :: Imagen -> Rectángulo
rectánguloImagen = undefined

data Orientación
  = Horizontal
  | Vertical
  deriving Show

dividir :: Orientación -> Rectángulo -> Maybe Diagrama
dividir = undefined

caminar :: [Paso] -> Diagrama -> Maybe Diagrama
caminar = undefined

sustituir :: Diagrama -> [Paso] -> Diagrama -> Diagrama
sustituir = undefined
