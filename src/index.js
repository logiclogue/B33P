const c = document.getElementById("main-canvas");
const ctx = c.getContext("2d");
const width = 512;
const height = 384;
const imgData = ctx.createImageData(width, height);

// 0 - black
// 1 - red
// 2 - green
// 3 - yellow
// 4 - blue
// 5 - pink
// 6 - cyan
// 7 - white

let i;

for (i = 0; i < imgData.data.length; i += 1) {
    setPixelI(imgData, i, getPixelColour(i));
}

ctx.putImageData(imgData, 0, 0);

function xAndYToI(x, y) {
    return (y * width) + x;
}

function getPixelColour(i) {
    const colour = i % 3;

    switch (colour) {
    case 0:
        return 1;

    case 1:
        return 2;

    case 2:
        return 4;

    default:
        return 0;
    }
}

function setPixelI(imgData, i, colourCode) {
    const mainI = i * 4;

    imgData.data[mainI + 0] = (colourCode % 2) * 255;
    imgData.data[mainI + 1] = ((colourCode >> 1) % 2) * 255;
    imgData.data[mainI + 2] = ((colourCode >> 2) % 2) * 255;
    imgData.data[mainI + 3] = 255;
}

function setPixelXY(imgData, x, y, colourCode) {
    const i = xAndYToI(x, y);

    setPixelI(imgData, i, colourCode);
}
