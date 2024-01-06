# 01 Start Button

## HTML and JavaScript

### The csound object

WASM Csound lets us access an object which is — not surprisingly — called *csound*. We communicate with this object via different methods. They are listed in the [WASM Csound Rapository](https://github.com/csound/csound/tree/master/wasm/browser).

If we use Csound for Android, or CsoundQt, we can access the Csound Object directly in a HTML tag as part of the .csd file. If you use Csound in a JavaScript environment, you find good introductions in the Tutorials of Yi/Sigurdsson and Lazzarini.

### Where to put the HTML tag in the .csd file

I will go the Android / CsoundQt way here, so we start by adding an HTML tag to our .csd file. We must put this additional tag **outside** the CsoundSynthesizer tag, for instance before it.

### The HTML tag

#### This is the GUI

All we put in the HTML tag as valid HTML or JavaScript code will be shown in an own panel. In CsoundQt it is called "HTML View", in Android Csound it is available via the "HTML" tab.

We can put anything here what we want to see in our GUI. In particular:
- text
- buttons
- sliders
- number boxes
- graphical displays

#### HTML code

There are excellent tutorials and references online, in particular the [W3schools](https://www.w3schools.com/). Its [HTML Tutorial](https://www.w3schools.com/html/default.asp) is fun to learn. The [HMTL Reference](https://www.w3schools.com/tags/default.asp) will also be consulted.

We use mostly text tags here:
- h1 tag for the first order heading
- p tag for a paragraph
- i tag for italics
- a tag with href="" for a link

#### Button with readScore()

The element which interacts with Csound is a button. It is created as:

`<button type=button onclick='csound.readScore("i 1 0 5")'>Click me!</button>`

As explained [here](https://www.w3schools.com/tags/tag_button.asp), we should always use the `type=button` specification as a button can also be created as image or text. When ths button is clicked, the *readScore()* method of the *csound* object is called with the string "i 1 0 5". This score line will call instrument 1 immediately for 5 seconds.

## Csound

### Generate a random MIDI note

The MIDI note numbers are familiar to musicians. Middle C is MIDI key 60, and each semitone is one up or down. With the code `iMidiPitch = random:i(80,90)` we generate a number between 80 and 90 and interpret it as MIDI key, resulting in pitches between G#5 and F#6.

We use the functional way of writing Csound code here. `random:i` mean that we use the `random` opcode at *i-rate*, thus generating only one result at the initialization of this instrument instance.

In the header we use the statement `seed 0` to get always different results of the `random` opcode.

### Modal Synthesis

We will use a mass-spring system as sound producing unit in this tutorial. The core is the [mode]() opcode which was introduced by François Blanc and Steven Yi. Iain McCurdy has created a wonderful example in his Realtim Collection which showed the immense potential of it.

The sound producing unit consists of two parts:
1. The exciter which is in this case a single sample, and
2. the resonator which is a high quality resonance filter.

