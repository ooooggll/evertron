# evertron
The port of evercore to picotron

Based on evercore+ v2.0.1, which is based on evercore v2.3.0, which is based on smalleste, which is based on celeste classic

## Credits
### Celeste Classic
- Maddy Thorson
- Noel Berry
### Evercore
- petra
- meep
- gonengazit
- akliant
### Evercore+ and Evertron
- equinox
### PICO-8 Instruments
- pancelor

## Documentation (barely)
A few things you should know about Evertron.
- In order to make a left-facing spring or left-moving cloud, simply flip its tile horizontally in the map. Use the tool that looks like a crosshair to select a single tile, then press F.
- Spikes and semisolids go on the ground layer, not the object layer.
- You can change the resolution by modifying the `vid(3)` line in `main.lua`. Settings of 3, 0, and 4 are recommended (1 and 2 don't do much).
- The object dictionary has been changed to be a bit more readable, hopefully. It previously used some kind of gross-looking but token-efficient code that's not necessary anymore.
- Objects can have a `:draw_before()` function defined, in addition to their `:draw()` function. This allows them to draw on multiple separate layers. If `:draw_before()` is defined, it will be called before the terrain is drawn (with other objects that have a negative layer).
- The `key` object has been renamed to `berry_key`, to avoid conflict with `key()`.
