# c4ev3-helpers
A makefile and template for [c4ev3](https://github.com/c4ev3) projects.

#### Usage

`make` or `make build` only builds the project.<br/>
`make upload` builds and uploads the project via [ev3duder](https://github.com/c4ev3/ev3duder) to the SD-Card (/media/card/myapps/).<br/>
`make run` builds, uploads and runs the project.<br/>

#### Template
The template contains a function `stop` which runs in a separate thread.<br/>
This ensures the option of aborting the program manually via pressing the EV3's "back" button.
