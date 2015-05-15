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

dividir :: Orientación -> Rectángulo -> Maybe Diagrama
dividir o (Rectángulo prom (Imagen anch alt cols)) = case o of Horizontal -> 
                                                                  if alt < 2 then Nothing
                                                                  else Just (f1 (hSplit (Imagen anch alt cols)))
                                                               Vertical ->
                                                                  if anch < 2 then Nothing
                                                                  else Just (f2 (vSplit (Imagen anch alt cols)))
                                                where f1 (img1,img2) = ((Hoja (rectánguloImagen img1)) :-: (Hoja (rectánguloImagen img2)))
                                                      f2 (img1,img2) = ((Hoja (rectánguloImagen img1)) :|: (Hoja (rectánguloImagen img2)))


img = crearImg
rec = rectánguloImagen img
diag = (((Hoja rec) :-: (((Hoja rec) :|: (Hoja rec)) :-: (Hoja rec))) :-: ((Hoja rec) :|: (Hoja rec)))

caminar :: [Paso] -> Diagrama -> Maybe Diagrama
caminar [] d = Just d
caminar _ (Hoja rec) = Nothing 
caminar (p:ps) (d1 :-: d2) = case p of Primero -> (caminar ps d1)
                                       Segundo -> (caminar ps d2)
caminar (p:ps) (d1 :|: d2) = case p of Primero -> (caminar ps d1)
                                       Segundo -> (caminar ps d2)

sustituir :: Diagrama -> [Paso] -> Diagrama -> Diagrama
sustituir = undefined
