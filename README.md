# kakstate
Keep your kakoune state (partially) after closing the editor.
to use it, just create a `.kakstate` file in your project directory, it
will make kakoune to dump the registers and the opened buffers to that
file when you exit kakoune, and it will load that information when
you open a file inside that directory, it will walk up until it finds
a `.kakstate` file so you can open the file of the project you need from
werever inside that path.

note that currently it does open all the files corresponding to the buffers
you had opened since the last time you closed kakoune, if you desire a 
different behavior take a look at the code, is very simple and straightforward.

I also stole some stuff from localkakrc. :)
