<html>
<body bgcolor="darkorange">
  <h1>Tutorial 2: Colors and Sizes</h1>
  <p>This tutorial shows some basic formatting in HTML.</p>
  <p>The background color can be set, and the color of elements. 
    (See <a href="https://www.w3schools.com/tags/ref_colornames.asp">here</a> for the HTML colors.)</p>
  <p>The size of the button can be set, and its text size.</p>
  <button type=button onclick='csound.readScore("i 1 0 5")' 
    style="background-color:#AABBAA; width:150px; height:50px; font-size:30px;">Click me!</button>
</body>
</html>

<CsoundSynthesizer>
<CsOptions>
-odac -m128
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1
seed 0

instr Timbre
  iMidiPitch = random:i(80,90)
  aImpulse = mpulse(1/3,p3)
  iBaseFreq = mtof:i(iMidiPitch)
  aMode_1 = mode(aImpulse,iBaseFreq,1000)
  //aMode_2 = mode(aImpulse,iBaseFreq*random:i(1.9,2.1),1000)
  aMode_2 = mode(aImpulse,iBaseFreq*2*semitone(random:i(-2,2)),1000)
  outall(aMode_1+aMode_2)
endin


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>








<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>672</x>
 <y>232</y>
 <width>635</width>
 <height>380</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
