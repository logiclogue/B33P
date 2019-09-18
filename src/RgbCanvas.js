// 0 - black
// 1 - red
// 2 - green
// 3 - yellow
// 4 - blue
// 5 - pink
// 6 - cyan
// 7 - white

export function create() {
    const c = document.getElementById("main-canvas");
    const ctx = c.getContext("2d");
    const width = 512;
    const height = 384;
    const imgData = ctx.createImageData(width, height);

    return {
        c, ctx, width, height, imgData
    };
}

export function start(self) {
    console.log("HERE");

    setInterval(() => {
        for (let i = 0; i < self.imgData.data.length; i += 1) {
            if (Math.floor(Math.random() * 2) % 2 === 0) {
                setPixelI(self, i, true);
            } else {
                setPixelI(self, i, false);
            }
        }

        putData(self);
    }, 10);
}

function xAndYToI(x, y) {
    return (y * width) + x;
}

export function setPixelI(self, i, onOrOff) {
    const mainI = i * 4;
    const colour = i % 3;

    self.imgData.data[mainI + 0] = boolToInt(colour === 0 && onOrOff) * 255;
    self.imgData.data[mainI + 1] = boolToInt(colour === 1 && onOrOff) * 255;
    self.imgData.data[mainI + 2] = boolToInt(colour === 2 && onOrOff) * 255;
    self.imgData.data[mainI + 3] = 255;
}

function boolToInt(b) {
    if (b) {
        return 1;
    }

    return 0;
}

function setPixelXY(self, x, y) {
    const i = xAndYToI(x, y);

    setPixelI(self.imgData, i);
}

export function putData(self) {
    self.ctx.putImageData(self.imgData, 0, 0);
}
