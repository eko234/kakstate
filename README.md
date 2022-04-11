# kakstate
Keep your kakoune state (partially) after closing the editor.
to use it, just create a `.kakstate` file in your project directory, it
will make kakoune to dump the registers and the opened buffers to that
file when you exit kakoune, and it will load that information when
you open a file inside that directory, it will walk up until it finds
a `.kakstate` file so you can open the file of the project you need from
werever.
