open Mocha;
open Chai;
open SpriteToEightCanvas;
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

        context("given [[0, 1], [2, 3]], 3, 4", () => {
            it("returns a list of SetPixelXYs with appropriate values", () => {
                let result = draw_sprite([[0, 1], [2, 3]], 3, 4);

                let expected = [
                    SetPixelXY(0, 3, 4),
                    SetPixelXY(1, 4, 4),
                    SetPixelXY(2, 3, 5),
                    SetPixelXY(3, 4, 5)
                ];

                expect(result)->t->deep->equal(expected);
            });
        });
    });
});
