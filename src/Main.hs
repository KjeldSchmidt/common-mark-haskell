import Data.Char

main :: IO()
main = do
    a <- getLine
    putStrLn . show . tagChars . replace $ [chr 0, chr 1, chr 2]
    return ()

replace :: String -> String
replace = map (\x -> if ord x /= 0 then x else chr 65533 )

tagChars :: [Char] -> [(Char, Int)]
tagChars = map (\x -> (x, (tag . ord) x))
    where
        tag = id

data CharacterType = Space | Tab | NewLine | CarriageReturn | FormFeed | UnicodeWhiteSpace | ASCIIPunctuation | UnicodePunctuation | Generic | EOF
data LineType = Blank | WhiteSpace | UnicodeWhiteSpaceLine | GenericLine