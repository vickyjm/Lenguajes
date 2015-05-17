module Main (main) where

import Graphics.Mosaico.Diagrama (Diagrama((:-:), (:|:), Hoja), Paso(Primero, Segundo))
import Graphics.Mosaico.Imagen   (Imagen(Imagen, altura, anchura, datos), leerImagen)
import Graphics.Mosaico.Ventana  (Ventana, cerrar, crearVentana, leerTecla, mostrar)

import Diagramas (Orientación(Horizontal, Vertical), caminar, dividir, rectánguloImagen, sustituir)
import System.Environment (getArgs)
import System.IO(stderr,hPutStrLn)

ciclo :: Ventana -> Diagrama -> [Paso] -> IO ()
ciclo = undefined

main :: IO ()
main = do
    args <- getArgs
    if length args /= 1 then do hPutStrLn stderr "Ingrese una imagen"
    else do
        imagen <- leerImagen (head args)
        case imagen of Left msg -> hPutStrLn stderr msg
                       Right (Imagen ancho alto cols) -> do
                                    vent <- crearVentana ancho alto 
                                    ciclo vent (Hoja (rectánguloImagen (Imagen ancho alto cols))) []