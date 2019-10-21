open Mocha;
open Chai;
open TextToSpriteCanvas;

describe("TextToSpriteCanvas", () => {
    describe("draw_char", () => {
        context("given 'A'", () => {
            let result = draw_char('A', 0, 0, 1);

            it("returns the relevant sprite", () => {
                expect(result)->t->deep->equal([
                    SpriteCanvas.DrawSprite(
                        CharacterSprites.find('A'), 0, 0
                    )
                ]);
            });
        });

        context("given 'B'", () => {
            it("returns the relevant sprite", () => {
                let result = draw_char('B', 4, 2, 1);

                expect(result)->t->deep->equal([
                    SpriteCanvas.DrawSprite(
                        CharacterSprites.find('B'), 4, 2
                    )
                ]);
            });
        });
    });

    describe("draw_text", () => {
        context("given 'AB'", () => {
            let result = draw_text("AB", 4, 2, 1);

            it("returns the relevant sprite", () => {
                expect(result)->t->deep->equal([
                    SpriteCanvas.DrawSprite(
                        CharacterSprites.find('A'), 4, 2
                    ),
                    SpriteCanvas.DrawSprite(
                        CharacterSprites.find('B'), 12, 2
                    )
                ]);
            });
        });

        context("given 'AB' in white", () => {
            let result = draw_text("AB", 4, 2, 7);

            it("returns the relevant sprite in white", () => {
                let original_a = CharacterSprites.find('A');
                let original_b = CharacterSprites.find('B');

                let letter_a = List.map(List.map(x => x * 7), original_a);
                let letter_b = List.map(List.map(x => x * 7), original_b);

                expect(result)->t->deep->equal([
                    SpriteCanvas.DrawSprite(letter_a, 4, 2),
                    SpriteCanvas.DrawSprite(letter_b, 12, 2)
                ]);
            });
        });
    });
});
