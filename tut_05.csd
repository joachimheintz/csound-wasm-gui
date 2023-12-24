<html>
<style>
body {
 background-color: darkorange;
 }
p {
 font-size: 20px;
 font-family: "Noto sans", Helvetica, sans;
 margin-top: 0.15em;
 margin-bottom: 0.15em;
 }
button {
 background-color: #AABBAA; 
 width: 150px; 
 height: 50px; 
 font-size: 30px;
 }
.numbox {
 width: 100px; 
 height: 50px; 
 font-size: 30px; 
 text-align: right;
 font-family: "Lucida Console", "Courier New", monospace;
 }
.slider {
 width: 200px;
 height: 20px;
 }
</style>
<head>
</head>
<body >
  <h1>Tutorial 5: Slider</h1>
  <p>Another common input element is the slider.</p>
  <p>In HTML a slider is an input element with <b><i>type="range"</i></b>.</p>
  <p>We use a slider here for the master volume, between -30 and +6 dB.</p>
  <br>
  <button type=button onclick='csound.readScore("i 1 0 1");'>Click me!</button>
  <input class="numbox" type=number oninput='csound.setControlChannel("base_pitch",this.value);' value="65"></input>
  <input class="slider" type=range oninput='csound.setControlChannel("master_volume",this.value)' min="-30" max="6" value="-10"></input>
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

//set a default value for the channel
chnset(65,"base_pitch")
chnset(-10,"master_volume")

instr Main
  iPitch = chnget:i("base_pitch")  //midi note numbers given from user input
  iNumTones = random:i(3,12)
  iStart = 0
  indx = 0
  while (indx<iNumTones) do
    schedule("Play",iStart,random:i(1,3),iPitch)
    iStart += random:i(.1,.5)
    indx += 1
  od
endin

instr Play
  kMasterVolume = chnget:k("master_volume") //dB
  iPitch = p4 + random:i(-6,6)
  iDb = random:i(-20,-10)
  aImp = mpulse:a(ampdb(iDb),p3+1)
  aTon_1 = mode:a(aImp,mtof:i(iPitch),1000)
  aTon_2 = mode:a(aImp,mtof:i(iPitch*random:i(1.9,2.1)),1000)
  aTon = linen:a(aTon_1+aTon_2,.003,p3,p3/2)
  aL,aR pan2 aTon*ampdb(kMasterVolume), random:i(0,1)
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
