open Mocha;
open Chai;
open EightColourToRgbCanvas;

describe("EightColourToRgbCanvas", () => {
    describe("set_pixel_xy", () => {
        context("given 0, 0, 0", () => {
            let result = set_pixel_xy(0, 0, 0);

            it("returns [(0, 0), (1, 0), (512, 0), (513, 0)]", () => {
                expect(result)->t->deep->equal([
                    RgbCanvasAction.SetPixelI(0, false),
                    RgbCanvasAction.SetPixelI(1, false),
                    RgbCanvasAction.SetPixelI(512, false),
                    RgbCanvasAction.SetPixelI(513, false)
                ]);
            });
        });

        context("given 0, 0, 7", () => {
            let result = set_pixel_xy(0, 0, 7);

            it("returns [(0, 1), (1, 1), (512, 1), (513, 1)]", () => {
                expect(result)->t->deep->equal([
                    RgbCanvasAction.SetPixelI(0, true),
                    RgbCanvasAction.SetPixelI(1, true),
                    RgbCanvasAction.SetPixelI(512, true),
                    RgbCanvasAction.SetPixelI(513, true)
                ]);
            });
        });

        context("given 1, 0, 6", () => {
            let result = set_pixel_xy(1, 0, 6);

            it("returns [(2, 1), (3, 0), (514, 1), (515, 1)]", () => {
                expect(result)->t->deep->equal([
                    RgbCanvasAction.SetPixelI(2, false),
                    RgbCanvasAction.SetPixelI(3, true),
                    RgbCanvasAction.SetPixelI(514, true),
                    RgbCanvasAction.SetPixelI(515, false)
                ]);
            });
        });
    });
});
