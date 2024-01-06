<html>
<head>
</head>
<body bgcolor="darkorange">
  <h1>Tutorial 2: Colors and Sizes</h1>
  <p>This tutorial shows some basic formatting in HTML.</p>
  <p>The background color can be set, and the color of elements. 
    (See <a href="https://www.w3schools.com/tags/ref_colornames.asp">here</a> for the HTML colors.)</p>
  <p>The size of the button can be set, and its text size.</p>
  <button type=button onclick='csound.readScore("i 1 0 1")' 
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

instr Main
  iNumTones = random:i(3,12)
  iStart = 0
  indx = 0
  while (indx<iNumTones) do
    schedule("Play",iStart,random:i(1,3))
    iStart += random:i(.1,.5)
    indx += 1
  od
endin

instr Play
  iPitch = random:i(60,80)  //midi note numbersTo
  iDb = random:i(-20,-10)
  aImp = mpulse:a(ampdb(iDb),p3+1)
  aTon_1 = mode:a(aImp,mtof:i(iPitch),1000)
  aTon_2 = mode:a(aImp,mtof:i(iPitch*random:i(1.9,2.1)),1000)
  aTon = linen:a(aTon_1+aTon_2,.003,p3,p3/2)
  aL,aR pan2 aTon, random:i(0,1)
  out(aL,aR)
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
