open Mocha;
open Chai;
open SpriteToEightCanvas;
open SpriteCanvas;
open EightColourCanvas;

describe("SpriteToEightCanvas", () => {
    describe("draw_sprite", () => {
        context("given [[0]], 0, 0", () => {
            it("returns [SetPixelXY 0 0 0]", () => {
                let result = draw_sprite([[0]], 0, 0);

                let expected = [
                    SetPixelXY(0, 0, 0)
                ];

                expect(result)->t->deep->equal(expected);
            });
        });
    });
});
