open Mocha;
open Chai;
open TextToSpriteCanvas;

describe("TextToSpriteCanvas", () => {
    describe("draw_char", () => {
        context("given 'A'", () => {
            let result = draw_char('A', 0, 0);

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
                let result = draw_char('B', 4, 2);

                expect(result)->t->deep->equal([
                    SpriteCanvas.DrawSprite(
                        CharacterSprites.find('B'), 4, 2
                    )
                ]);
            });
        });
    });
});
