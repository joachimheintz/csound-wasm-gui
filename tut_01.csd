<html>
<head>
</head>
<body>
  <h1>Tutorial 1: Start Instrument</h1>
  <p>This tutorial shows how to start an instrument with a button.</p>
  <p>This is done in HTML by calling the <i>readScore()</i> function.</p>
  <p>The <i>readScore()</i> function is part of the Csound WASM API.</p>
  <p>All methods applicable to the Csound object are listed 
    <a href="https://github.com/csound/csound/tree/master/wasm/browser">here</a></p>
  <button type=button onclick='csound.readScore("i 1 0 1")'>Click me!</button>
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
