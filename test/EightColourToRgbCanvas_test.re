open Mocha;
open Chai;
open EightColourToRgbCanvas;

describe("EightColourToRgbCanvas", () => {
    describe("set_pixel_xy", () => {
        context("given 0, 0, 0", () => {
            let result = set_pixel_xy(0, 0);

            it("returns [(0, 0), (1, 0), (512, 0), (513, 0)]", () => {
                expect(result)->t->deep->equal([
                    RgbCanvasAction.SetPixelI((0, false)),
                    RgbCanvasAction.SetPixelI((1, false)),
                    RgbCanvasAction.SetPixelI((512, false)),
                    RgbCanvasAction.SetPixelI((513, false))
                ]);
            });
        });
    });
});
