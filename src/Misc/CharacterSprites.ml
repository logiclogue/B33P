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
            [0; 0; 1; 0; 0; 1; 1; 0];
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
