<html>
<style>
body {
 background-color: darkorange;
 }
p {
 font-size: 20px;
 font-family: "Noto sans", Helvetica, sans;
 }
button {
 background-color: #AABBAA; 
 width: 150px; 
 height: 50px; 
 font-size: 30px;
 }
input {
 width: 100px; 
 height: 50px; 
 font-size: 30px; 
 text-align: right;
 font-family: "Lucida Console", "Courier New", monospace;
 }
</style>
<head>
</head>
<body >
  <h1>Tutorial 4: Style Sheet</h1>
  <p>The different style properties are usually organized in a <i><b>style</i></b> tag.</p>
  <p>This provides much better overview and let us re-use and modify properties
    for the same elements, like buttons or sliders.</p>
  <p>The HTML user interface is similar to Tutorial 3, but the code is much clearer.</p>
  <button type=button onclick='csound.readScore("i 1 0 1");'>Click me!</button>
  <input type=number oninput='csound.setControlChannel("base_pitch",this.value);' value="65"></input>
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

instr Main
  iPitch = chnget:i("base_pitch")  //midi note numbers given from user input
  printf_i("Base pitch = %.2f\n",1,iPitch)
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
  iPitch = p4 + random:i(-6,6)
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
