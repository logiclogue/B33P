let find c =
    match c with
    | 'A' -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'B' -> [
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'C' -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'D' -> [
            [0; 1; 1; 1; 1; 0; 0; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 1; 1; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'E' -> [
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'F' -> [
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'G' -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'H' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'I' -> [
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'J' -> [
            [0; 0; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 0; 1; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'K' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 1; 1; 1; 1; 0; 0; 0];
            [0; 1; 1; 1; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 0; 0; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'L' -> [
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'M' -> [
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 1; 1; 1; 0; 1; 1; 1];
            [0; 1; 1; 1; 1; 1; 1; 1];
            [0; 1; 1; 0; 1; 0; 1; 1];
            [0; 1; 1; 0; 1; 0; 1; 1];
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'N' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 0; 1; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'O' -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'P' -> [
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 1; 1; 0; 0; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'Q' -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 1; 0; 1; 0];
            [0; 1; 1; 0; 1; 1; 0; 0];
            [0; 0; 1; 1; 0; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'T' -> [
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'U' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'V' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'W' -> [
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 1; 1; 0; 1; 0; 1; 1];
            [0; 1; 1; 0; 1; 0; 1; 1];
            [0; 1; 1; 1; 1; 1; 1; 1];
            [0; 1; 1; 1; 0; 1; 1; 1];
            [0; 1; 1; 0; 0; 0; 1; 1];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'X' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'Y' -> [
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | 'Z' -> [
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 1; 1; 0; 0; 0; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 1; 1; 1; 1; 1; 1; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
    | _  -> [
            [0; 0; 1; 1; 1; 1; 0; 0];
            [0; 1; 1; 0; 0; 1; 1; 0];
            [0; 0; 0; 0; 1; 1; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
            [0; 0; 0; 1; 1; 0; 0; 0];
            [0; 0; 0; 0; 0; 0; 0; 0];
        ]
