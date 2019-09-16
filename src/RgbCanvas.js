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

setInterval(() => {
    for (i = 0; i < imgData.data.length; i += 1) {
        if (Math.floor(Math.random() * 2) % 2 === 0) {
            setPixelI(imgData, i, 1);
        } else {
            setPixelI(imgData, i, 0);
        }
    }

    putImageData();
}, 10);

function xAndYToI(x, y) {
    return (y * width) + x;
}

function setPixelI(imgData, i, onOrOff) {
    const mainI = i * 4;
    const colour = i % 3;

    imgData.data[mainI + 0] = boolToInt(colour === 0) * 255 * onOrOff;
    imgData.data[mainI + 1] = boolToInt(colour === 1) * 255 * onOrOff;
    imgData.data[mainI + 2] = boolToInt(colour === 2) * 255 * onOrOff;
    imgData.data[mainI + 3] = 255;
}

function boolToInt(b) {
    if (b) {
        return 1;
    }

    return 0;
}

function setPixelXY(imgData, x, y) {
    const i = xAndYToI(x, y);

    setPixelI(imgData, i);
}

function putImageData() {
    ctx.putImageData(imgData, 0, 0);
}
