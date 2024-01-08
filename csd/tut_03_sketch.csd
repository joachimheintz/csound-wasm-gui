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

instr Timbre_Array
  iMidiPitch = random:i(80,90)
  aImpulse = mpulse(1/3,p3)
  iBaseFreq = mtof:i(iMidiPitch)
  iQ = 1000
  iPartials[] = fillarray(1,2.32,4.25,6.63,9.38)
  aMode_1 = mode(aImpulse,iBaseFreq*iPartials[0],iQ)
  aMode_2 = mode(aImpulse,iBaseFreq*iPartials[1],iQ)
  aMode_3 = mode(aImpulse,iBaseFreq*iPartials[2],iQ)
  aMode_4 = mode(aImpulse,iBaseFreq*iPartials[3],iQ)
  aMode_5 = mode(aImpulse,iBaseFreq*iPartials[4],iQ)
  aMode = sum:a(aMode_1,aMode_2,aMode_3,aMode_4,aMode_5)
  outall(aMode)
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
