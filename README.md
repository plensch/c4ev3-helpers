# c4ev3-template
A makefile and template for [c4ev3](https://github.com/c4ev3) projects.

### Makefile
#### Usage

`make` or `make build` only builds the project.<br>
`make upload` builds and uploads the project via [ev3duder](https://github.com/c4ev3/ev3duder).<br>
`make run` builds, uploads and runs the project.<br>

#### Configuration
`CC=arm-linux-gnueabi-gcc`: you may have to change this to `CC=arm-none-linux-gnueabi-gcc`.<br>
`LDFLIBS=-L[YOUR-PATH] -lev3api -I[YOUR-PATH] -pthread`:
Point gcc to the [EV3-API](https://github.com/c4ev3/EV3-API) with both `-L` and `-I`.<br>
`EV3DUDER`: Path to [ev3duder](https://github.com/c4ev3/ev3duder).<br>
`OPTDUDER`: Options you want to pass to [ev3duder](https://github.com/c4ev3/ev3duder). The default is `--usb`.<br>
`upload`: The folder on your EV3 you want to upload to. The default is `/media/card/myapps/`, 
which seems to be the most reliable method. [More Information on folders](https://github.com/c4ev3/ev3duder#uploading).<br>


### Template
The template contains a function, `stop`, which runs in a separate thread.<br/>
This ensures the option of aborting the program manually via pressing the EV3's "back" button.
