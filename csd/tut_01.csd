<html>
<body>
  <h1>Tutorial 1: Start Instrument</h1>
  <p>This tutorial shows how to start an instrument with a button.</p>
  <p>This is done in HTML by calling the <i>readScore()</i> function.</p>
  <p>The <i>readScore()</i> function is part of the Csound WASM API.</p>
  <p>All methods applicable to the Csound object are listed 
    <a href="https://github.com/csound/csound/tree/master/wasm/browser">here</a></p>
  <button type=button onclick='csound.readScore("i 1 0 5")'>Click me!</button>
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

instr Pling
  iMidiPitch = random:i(80,90)
  aImpulse = mpulse(1/3,p3)
  aMode = mode(aImpulse,mtof:i(iMidiPitch),1000)
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
