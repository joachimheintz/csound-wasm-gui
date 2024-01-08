# 01 A Color and a Timbre

## HTML and JavaScript

### Colors

We set a background color in the opening tag of the HTML `<body>` as

`<body bgcolor="darkorange">`

HTML has 140 color names which can be seen [here](https://www.w3schools.com/tags/ref_colornames.asp) in alphabetical order, and [here](https://www.w3schools.com/colors/colors_hex.asp) ordered by their hexadecimal RGB values. 

We use a HEX value to define the background color of the button:

`<button ... style="background-color:#AABBAA;"`

`#AABBAA` results in (170,187,170) as RGB values, so in this case grey with a bit more green than plain grey.

### Text size

The text size can be set as `font-size`, usually in *px* (which are not the pixels on your screen but a measurement of 0.265 mm).

The font sizes for `<h1>` and `<p>` are set internally. We will get later to how we can adapt it to our needs.

### Button size

We set the button size in the `width` and `height` property of its `style` attribute:

`width:150px; height:50px;`


### The style attribute

When we define the `style` of a HTML element, we must enclose the properties in a string and separate them by a semicolon:

`style="background-color:#AABBAA; width:150px; height:50px; font-size:30px;"`


## Csound

### Partials

Musical timbre derives from the number and ratios of single partials. In a harmonic sound the partials have integer ratios. Setting the base frequency as 1, the following partials follow the ratio 2:1, 3:1, 4:1, and so on.

When we add on partial to our exciter-resonator unit, we can use the same impulse as exciter, but we need a second mode filter for the second partial:

```
  aImpulse = mpulse(1/3,p3)
  aMode_1 = mode(aImpulse,mtof:i(iMidiPitch),1000)
  aMode_2 = mode(aImpulse,mtof:i(iMidiPitch)*2,1000)
```

(Rather than `mtof:i(iMidiPitch)*2` we could also write `mtof:i(iMidiPitch+12)`.)

### Varying timbres

All natural timbres vary in different ways. Even a constant bowing on a string will create a fast movement of the partials over time, with slight modifications in intensity and even in pitch. A hit on a bowl or glass will produce more or less different partials depending on the position and strength of the hit.

We can follow this line in different ways in computer music. We start here in opening a slight pitch variation for the second partial. It will not always be twice the base frequency, but in a random range between 1.9 and 2.1:

`aMode_2 = mode(aImpulse,iBaseFreq*random:i(1.9,2.1),1000)`

You may want to play with the possible amount of random deviation. If the random range exceeds a certain size, the second partial gets isolated from the first.

### Note on random ranges for pitch

Mathematically the calculation `iBaseFreq*random:i(1.9,2.1)` is not correct. We can see it more obvious when we add and subtract not 0.1 to/from 2 as the normal multiplier for the second partial, but a larger value, say 1. Our random range is then between 1 and 3 as multipliers. Imagine 100 Hz as the base frequency. The second partial would be 200 Hz, but is now between 100 and 300 Hz. But the minimum 100 Hz is one octave lower (ratio 1:2) than 200 Hz, wheras the maximum 300 Hz is only one fifth higher (ratio 3:2) than 200 Hz.

Correctly done, our random range will count in musical intervals, for instance semitones or cents. Csound offers easy-to-use converters for them. To calculate an interval which is minum 2 semitones lower than the octave and maximum 2 semitones higher, we write:

`aMode_2 = mode(aImpulse,iBaseFreq*2*semitone(random:i(-2,2)),1000)`

I think that for small random ranges we will not have an audible difference, and a mathematical fault can result in a good sound. But we should be aware of this issue and usually think in intervals rather than in linear numbers.
