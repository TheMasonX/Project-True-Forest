// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5254902,fgcg:0.5254902,fgcb:0.6745098,fgca:0.5372549,fgde:0.002551961,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3351,x:32719,y:32712,varname:node_3351,prsc:2|diff-3433-OUT;n:type:ShaderForge.SFN_Code,id:3433,x:30809,y:32417,varname:node_3433,prsc:2,code:ZgBsAG8AYQB0ADIAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAgAD0AIABmAGwAbwBhAHQAMgAoADEALgAwAC8AMwAuADAALAAxAC4AMAAvADMALgAwACkAOwAgAC8ALwAzACAAdABpAGwAZQBzACAAdwBpAGQAZQAsACAAdABoAHIAZQBlACAAdABpAGwAZQBzACAAdABhAGwAbAAsACAAYwBoAGEAbgBnAGUAIABpAGYAIAB1AHMAaQBuAGcAIABhACAAZABpAGYAZgBlAHIAZQBuAHQAIAB0AGkAbABlACAAcwBlAHQAdQBwAA0ACgBmAGwAbwBhAHQANAAgAHQAZQB4AFIAZQBzAHUAbAB0ADsADQAKAA0ACgANAAoAbgBvAHIAbQBhAGwAIAAqAD0AIABuAG8AcgBtAGEAbAAgACoAIABuAG8AcgBtAGEAbAAgACoAIABuAG8AcgBtAGEAbAA7AA0ACgBuAG8AcgBtAGEAbAAgAD0AIABuAG8AcgBtAGEAbAAuAHIAZwBiACAALwAgACgAbgBvAHIAbQBhAGwALgByACAAKwAgAG4AbwByAG0AYQBsAC4AZwAgACsAIABuAG8AcgBtAGEAbAAuAGIAKQA7AA0ACgANAAoALwAvAFIAIABUAGkAbABlACAAUwBlAGMAdABpAG8AbgAgAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQANAAoAZgBsAG8AYQB0ADMAIABSAF8AUABvAHMAIAA9ACAAZgByAGEAYwAoAHAAbwBzAGkAdABpAG8AbgAgACoAIAByAGcAYgBhAFMAYwBhAGwAZQAuAHIAKQA7AA0ACgBmAGwAbwBhAHQAIABSAF8AVQBWAFQAaQBsAGUAXwBZACAAPQAgAGYAbABvAG8AcgAoAHIAZwBiAGEAVABpAGwAZQAuAHIAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALgB4ACkAOwANAAoAZgBsAG8AYQB0ACAAUgBfAFUAVgBUAGkAbABlAF8AWAAgAD0AIAByAGcAYgBhAFQAaQBsAGUALgByACAALQAgADMAIAAqACAAUgBfAFUAVgBUAGkAbABlAF8AWQA7AA0ACgBmAGwAbwBhAHQAMgAgAFIAXwBVAFYAVABpAGwAZQAgAD0AIABmAGwAbwBhAHQAMgAoAFIAXwBVAFYAVABpAGwAZQBfAFgALAAgAFIAXwBVAFYAVABpAGwAZQBfAFkAKQA7AA0ACgANAAoAZgBsAG8AYQB0ADQAIAB0AGUAeAAxACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAFIAXwBQAG8AcwAuAHIAZwAgACsAIABSAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgBmAGwAbwBhAHQANAAgAHQAZQB4ADIAIAA9ACAAdABlAHgAMgBEAGwAbwBkACgAdABpAGwAZQBTAGgAZQBlAHQALABmAGwAbwBhAHQANAAoACgAUgBfAFAAbwBzAC4AcgBiACAAKwAgAFIAXwBVAFYAVABpAGwAZQApACAAKgAgAFUAVgBUAGkAbABlAF8AUwBjAGEAbABlACwAMAAsADAAKQApADsADQAKAGYAbABvAGEAdAA0ACAAdABlAHgAMwAgAD0AIAB0AGUAeAAyAEQAbABvAGQAKAB0AGkAbABlAFMAaABlAGUAdAAsAGYAbABvAGEAdAA0ACgAKABSAF8AUABvAHMALgBnAGIAIAArACAAUgBfAFUAVgBUAGkAbABlACkAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALAAwACwAMAApACkAOwANAAoAdABlAHgAUgBlAHMAdQBsAHQAIAA9ACAAKAB0AGUAeAAxACAAKgAgAG4AbwByAG0AYQBsAC4AYgAgACsAIAB0AGUAeAAyACAAKgAgAG4AbwByAG0AYQBsAC4AZwAgACsAIAB0AGUAeAAzACAAKgAgAG4AbwByAG0AYQBsAC4AcgApACAAKgAgAHYAZQByAHQAZQB4AEMAbwBsAG8AcgAuAHIAOwANAAoADQAKAA0ACgANAAoALwAvAEcAIABUAGkAbABlACAAUwBlAGMAdABpAG8AbgAgAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQANAAoAZgBsAG8AYQB0ADMAIABHAF8AUABvAHMAIAA9ACAAZgByAGEAYwAoAHAAbwBzAGkAdABpAG8AbgAgACoAIAByAGcAYgBhAFMAYwBhAGwAZQAuAGcAKQA7AA0ACgBmAGwAbwBhAHQAIABHAF8AVQBWAFQAaQBsAGUAXwBZACAAPQAgAGYAbABvAG8AcgAoAHIAZwBiAGEAVABpAGwAZQAuAGcAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALgB4ACkAOwANAAoAZgBsAG8AYQB0ACAARwBfAFUAVgBUAGkAbABlAF8AWAAgAD0AIAByAGcAYgBhAFQAaQBsAGUALgBnACAALQAgADMAIAAqACAARwBfAFUAVgBUAGkAbABlAF8AWQA7AA0ACgBmAGwAbwBhAHQAMgAgAEcAXwBVAFYAVABpAGwAZQAgAD0AIABmAGwAbwBhAHQAMgAoAEcAXwBVAFYAVABpAGwAZQBfAFgALAAgAEcAXwBVAFYAVABpAGwAZQBfAFkAKQA7AA0ACgANAAoAdABlAHgAMQAgAD0AIAB0AGUAeAAyAEQAbABvAGQAKAB0AGkAbABlAFMAaABlAGUAdAAsAGYAbABvAGEAdAA0ACgAKABHAF8AUABvAHMALgByAGcAIAArACAARwBfAFUAVgBUAGkAbABlACkAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALAAwACwAMAApACkAOwANAAoAdABlAHgAMgAgAD0AIAB0AGUAeAAyAEQAbABvAGQAKAB0AGkAbABlAFMAaABlAGUAdAAsAGYAbABvAGEAdAA0ACgAKABHAF8AUABvAHMALgByAGIAIAArACAARwBfAFUAVgBUAGkAbABlACkAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALAAwACwAMAApACkAOwANAAoAdABlAHgAMwAgAD0AIAB0AGUAeAAyAEQAbABvAGQAKAB0AGkAbABlAFMAaABlAGUAdAAsAGYAbABvAGEAdAA0ACgAKABHAF8AUABvAHMALgBnAGIAIAArACAARwBfAFUAVgBUAGkAbABlACkAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALAAwACwAMAApACkAOwANAAoAdABlAHgAUgBlAHMAdQBsAHQAIAArAD0AIAAoAHQAZQB4ADEAIAAqACAAbgBvAHIAbQBhAGwALgBiACAAKwAgAHQAZQB4ADIAIAAqACAAbgBvAHIAbQBhAGwALgBnACAAKwAgAHQAZQB4ADMAIAAqACAAbgBvAHIAbQBhAGwALgByACkAIAAqACAAdgBlAHIAdABlAHgAQwBvAGwAbwByAC4AZwA7AA0ACgANAAoADQAKAA0ACgAvAC8AQgAgAFQAaQBsAGUAIABTAGUAYwB0AGkAbwBuACAALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAA0ACgBmAGwAbwBhAHQAMwAgAEIAXwBQAG8AcwAgAD0AIABmAHIAYQBjACgAcABvAHMAaQB0AGkAbwBuACoAcgBnAGIAYQBTAGMAYQBsAGUALgBiACkAOwANAAoAZgBsAG8AYQB0ACAAQgBfAFUAVgBUAGkAbABlAF8AWQAgAD0AIABmAGwAbwBvAHIAKAByAGcAYgBhAFQAaQBsAGUALgBiACAAKgAgAFUAVgBUAGkAbABlAF8AUwBjAGEAbABlAC4AeAApADsADQAKAGYAbABvAGEAdAAgAEIAXwBVAFYAVABpAGwAZQBfAFgAIAA9ACAAcgBnAGIAYQBUAGkAbABlAC4AYgAgAC0AIAAzACAAKgAgAEIAXwBVAFYAVABpAGwAZQBfAFkAOwANAAoAZgBsAG8AYQB0ADIAIABCAF8AVQBWAFQAaQBsAGUAIAA9ACAAZgBsAG8AYQB0ADIAKABCAF8AVQBWAFQAaQBsAGUAXwBYACwAIABCAF8AVQBWAFQAaQBsAGUAXwBZACkAOwANAAoADQAKAHQAZQB4ADEAIAA9ACAAdABlAHgAMgBEAGwAbwBkACgAdABpAGwAZQBTAGgAZQBlAHQALABmAGwAbwBhAHQANAAoACgAQgBfAFAAbwBzAC4AcgBnACAAKwAgAEIAXwBVAFYAVABpAGwAZQApACAAKgAgAFUAVgBUAGkAbABlAF8AUwBjAGEAbABlACwAMAAsADAAKQApADsADQAKAHQAZQB4ADIAIAA9ACAAdABlAHgAMgBEAGwAbwBkACgAdABpAGwAZQBTAGgAZQBlAHQALABmAGwAbwBhAHQANAAoACgAQgBfAFAAbwBzAC4AcgBiACAAKwAgAEIAXwBVAFYAVABpAGwAZQApACAAKgAgAFUAVgBUAGkAbABlAF8AUwBjAGEAbABlACwAMAAsADAAKQApADsADQAKAHQAZQB4ADMAIAA9ACAAdABlAHgAMgBEAGwAbwBkACgAdABpAGwAZQBTAGgAZQBlAHQALABmAGwAbwBhAHQANAAoACgAQgBfAFAAbwBzAC4AZwBiACAAKwAgAEIAXwBVAFYAVABpAGwAZQApACAAKgAgAFUAVgBUAGkAbABlAF8AUwBjAGEAbABlACwAMAAsADAAKQApADsADQAKAHQAZQB4AFIAZQBzAHUAbAB0ACAAKwA9ACAAKAB0AGUAeAAxACAAKgAgAG4AbwByAG0AYQBsAC4AYgAgACsAIAB0AGUAeAAyACAAKgAgAG4AbwByAG0AYQBsAC4AZwAgACsAIAB0AGUAeAAzACAAKgAgAG4AbwByAG0AYQBsAC4AcgApACAAKgAgAHYAZQByAHQAZQB4AEMAbwBsAG8AcgAuAGIAOwANAAoADQAKAA0ACgAvAC8AQQAgAFQAaQBsAGUAIABTAGUAYwB0AGkAbwBuACAALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAA0ACgBmAGwAbwBhAHQAMwAgAEEAXwBQAG8AcwAgAD0AIABmAHIAYQBjACgAcABvAHMAaQB0AGkAbwBuACAAKgAgAHIAZwBiAGEAUwBjAGEAbABlAC4AYQApADsADQAKAGYAbABvAGEAdAAgAEEAXwBVAFYAVABpAGwAZQBfAFkAIAA9ACAAZgBsAG8AbwByACgAcgBnAGIAYQBUAGkAbABlAC4AYQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAuAHgAKQA7AA0ACgBmAGwAbwBhAHQAIABBAF8AVQBWAFQAaQBsAGUAXwBYACAAPQAgAHIAZwBiAGEAVABpAGwAZQAuAGEAIAAtACAAMwAgACoAIABBAF8AVQBWAFQAaQBsAGUAXwBZADsADQAKAGYAbABvAGEAdAAyACAAQQBfAFUAVgBUAGkAbABlACAAPQAgAGYAbABvAGEAdAAyACgAQQBfAFUAVgBUAGkAbABlAF8AWAAsACAAQQBfAFUAVgBUAGkAbABlAF8AWQApADsADQAKAA0ACgB0AGUAeAAxACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEEAXwBQAG8AcwAuAHIAZwAgACsAIABBAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeAAyACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEEAXwBQAG8AcwAuAHIAYgAgACsAIABBAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeAAzACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEEAXwBQAG8AcwAuAGcAYgAgACsAIABBAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeABSAGUAcwB1AGwAdAAgACsAPQAgACgAdABlAHgAMQAgACoAIABuAG8AcgBtAGEAbAAuAGIAIAArACAAdABlAHgAMgAgACoAIABuAG8AcgBtAGEAbAAuAGcAIAArACAAdABlAHgAMwAgACoAIABuAG8AcgBtAGEAbAAuAHIAKQAgACoAIAB2AGUAcgB0AGUAeABDAG8AbABvAHIALgBhADsADQAKAA0ACgANAAoALwAvAEIAYQBzAGUAIABUAGkAbABlACAAUwBlAGMAdABpAG8AbgAgAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAC0ALQAtAA0ACgBmAGwAbwBhAHQAMwAgAEIAYQBzAGUAXwBQAG8AcwAgAD0AIABmAHIAYQBjACgAcABvAHMAaQB0AGkAbwBuACAAKgAgAGIAYQBzAGUAUwBjAGEAbABlACkAOwANAAoAZgBsAG8AYQB0ACAAQgBhAHMAZQBfAFUAVgBUAGkAbABlAF8AWQAgAD0AIABmAGwAbwBvAHIAKABiAGEAcwBlAFQAaQBsAGUAIAAqACAAVQBWAFQAaQBsAGUAXwBTAGMAYQBsAGUALgB4ACkAOwANAAoAZgBsAG8AYQB0ACAAQgBhAHMAZQBfAFUAVgBUAGkAbABlAF8AWAAgAD0AIABiAGEAcwBlAFQAaQBsAGUAIAAtACAAMwAgACoAIABCAGEAcwBlAF8AVQBWAFQAaQBsAGUAXwBZADsADQAKAGYAbABvAGEAdAAyACAAQgBhAHMAZQBfAFUAVgBUAGkAbABlACAAPQAgAGYAbABvAGEAdAAyACgAQgBhAHMAZQBfAFUAVgBUAGkAbABlAF8AWAAsACAAQgBhAHMAZQBfAFUAVgBUAGkAbABlAF8AWQApADsADQAKAA0ACgB0AGUAeAAxACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEIAYQBzAGUAXwBQAG8AcwAuAHIAZwAgACsAIABCAGEAcwBlAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeAAyACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEIAYQBzAGUAXwBQAG8AcwAuAHIAYgAgACsAIABCAGEAcwBlAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeAAzACAAPQAgAHQAZQB4ADIARABsAG8AZAAoAHQAaQBsAGUAUwBoAGUAZQB0ACwAZgBsAG8AYQB0ADQAKAAoAEIAYQBzAGUAXwBQAG8AcwAuAGcAYgAgACsAIABCAGEAcwBlAF8AVQBWAFQAaQBsAGUAKQAgACoAIABVAFYAVABpAGwAZQBfAFMAYwBhAGwAZQAsADAALAAwACkAKQA7AA0ACgB0AGUAeABSAGUAcwB1AGwAdAAgACsAPQAgACgAdABlAHgAMQAgACoAIABuAG8AcgBtAGEAbAAuAGIAIAArACAAdABlAHgAMgAgACoAIABuAG8AcgBtAGEAbAAuAGcAIAArACAAdABlAHgAMwAgACoAIABuAG8AcgBtAGEAbAAuAHIAKQAgACoAIAAoADEALgAwACAALQAgACgAdgBlAHIAdABlAHgAQwBvAGwAbwByAC4AcgAgACsAIAB2AGUAcgB0AGUAeABDAG8AbABvAHIALgBnACAAKwAgAHYAZQByAHQAZQB4AEMAbwBsAG8AcgAuAGIAIAArACAAdgBlAHIAdABlAHgAQwBvAGwAbwByAC4AYQApACkAOwANAAoADQAKAHIAZQB0AHUAcgBuACAAdABlAHgAUgBlAHMAdQBsAHQAOwA=,output:3,fname:UVTile,width:1174,height:1032,input:2,input:2,input:12,input:3,input:3,input:3,input:0,input:0,input_1_label:normal,input_2_label:position,input_3_label:tileSheet,input_4_label:vertexColor,input_5_label:rgbaScale,input_6_label:rgbaTile,input_7_label:baseScale,input_8_label:baseTile|A-5208-OUT,B-9079-XYZ,C-4949-TEX,D-717-OUT,E-2499-OUT,F-4017-OUT,G-1158-OUT,H-9649-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4949,x:30273,y:32404,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_4949,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:6537,x:30183,y:31559,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:6820,x:30355,y:31559,cmnt:Not necessary since the planet is stationary,varname:node_6820,prsc:2,tffrom:0,tfto:1|IN-6537-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6356,x:30496,y:31572,varname:node_6356,prsc:2;n:type:ShaderForge.SFN_Transform,id:9843,x:30652,y:31572,varname:node_9843,prsc:2,tffrom:0,tfto:1|IN-6356-XYZ;n:type:ShaderForge.SFN_NormalVector,id:5208,x:30273,y:32091,prsc:2,pt:False;n:type:ShaderForge.SFN_FragmentPosition,id:9079,x:30273,y:32244,varname:node_9079,prsc:2;n:type:ShaderForge.SFN_VertexColor,id:6009,x:30057,y:32565,varname:node_6009,prsc:2;n:type:ShaderForge.SFN_Append,id:717,x:30303,y:32565,varname:node_717,prsc:2|A-6009-RGB,B-6009-A;n:type:ShaderForge.SFN_ValueProperty,id:2082,x:29791,y:32662,ptovrint:False,ptlb:R Scale,ptin:_RScale,varname:node_2082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9139,x:29791,y:32740,ptovrint:False,ptlb:G Scale,ptin:_GScale,varname:node_9139,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:3209,x:29791,y:32815,ptovrint:False,ptlb:B Scale,ptin:_BScale,varname:node_3209,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:2657,x:29791,y:32900,ptovrint:False,ptlb:A Scale,ptin:_AScale,varname:node_2657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1158,x:30595,y:32749,ptovrint:False,ptlb:Base Scale,ptin:_BaseScale,varname:node_1158,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Append,id:2499,x:30192,y:32721,varname:node_2499,prsc:2|A-2082-OUT,B-9139-OUT,C-3209-OUT,D-2657-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5355,x:30089,y:32923,ptovrint:False,ptlb:R Tile,ptin:_RTile,varname:node_5355,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1497,x:30089,y:33004,ptovrint:False,ptlb:G Tile,ptin:_GTile,varname:node_1497,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9006,x:30089,y:33082,ptovrint:False,ptlb:B Tile,ptin:_BTile,varname:node_9006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:7629,x:30089,y:33163,ptovrint:False,ptlb:A Tile,ptin:_ATile,varname:node_7629,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Append,id:4017,x:30313,y:32979,varname:node_4017,prsc:2|A-5355-OUT,B-1497-OUT,C-9006-OUT,D-7629-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9649,x:30601,y:32859,ptovrint:False,ptlb:Base Tile,ptin:_BaseTile,varname:node_9649,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4;proporder:4949-2082-9139-3209-2657-1158-5355-1497-9006-7629-9649;pass:END;sub:END;*/

Shader "TMX/Tiled TPM" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _RScale ("R Scale", Float ) = 1
        _GScale ("G Scale", Float ) = 1
        _BScale ("B Scale", Float ) = 1
        _AScale ("A Scale", Float ) = 1
        _BaseScale ("Base Scale", Float ) = 1
        _RTile ("R Tile", Float ) = 0
        _GTile ("G Tile", Float ) = 1
        _BTile ("B Tile", Float ) = 2
        _ATile ("A Tile", Float ) = 3
        _BaseTile ("Base Tile", Float ) = 4
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            float4 UVTile( float3 normal , float3 position , sampler2D tileSheet , float4 vertexColor , float4 rgbaScale , float4 rgbaTile , float baseScale , float baseTile ){
            float2 UVTile_Scale = float2(1.0/3.0,1.0/3.0); //3 tiles wide, three tiles tall, change if using a different tile setup
            float4 texResult;
            
            
            normal *= normal * normal * normal;
            normal = normal.rgb / (normal.r + normal.g + normal.b);
            
            //R Tile Section -----------------------------------------------------------
            float3 R_Pos = frac(position * rgbaScale.r);
            float R_UVTile_Y = floor(rgbaTile.r * UVTile_Scale.x);
            float R_UVTile_X = rgbaTile.r - 3 * R_UVTile_Y;
            float2 R_UVTile = float2(R_UVTile_X, R_UVTile_Y);
            
            float4 tex1 = tex2Dlod(tileSheet,float4((R_Pos.rg + R_UVTile) * UVTile_Scale,0,0));
            float4 tex2 = tex2Dlod(tileSheet,float4((R_Pos.rb + R_UVTile) * UVTile_Scale,0,0));
            float4 tex3 = tex2Dlod(tileSheet,float4((R_Pos.gb + R_UVTile) * UVTile_Scale,0,0));
            texResult = (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.r;
            
            
            
            //G Tile Section -----------------------------------------------------------
            float3 G_Pos = frac(position * rgbaScale.g);
            float G_UVTile_Y = floor(rgbaTile.g * UVTile_Scale.x);
            float G_UVTile_X = rgbaTile.g - 3 * G_UVTile_Y;
            float2 G_UVTile = float2(G_UVTile_X, G_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((G_Pos.rg + G_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((G_Pos.rb + G_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((G_Pos.gb + G_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.g;
            
            
            
            //B Tile Section -----------------------------------------------------------
            float3 B_Pos = frac(position*rgbaScale.b);
            float B_UVTile_Y = floor(rgbaTile.b * UVTile_Scale.x);
            float B_UVTile_X = rgbaTile.b - 3 * B_UVTile_Y;
            float2 B_UVTile = float2(B_UVTile_X, B_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((B_Pos.rg + B_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((B_Pos.rb + B_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((B_Pos.gb + B_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.b;
            
            
            //A Tile Section -----------------------------------------------------------
            float3 A_Pos = frac(position * rgbaScale.a);
            float A_UVTile_Y = floor(rgbaTile.a * UVTile_Scale.x);
            float A_UVTile_X = rgbaTile.a - 3 * A_UVTile_Y;
            float2 A_UVTile = float2(A_UVTile_X, A_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((A_Pos.rg + A_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((A_Pos.rb + A_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((A_Pos.gb + A_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.a;
            
            
            //Base Tile Section ---------------------------------------------------------
            float3 Base_Pos = frac(position * baseScale);
            float Base_UVTile_Y = floor(baseTile * UVTile_Scale.x);
            float Base_UVTile_X = baseTile - 3 * Base_UVTile_Y;
            float2 Base_UVTile = float2(Base_UVTile_X, Base_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((Base_Pos.rg + Base_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((Base_Pos.rb + Base_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((Base_Pos.gb + Base_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * (1.0 - (vertexColor.r + vertexColor.g + vertexColor.b + vertexColor.a));
            
            return texResult;
            }
            
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _RScale;
            uniform float _GScale;
            uniform float _BScale;
            uniform float _AScale;
            uniform float _BaseScale;
            uniform float _RTile;
            uniform float _GTile;
            uniform float _BTile;
            uniform float _ATile;
            uniform float _BaseTile;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = UVTile( i.normalDir , i.posWorld.rgb , _Diffuse , float4(i.vertexColor.rgb,i.vertexColor.a) , float4(_RScale,_GScale,_BScale,_AScale) , float4(_RTile,_GTile,_BTile,_ATile) , _BaseScale , _BaseTile ).rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            float4 UVTile( float3 normal , float3 position , sampler2D tileSheet , float4 vertexColor , float4 rgbaScale , float4 rgbaTile , float baseScale , float baseTile ){
            float2 UVTile_Scale = float2(1.0/3.0,1.0/3.0); //3 tiles wide, three tiles tall, change if using a different tile setup
            float4 texResult;
            
            
            normal *= normal * normal * normal;
            normal = normal.rgb / (normal.r + normal.g + normal.b);
            
            //R Tile Section -----------------------------------------------------------
            float3 R_Pos = frac(position * rgbaScale.r);
            float R_UVTile_Y = floor(rgbaTile.r * UVTile_Scale.x);
            float R_UVTile_X = rgbaTile.r - 3 * R_UVTile_Y;
            float2 R_UVTile = float2(R_UVTile_X, R_UVTile_Y);
            
            float4 tex1 = tex2Dlod(tileSheet,float4((R_Pos.rg + R_UVTile) * UVTile_Scale,0,0));
            float4 tex2 = tex2Dlod(tileSheet,float4((R_Pos.rb + R_UVTile) * UVTile_Scale,0,0));
            float4 tex3 = tex2Dlod(tileSheet,float4((R_Pos.gb + R_UVTile) * UVTile_Scale,0,0));
            texResult = (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.r;
            
            
            
            //G Tile Section -----------------------------------------------------------
            float3 G_Pos = frac(position * rgbaScale.g);
            float G_UVTile_Y = floor(rgbaTile.g * UVTile_Scale.x);
            float G_UVTile_X = rgbaTile.g - 3 * G_UVTile_Y;
            float2 G_UVTile = float2(G_UVTile_X, G_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((G_Pos.rg + G_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((G_Pos.rb + G_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((G_Pos.gb + G_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.g;
            
            
            
            //B Tile Section -----------------------------------------------------------
            float3 B_Pos = frac(position*rgbaScale.b);
            float B_UVTile_Y = floor(rgbaTile.b * UVTile_Scale.x);
            float B_UVTile_X = rgbaTile.b - 3 * B_UVTile_Y;
            float2 B_UVTile = float2(B_UVTile_X, B_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((B_Pos.rg + B_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((B_Pos.rb + B_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((B_Pos.gb + B_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.b;
            
            
            //A Tile Section -----------------------------------------------------------
            float3 A_Pos = frac(position * rgbaScale.a);
            float A_UVTile_Y = floor(rgbaTile.a * UVTile_Scale.x);
            float A_UVTile_X = rgbaTile.a - 3 * A_UVTile_Y;
            float2 A_UVTile = float2(A_UVTile_X, A_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((A_Pos.rg + A_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((A_Pos.rb + A_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((A_Pos.gb + A_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.a;
            
            
            //Base Tile Section ---------------------------------------------------------
            float3 Base_Pos = frac(position * baseScale);
            float Base_UVTile_Y = floor(baseTile * UVTile_Scale.x);
            float Base_UVTile_X = baseTile - 3 * Base_UVTile_Y;
            float2 Base_UVTile = float2(Base_UVTile_X, Base_UVTile_Y);
            
            tex1 = tex2Dlod(tileSheet,float4((Base_Pos.rg + Base_UVTile) * UVTile_Scale,0,0));
            tex2 = tex2Dlod(tileSheet,float4((Base_Pos.rb + Base_UVTile) * UVTile_Scale,0,0));
            tex3 = tex2Dlod(tileSheet,float4((Base_Pos.gb + Base_UVTile) * UVTile_Scale,0,0));
            texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * (1.0 - (vertexColor.r + vertexColor.g + vertexColor.b + vertexColor.a));
            
            return texResult;
            }
            
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _RScale;
            uniform float _GScale;
            uniform float _BScale;
            uniform float _AScale;
            uniform float _BaseScale;
            uniform float _RTile;
            uniform float _GTile;
            uniform float _BTile;
            uniform float _ATile;
            uniform float _BaseTile;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = UVTile( i.normalDir , i.posWorld.rgb , _Diffuse , float4(i.vertexColor.rgb,i.vertexColor.a) , float4(_RScale,_GScale,_BScale,_AScale) , float4(_RTile,_GTile,_BTile,_ATile) , _BaseScale , _BaseTile ).rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
