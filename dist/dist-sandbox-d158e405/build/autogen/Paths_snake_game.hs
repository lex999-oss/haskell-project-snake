{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_snake_game (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\bin"
libdir     = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\x86_64-windows-ghc-8.6.5\\snake-game-0.1.0.0-DaHFJox3Znb1xH7CXrhE8d"
dynlibdir  = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\x86_64-windows-ghc-8.6.5\\snake-game-0.1.0.0"
libexecdir = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\snake-game-0.1.0.0-DaHFJox3Znb1xH7CXrhE8d\\x86_64-windows-ghc-8.6.5\\snake-game-0.1.0.0"
sysconfdir = "C:\\Users\\ALEX\\Desktop\\Haskell\\project\\snake-game\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snake_game_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snake_game_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "snake_game_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "snake_game_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snake_game_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snake_game_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
