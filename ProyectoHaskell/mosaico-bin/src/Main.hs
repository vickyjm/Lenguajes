module Main (main) where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo), Rectángulo(Rectángulo, color, imagen))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos), leerImagen,Color(Color, rojo, verde, azul))
import Graphics.Mosaico.Ventana  (Ventana, cerrar, crearVentana, leerTecla, mostrar)
import System.Environment (getArgs)
import System.IO(stderr,hPutStrLn)

import Diagramas (Orientación(Horizontal, Vertical), caminar, dividir, rectánguloImagen, sustituir)

mostrarTecla :: Maybe String -> String
mostrarTecla (Just x) = x
mostrarTecla Nothing = ""

extraerDiag :: Maybe Diagrama -> Diagrama
extraerDiag (Just d) = d
extraerDiag Nothing = Hoja (Rectángulo (Color 0 0 0) (Imagen 0 0 [[Color 0 0 0]]))

checkVacio :: Diagrama -> Bool
checkVacio d = case d of Hoja (Rectángulo (Color 0 0 0) (Imagen 0 0 [[Color 0 0 0]])) -> True
                         _ -> False

divAux :: String -> Diagrama -> Diagrama
divAux tecla (Hoja r1) = case tecla of "Up"    -> (extraerDiag (dividir Horizontal r1))
                                       "Down"  -> (extraerDiag (dividir Horizontal r1))
                                       "Left"  -> (extraerDiag (dividir Vertical r1))
                                       "Right" -> (extraerDiag (dividir Vertical r1))
                                       _ ->  (Hoja r1)
divAux _ d1 = d1


ciclo :: Ventana -> Diagrama -> [Paso] -> IO ()
ciclo v d ps = do
                mostrar v ps d
                teclaLeida <- leerTecla v                                         -- Maybe String guardado aqui
                let 
                    tecla = (mostrarTecla teclaLeida)                             -- Tecla guardada en tecla
                    diag = (extraerDiag (caminar (reverse ps) d))                 -- Obtener el subarbol sobre el cual vamos a trabajar
                    diag2 = divAux tecla diag                                     -- Divido si es hoja, dejo igual si no
                    diag3 = (sustituir (diag2) (reverse ps) d)
                if (checkVacio diag2) then ciclo v d ps
                else 
                  case d of (Hoja _) ->
                                case tecla of "Up"    -> ciclo v diag3 (Primero:ps)
                                              "Down"  -> ciclo v diag3 (Segundo:ps)
                                              "Left"  -> ciclo v diag3 (Primero:ps)
                                              "Right" -> ciclo v diag3 (Segundo:ps)
                                              "BackSpace" -> if null ps then ciclo v d ps else ciclo v d (tail ps)
                                              "q"     -> cerrar v
                                              _ -> ciclo v d ps
                            (_ :-: _) ->
                                case tecla of "Up"    -> ciclo v diag3 (Primero:ps)
                                              "Down"  -> ciclo v diag3 (Segundo:ps)
                                              "Left"  -> ciclo v d ps
                                              "Right" -> ciclo v d ps
                                              "BackSpace" -> if null ps then ciclo v d ps else ciclo v d (tail ps)
                                              "q"     -> cerrar v
                                              _ -> ciclo v d ps
                            (_ :|: _) ->
                                case tecla of "Up"    -> ciclo v d ps
                                              "Down"  -> ciclo v d ps
                                              "Left"  -> ciclo v diag3 (Primero:ps)
                                              "Right" -> ciclo v diag3 (Segundo:ps)
                                              "BackSpace" -> if null ps then ciclo v d ps else ciclo v d (tail ps)
                                              "q"     -> cerrar v
                                              _ -> ciclo v d ps


main :: IO ()
main = do
        args <- getArgs
        if length args /= 1 then do hPutStrLn stderr "Ingrese una imagen"
        else do
            img <- leerImagen (head args)
            case img of Left msg -> hPutStrLn stderr msg
                        Right (Imagen ancho alto cols) -> do
                                       vent <- crearVentana ancho alto 
                                       ciclo vent (Hoja (rectánguloImagen (Imagen ancho alto cols))) []
