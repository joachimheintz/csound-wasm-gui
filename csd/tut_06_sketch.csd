<html>
<body bgcolor="darkorange">
  <h1>Tutorial 2: Colors and Sizes</h1>
  <p>This tutorial shows some basic formatting in HTML.</p>
  <p>The background color can be set, and the color of elements. 
    (See <a href="https://www.w3schools.com/tags/ref_colornames.asp">here</a> for the HTML colors.)</p>
  <p>The size of the button can be set, and its text size.</p>
  <button type=button onclick='csound.readScore("i 1 0 30")' 
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

//lösung: sehr lange grunddauer
//aber ausschalten wenn -80 dB unterschritten
//GUI: show number of instances

instr WineGlass
  iMidiPitch = random:i(80,90)
  iDb = random:i(-20,0)
  iPartials[] = fillarray(1,2.32,4.25,6.63,9.38)
  iBaseFreq = mtof:i(iMidiPitch)
  iQ = 10^random:i(1,4)
  indx = 0
  while (indx < lenarray(iPartials)) do
    schedule("Partial",0,p3,iBaseFreq,iPartials[indx],iQ,iDb)
    indx += 1
  od
endin

instr Partial
  iBasFreq = p4
  iMult = p5
  iQ = p6
  iDb = p7
  iDevMult = (iMult == 1) ? 1 : semitone(random:i(-2,2))
  aImpulse = mpulse(1/3,p3)
  aMode = mode(aImpulse,iBasFreq*iMult*iDevMult,iQ)
  outall(aMode)
  
  kRms = rms(aMode)
  if (timeinsts:k() > 0.2) && (kRms < ampdb(-80)) then
    printks("Turned off after %.2f seconds (Q = %d)\n",0,timeinsts:k(),iQ)
    turnoff
  endif
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
