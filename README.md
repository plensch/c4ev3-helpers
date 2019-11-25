# c4ev3-template
A makefile and template for [c4ev3](https://github.com/c4ev3) projects.

### Makefile
#### Usage

`make` or `make build` only builds the project.<br>
`make upload` builds and uploads the project via [ev3duder](https://github.com/c4ev3/ev3duder) to the SD-Card (/media/card/myapps/).<br>
`make run` builds, uploads and runs the project.<br>

#### Configuration
`CC=arm-linux-gnueabi-gcc`: you may have to change this line to `arm-none-linux-gnueabi-gcc`.<br>
`LDFLIBS=-L../lib/libev3api -lev3api -I../lib/libev3api -pthread`:
Point gcc to your [EV3-API](https://github.com/c4ev3/EV3-API) with both `-L` and `-I`.

`EV3DUDER=../tools/ev3duder/ev3duder`: Path to [ev3duder](https://github.com/c4ev3/ev3duder).<br>
`OPTDUDER`: Options you want to pass to [ev3duder](https://github.com/c4ev3/ev3duder). The default ist `--usb`<br>


### Template
The template contains a function, `stop`, which runs in a separate thread.<br/>
This ensures the option of aborting the program manually via pressing the EV3's "back" button.
