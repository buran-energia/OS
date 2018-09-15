
cubekrnl.exe:     file format pei-i386

Disassembly of section .text:

c0101000 <_HALSetup>:
c0101000:	55                   	push   %ebp
c0101001:	89 e5                	mov    %esp,%ebp
c0101003:	83 ec 08             	sub    $0x8,%esp
c0101006:	e8 13 01 00 00       	call   c010111e <_i386CPUInit>
c010100b:	c9                   	leave  
c010100c:	c3                   	ret    

c010100d <_HALIdleThread>:
c010100d:	55                   	push   %ebp
c010100e:	89 e5                	mov    %esp,%ebp
c0101010:	83 ec 08             	sub    $0x8,%esp
c0101013:	e8 7c 03 00 00       	call   c0101394 <_i386HaltCPU>
c0101018:	c9                   	leave  
c0101019:	c3                   	ret    

c010101a <_HALSetTimerFreq>:
c010101a:	55                   	push   %ebp
c010101b:	89 e5                	mov    %esp,%ebp
c010101d:	83 ec 08             	sub    $0x8,%esp
c0101020:	83 ec 0c             	sub    $0xc,%esp
c0101023:	ff 75 08             	pushl  0x8(%ebp)
c0101026:	e8 27 03 00 00       	call   c0101352 <_i386SetTimerFreq>
c010102b:	83 c4 10             	add    $0x10,%esp
c010102e:	c9                   	leave  
c010102f:	c3                   	ret    

c0101030 <_HALInitContext>:
c0101030:	55                   	push   %ebp
c0101031:	89 e5                	mov    %esp,%ebp
c0101033:	83 ec 08             	sub    $0x8,%esp
c0101036:	ff 75 14             	pushl  0x14(%ebp)
c0101039:	ff 75 10             	pushl  0x10(%ebp)
c010103c:	ff 75 0c             	pushl  0xc(%ebp)
c010103f:	ff 75 08             	pushl  0x8(%ebp)
c0101042:	e8 97 03 00 00       	call   c01013de <_i386InitContext>
c0101047:	83 c4 10             	add    $0x10,%esp
c010104a:	c9                   	leave  
c010104b:	c3                   	ret    

c010104c <_HALMaskIRQs>:
c010104c:	55                   	push   %ebp
c010104d:	89 e5                	mov    %esp,%ebp
c010104f:	83 ec 08             	sub    $0x8,%esp
c0101052:	83 ec 0c             	sub    $0xc,%esp
c0101055:	ff 75 08             	pushl  0x8(%ebp)
c0101058:	e8 3d 03 00 00       	call   c010139a <_i386MaskIRQs>
c010105d:	83 c4 10             	add    $0x10,%esp
c0101060:	c9                   	leave  
c0101061:	c3                   	ret    

c0101062 <_HALAckInterrupt>:
c0101062:	55                   	push   %ebp
c0101063:	89 e5                	mov    %esp,%ebp
c0101065:	83 ec 08             	sub    $0x8,%esp
c0101068:	8b 45 08             	mov    0x8(%ebp),%eax
c010106b:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c010106e:	83 ec 0c             	sub    $0xc,%esp
c0101071:	b8 00 00 00 00       	mov    $0x0,%eax
c0101076:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c0101079:	50                   	push   %eax
c010107a:	e8 35 03 00 00       	call   c01013b4 <_i386AckInterrupt>
c010107f:	83 c4 10             	add    $0x10,%esp
c0101082:	c9                   	leave  
c0101083:	c3                   	ret    

c0101084 <_HALShutDown>:
c0101084:	55                   	push   %ebp
c0101085:	89 e5                	mov    %esp,%ebp
c0101087:	5d                   	pop    %ebp
c0101088:	c3                   	ret    
c0101089:	49                   	dec    %ecx
c010108a:	4e                   	dec    %esi
c010108b:	54                   	push   %esp
c010108c:	45                   	inc    %ebp
c010108d:	52                   	push   %edx
c010108e:	52                   	push   %edx
c010108f:	55                   	push   %ebp
c0101090:	50                   	push   %eax
c0101091:	54                   	push   %esp
c0101092:	20 25 64 0a 00 50    	and    %ah,0x50000a64
c0101098:	41                   	inc    %ecx
c0101099:	47                   	inc    %edi
c010109a:	45                   	inc    %ebp
c010109b:	20 30                	and    %dh,(%eax)
c010109d:	78 25                	js     c01010c4 <_HALInterruptHandler+0x15>
c010109f:	30 38                	xor    %bh,(%eax)
c01010a1:	58                   	pop    %eax
c01010a2:	20 45 49             	and    %al,0x49(%ebp)
c01010a5:	50                   	push   %eax
c01010a6:	20 30                	and    %dh,(%eax)
c01010a8:	78 25                	js     c01010cf <_HALInterruptHandler+0x20>
c01010aa:	30 38                	xor    %bh,(%eax)
c01010ac:	58                   	pop    %eax
c01010ad:	0a 00                	or     (%eax),%al

c01010af <_HALInterruptHandler>:
c01010af:	55                   	push   %ebp
c01010b0:	89 e5                	mov    %esp,%ebp
c01010b2:	83 ec 08             	sub    $0x8,%esp
c01010b5:	83 ec 08             	sub    $0x8,%esp
c01010b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01010bb:	ff 70 30             	pushl  0x30(%eax)
c01010be:	68 89 10 10 c0       	push   $0xc0101089
c01010c3:	e8 89 19 00 00       	call   c0102a51 <_printf>
c01010c8:	83 c4 10             	add    $0x10,%esp
c01010cb:	0f 20 d0             	mov    %cr2,%eax
c01010ce:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01010d1:	83 ec 04             	sub    $0x4,%esp
c01010d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01010d7:	ff 70 38             	pushl  0x38(%eax)
c01010da:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01010dd:	68 97 10 10 c0       	push   $0xc0101097
c01010e2:	e8 6a 19 00 00       	call   c0102a51 <_printf>
c01010e7:	83 c4 10             	add    $0x10,%esp
c01010ea:	eb fe                	jmp    c01010ea <_HALInterruptHandler+0x3b>
c01010ec:	90                   	nop    
c01010ed:	90                   	nop    
c01010ee:	90                   	nop    
c01010ef:	90                   	nop    

c01010f0 <.text>:
c01010f0:	4f                   	dec    %edi
c01010f1:	6e                   	outsb  %ds:(%esi),(%dx)
c01010f2:	6c                   	insb   (%dx),%es:(%edi)
c01010f3:	79 20                	jns    c0101115 <.text+0x25>
c01010f5:	69 34 38 36 20 61 6e 	imul   $0x6e612036,(%eax,%edi,1),%esi
c01010fc:	64 20 6e 65          	and    %ch,%fs:0x65(%esi)
c0101100:	77 65                	ja     c0101167 <_i386CPUInit+0x49>
c0101102:	72 20                	jb     c0101124 <_i386CPUInit+0x6>
c0101104:	70 72                	jo     c0101178 <_i386CPUInit+0x5a>
c0101106:	6f                   	outsl  %ds:(%esi),(%dx)
c0101107:	63 65 73             	arpl   %sp,0x73(%ebp)
c010110a:	73 6f                	jae    c010117b <_i386CPUInit+0x5d>
c010110c:	72 73                	jb     c0101181 <_i386CPUInit+0x63>
c010110e:	20 61 72             	and    %ah,0x72(%ecx)
c0101111:	65 20 73 75          	and    %dh,%gs:0x75(%ebx)
c0101115:	70 70                	jo     c0101187 <_i386CPUInit+0x69>
c0101117:	6f                   	outsl  %ds:(%esi),(%dx)
c0101118:	72 74                	jb     c010118e <_i386CPUInit+0x70>
c010111a:	65 64 2e 00 55 89    	add    %dl,%cs:%fs:%gs:0xffffff89(%ebp)

c010111e <_i386CPUInit>:
c010111e:	55                   	push   %ebp
c010111f:	89 e5                	mov    %esp,%ebp
c0101121:	83 ec 08             	sub    $0x8,%esp
c0101124:	e8 8c 17 00 00       	call   c01028b5 <_ClearScreen>
c0101129:	e8 77 05 00 00       	call   c01016a5 <_i386IsCPUSupported>
c010112e:	84 c0                	test   %al,%al
c0101130:	75 15                	jne    c0101147 <_i386CPUInit+0x29>
c0101132:	83 ec 0c             	sub    $0xc,%esp
c0101135:	68 f0 10 10 c0       	push   $0xc01010f0
c010113a:	e8 12 19 00 00       	call   c0102a51 <_printf>
c010113f:	83 c4 10             	add    $0x10,%esp
c0101142:	e8 4d 02 00 00       	call   c0101394 <_i386HaltCPU>
c0101147:	83 ec 08             	sub    $0x8,%esp
c010114a:	6a 08                	push   $0x8
c010114c:	68 40 60 10 c0       	push   $0xc0106040
c0101151:	e8 30 09 00 00       	call   c0101a86 <_ZeroMemory>
c0101156:	83 c4 10             	add    $0x10,%esp
c0101159:	6a 01                	push   $0x1
c010115b:	6a 01                	push   $0x1
c010115d:	6a 01                	push   $0x1
c010115f:	6a 00                	push   $0x0
c0101161:	6a 1a                	push   $0x1a
c0101163:	68 ff ff 0f 00       	push   $0xfffff
c0101168:	6a 00                	push   $0x0
c010116a:	68 48 60 10 c0       	push   $0xc0106048
c010116f:	e8 98 02 00 00       	call   c010140c <_i386SetSegment>
c0101174:	83 c4 20             	add    $0x20,%esp
c0101177:	6a 01                	push   $0x1
c0101179:	6a 01                	push   $0x1
c010117b:	6a 01                	push   $0x1
c010117d:	6a 00                	push   $0x0
c010117f:	6a 12                	push   $0x12
c0101181:	68 ff ff 0f 00       	push   $0xfffff
c0101186:	6a 00                	push   $0x0
c0101188:	68 50 60 10 c0       	push   $0xc0106050
c010118d:	e8 7a 02 00 00       	call   c010140c <_i386SetSegment>
c0101192:	83 c4 20             	add    $0x20,%esp
c0101195:	6a 01                	push   $0x1
c0101197:	6a 01                	push   $0x1
c0101199:	6a 01                	push   $0x1
c010119b:	6a 03                	push   $0x3
c010119d:	6a 1a                	push   $0x1a
c010119f:	68 ff ff 0f 00       	push   $0xfffff
c01011a4:	6a 00                	push   $0x0
c01011a6:	68 58 60 10 c0       	push   $0xc0106058
c01011ab:	e8 5c 02 00 00       	call   c010140c <_i386SetSegment>
c01011b0:	83 c4 20             	add    $0x20,%esp
c01011b3:	6a 01                	push   $0x1
c01011b5:	6a 01                	push   $0x1
c01011b7:	6a 01                	push   $0x1
c01011b9:	6a 03                	push   $0x3
c01011bb:	6a 12                	push   $0x12
c01011bd:	68 ff ff 0f 00       	push   $0xfffff
c01011c2:	6a 00                	push   $0x0
c01011c4:	68 60 60 10 c0       	push   $0xc0106060
c01011c9:	e8 3e 02 00 00       	call   c010140c <_i386SetSegment>
c01011ce:	83 c4 20             	add    $0x20,%esp
c01011d1:	6a 01                	push   $0x1
c01011d3:	6a 01                	push   $0x1
c01011d5:	6a 01                	push   $0x1
c01011d7:	6a 00                	push   $0x0
c01011d9:	6a 09                	push   $0x9
c01011db:	6a 68                	push   $0x68
c01011dd:	68 70 68 10 c0       	push   $0xc0106870
c01011e2:	68 68 60 10 c0       	push   $0xc0106068
c01011e7:	e8 20 02 00 00       	call   c010140c <_i386SetSegment>
c01011ec:	83 c4 20             	add    $0x20,%esp
c01011ef:	c7 05 78 68 10 c0 90 	movl   $0x90,0xc0106878
c01011f6:	00 00 00 
c01011f9:	c7 05 d4 68 10 c0 68 	movl   $0x68,0xc01068d4
c0101200:	00 00 00 
c0101203:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c010120a:	83 7d fc 2f          	cmpl   $0x2f,0xfffffffc(%ebp)
c010120e:	7e 02                	jle    c0101212 <_i386CPUInit+0xf4>
c0101210:	eb 32                	jmp    c0101244 <_i386CPUInit+0x126>
c0101212:	83 ec 04             	sub    $0x4,%esp
c0101215:	6a 01                	push   $0x1
c0101217:	6a 00                	push   $0x0
c0101219:	6a 01                	push   $0x1
c010121b:	6a 0e                	push   $0xe
c010121d:	6a 08                	push   $0x8
c010121f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0101222:	ff 34 85 00 40 10 c0 	pushl  0xc0104000(,%eax,4)
c0101229:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010122c:	c1 e0 03             	shl    $0x3,%eax
c010122f:	05 70 60 10 c0       	add    $0xc0106070,%eax
c0101234:	50                   	push   %eax
c0101235:	e8 c0 02 00 00       	call   c01014fa <_i386SetGate>
c010123a:	83 c4 20             	add    $0x20,%esp
c010123d:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0101240:	ff 00                	incl   (%eax)
c0101242:	eb c6                	jmp    c010120a <_i386CPUInit+0xec>
c0101244:	c7 05 22 60 10 c0 40 	movl   $0xc0106040,0xc0106022
c010124b:	60 10 c0 
c010124e:	66 c7 05 20 60 10 c0 	movw   $0x2f,0xc0106020
c0101255:	2f 00 
c0101257:	c7 05 32 60 10 c0 70 	movl   $0xc0106070,0xc0106032
c010125e:	60 10 c0 
c0101261:	66 c7 05 30 60 10 c0 	movw   $0x7ff,0xc0106030
c0101268:	ff 07 
c010126a:	83 ec 0c             	sub    $0xc,%esp
c010126d:	68 20 60 10 c0       	push   $0xc0106020
c0101272:	e8 6c 01 00 00       	call   c01013e3 <_i386LoadGDTR>
c0101277:	83 c4 10             	add    $0x10,%esp
c010127a:	83 ec 0c             	sub    $0xc,%esp
c010127d:	68 30 60 10 c0       	push   $0xc0106030
c0101282:	e8 67 01 00 00       	call   c01013ee <_i386LoadIDTR>
c0101287:	83 c4 10             	add    $0x10,%esp
c010128a:	83 ec 0c             	sub    $0xc,%esp
c010128d:	6a 28                	push   $0x28
c010128f:	e8 65 01 00 00       	call   c01013f9 <_i386LoadTSS>
c0101294:	83 c4 10             	add    $0x10,%esp
c0101297:	83 ec 08             	sub    $0x8,%esp
c010129a:	6a 28                	push   $0x28
c010129c:	6a 20                	push   $0x20
c010129e:	e8 35 00 00 00       	call   c01012d8 <_i386InitPIC>
c01012a3:	83 c4 10             	add    $0x10,%esp
c01012a6:	83 ec 0c             	sub    $0xc,%esp
c01012a9:	6a 64                	push   $0x64
c01012ab:	e8 a2 00 00 00       	call   c0101352 <_i386SetTimerFreq>
c01012b0:	83 c4 10             	add    $0x10,%esp
c01012b3:	83 ec 0c             	sub    $0xc,%esp
c01012b6:	68 00 60 10 c0       	push   $0xc0106000
c01012bb:	e8 21 03 00 00       	call   c01015e1 <_i386GetCPUID>
c01012c0:	83 c4 10             	add    $0x10,%esp
c01012c3:	b8 00 7c 00 c0       	mov    $0xc0007c00,%eax
c01012c8:	89 c4                	mov    %eax,%esp
c01012ca:	e8 06 26 00 00       	call   c01038d5 <_i386MmInit>
c01012cf:	ea 22 2e 10 c0 08 00 	ljmp   $0x8,$0xc0102e22
c01012d6:	c9                   	leave  
c01012d7:	c3                   	ret    

c01012d8 <_i386InitPIC>:
c01012d8:	55                   	push   %ebp
c01012d9:	89 e5                	mov    %esp,%ebp
c01012db:	ba 20 00 00 00       	mov    $0x20,%edx
c01012e0:	b8 11 00 00 00       	mov    $0x11,%eax
c01012e5:	ee                   	out    %al,(%dx)
c01012e6:	ba 21 00 00 00       	mov    $0x21,%edx
c01012eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ee:	ee                   	out    %al,(%dx)
c01012ef:	ba 21 00 00 00       	mov    $0x21,%edx
c01012f4:	b8 04 00 00 00       	mov    $0x4,%eax
c01012f9:	ee                   	out    %al,(%dx)
c01012fa:	ba 21 00 00 00       	mov    $0x21,%edx
c01012ff:	b8 01 00 00 00       	mov    $0x1,%eax
c0101304:	ee                   	out    %al,(%dx)
c0101305:	ba 21 00 00 00       	mov    $0x21,%edx
c010130a:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
c010130f:	ee                   	out    %al,(%dx)
c0101310:	ba 21 00 00 00       	mov    $0x21,%edx
c0101315:	b8 ff 00 00 00       	mov    $0xff,%eax
c010131a:	ee                   	out    %al,(%dx)
c010131b:	ba a0 00 00 00       	mov    $0xa0,%edx
c0101320:	b8 11 00 00 00       	mov    $0x11,%eax
c0101325:	ee                   	out    %al,(%dx)
c0101326:	ba a1 00 00 00       	mov    $0xa1,%edx
c010132b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010132e:	ee                   	out    %al,(%dx)
c010132f:	ba a1 00 00 00       	mov    $0xa1,%edx
c0101334:	b8 02 00 00 00       	mov    $0x2,%eax
c0101339:	ee                   	out    %al,(%dx)
c010133a:	ba a1 00 00 00       	mov    $0xa1,%edx
c010133f:	b8 01 00 00 00       	mov    $0x1,%eax
c0101344:	ee                   	out    %al,(%dx)
c0101345:	ba a1 00 00 00       	mov    $0xa1,%edx
c010134a:	b8 ff 00 00 00       	mov    $0xff,%eax
c010134f:	ee                   	out    %al,(%dx)
c0101350:	5d                   	pop    %ebp
c0101351:	c3                   	ret    

c0101352 <_i386SetTimerFreq>:
c0101352:	55                   	push   %ebp
c0101353:	89 e5                	mov    %esp,%ebp
c0101355:	ba 43 00 00 00       	mov    $0x43,%edx
c010135a:	b8 36 00 00 00       	mov    $0x36,%eax
c010135f:	ee                   	out    %al,(%dx)
c0101360:	b9 40 00 00 00       	mov    $0x40,%ecx
c0101365:	ba de 34 12 00       	mov    $0x1234de,%edx
c010136a:	89 d0                	mov    %edx,%eax
c010136c:	c1 fa 1f             	sar    $0x1f,%edx
c010136f:	f7 7d 08             	idivl  0x8(%ebp)
c0101372:	25 ff 00 00 00       	and    $0xff,%eax
c0101377:	89 ca                	mov    %ecx,%edx
c0101379:	ee                   	out    %al,(%dx)
c010137a:	b9 40 00 00 00       	mov    $0x40,%ecx
c010137f:	ba de 34 12 00       	mov    $0x1234de,%edx
c0101384:	89 d0                	mov    %edx,%eax
c0101386:	c1 fa 1f             	sar    $0x1f,%edx
c0101389:	f7 7d 08             	idivl  0x8(%ebp)
c010138c:	c1 f8 08             	sar    $0x8,%eax
c010138f:	89 ca                	mov    %ecx,%edx
c0101391:	ee                   	out    %al,(%dx)
c0101392:	5d                   	pop    %ebp
c0101393:	c3                   	ret    

c0101394 <_i386HaltCPU>:
c0101394:	55                   	push   %ebp
c0101395:	89 e5                	mov    %esp,%ebp
c0101397:	f4                   	hlt    
c0101398:	5d                   	pop    %ebp
c0101399:	c3                   	ret    

c010139a <_i386MaskIRQs>:
c010139a:	55                   	push   %ebp
c010139b:	89 e5                	mov    %esp,%ebp
c010139d:	ba 21 00 00 00       	mov    $0x21,%edx
c01013a2:	8a 45 08             	mov    0x8(%ebp),%al
c01013a5:	ee                   	out    %al,(%dx)
c01013a6:	ba a1 00 00 00       	mov    $0xa1,%edx
c01013ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ae:	c1 e8 08             	shr    $0x8,%eax
c01013b1:	ee                   	out    %al,(%dx)
c01013b2:	5d                   	pop    %ebp
c01013b3:	c3                   	ret    

c01013b4 <_i386AckInterrupt>:
c01013b4:	55                   	push   %ebp
c01013b5:	89 e5                	mov    %esp,%ebp
c01013b7:	83 ec 04             	sub    $0x4,%esp
c01013ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01013bd:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c01013c0:	ba 20 00 00 00       	mov    $0x20,%edx
c01013c5:	b8 20 00 00 00       	mov    $0x20,%eax
c01013ca:	ee                   	out    %al,(%dx)
c01013cb:	80 7d ff 07          	cmpb   $0x7,0xffffffff(%ebp)
c01013cf:	76 0b                	jbe    c01013dc <_i386AckInterrupt+0x28>
c01013d1:	ba a0 00 00 00       	mov    $0xa0,%edx
c01013d6:	b8 20 00 00 00       	mov    $0x20,%eax
c01013db:	ee                   	out    %al,(%dx)
c01013dc:	c9                   	leave  
c01013dd:	c3                   	ret    

c01013de <_i386InitContext>:
c01013de:	55                   	push   %ebp
c01013df:	89 e5                	mov    %esp,%ebp
c01013e1:	5d                   	pop    %ebp
c01013e2:	c3                   	ret    

c01013e3 <_i386LoadGDTR>:
c01013e3:	55                   	push   %ebp
c01013e4:	89 e5                	mov    %esp,%ebp
c01013e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01013e9:	0f 01 10             	lgdtl  (%eax)
c01013ec:	5d                   	pop    %ebp
c01013ed:	c3                   	ret    

c01013ee <_i386LoadIDTR>:
c01013ee:	55                   	push   %ebp
c01013ef:	89 e5                	mov    %esp,%ebp
c01013f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01013f4:	0f 01 18             	lidtl  (%eax)
c01013f7:	5d                   	pop    %ebp
c01013f8:	c3                   	ret    

c01013f9 <_i386LoadTSS>:
c01013f9:	55                   	push   %ebp
c01013fa:	89 e5                	mov    %esp,%ebp
c01013fc:	83 ec 04             	sub    $0x4,%esp
c01013ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0101402:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c0101406:	0f 00 5d fe          	ltr    0xfffffffe(%ebp)
c010140a:	c9                   	leave  
c010140b:	c3                   	ret    

c010140c <_i386SetSegment>:
c010140c:	55                   	push   %ebp
c010140d:	89 e5                	mov    %esp,%ebp
c010140f:	83 ec 08             	sub    $0x8,%esp
c0101412:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0101415:	8b 55 20             	mov    0x20(%ebp),%edx
c0101418:	8b 4d 24             	mov    0x24(%ebp),%ecx
c010141b:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c010141e:	88 55 fe             	mov    %dl,0xfffffffe(%ebp)
c0101421:	88 4d fd             	mov    %cl,0xfffffffd(%ebp)
c0101424:	83 ec 08             	sub    $0x8,%esp
c0101427:	6a 08                	push   $0x8
c0101429:	ff 75 08             	pushl  0x8(%ebp)
c010142c:	e8 55 06 00 00       	call   c0101a86 <_ZeroMemory>
c0101431:	83 c4 10             	add    $0x10,%esp
c0101434:	8b 55 08             	mov    0x8(%ebp),%edx
c0101437:	8b 45 0c             	mov    0xc(%ebp),%eax
c010143a:	66 89 42 02          	mov    %ax,0x2(%edx)
c010143e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101441:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101444:	c1 e8 10             	shr    $0x10,%eax
c0101447:	88 42 04             	mov    %al,0x4(%edx)
c010144a:	8b 55 08             	mov    0x8(%ebp),%edx
c010144d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101450:	c1 e8 18             	shr    $0x18,%eax
c0101453:	88 42 07             	mov    %al,0x7(%edx)
c0101456:	8b 55 08             	mov    0x8(%ebp),%edx
c0101459:	8b 45 10             	mov    0x10(%ebp),%eax
c010145c:	66 89 02             	mov    %ax,(%edx)
c010145f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101462:	8b 45 10             	mov    0x10(%ebp),%eax
c0101465:	89 c2                	mov    %eax,%edx
c0101467:	c1 ea 10             	shr    $0x10,%edx
c010146a:	8a 41 06             	mov    0x6(%ecx),%al
c010146d:	83 e2 0f             	and    $0xf,%edx
c0101470:	83 e0 f0             	and    $0xfffffff0,%eax
c0101473:	09 d0                	or     %edx,%eax
c0101475:	88 41 06             	mov    %al,0x6(%ecx)
c0101478:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010147b:	8a 41 05             	mov    0x5(%ecx),%al
c010147e:	8a 55 14             	mov    0x14(%ebp),%dl
c0101481:	83 e2 1f             	and    $0x1f,%edx
c0101484:	83 e0 e0             	and    $0xffffffe0,%eax
c0101487:	09 d0                	or     %edx,%eax
c0101489:	88 41 05             	mov    %al,0x5(%ecx)
c010148c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010148f:	8a 41 05             	mov    0x5(%ecx),%al
c0101492:	8a 55 18             	mov    0x18(%ebp),%dl
c0101495:	83 e2 03             	and    $0x3,%edx
c0101498:	c1 e2 05             	shl    $0x5,%edx
c010149b:	83 e0 9f             	and    $0xffffff9f,%eax
c010149e:	09 d0                	or     %edx,%eax
c01014a0:	88 41 05             	mov    %al,0x5(%ecx)
c01014a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014a6:	ba 00 00 00 00       	mov    $0x0,%edx
c01014ab:	8a 55 ff             	mov    0xffffffff(%ebp),%dl
c01014ae:	8a 41 05             	mov    0x5(%ecx),%al
c01014b1:	c1 e2 07             	shl    $0x7,%edx
c01014b4:	83 e0 7f             	and    $0x7f,%eax
c01014b7:	09 d0                	or     %edx,%eax
c01014b9:	88 41 05             	mov    %al,0x5(%ecx)
c01014bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014bf:	ba 00 00 00 00       	mov    $0x0,%edx
c01014c4:	8a 55 fe             	mov    0xfffffffe(%ebp),%dl
c01014c7:	8a 41 06             	mov    0x6(%ecx),%al
c01014ca:	83 e2 01             	and    $0x1,%edx
c01014cd:	c1 e2 06             	shl    $0x6,%edx
c01014d0:	83 e0 bf             	and    $0xffffffbf,%eax
c01014d3:	09 d0                	or     %edx,%eax
c01014d5:	88 41 06             	mov    %al,0x6(%ecx)
c01014d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01014db:	80 60 06 df          	andb   $0xdf,0x6(%eax)
c01014df:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014e2:	ba 00 00 00 00       	mov    $0x0,%edx
c01014e7:	8a 55 fd             	mov    0xfffffffd(%ebp),%dl
c01014ea:	8a 41 06             	mov    0x6(%ecx),%al
c01014ed:	c1 e2 07             	shl    $0x7,%edx
c01014f0:	83 e0 7f             	and    $0x7f,%eax
c01014f3:	09 d0                	or     %edx,%eax
c01014f5:	88 41 06             	mov    %al,0x6(%ecx)
c01014f8:	c9                   	leave  
c01014f9:	c3                   	ret    

c01014fa <_i386SetGate>:
c01014fa:	55                   	push   %ebp
c01014fb:	89 e5                	mov    %esp,%ebp
c01014fd:	83 ec 08             	sub    $0x8,%esp
c0101500:	8b 45 10             	mov    0x10(%ebp),%eax
c0101503:	8b 55 18             	mov    0x18(%ebp),%edx
c0101506:	8b 4d 20             	mov    0x20(%ebp),%ecx
c0101509:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c010150d:	88 55 fd             	mov    %dl,0xfffffffd(%ebp)
c0101510:	88 4d fc             	mov    %cl,0xfffffffc(%ebp)
c0101513:	83 ec 08             	sub    $0x8,%esp
c0101516:	6a 08                	push   $0x8
c0101518:	ff 75 08             	pushl  0x8(%ebp)
c010151b:	e8 66 05 00 00       	call   c0101a86 <_ZeroMemory>
c0101520:	83 c4 10             	add    $0x10,%esp
c0101523:	8b 55 08             	mov    0x8(%ebp),%edx
c0101526:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101529:	66 89 02             	mov    %ax,(%edx)
c010152c:	8b 55 08             	mov    0x8(%ebp),%edx
c010152f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101532:	c1 e8 10             	shr    $0x10,%eax
c0101535:	66 89 42 06          	mov    %ax,0x6(%edx)
c0101539:	8b 55 08             	mov    0x8(%ebp),%edx
c010153c:	66 8b 45 fe          	mov    0xfffffffe(%ebp),%ax
c0101540:	66 89 42 02          	mov    %ax,0x2(%edx)
c0101544:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101547:	8a 41 05             	mov    0x5(%ecx),%al
c010154a:	8a 55 14             	mov    0x14(%ebp),%dl
c010154d:	83 e2 07             	and    $0x7,%edx
c0101550:	83 e0 f8             	and    $0xfffffff8,%eax
c0101553:	09 d0                	or     %edx,%eax
c0101555:	88 41 05             	mov    %al,0x5(%ecx)
c0101558:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010155b:	ba 00 00 00 00       	mov    $0x0,%edx
c0101560:	8a 55 fd             	mov    0xfffffffd(%ebp),%dl
c0101563:	8a 41 05             	mov    0x5(%ecx),%al
c0101566:	83 e2 01             	and    $0x1,%edx
c0101569:	c1 e2 03             	shl    $0x3,%edx
c010156c:	83 e0 f7             	and    $0xfffffff7,%eax
c010156f:	09 d0                	or     %edx,%eax
c0101571:	88 41 05             	mov    %al,0x5(%ecx)
c0101574:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101577:	8a 41 05             	mov    0x5(%ecx),%al
c010157a:	8a 55 1c             	mov    0x1c(%ebp),%dl
c010157d:	83 e2 03             	and    $0x3,%edx
c0101580:	c1 e2 05             	shl    $0x5,%edx
c0101583:	83 e0 9f             	and    $0xffffff9f,%eax
c0101586:	09 d0                	or     %edx,%eax
c0101588:	88 41 05             	mov    %al,0x5(%ecx)
c010158b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010158e:	ba 00 00 00 00       	mov    $0x0,%edx
c0101593:	8a 55 fc             	mov    0xfffffffc(%ebp),%dl
c0101596:	8a 41 05             	mov    0x5(%ecx),%al
c0101599:	c1 e2 07             	shl    $0x7,%edx
c010159c:	83 e0 7f             	and    $0x7f,%eax
c010159f:	09 d0                	or     %edx,%eax
c01015a1:	88 41 05             	mov    %al,0x5(%ecx)
c01015a4:	c9                   	leave  
c01015a5:	c3                   	ret    

c01015a6 <_i386CanChangeFlag>:
c01015a6:	55                   	push   %ebp
c01015a7:	89 e5                	mov    %esp,%ebp
c01015a9:	83 ec 08             	sub    $0x8,%esp
c01015ac:	b8 01 00 00 00       	mov    $0x1,%eax
c01015b1:	8a 4d 08             	mov    0x8(%ebp),%cl
c01015b4:	d3 e0                	shl    %cl,%eax
c01015b6:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01015b9:	9c                   	pushf  
c01015ba:	58                   	pop    %eax
c01015bb:	89 c3                	mov    %eax,%ebx
c01015bd:	33 45 f8             	xor    0xfffffff8(%ebp),%eax
c01015c0:	50                   	push   %eax
c01015c1:	9d                   	popf   
c01015c2:	9c                   	pushf  
c01015c3:	58                   	pop    %eax
c01015c4:	33 45 f8             	xor    0xfffffff8(%ebp),%eax
c01015c7:	39 d8                	cmp    %ebx,%eax
c01015c9:	74 04                	je     c01015cf <_i386CanChangeFlag+0x29>
c01015cb:	31 c0                	xor    %eax,%eax
c01015cd:	eb 05                	jmp    c01015d4 <_i386CanChangeFlag+0x2e>
c01015cf:	b8 01 00 00 00       	mov    $0x1,%eax
c01015d4:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c01015d7:	b8 00 00 00 00       	mov    $0x0,%eax
c01015dc:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c01015df:	c9                   	leave  
c01015e0:	c3                   	ret    

c01015e1 <_i386GetCPUID>:
c01015e1:	55                   	push   %ebp
c01015e2:	89 e5                	mov    %esp,%ebp
c01015e4:	53                   	push   %ebx
c01015e5:	83 ec 14             	sub    $0x14,%esp
c01015e8:	83 ec 08             	sub    $0x8,%esp
c01015eb:	6a 1c                	push   $0x1c
c01015ed:	ff 75 08             	pushl  0x8(%ebp)
c01015f0:	e8 91 04 00 00       	call   c0101a86 <_ZeroMemory>
c01015f5:	83 c4 10             	add    $0x10,%esp
c01015f8:	83 ec 0c             	sub    $0xc,%esp
c01015fb:	6a 15                	push   $0x15
c01015fd:	e8 a4 ff ff ff       	call   c01015a6 <_i386CanChangeFlag>
c0101602:	83 c4 10             	add    $0x10,%esp
c0101605:	84 c0                	test   %al,%al
c0101607:	75 0c                	jne    c0101615 <_i386GetCPUID+0x34>
c0101609:	c7 45 e8 00 00 00 00 	movl   $0x0,0xffffffe8(%ebp)
c0101610:	e9 88 00 00 00       	jmp    c010169d <_i386GetCPUID+0xbc>
c0101615:	b8 00 00 00 00       	mov    $0x0,%eax
c010161a:	0f a2                	cpuid  
c010161c:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010161f:	89 d8                	mov    %ebx,%eax
c0101621:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0101624:	89 c8                	mov    %ecx,%eax
c0101626:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0101629:	89 d0                	mov    %edx,%eax
c010162b:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c010162e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101631:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0101634:	89 02                	mov    %eax,(%edx)
c0101636:	8b 55 08             	mov    0x8(%ebp),%edx
c0101639:	83 c2 04             	add    $0x4,%edx
c010163c:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010163f:	89 02                	mov    %eax,(%edx)
c0101641:	8b 55 08             	mov    0x8(%ebp),%edx
c0101644:	83 c2 08             	add    $0x8,%edx
c0101647:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c010164a:	89 02                	mov    %eax,(%edx)
c010164c:	8b 55 08             	mov    0x8(%ebp),%edx
c010164f:	83 c2 0c             	add    $0xc,%edx
c0101652:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101655:	89 02                	mov    %eax,(%edx)
c0101657:	8b 45 08             	mov    0x8(%ebp),%eax
c010165a:	83 38 00             	cmpl   $0x0,(%eax)
c010165d:	74 37                	je     c0101696 <_i386GetCPUID+0xb5>
c010165f:	b8 01 00 00 00       	mov    $0x1,%eax
c0101664:	0f a2                	cpuid  
c0101666:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0101669:	89 d8                	mov    %ebx,%eax
c010166b:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c010166e:	89 c8                	mov    %ecx,%eax
c0101670:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0101673:	89 d0                	mov    %edx,%eax
c0101675:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0101678:	8b 55 08             	mov    0x8(%ebp),%edx
c010167b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010167e:	c1 e8 10             	shr    $0x10,%eax
c0101681:	88 42 11             	mov    %al,0x11(%edx)
c0101684:	8b 55 08             	mov    0x8(%ebp),%edx
c0101687:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c010168a:	89 42 14             	mov    %eax,0x14(%edx)
c010168d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101690:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101693:	89 42 18             	mov    %eax,0x18(%edx)
c0101696:	c7 45 e8 01 00 00 00 	movl   $0x1,0xffffffe8(%ebp)
c010169d:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01016a0:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
c01016a3:	c9                   	leave  
c01016a4:	c3                   	ret    

c01016a5 <_i386IsCPUSupported>:
c01016a5:	55                   	push   %ebp
c01016a6:	89 e5                	mov    %esp,%ebp
c01016a8:	83 ec 08             	sub    $0x8,%esp
c01016ab:	83 ec 0c             	sub    $0xc,%esp
c01016ae:	6a 12                	push   $0x12
c01016b0:	e8 f1 fe ff ff       	call   c01015a6 <_i386CanChangeFlag>
c01016b5:	83 c4 10             	add    $0x10,%esp
c01016b8:	25 ff 00 00 00       	and    $0xff,%eax
c01016bd:	c9                   	leave  
c01016be:	c3                   	ret    

c01016bf <_i386QueryFeature>:
c01016bf:	55                   	push   %ebp
c01016c0:	89 e5                	mov    %esp,%ebp
c01016c2:	83 ec 04             	sub    $0x4,%esp
c01016c5:	b8 01 00 00 00       	mov    $0x1,%eax
c01016ca:	8a 4d 08             	mov    0x8(%ebp),%cl
c01016cd:	d3 e0                	shl    %cl,%eax
c01016cf:	23 05 14 60 10 c0    	and    0xc0106014,%eax
c01016d5:	85 c0                	test   %eax,%eax
c01016d7:	74 09                	je     c01016e2 <_i386QueryFeature+0x23>
c01016d9:	c7 45 fc 01 00 00 00 	movl   $0x1,0xfffffffc(%ebp)
c01016e0:	eb 07                	jmp    c01016e9 <_i386QueryFeature+0x2a>
c01016e2:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01016e9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01016ec:	c9                   	leave  
c01016ed:	c3                   	ret    
c01016ee:	90                   	nop    
c01016ef:	90                   	nop    

c01016f0 <_interrupt_0>:
c01016f0:	68 00 00 00 00       	push   $0x0
c01016f5:	68 00 00 00 00       	push   $0x0
c01016fa:	e9 11 03 00 00       	jmp    c0101a10 <_isr>
c01016ff:	90                   	nop    

c0101700 <_interrupt_1>:
c0101700:	68 00 00 00 00       	push   $0x0
c0101705:	68 01 00 00 00       	push   $0x1
c010170a:	e9 01 03 00 00       	jmp    c0101a10 <_isr>
c010170f:	90                   	nop    

c0101710 <_interrupt_2>:
c0101710:	68 00 00 00 00       	push   $0x0
c0101715:	68 02 00 00 00       	push   $0x2
c010171a:	e9 f1 02 00 00       	jmp    c0101a10 <_isr>
c010171f:	90                   	nop    

c0101720 <_interrupt_3>:
c0101720:	68 00 00 00 00       	push   $0x0
c0101725:	68 03 00 00 00       	push   $0x3
c010172a:	e9 e1 02 00 00       	jmp    c0101a10 <_isr>
c010172f:	90                   	nop    

c0101730 <_interrupt_4>:
c0101730:	68 00 00 00 00       	push   $0x0
c0101735:	68 04 00 00 00       	push   $0x4
c010173a:	e9 d1 02 00 00       	jmp    c0101a10 <_isr>
c010173f:	90                   	nop    

c0101740 <_interrupt_5>:
c0101740:	68 00 00 00 00       	push   $0x0
c0101745:	68 05 00 00 00       	push   $0x5
c010174a:	e9 c1 02 00 00       	jmp    c0101a10 <_isr>
c010174f:	90                   	nop    

c0101750 <_interrupt_6>:
c0101750:	68 00 00 00 00       	push   $0x0
c0101755:	68 06 00 00 00       	push   $0x6
c010175a:	e9 b1 02 00 00       	jmp    c0101a10 <_isr>
c010175f:	90                   	nop    

c0101760 <_interrupt_7>:
c0101760:	68 00 00 00 00       	push   $0x0
c0101765:	68 07 00 00 00       	push   $0x7
c010176a:	e9 a1 02 00 00       	jmp    c0101a10 <_isr>
c010176f:	90                   	nop    

c0101770 <_interrupt_8>:
c0101770:	68 08 00 00 00       	push   $0x8
c0101775:	e9 96 02 00 00       	jmp    c0101a10 <_isr>
c010177a:	90                   	nop    
c010177b:	90                   	nop    
c010177c:	90                   	nop    
c010177d:	90                   	nop    
c010177e:	90                   	nop    
c010177f:	90                   	nop    

c0101780 <_interrupt_9>:
c0101780:	68 00 00 00 00       	push   $0x0
c0101785:	68 09 00 00 00       	push   $0x9
c010178a:	e9 81 02 00 00       	jmp    c0101a10 <_isr>
c010178f:	90                   	nop    

c0101790 <_interrupt_10>:
c0101790:	68 0a 00 00 00       	push   $0xa
c0101795:	e9 76 02 00 00       	jmp    c0101a10 <_isr>
c010179a:	90                   	nop    
c010179b:	90                   	nop    
c010179c:	90                   	nop    
c010179d:	90                   	nop    
c010179e:	90                   	nop    
c010179f:	90                   	nop    

c01017a0 <_interrupt_11>:
c01017a0:	68 0b 00 00 00       	push   $0xb
c01017a5:	e9 66 02 00 00       	jmp    c0101a10 <_isr>
c01017aa:	90                   	nop    
c01017ab:	90                   	nop    
c01017ac:	90                   	nop    
c01017ad:	90                   	nop    
c01017ae:	90                   	nop    
c01017af:	90                   	nop    

c01017b0 <_interrupt_12>:
c01017b0:	68 0c 00 00 00       	push   $0xc
c01017b5:	e9 56 02 00 00       	jmp    c0101a10 <_isr>
c01017ba:	90                   	nop    
c01017bb:	90                   	nop    
c01017bc:	90                   	nop    
c01017bd:	90                   	nop    
c01017be:	90                   	nop    
c01017bf:	90                   	nop    

c01017c0 <_interrupt_13>:
c01017c0:	68 0d 00 00 00       	push   $0xd
c01017c5:	e9 46 02 00 00       	jmp    c0101a10 <_isr>
c01017ca:	90                   	nop    
c01017cb:	90                   	nop    
c01017cc:	90                   	nop    
c01017cd:	90                   	nop    
c01017ce:	90                   	nop    
c01017cf:	90                   	nop    

c01017d0 <_interrupt_14>:
c01017d0:	68 0e 00 00 00       	push   $0xe
c01017d5:	e9 36 02 00 00       	jmp    c0101a10 <_isr>
c01017da:	90                   	nop    
c01017db:	90                   	nop    
c01017dc:	90                   	nop    
c01017dd:	90                   	nop    
c01017de:	90                   	nop    
c01017df:	90                   	nop    

c01017e0 <_interrupt_15>:
c01017e0:	68 00 00 00 00       	push   $0x0
c01017e5:	68 0f 00 00 00       	push   $0xf
c01017ea:	e9 21 02 00 00       	jmp    c0101a10 <_isr>
c01017ef:	90                   	nop    

c01017f0 <_interrupt_16>:
c01017f0:	68 00 00 00 00       	push   $0x0
c01017f5:	68 10 00 00 00       	push   $0x10
c01017fa:	e9 11 02 00 00       	jmp    c0101a10 <_isr>
c01017ff:	90                   	nop    

c0101800 <_interrupt_17>:
c0101800:	68 11 00 00 00       	push   $0x11
c0101805:	e9 06 02 00 00       	jmp    c0101a10 <_isr>
c010180a:	90                   	nop    
c010180b:	90                   	nop    
c010180c:	90                   	nop    
c010180d:	90                   	nop    
c010180e:	90                   	nop    
c010180f:	90                   	nop    

c0101810 <_interrupt_18>:
c0101810:	68 00 00 00 00       	push   $0x0
c0101815:	68 12 00 00 00       	push   $0x12
c010181a:	e9 f1 01 00 00       	jmp    c0101a10 <_isr>
c010181f:	90                   	nop    

c0101820 <_interrupt_19>:
c0101820:	68 00 00 00 00       	push   $0x0
c0101825:	68 13 00 00 00       	push   $0x13
c010182a:	e9 e1 01 00 00       	jmp    c0101a10 <_isr>
c010182f:	90                   	nop    

c0101830 <_interrupt_20>:
c0101830:	68 00 00 00 00       	push   $0x0
c0101835:	68 14 00 00 00       	push   $0x14
c010183a:	e9 d1 01 00 00       	jmp    c0101a10 <_isr>
c010183f:	90                   	nop    

c0101840 <_interrupt_21>:
c0101840:	68 00 00 00 00       	push   $0x0
c0101845:	68 15 00 00 00       	push   $0x15
c010184a:	e9 c1 01 00 00       	jmp    c0101a10 <_isr>
c010184f:	90                   	nop    

c0101850 <_interrupt_22>:
c0101850:	68 00 00 00 00       	push   $0x0
c0101855:	68 16 00 00 00       	push   $0x16
c010185a:	e9 b1 01 00 00       	jmp    c0101a10 <_isr>
c010185f:	90                   	nop    

c0101860 <_interrupt_23>:
c0101860:	68 00 00 00 00       	push   $0x0
c0101865:	68 17 00 00 00       	push   $0x17
c010186a:	e9 a1 01 00 00       	jmp    c0101a10 <_isr>
c010186f:	90                   	nop    

c0101870 <_interrupt_24>:
c0101870:	68 00 00 00 00       	push   $0x0
c0101875:	68 18 00 00 00       	push   $0x18
c010187a:	e9 91 01 00 00       	jmp    c0101a10 <_isr>
c010187f:	90                   	nop    

c0101880 <_interrupt_25>:
c0101880:	68 00 00 00 00       	push   $0x0
c0101885:	68 19 00 00 00       	push   $0x19
c010188a:	e9 81 01 00 00       	jmp    c0101a10 <_isr>
c010188f:	90                   	nop    

c0101890 <_interrupt_26>:
c0101890:	68 00 00 00 00       	push   $0x0
c0101895:	68 1a 00 00 00       	push   $0x1a
c010189a:	e9 71 01 00 00       	jmp    c0101a10 <_isr>
c010189f:	90                   	nop    

c01018a0 <_interrupt_27>:
c01018a0:	68 00 00 00 00       	push   $0x0
c01018a5:	68 1b 00 00 00       	push   $0x1b
c01018aa:	e9 61 01 00 00       	jmp    c0101a10 <_isr>
c01018af:	90                   	nop    

c01018b0 <_interrupt_28>:
c01018b0:	68 00 00 00 00       	push   $0x0
c01018b5:	68 1c 00 00 00       	push   $0x1c
c01018ba:	e9 51 01 00 00       	jmp    c0101a10 <_isr>
c01018bf:	90                   	nop    

c01018c0 <_interrupt_29>:
c01018c0:	68 00 00 00 00       	push   $0x0
c01018c5:	68 1d 00 00 00       	push   $0x1d
c01018ca:	e9 41 01 00 00       	jmp    c0101a10 <_isr>
c01018cf:	90                   	nop    

c01018d0 <_interrupt_30>:
c01018d0:	68 00 00 00 00       	push   $0x0
c01018d5:	68 1e 00 00 00       	push   $0x1e
c01018da:	e9 31 01 00 00       	jmp    c0101a10 <_isr>
c01018df:	90                   	nop    

c01018e0 <_interrupt_31>:
c01018e0:	68 00 00 00 00       	push   $0x0
c01018e5:	68 1f 00 00 00       	push   $0x1f
c01018ea:	e9 21 01 00 00       	jmp    c0101a10 <_isr>
c01018ef:	90                   	nop    

c01018f0 <_interrupt_32>:
c01018f0:	68 00 00 00 00       	push   $0x0
c01018f5:	68 20 00 00 00       	push   $0x20
c01018fa:	e9 11 01 00 00       	jmp    c0101a10 <_isr>
c01018ff:	90                   	nop    

c0101900 <_interrupt_33>:
c0101900:	68 00 00 00 00       	push   $0x0
c0101905:	68 21 00 00 00       	push   $0x21
c010190a:	e9 01 01 00 00       	jmp    c0101a10 <_isr>
c010190f:	90                   	nop    

c0101910 <_interrupt_34>:
c0101910:	68 00 00 00 00       	push   $0x0
c0101915:	68 22 00 00 00       	push   $0x22
c010191a:	e9 f1 00 00 00       	jmp    c0101a10 <_isr>
c010191f:	90                   	nop    

c0101920 <_interrupt_35>:
c0101920:	68 00 00 00 00       	push   $0x0
c0101925:	68 23 00 00 00       	push   $0x23
c010192a:	e9 e1 00 00 00       	jmp    c0101a10 <_isr>
c010192f:	90                   	nop    

c0101930 <_interrupt_36>:
c0101930:	68 00 00 00 00       	push   $0x0
c0101935:	68 24 00 00 00       	push   $0x24
c010193a:	e9 d1 00 00 00       	jmp    c0101a10 <_isr>
c010193f:	90                   	nop    

c0101940 <_interrupt_37>:
c0101940:	68 00 00 00 00       	push   $0x0
c0101945:	68 25 00 00 00       	push   $0x25
c010194a:	e9 c1 00 00 00       	jmp    c0101a10 <_isr>
c010194f:	90                   	nop    

c0101950 <_interrupt_38>:
c0101950:	68 00 00 00 00       	push   $0x0
c0101955:	68 26 00 00 00       	push   $0x26
c010195a:	e9 b1 00 00 00       	jmp    c0101a10 <_isr>
c010195f:	90                   	nop    

c0101960 <_interrupt_39>:
c0101960:	68 00 00 00 00       	push   $0x0
c0101965:	68 27 00 00 00       	push   $0x27
c010196a:	e9 a1 00 00 00       	jmp    c0101a10 <_isr>
c010196f:	90                   	nop    

c0101970 <_interrupt_40>:
c0101970:	68 00 00 00 00       	push   $0x0
c0101975:	68 28 00 00 00       	push   $0x28
c010197a:	e9 91 00 00 00       	jmp    c0101a10 <_isr>
c010197f:	90                   	nop    

c0101980 <_interrupt_41>:
c0101980:	68 00 00 00 00       	push   $0x0
c0101985:	68 29 00 00 00       	push   $0x29
c010198a:	e9 81 00 00 00       	jmp    c0101a10 <_isr>
c010198f:	90                   	nop    

c0101990 <_interrupt_42>:
c0101990:	68 00 00 00 00       	push   $0x0
c0101995:	68 2a 00 00 00       	push   $0x2a
c010199a:	e9 71 00 00 00       	jmp    c0101a10 <_isr>
c010199f:	90                   	nop    

c01019a0 <_interrupt_43>:
c01019a0:	68 00 00 00 00       	push   $0x0
c01019a5:	68 2b 00 00 00       	push   $0x2b
c01019aa:	e9 61 00 00 00       	jmp    c0101a10 <_isr>
c01019af:	90                   	nop    

c01019b0 <_interrupt_44>:
c01019b0:	68 00 00 00 00       	push   $0x0
c01019b5:	68 2c 00 00 00       	push   $0x2c
c01019ba:	e9 51 00 00 00       	jmp    c0101a10 <_isr>
c01019bf:	90                   	nop    

c01019c0 <_interrupt_45>:
c01019c0:	68 00 00 00 00       	push   $0x0
c01019c5:	68 2d 00 00 00       	push   $0x2d
c01019ca:	e9 41 00 00 00       	jmp    c0101a10 <_isr>
c01019cf:	90                   	nop    

c01019d0 <_interrupt_46>:
c01019d0:	68 00 00 00 00       	push   $0x0
c01019d5:	68 2e 00 00 00       	push   $0x2e
c01019da:	e9 31 00 00 00       	jmp    c0101a10 <_isr>
c01019df:	90                   	nop    

c01019e0 <_interrupt_47>:
c01019e0:	68 00 00 00 00       	push   $0x0
c01019e5:	68 2f 00 00 00       	push   $0x2f
c01019ea:	e9 21 00 00 00       	jmp    c0101a10 <_isr>
c01019ef:	90                   	nop    

c01019f0 <_interrupt_48>:
c01019f0:	68 00 00 00 00       	push   $0x0
c01019f5:	68 30 00 00 00       	push   $0x30
c01019fa:	e9 11 00 00 00       	jmp    c0101a10 <_isr>

c01019ff <_isr_stack>:
c01019ff:	00 00                	add    %al,(%eax)
	...

c0101a03 <_reentrance>:
c0101a03:	00 00                	add    %al,(%eax)
c0101a05:	00 00                	add    %al,(%eax)
c0101a07:	90                   	nop    
c0101a08:	90                   	nop    
c0101a09:	90                   	nop    
c0101a0a:	90                   	nop    
c0101a0b:	90                   	nop    
c0101a0c:	90                   	nop    
c0101a0d:	90                   	nop    
c0101a0e:	90                   	nop    
c0101a0f:	90                   	nop    

c0101a10 <_isr>:
c0101a10:	60                   	pusha  
c0101a11:	1e                   	push   %ds
c0101a12:	06                   	push   %es
c0101a13:	0f a0                	push   %fs
c0101a15:	0f a8                	push   %gs
c0101a17:	66 8c d0             	mov    %ss,%ax
c0101a1a:	8e d8                	mov    %eax,%ds
c0101a1c:	8e c0                	mov    %eax,%es
c0101a1e:	8e e0                	mov    %eax,%fs
c0101a20:	8e e8                	mov    %eax,%gs
c0101a22:	89 e3                	mov    %esp,%ebx
c0101a24:	53                   	push   %ebx
c0101a25:	5b                   	pop    %ebx

c0101a26 <skip_isr_stack>:
c0101a26:	ff 05 03 1a 10 c0    	incl   0xc0101a03
c0101a2c:	53                   	push   %ebx
c0101a2d:	e8 7d f6 ff ff       	call   c01010af <_HALInterruptHandler>
c0101a32:	81 c4 04 00 00 00    	add    $0x4,%esp
c0101a38:	ff 0d 03 1a 10 c0    	decl   0xc0101a03
c0101a3e:	3d 00 00 00 00       	cmp    $0x0,%eax
c0101a43:	74 02                	je     c0101a47 <isr_flush>

c0101a45 <_isr_return>:
c0101a45:	89 c4                	mov    %eax,%esp

c0101a47 <isr_flush>:
c0101a47:	0f a9                	pop    %gs
c0101a49:	0f a1                	pop    %fs
c0101a4b:	07                   	pop    %es
c0101a4c:	1f                   	pop    %ds
c0101a4d:	61                   	popa   
c0101a4e:	81 c4 08 00 00 00    	add    $0x8,%esp
c0101a54:	cf                   	iret   
	...

c0101a60 <_SetMemory>:
c0101a60:	55                   	push   %ebp
c0101a61:	89 e5                	mov    %esp,%ebp
c0101a63:	57                   	push   %edi
c0101a64:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101a67:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a6a:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101a6d:	fc                   	cld    
c0101a6e:	f3 aa                	repz stos %al,%es:(%edi)
c0101a70:	5f                   	pop    %edi
c0101a71:	5d                   	pop    %ebp
c0101a72:	c3                   	ret    

c0101a73 <_SetMemoryD>:
c0101a73:	55                   	push   %ebp
c0101a74:	89 e5                	mov    %esp,%ebp
c0101a76:	57                   	push   %edi
c0101a77:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101a7d:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101a80:	fc                   	cld    
c0101a81:	f3 ab                	repz stos %eax,%es:(%edi)
c0101a83:	5f                   	pop    %edi
c0101a84:	5d                   	pop    %ebp
c0101a85:	c3                   	ret    

c0101a86 <_ZeroMemory>:
c0101a86:	55                   	push   %ebp
c0101a87:	89 e5                	mov    %esp,%ebp
c0101a89:	83 ec 08             	sub    $0x8,%esp
c0101a8c:	83 ec 04             	sub    $0x4,%esp
c0101a8f:	ff 75 0c             	pushl  0xc(%ebp)
c0101a92:	6a 00                	push   $0x0
c0101a94:	ff 75 08             	pushl  0x8(%ebp)
c0101a97:	e8 c4 ff ff ff       	call   c0101a60 <_SetMemory>
c0101a9c:	83 c4 10             	add    $0x10,%esp
c0101a9f:	c9                   	leave  
c0101aa0:	c3                   	ret    

c0101aa1 <_ZeroMemoryD>:
c0101aa1:	55                   	push   %ebp
c0101aa2:	89 e5                	mov    %esp,%ebp
c0101aa4:	83 ec 08             	sub    $0x8,%esp
c0101aa7:	83 ec 04             	sub    $0x4,%esp
c0101aaa:	ff 75 0c             	pushl  0xc(%ebp)
c0101aad:	6a 00                	push   $0x0
c0101aaf:	ff 75 08             	pushl  0x8(%ebp)
c0101ab2:	e8 bc ff ff ff       	call   c0101a73 <_SetMemoryD>
c0101ab7:	83 c4 10             	add    $0x10,%esp
c0101aba:	c9                   	leave  
c0101abb:	c3                   	ret    

c0101abc <_ZeroPage>:
c0101abc:	55                   	push   %ebp
c0101abd:	89 e5                	mov    %esp,%ebp
c0101abf:	83 ec 08             	sub    $0x8,%esp
c0101ac2:	83 ec 08             	sub    $0x8,%esp
c0101ac5:	68 00 10 00 00       	push   $0x1000
c0101aca:	ff 75 08             	pushl  0x8(%ebp)
c0101acd:	e8 cf ff ff ff       	call   c0101aa1 <_ZeroMemoryD>
c0101ad2:	83 c4 10             	add    $0x10,%esp
c0101ad5:	c9                   	leave  
c0101ad6:	c3                   	ret    
c0101ad7:	90                   	nop    
c0101ad8:	90                   	nop    
c0101ad9:	90                   	nop    
c0101ada:	90                   	nop    
c0101adb:	90                   	nop    
c0101adc:	90                   	nop    
c0101add:	90                   	nop    
c0101ade:	90                   	nop    
c0101adf:	90                   	nop    

c0101ae0 <__leading_chars>:
c0101ae0:	55                   	push   %ebp
c0101ae1:	89 e5                	mov    %esp,%ebp
c0101ae3:	83 ec 48             	sub    $0x48,%esp
c0101ae6:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ae9:	8b 55 14             	mov    0x14(%ebp),%edx
c0101aec:	88 45 f7             	mov    %al,0xfffffff7(%ebp)
c0101aef:	88 55 f6             	mov    %dl,0xfffffff6(%ebp)
c0101af2:	83 ec 0c             	sub    $0xc,%esp
c0101af5:	ff 75 08             	pushl  0x8(%ebp)
c0101af8:	e8 c3 11 00 00       	call   c0102cc0 <_strlen>
c0101afd:	83 c4 10             	add    $0x10,%esp
c0101b00:	89 c2                	mov    %eax,%edx
c0101b02:	8b 45 18             	mov    0x18(%ebp),%eax
c0101b05:	29 d0                	sub    %edx,%eax
c0101b07:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0101b0a:	c7 45 c8 00 00 00 00 	movl   $0x0,0xffffffc8(%ebp)
c0101b11:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
c0101b18:	c7 45 d0 00 00 00 00 	movl   $0x0,0xffffffd0(%ebp)
c0101b1f:	c7 45 d4 00 00 00 00 	movl   $0x0,0xffffffd4(%ebp)
c0101b26:	c7 45 d8 00 00 00 00 	movl   $0x0,0xffffffd8(%ebp)
c0101b2d:	c7 45 dc 00 00 00 00 	movl   $0x0,0xffffffdc(%ebp)
c0101b34:	c7 45 e0 00 00 00 00 	movl   $0x0,0xffffffe0(%ebp)
c0101b3b:	66 c7 45 e4 00 00    	movw   $0x0,0xffffffe4(%ebp)
c0101b41:	83 7d 18 1e          	cmpl   $0x1e,0x18(%ebp)
c0101b45:	7f 08                	jg     c0101b4f <__leading_chars+0x6f>
c0101b47:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
c0101b4b:	7e 02                	jle    c0101b4f <__leading_chars+0x6f>
c0101b4d:	eb 0b                	jmp    c0101b5a <__leading_chars+0x7a>
c0101b4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b52:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0101b55:	e9 c8 00 00 00       	jmp    c0101c22 <__leading_chars+0x142>
c0101b5a:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0101b61:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101b64:	3b 45 18             	cmp    0x18(%ebp),%eax
c0101b67:	7c 02                	jl     c0101b6b <__leading_chars+0x8b>
c0101b69:	eb 7b                	jmp    c0101be6 <__leading_chars+0x106>
c0101b6b:	80 7d f6 00          	cmpb   $0x0,0xfffffff6(%ebp)
c0101b6f:	74 38                	je     c0101ba9 <__leading_chars+0xc9>
c0101b71:	83 ec 0c             	sub    $0xc,%esp
c0101b74:	ff 75 08             	pushl  0x8(%ebp)
c0101b77:	e8 44 11 00 00       	call   c0102cc0 <_strlen>
c0101b7c:	83 c4 10             	add    $0x10,%esp
c0101b7f:	39 45 f0             	cmp    %eax,0xfffffff0(%ebp)
c0101b82:	7d 15                	jge    c0101b99 <__leading_chars+0xb9>
c0101b84:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101b87:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101b8a:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101b8d:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101b90:	03 45 08             	add    0x8(%ebp),%eax
c0101b93:	8a 00                	mov    (%eax),%al
c0101b95:	88 02                	mov    %al,(%edx)
c0101b97:	eb 43                	jmp    c0101bdc <__leading_chars+0xfc>
c0101b99:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101b9c:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101b9f:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101ba2:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c0101ba5:	88 02                	mov    %al,(%edx)
c0101ba7:	eb 33                	jmp    c0101bdc <__leading_chars+0xfc>
c0101ba9:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101bac:	3b 45 ec             	cmp    0xffffffec(%ebp),%eax
c0101baf:	7d 10                	jge    c0101bc1 <__leading_chars+0xe1>
c0101bb1:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101bb4:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101bb7:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101bba:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c0101bbd:	88 02                	mov    %al,(%edx)
c0101bbf:	eb 1b                	jmp    c0101bdc <__leading_chars+0xfc>
c0101bc1:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101bc4:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101bc7:	8d 48 d0             	lea    0xffffffd0(%eax),%ecx
c0101bca:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
c0101bcd:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101bd0:	29 d0                	sub    %edx,%eax
c0101bd2:	89 c2                	mov    %eax,%edx
c0101bd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bd7:	8a 04 02             	mov    (%edx,%eax,1),%al
c0101bda:	88 01                	mov    %al,(%ecx)
c0101bdc:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101bdf:	ff 00                	incl   (%eax)
c0101be1:	e9 7b ff ff ff       	jmp    c0101b61 <__leading_chars+0x81>
c0101be6:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0101bed:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101bf0:	3b 45 18             	cmp    0x18(%ebp),%eax
c0101bf3:	7c 02                	jl     c0101bf7 <__leading_chars+0x117>
c0101bf5:	eb 1c                	jmp    c0101c13 <__leading_chars+0x133>
c0101bf7:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101bfa:	8b 55 08             	mov    0x8(%ebp),%edx
c0101bfd:	01 c2                	add    %eax,%edx
c0101bff:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c02:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c05:	83 e8 30             	sub    $0x30,%eax
c0101c08:	8a 00                	mov    (%eax),%al
c0101c0a:	88 02                	mov    %al,(%edx)
c0101c0c:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101c0f:	ff 00                	incl   (%eax)
c0101c11:	eb da                	jmp    c0101bed <__leading_chars+0x10d>
c0101c13:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c16:	03 45 08             	add    0x8(%ebp),%eax
c0101c19:	c6 00 00             	movb   $0x0,(%eax)
c0101c1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c1f:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0101c22:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0101c25:	c9                   	leave  
c0101c26:	c3                   	ret    

c0101c27 <__makestr>:
c0101c27:	55                   	push   %ebp
c0101c28:	89 e5                	mov    %esp,%ebp
c0101c2a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0101c30:	8b 45 10             	mov    0x10(%ebp),%eax
c0101c33:	8b 55 14             	mov    0x14(%ebp),%edx
c0101c36:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0101c39:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
c0101c3c:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101c43:	8b 45 20             	mov    0x20(%ebp),%eax
c0101c46:	8b 00                	mov    (%eax),%eax
c0101c48:	89 45 8c             	mov    %eax,0xffffff8c(%ebp)
c0101c4b:	83 7d 18 01          	cmpl   $0x1,0x18(%ebp)
c0101c4f:	7e 08                	jle    c0101c59 <__makestr+0x32>
c0101c51:	83 7d 18 24          	cmpl   $0x24,0x18(%ebp)
c0101c55:	7f 02                	jg     c0101c59 <__makestr+0x32>
c0101c57:	eb 0c                	jmp    c0101c65 <__makestr+0x3e>
c0101c59:	c7 45 88 00 00 00 00 	movl   $0x0,0xffffff88(%ebp)
c0101c60:	e9 c6 01 00 00       	jmp    c0101e2b <__makestr+0x204>
c0101c65:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101c68:	83 e0 10             	and    $0x10,%eax
c0101c6b:	85 c0                	test   %eax,%eax
c0101c6d:	74 0d                	je     c0101c7c <__makestr+0x55>
c0101c6f:	8b 45 20             	mov    0x20(%ebp),%eax
c0101c72:	8b 55 20             	mov    0x20(%ebp),%edx
c0101c75:	8b 12                	mov    (%edx),%edx
c0101c77:	83 e2 fe             	and    $0xfffffffe,%edx
c0101c7a:	89 10                	mov    %edx,(%eax)
c0101c7c:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101c7f:	83 e0 01             	and    $0x1,%eax
c0101c82:	85 c0                	test   %eax,%eax
c0101c84:	74 06                	je     c0101c8c <__makestr+0x65>
c0101c86:	c6 45 87 30          	movb   $0x30,0xffffff87(%ebp)
c0101c8a:	eb 04                	jmp    c0101c90 <__makestr+0x69>
c0101c8c:	c6 45 87 20          	movb   $0x20,0xffffff87(%ebp)
c0101c90:	8a 45 87             	mov    0xffffff87(%ebp),%al
c0101c93:	88 45 ef             	mov    %al,0xffffffef(%ebp)
c0101c96:	c6 45 ee 00          	movb   $0x0,0xffffffee(%ebp)
c0101c9a:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101c9d:	83 e0 02             	and    $0x2,%eax
c0101ca0:	85 c0                	test   %eax,%eax
c0101ca2:	74 4b                	je     c0101cef <__makestr+0xc8>
c0101ca4:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c0101ca8:	79 12                	jns    c0101cbc <__makestr+0x95>
c0101caa:	c6 45 ee 2d          	movb   $0x2d,0xffffffee(%ebp)
c0101cae:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101cb1:	f7 18                	negl   (%eax)
c0101cb3:	83 50 04 00          	adcl   $0x0,0x4(%eax)
c0101cb7:	f7 58 04             	negl   0x4(%eax)
c0101cba:	eb 1e                	jmp    c0101cda <__makestr+0xb3>
c0101cbc:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101cbf:	83 e0 04             	and    $0x4,%eax
c0101cc2:	85 c0                	test   %eax,%eax
c0101cc4:	74 06                	je     c0101ccc <__makestr+0xa5>
c0101cc6:	c6 45 ee 2b          	movb   $0x2b,0xffffffee(%ebp)
c0101cca:	eb 0e                	jmp    c0101cda <__makestr+0xb3>
c0101ccc:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101ccf:	83 e0 08             	and    $0x8,%eax
c0101cd2:	85 c0                	test   %eax,%eax
c0101cd4:	74 04                	je     c0101cda <__makestr+0xb3>
c0101cd6:	c6 45 ee 20          	movb   $0x20,0xffffffee(%ebp)
c0101cda:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101cdd:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101ce0:	01 d0                	add    %edx,%eax
c0101ce2:	8d 50 e0             	lea    0xffffffe0(%eax),%edx
c0101ce5:	8a 45 ee             	mov    0xffffffee(%ebp),%al
c0101ce8:	88 02                	mov    %al,(%edx)
c0101cea:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101ced:	ff 00                	incl   (%eax)
c0101cef:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101cf2:	83 e0 20             	and    $0x20,%eax
c0101cf5:	85 c0                	test   %eax,%eax
c0101cf7:	74 47                	je     c0101d40 <__makestr+0x119>
c0101cf9:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
c0101cfd:	75 28                	jne    c0101d27 <__makestr+0x100>
c0101cff:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101d02:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101d05:	01 d0                	add    %edx,%eax
c0101d07:	83 e8 20             	sub    $0x20,%eax
c0101d0a:	c6 00 30             	movb   $0x30,(%eax)
c0101d0d:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101d10:	ff 00                	incl   (%eax)
c0101d12:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101d15:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101d18:	01 d0                	add    %edx,%eax
c0101d1a:	83 e8 20             	sub    $0x20,%eax
c0101d1d:	c6 00 78             	movb   $0x78,(%eax)
c0101d20:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101d23:	ff 00                	incl   (%eax)
c0101d25:	eb 19                	jmp    c0101d40 <__makestr+0x119>
c0101d27:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
c0101d2b:	75 13                	jne    c0101d40 <__makestr+0x119>
c0101d2d:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101d30:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101d33:	01 d0                	add    %edx,%eax
c0101d35:	83 e8 20             	sub    $0x20,%eax
c0101d38:	c6 00 30             	movb   $0x30,(%eax)
c0101d3b:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101d3e:	ff 00                	incl   (%eax)
c0101d40:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101d43:	03 45 94             	add    0xffffff94(%ebp),%eax
c0101d46:	83 e8 20             	sub    $0x20,%eax
c0101d49:	c6 00 00             	movb   $0x0,(%eax)
c0101d4c:	6a 00                	push   $0x0
c0101d4e:	ff 75 18             	pushl  0x18(%ebp)
c0101d51:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101d54:	50                   	push   %eax
c0101d55:	ff 75 f0             	pushl  0xfffffff0(%ebp)
c0101d58:	e8 43 0d 00 00       	call   c0102aa0 <_itoaex>
c0101d5d:	83 c4 10             	add    $0x10,%esp
c0101d60:	85 c0                	test   %eax,%eax
c0101d62:	75 0c                	jne    c0101d70 <__makestr+0x149>
c0101d64:	c7 45 88 00 00 00 00 	movl   $0x0,0xffffff88(%ebp)
c0101d6b:	e9 bb 00 00 00       	jmp    c0101e2b <__makestr+0x204>
c0101d70:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d73:	83 e0 40             	and    $0x40,%eax
c0101d76:	85 c0                	test   %eax,%eax
c0101d78:	74 0f                	je     c0101d89 <__makestr+0x162>
c0101d7a:	83 ec 0c             	sub    $0xc,%esp
c0101d7d:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101d80:	50                   	push   %eax
c0101d81:	e8 60 0f 00 00       	call   c0102ce6 <__strupr>
c0101d86:	83 c4 10             	add    $0x10,%esp
c0101d89:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101d90:	c7 45 90 00 00 00 00 	movl   $0x0,0xffffff90(%ebp)
c0101d97:	83 ec 0c             	sub    $0xc,%esp
c0101d9a:	8d 45 d8             	lea    0xffffffd8(%ebp),%eax
c0101d9d:	50                   	push   %eax
c0101d9e:	e8 1d 0f 00 00       	call   c0102cc0 <_strlen>
c0101da3:	83 c4 10             	add    $0x10,%esp
c0101da6:	39 45 90             	cmp    %eax,0xffffff90(%ebp)
c0101da9:	7c 02                	jl     c0101dad <__makestr+0x186>
c0101dab:	eb 29                	jmp    c0101dd6 <__makestr+0x1af>
c0101dad:	8b 45 08             	mov    0x8(%ebp),%eax
c0101db0:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101db3:	77 21                	ja     c0101dd6 <__makestr+0x1af>
c0101db5:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101db8:	8b 55 08             	mov    0x8(%ebp),%edx
c0101dbb:	01 c2                	add    %eax,%edx
c0101dbd:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101dc0:	03 45 90             	add    0xffffff90(%ebp),%eax
c0101dc3:	83 e8 20             	sub    $0x20,%eax
c0101dc6:	8a 00                	mov    (%eax),%al
c0101dc8:	88 02                	mov    %al,(%edx)
c0101dca:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101dcd:	ff 00                	incl   (%eax)
c0101dcf:	8d 45 90             	lea    0xffffff90(%ebp),%eax
c0101dd2:	ff 00                	incl   (%eax)
c0101dd4:	eb c1                	jmp    c0101d97 <__makestr+0x170>
c0101dd6:	c7 45 90 00 00 00 00 	movl   $0x0,0xffffff90(%ebp)
c0101ddd:	83 ec 0c             	sub    $0xc,%esp
c0101de0:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101de3:	50                   	push   %eax
c0101de4:	e8 d7 0e 00 00       	call   c0102cc0 <_strlen>
c0101de9:	83 c4 10             	add    $0x10,%esp
c0101dec:	39 45 90             	cmp    %eax,0xffffff90(%ebp)
c0101def:	7c 02                	jl     c0101df3 <__makestr+0x1cc>
c0101df1:	eb 29                	jmp    c0101e1c <__makestr+0x1f5>
c0101df3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101df6:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101df9:	77 21                	ja     c0101e1c <__makestr+0x1f5>
c0101dfb:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101dfe:	8b 55 08             	mov    0x8(%ebp),%edx
c0101e01:	01 c2                	add    %eax,%edx
c0101e03:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101e06:	03 45 90             	add    0xffffff90(%ebp),%eax
c0101e09:	83 e8 60             	sub    $0x60,%eax
c0101e0c:	8a 00                	mov    (%eax),%al
c0101e0e:	88 02                	mov    %al,(%edx)
c0101e10:	8d 45 90             	lea    0xffffff90(%ebp),%eax
c0101e13:	ff 00                	incl   (%eax)
c0101e15:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101e18:	ff 00                	incl   (%eax)
c0101e1a:	eb c1                	jmp    c0101ddd <__makestr+0x1b6>
c0101e1c:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101e1f:	03 45 08             	add    0x8(%ebp),%eax
c0101e22:	c6 00 00             	movb   $0x0,(%eax)
c0101e25:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e28:	89 45 88             	mov    %eax,0xffffff88(%ebp)
c0101e2b:	8b 45 88             	mov    0xffffff88(%ebp),%eax
c0101e2e:	c9                   	leave  
c0101e2f:	c3                   	ret    
c0101e30:	3c 4e                	cmp    $0x4e,%al
c0101e32:	55                   	push   %ebp
c0101e33:	4c                   	dec    %esp
c0101e34:	4c                   	dec    %esp
c0101e35:	3e 00 55 89          	add    %dl,%ds:0xffffff89(%ebp)

c0101e37 <_vsnprintf>:
c0101e37:	55                   	push   %ebp
c0101e38:	89 e5                	mov    %esp,%ebp
c0101e3a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0101e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e43:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
c0101e46:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e49:	03 45 08             	add    0x8(%ebp),%eax
c0101e4c:	48                   	dec    %eax
c0101e4d:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
c0101e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e53:	48                   	dec    %eax
c0101e54:	39 45 e4             	cmp    %eax,0xffffffe4(%ebp)
c0101e57:	73 13                	jae    c0101e6c <_vsnprintf+0x35>
c0101e59:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,0xffffffe4(%ebp)
c0101e60:	8b 55 08             	mov    0x8(%ebp),%edx
c0101e63:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
c0101e66:	29 d0                	sub    %edx,%eax
c0101e68:	40                   	inc    %eax
c0101e69:	89 45 0c             	mov    %eax,0xc(%ebp)
c0101e6c:	90                   	nop    
c0101e6d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101e70:	80 38 00             	cmpb   $0x0,(%eax)
c0101e73:	75 05                	jne    c0101e7a <_vsnprintf+0x43>
c0101e75:	e9 09 08 00 00       	jmp    c0102683 <_vsnprintf+0x84c>
c0101e7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0101e7d:	80 38 25             	cmpb   $0x25,(%eax)
c0101e80:	74 24                	je     c0101ea6 <_vsnprintf+0x6f>
c0101e82:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0101e85:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c0101e88:	0f 87 f5 07 00 00    	ja     c0102683 <_vsnprintf+0x84c>
c0101e8e:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0101e91:	89 c2                	mov    %eax,%edx
c0101e93:	8b 45 10             	mov    0x10(%ebp),%eax
c0101e96:	8a 00                	mov    (%eax),%al
c0101e98:	88 02                	mov    %al,(%edx)
c0101e9a:	8d 45 10             	lea    0x10(%ebp),%eax
c0101e9d:	ff 00                	incl   (%eax)
c0101e9f:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0101ea2:	ff 00                	incl   (%eax)
c0101ea4:	eb c7                	jmp    c0101e6d <_vsnprintf+0x36>
c0101ea6:	c7 45 9c 00 00 00 00 	movl   $0x0,0xffffff9c(%ebp)
c0101ead:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,0xffffffa0(%ebp)
c0101eb4:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,0xffffffec(%ebp)
c0101ebb:	c7 45 a4 0a 00 00 00 	movl   $0xa,0xffffffa4(%ebp)
c0101ec2:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101ec9:	8d 45 10             	lea    0x10(%ebp),%eax
c0101ecc:	ff 00                	incl   (%eax)
c0101ece:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ed1:	0f be 00             	movsbl (%eax),%eax
c0101ed4:	83 e8 20             	sub    $0x20,%eax
c0101ed7:	89 45 8c             	mov    %eax,0xffffff8c(%ebp)
c0101eda:	83 7d 8c 10          	cmpl   $0x10,0xffffff8c(%ebp)
c0101ede:	77 7e                	ja     c0101f5e <_vsnprintf+0x127>
c0101ee0:	8b 55 8c             	mov    0xffffff8c(%ebp),%edx
c0101ee3:	8b 04 95 ec 1e 10 c0 	mov    0xc0101eec(,%edx,4),%eax
c0101eea:	ff e0                	jmp    *%eax
c0101eec:	53                   	push   %ebx
c0101eed:	1f                   	pop    %ds
c0101eee:	10 c0                	adc    %al,%al
c0101ef0:	5e                   	pop    %esi
c0101ef1:	1f                   	pop    %ds
c0101ef2:	10 c0                	adc    %al,%al
c0101ef4:	5e                   	pop    %esi
c0101ef5:	1f                   	pop    %ds
c0101ef6:	10 c0                	adc    %al,%al
c0101ef8:	48                   	dec    %eax
c0101ef9:	1f                   	pop    %ds
c0101efa:	10 c0                	adc    %al,%al
c0101efc:	5e                   	pop    %esi
c0101efd:	1f                   	pop    %ds
c0101efe:	10 c0                	adc    %al,%al
c0101f00:	5e                   	pop    %esi
c0101f01:	1f                   	pop    %ds
c0101f02:	10 c0                	adc    %al,%al
c0101f04:	5e                   	pop    %esi
c0101f05:	1f                   	pop    %ds
c0101f06:	10 c0                	adc    %al,%al
c0101f08:	5e                   	pop    %esi
c0101f09:	1f                   	pop    %ds
c0101f0a:	10 c0                	adc    %al,%al
c0101f0c:	5e                   	pop    %esi
c0101f0d:	1f                   	pop    %ds
c0101f0e:	10 c0                	adc    %al,%al
c0101f10:	5e                   	pop    %esi
c0101f11:	1f                   	pop    %ds
c0101f12:	10 c0                	adc    %al,%al
c0101f14:	5e                   	pop    %esi
c0101f15:	1f                   	pop    %ds
c0101f16:	10 c0                	adc    %al,%al
c0101f18:	40                   	inc    %eax
c0101f19:	1f                   	pop    %ds
c0101f1a:	10 c0                	adc    %al,%al
c0101f1c:	5e                   	pop    %esi
c0101f1d:	1f                   	pop    %ds
c0101f1e:	10 c0                	adc    %al,%al
c0101f20:	38 1f                	cmp    %bl,(%edi)
c0101f22:	10 c0                	adc    %al,%al
c0101f24:	5e                   	pop    %esi
c0101f25:	1f                   	pop    %ds
c0101f26:	10 c0                	adc    %al,%al
c0101f28:	5e                   	pop    %esi
c0101f29:	1f                   	pop    %ds
c0101f2a:	10 c0                	adc    %al,%al
c0101f2c:	30 1f                	xor    %bl,(%edi)
c0101f2e:	10 c0                	adc    %al,%al
c0101f30:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101f33:	83 08 01             	orl    $0x1,(%eax)
c0101f36:	eb 91                	jmp    c0101ec9 <_vsnprintf+0x92>
c0101f38:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101f3b:	83 08 10             	orl    $0x10,(%eax)
c0101f3e:	eb 89                	jmp    c0101ec9 <_vsnprintf+0x92>
c0101f40:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101f43:	83 08 04             	orl    $0x4,(%eax)
c0101f46:	eb 81                	jmp    c0101ec9 <_vsnprintf+0x92>
c0101f48:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101f4b:	83 08 20             	orl    $0x20,(%eax)
c0101f4e:	e9 76 ff ff ff       	jmp    c0101ec9 <_vsnprintf+0x92>
c0101f53:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101f56:	83 08 08             	orl    $0x8,(%eax)
c0101f59:	e9 6b ff ff ff       	jmp    c0101ec9 <_vsnprintf+0x92>
c0101f5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f61:	80 38 2f             	cmpb   $0x2f,(%eax)
c0101f64:	7e 60                	jle    c0101fc6 <_vsnprintf+0x18f>
c0101f66:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f69:	80 38 39             	cmpb   $0x39,(%eax)
c0101f6c:	7f 58                	jg     c0101fc6 <_vsnprintf+0x18f>
c0101f6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f71:	80 38 2f             	cmpb   $0x2f,(%eax)
c0101f74:	7e 28                	jle    c0101f9e <_vsnprintf+0x167>
c0101f76:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f79:	80 38 39             	cmpb   $0x39,(%eax)
c0101f7c:	7e 02                	jle    c0101f80 <_vsnprintf+0x149>
c0101f7e:	eb 1e                	jmp    c0101f9e <_vsnprintf+0x167>
c0101f80:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101f83:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101f86:	01 d0                	add    %edx,%eax
c0101f88:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c0101f8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f8e:	8a 00                	mov    (%eax),%al
c0101f90:	88 02                	mov    %al,(%edx)
c0101f92:	8d 45 10             	lea    0x10(%ebp),%eax
c0101f95:	ff 00                	incl   (%eax)
c0101f97:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101f9a:	ff 00                	incl   (%eax)
c0101f9c:	eb d0                	jmp    c0101f6e <_vsnprintf+0x137>
c0101f9e:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101fa1:	03 45 94             	add    0xffffff94(%ebp),%eax
c0101fa4:	83 e8 50             	sub    $0x50,%eax
c0101fa7:	c6 00 00             	movb   $0x0,(%eax)
c0101faa:	83 ec 0c             	sub    $0xc,%esp
c0101fad:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0101fb0:	50                   	push   %eax
c0101fb1:	e8 70 0c 00 00       	call   c0102c26 <_atoi>
c0101fb6:	83 c4 10             	add    $0x10,%esp
c0101fb9:	89 45 a0             	mov    %eax,0xffffffa0(%ebp)
c0101fbc:	8d 45 10             	lea    0x10(%ebp),%eax
c0101fbf:	ff 08                	decl   (%eax)
c0101fc1:	e9 03 ff ff ff       	jmp    c0101ec9 <_vsnprintf+0x92>
c0101fc6:	8b 45 10             	mov    0x10(%ebp),%eax
c0101fc9:	80 38 2a             	cmpb   $0x2a,(%eax)
c0101fcc:	75 27                	jne    c0101ff5 <_vsnprintf+0x1be>
c0101fce:	8d 45 10             	lea    0x10(%ebp),%eax
c0101fd1:	ff 00                	incl   (%eax)
c0101fd3:	8d 45 14             	lea    0x14(%ebp),%eax
c0101fd6:	83 00 04             	addl   $0x4,(%eax)
c0101fd9:	8b 45 14             	mov    0x14(%ebp),%eax
c0101fdc:	83 e8 04             	sub    $0x4,%eax
c0101fdf:	8b 00                	mov    (%eax),%eax
c0101fe1:	89 45 a0             	mov    %eax,0xffffffa0(%ebp)
c0101fe4:	83 7d a0 00          	cmpl   $0x0,0xffffffa0(%ebp)
c0101fe8:	79 0b                	jns    c0101ff5 <_vsnprintf+0x1be>
c0101fea:	8d 45 a0             	lea    0xffffffa0(%ebp),%eax
c0101fed:	f7 18                	negl   (%eax)
c0101fef:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101ff2:	83 08 10             	orl    $0x10,(%eax)
c0101ff5:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ff8:	80 38 2e             	cmpb   $0x2e,(%eax)
c0101ffb:	0f 85 98 00 00 00    	jne    c0102099 <_vsnprintf+0x262>
c0102001:	8d 45 10             	lea    0x10(%ebp),%eax
c0102004:	ff 00                	incl   (%eax)
c0102006:	8b 45 10             	mov    0x10(%ebp),%eax
c0102009:	80 38 2f             	cmpb   $0x2f,(%eax)
c010200c:	7e 60                	jle    c010206e <_vsnprintf+0x237>
c010200e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102011:	80 38 39             	cmpb   $0x39,(%eax)
c0102014:	7f 58                	jg     c010206e <_vsnprintf+0x237>
c0102016:	8b 45 10             	mov    0x10(%ebp),%eax
c0102019:	80 38 2f             	cmpb   $0x2f,(%eax)
c010201c:	7e 28                	jle    c0102046 <_vsnprintf+0x20f>
c010201e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102021:	80 38 39             	cmpb   $0x39,(%eax)
c0102024:	7e 02                	jle    c0102028 <_vsnprintf+0x1f1>
c0102026:	eb 1e                	jmp    c0102046 <_vsnprintf+0x20f>
c0102028:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c010202b:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c010202e:	01 d0                	add    %edx,%eax
c0102030:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c0102033:	8b 45 10             	mov    0x10(%ebp),%eax
c0102036:	8a 00                	mov    (%eax),%al
c0102038:	88 02                	mov    %al,(%edx)
c010203a:	8d 45 10             	lea    0x10(%ebp),%eax
c010203d:	ff 00                	incl   (%eax)
c010203f:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102042:	ff 00                	incl   (%eax)
c0102044:	eb d0                	jmp    c0102016 <_vsnprintf+0x1df>
c0102046:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102049:	03 45 94             	add    0xffffff94(%ebp),%eax
c010204c:	83 e8 50             	sub    $0x50,%eax
c010204f:	c6 00 00             	movb   $0x0,(%eax)
c0102052:	83 ec 0c             	sub    $0xc,%esp
c0102055:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102058:	50                   	push   %eax
c0102059:	e8 c8 0b 00 00       	call   c0102c26 <_atoi>
c010205e:	83 c4 10             	add    $0x10,%esp
c0102061:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102064:	8d 45 10             	lea    0x10(%ebp),%eax
c0102067:	ff 08                	decl   (%eax)
c0102069:	e9 5b fe ff ff       	jmp    c0101ec9 <_vsnprintf+0x92>
c010206e:	8b 45 10             	mov    0x10(%ebp),%eax
c0102071:	80 38 2a             	cmpb   $0x2a,(%eax)
c0102074:	75 16                	jne    c010208c <_vsnprintf+0x255>
c0102076:	8d 45 10             	lea    0x10(%ebp),%eax
c0102079:	ff 00                	incl   (%eax)
c010207b:	8d 45 14             	lea    0x14(%ebp),%eax
c010207e:	83 00 04             	addl   $0x4,(%eax)
c0102081:	8b 45 14             	mov    0x14(%ebp),%eax
c0102084:	83 e8 04             	sub    $0x4,%eax
c0102087:	8b 00                	mov    (%eax),%eax
c0102089:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c010208c:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
c0102090:	79 07                	jns    c0102099 <_vsnprintf+0x262>
c0102092:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
c0102099:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,0xffffff98(%ebp)
c01020a0:	8b 45 10             	mov    0x10(%ebp),%eax
c01020a3:	80 38 68             	cmpb   $0x68,(%eax)
c01020a6:	74 1a                	je     c01020c2 <_vsnprintf+0x28b>
c01020a8:	8b 45 10             	mov    0x10(%ebp),%eax
c01020ab:	80 38 6c             	cmpb   $0x6c,(%eax)
c01020ae:	74 12                	je     c01020c2 <_vsnprintf+0x28b>
c01020b0:	8b 45 10             	mov    0x10(%ebp),%eax
c01020b3:	80 38 4c             	cmpb   $0x4c,(%eax)
c01020b6:	74 0a                	je     c01020c2 <_vsnprintf+0x28b>
c01020b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01020bb:	80 38 5a             	cmpb   $0x5a,(%eax)
c01020be:	74 02                	je     c01020c2 <_vsnprintf+0x28b>
c01020c0:	eb 28                	jmp    c01020ea <_vsnprintf+0x2b3>
c01020c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01020c5:	0f be 00             	movsbl (%eax),%eax
c01020c8:	89 45 98             	mov    %eax,0xffffff98(%ebp)
c01020cb:	8d 45 10             	lea    0x10(%ebp),%eax
c01020ce:	ff 00                	incl   (%eax)
c01020d0:	83 7d 98 6c          	cmpl   $0x6c,0xffffff98(%ebp)
c01020d4:	75 14                	jne    c01020ea <_vsnprintf+0x2b3>
c01020d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01020d9:	80 38 6c             	cmpb   $0x6c,(%eax)
c01020dc:	75 0c                	jne    c01020ea <_vsnprintf+0x2b3>
c01020de:	c7 45 98 4c 00 00 00 	movl   $0x4c,0xffffff98(%ebp)
c01020e5:	8d 45 10             	lea    0x10(%ebp),%eax
c01020e8:	ff 00                	incl   (%eax)
c01020ea:	8b 45 10             	mov    0x10(%ebp),%eax
c01020ed:	0f be 00             	movsbl (%eax),%eax
c01020f0:	83 e8 25             	sub    $0x25,%eax
c01020f3:	89 85 7c ff ff ff    	mov    %eax,0xffffff7c(%ebp)
c01020f9:	83 bd 7c ff ff ff 53 	cmpl   $0x53,0xffffff7c(%ebp)
c0102100:	0f 87 c3 fd ff ff    	ja     c0101ec9 <_vsnprintf+0x92>
c0102106:	8b 95 7c ff ff ff    	mov    0xffffff7c(%ebp),%edx
c010210c:	8b 04 95 18 21 10 c0 	mov    0xc0102118(,%edx,4),%eax
c0102113:	ff e0                	jmp    *%eax
c0102115:	8d 76 00             	lea    0x0(%esi),%esi
c0102118:	fd                   	std    
c0102119:	23 10                	and    (%eax),%edx
c010211b:	c0 c9 1e             	ror    $0x1e,%cl
c010211e:	10 c0                	adc    %al,%al
c0102120:	c9                   	leave  
c0102121:	1e                   	push   %ds
c0102122:	10 c0                	adc    %al,%al
c0102124:	c9                   	leave  
c0102125:	1e                   	push   %ds
c0102126:	10 c0                	adc    %al,%al
c0102128:	c9                   	leave  
c0102129:	1e                   	push   %ds
c010212a:	10 c0                	adc    %al,%al
c010212c:	c9                   	leave  
c010212d:	1e                   	push   %ds
c010212e:	10 c0                	adc    %al,%al
c0102130:	c9                   	leave  
c0102131:	1e                   	push   %ds
c0102132:	10 c0                	adc    %al,%al
c0102134:	c9                   	leave  
c0102135:	1e                   	push   %ds
c0102136:	10 c0                	adc    %al,%al
c0102138:	c9                   	leave  
c0102139:	1e                   	push   %ds
c010213a:	10 c0                	adc    %al,%al
c010213c:	c9                   	leave  
c010213d:	1e                   	push   %ds
c010213e:	10 c0                	adc    %al,%al
c0102140:	c9                   	leave  
c0102141:	1e                   	push   %ds
c0102142:	10 c0                	adc    %al,%al
c0102144:	c9                   	leave  
c0102145:	1e                   	push   %ds
c0102146:	10 c0                	adc    %al,%al
c0102148:	c9                   	leave  
c0102149:	1e                   	push   %ds
c010214a:	10 c0                	adc    %al,%al
c010214c:	c9                   	leave  
c010214d:	1e                   	push   %ds
c010214e:	10 c0                	adc    %al,%al
c0102150:	c9                   	leave  
c0102151:	1e                   	push   %ds
c0102152:	10 c0                	adc    %al,%al
c0102154:	c9                   	leave  
c0102155:	1e                   	push   %ds
c0102156:	10 c0                	adc    %al,%al
c0102158:	c9                   	leave  
c0102159:	1e                   	push   %ds
c010215a:	10 c0                	adc    %al,%al
c010215c:	c9                   	leave  
c010215d:	1e                   	push   %ds
c010215e:	10 c0                	adc    %al,%al
c0102160:	c9                   	leave  
c0102161:	1e                   	push   %ds
c0102162:	10 c0                	adc    %al,%al
c0102164:	c9                   	leave  
c0102165:	1e                   	push   %ds
c0102166:	10 c0                	adc    %al,%al
c0102168:	c9                   	leave  
c0102169:	1e                   	push   %ds
c010216a:	10 c0                	adc    %al,%al
c010216c:	c9                   	leave  
c010216d:	1e                   	push   %ds
c010216e:	10 c0                	adc    %al,%al
c0102170:	c9                   	leave  
c0102171:	1e                   	push   %ds
c0102172:	10 c0                	adc    %al,%al
c0102174:	c9                   	leave  
c0102175:	1e                   	push   %ds
c0102176:	10 c0                	adc    %al,%al
c0102178:	c9                   	leave  
c0102179:	1e                   	push   %ds
c010217a:	10 c0                	adc    %al,%al
c010217c:	c9                   	leave  
c010217d:	1e                   	push   %ds
c010217e:	10 c0                	adc    %al,%al
c0102180:	c9                   	leave  
c0102181:	1e                   	push   %ds
c0102182:	10 c0                	adc    %al,%al
c0102184:	c9                   	leave  
c0102185:	1e                   	push   %ds
c0102186:	10 c0                	adc    %al,%al
c0102188:	c9                   	leave  
c0102189:	1e                   	push   %ds
c010218a:	10 c0                	adc    %al,%al
c010218c:	c9                   	leave  
c010218d:	1e                   	push   %ds
c010218e:	10 c0                	adc    %al,%al
c0102190:	c9                   	leave  
c0102191:	1e                   	push   %ds
c0102192:	10 c0                	adc    %al,%al
c0102194:	c9                   	leave  
c0102195:	1e                   	push   %ds
c0102196:	10 c0                	adc    %al,%al
c0102198:	c9                   	leave  
c0102199:	1e                   	push   %ds
c010219a:	10 c0                	adc    %al,%al
c010219c:	c9                   	leave  
c010219d:	1e                   	push   %ds
c010219e:	10 c0                	adc    %al,%al
c01021a0:	c9                   	leave  
c01021a1:	1e                   	push   %ds
c01021a2:	10 c0                	adc    %al,%al
c01021a4:	c9                   	leave  
c01021a5:	1e                   	push   %ds
c01021a6:	10 c0                	adc    %al,%al
c01021a8:	c9                   	leave  
c01021a9:	1e                   	push   %ds
c01021aa:	10 c0                	adc    %al,%al
c01021ac:	c9                   	leave  
c01021ad:	1e                   	push   %ds
c01021ae:	10 c0                	adc    %al,%al
c01021b0:	c9                   	leave  
c01021b1:	1e                   	push   %ds
c01021b2:	10 c0                	adc    %al,%al
c01021b4:	c9                   	leave  
c01021b5:	1e                   	push   %ds
c01021b6:	10 c0                	adc    %al,%al
c01021b8:	c9                   	leave  
c01021b9:	1e                   	push   %ds
c01021ba:	10 c0                	adc    %al,%al
c01021bc:	c9                   	leave  
c01021bd:	1e                   	push   %ds
c01021be:	10 c0                	adc    %al,%al
c01021c0:	c9                   	leave  
c01021c1:	1e                   	push   %ds
c01021c2:	10 c0                	adc    %al,%al
c01021c4:	c9                   	leave  
c01021c5:	1e                   	push   %ds
c01021c6:	10 c0                	adc    %al,%al
c01021c8:	c9                   	leave  
c01021c9:	1e                   	push   %ds
c01021ca:	10 c0                	adc    %al,%al
c01021cc:	c9                   	leave  
c01021cd:	1e                   	push   %ds
c01021ce:	10 c0                	adc    %al,%al
c01021d0:	c9                   	leave  
c01021d1:	1e                   	push   %ds
c01021d2:	10 c0                	adc    %al,%al
c01021d4:	c9                   	leave  
c01021d5:	1e                   	push   %ds
c01021d6:	10 c0                	adc    %al,%al
c01021d8:	c9                   	leave  
c01021d9:	1e                   	push   %ds
c01021da:	10 c0                	adc    %al,%al
c01021dc:	c9                   	leave  
c01021dd:	1e                   	push   %ds
c01021de:	10 c0                	adc    %al,%al
c01021e0:	c9                   	leave  
c01021e1:	1e                   	push   %ds
c01021e2:	10 c0                	adc    %al,%al
c01021e4:	20 25 10 c0 c9 1e    	and    %ah,0x1ec9c010
c01021ea:	10 c0                	adc    %al,%al
c01021ec:	c9                   	leave  
c01021ed:	1e                   	push   %ds
c01021ee:	10 c0                	adc    %al,%al
c01021f0:	c9                   	leave  
c01021f1:	1e                   	push   %ds
c01021f2:	10 c0                	adc    %al,%al
c01021f4:	c9                   	leave  
c01021f5:	1e                   	push   %ds
c01021f6:	10 c0                	adc    %al,%al
c01021f8:	c9                   	leave  
c01021f9:	1e                   	push   %ds
c01021fa:	10 c0                	adc    %al,%al
c01021fc:	c9                   	leave  
c01021fd:	1e                   	push   %ds
c01021fe:	10 c0                	adc    %al,%al
c0102200:	c9                   	leave  
c0102201:	1e                   	push   %ds
c0102202:	10 c0                	adc    %al,%al
c0102204:	c9                   	leave  
c0102205:	1e                   	push   %ds
c0102206:	10 c0                	adc    %al,%al
c0102208:	c9                   	leave  
c0102209:	1e                   	push   %ds
c010220a:	10 c0                	adc    %al,%al
c010220c:	c9                   	leave  
c010220d:	1e                   	push   %ds
c010220e:	10 c0                	adc    %al,%al
c0102210:	68 22 10 c0 11       	push   $0x11c01022
c0102215:	25 10 c0 c9 1e       	and    $0x1ec9c010,%eax
c010221a:	10 c0                	adc    %al,%al
c010221c:	c9                   	leave  
c010221d:	1e                   	push   %ds
c010221e:	10 c0                	adc    %al,%al
c0102220:	c9                   	leave  
c0102221:	1e                   	push   %ds
c0102222:	10 c0                	adc    %al,%al
c0102224:	c9                   	leave  
c0102225:	1e                   	push   %ds
c0102226:	10 c0                	adc    %al,%al
c0102228:	11 25 10 c0 c9 1e    	adc    %esp,0x1ec9c010
c010222e:	10 c0                	adc    %al,%al
c0102230:	c9                   	leave  
c0102231:	1e                   	push   %ds
c0102232:	10 c0                	adc    %al,%al
c0102234:	c9                   	leave  
c0102235:	1e                   	push   %ds
c0102236:	10 c0                	adc    %al,%al
c0102238:	c9                   	leave  
c0102239:	1e                   	push   %ds
c010223a:	10 c0                	adc    %al,%al
c010223c:	12 24 10             	adc    (%eax,%edx,1),%ah
c010223f:	c0 2f 25             	shrb   $0x25,(%edi)
c0102242:	10 c0                	adc    %al,%al
c0102244:	3a 24 10             	cmp    (%eax,%edx,1),%ah
c0102247:	c0 c9 1e             	ror    $0x1e,%cl
c010224a:	10 c0                	adc    %al,%al
c010224c:	c9                   	leave  
c010224d:	1e                   	push   %ds
c010224e:	10 c0                	adc    %al,%al
c0102250:	10 23                	adc    %ah,(%ebx)
c0102252:	10 c0                	adc    %al,%al
c0102254:	c9                   	leave  
c0102255:	1e                   	push   %ds
c0102256:	10 c0                	adc    %al,%al
c0102258:	17                   	pop    %ss
c0102259:	25 10 c0 c9 1e       	and    $0x1ec9c010,%eax
c010225e:	10 c0                	adc    %al,%al
c0102260:	c9                   	leave  
c0102261:	1e                   	push   %ds
c0102262:	10 c0                	adc    %al,%al
c0102264:	26                   	es
c0102265:	25 10 c0 8d 45       	and    $0x458dc010,%eax
c010226a:	14 83                	adc    $0x83,%al
c010226c:	00 04 8b             	add    %al,(%ebx,%ecx,4)
c010226f:	45                   	inc    %ebp
c0102270:	14 83                	adc    $0x83,%al
c0102272:	e8 04 8a 00 88       	call   4810ac7b <__size_of_stack_reserve__+0x47f0ac7b>
c0102277:	45                   	inc    %ebp
c0102278:	f7                   	(bad)  
c0102279:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c010227c:	88 45 a8             	mov    %al,0xffffffa8(%ebp)
c010227f:	c6 45 a9 00          	movb   $0x0,0xffffffa9(%ebp)
c0102283:	83 ec 0c             	sub    $0xc,%esp
c0102286:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102289:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c010228c:	c1 e8 04             	shr    $0x4,%eax
c010228f:	83 e0 01             	and    $0x1,%eax
c0102292:	50                   	push   %eax
c0102293:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102296:	83 e0 01             	and    $0x1,%eax
c0102299:	85 c0                	test   %eax,%eax
c010229b:	74 09                	je     c01022a6 <_vsnprintf+0x46f>
c010229d:	c7 45 88 30 00 00 00 	movl   $0x30,0xffffff88(%ebp)
c01022a4:	eb 07                	jmp    c01022ad <_vsnprintf+0x476>
c01022a6:	c7 45 88 20 00 00 00 	movl   $0x20,0xffffff88(%ebp)
c01022ad:	ff 75 88             	pushl  0xffffff88(%ebp)
c01022b0:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c01022b3:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01022b6:	50                   	push   %eax
c01022b7:	e8 24 f8 ff ff       	call   c0101ae0 <__leading_chars>
c01022bc:	83 c4 20             	add    $0x20,%esp
c01022bf:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c01022c6:	83 ec 0c             	sub    $0xc,%esp
c01022c9:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01022cc:	50                   	push   %eax
c01022cd:	e8 ee 09 00 00       	call   c0102cc0 <_strlen>
c01022d2:	83 c4 10             	add    $0x10,%esp
c01022d5:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c01022d8:	7c 02                	jl     c01022dc <_vsnprintf+0x4a5>
c01022da:	eb 2a                	jmp    c0102306 <_vsnprintf+0x4cf>
c01022dc:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01022df:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c01022e2:	0f 87 9b 03 00 00    	ja     c0102683 <_vsnprintf+0x84c>
c01022e8:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01022eb:	89 c2                	mov    %eax,%edx
c01022ed:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01022f0:	03 45 94             	add    0xffffff94(%ebp),%eax
c01022f3:	83 e8 50             	sub    $0x50,%eax
c01022f6:	8a 00                	mov    (%eax),%al
c01022f8:	88 02                	mov    %al,(%edx)
c01022fa:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c01022fd:	ff 00                	incl   (%eax)
c01022ff:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102302:	ff 00                	incl   (%eax)
c0102304:	eb c0                	jmp    c01022c6 <_vsnprintf+0x48f>
c0102306:	8d 45 10             	lea    0x10(%ebp),%eax
c0102309:	ff 00                	incl   (%eax)
c010230b:	e9 5d fb ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c0102310:	8d 45 14             	lea    0x14(%ebp),%eax
c0102313:	83 00 04             	addl   $0x4,(%eax)
c0102316:	8b 45 14             	mov    0x14(%ebp),%eax
c0102319:	83 e8 04             	sub    $0x4,%eax
c010231c:	8b 00                	mov    (%eax),%eax
c010231e:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0102321:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c0102325:	75 07                	jne    c010232e <_vsnprintf+0x4f7>
c0102327:	c7 45 f0 30 1e 10 c0 	movl   $0xc0101e30,0xfffffff0(%ebp)
c010232e:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0102335:	83 ec 0c             	sub    $0xc,%esp
c0102338:	ff 75 f0             	pushl  0xfffffff0(%ebp)
c010233b:	e8 80 09 00 00       	call   c0102cc0 <_strlen>
c0102340:	83 c4 10             	add    $0x10,%esp
c0102343:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c0102346:	7c 02                	jl     c010234a <_vsnprintf+0x513>
c0102348:	eb 1a                	jmp    c0102364 <_vsnprintf+0x52d>
c010234a:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c010234d:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102350:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c0102353:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0102356:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0102359:	8a 00                	mov    (%eax),%al
c010235b:	88 02                	mov    %al,(%edx)
c010235d:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102360:	ff 00                	incl   (%eax)
c0102362:	eb d1                	jmp    c0102335 <_vsnprintf+0x4fe>
c0102364:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102367:	03 45 94             	add    0xffffff94(%ebp),%eax
c010236a:	83 e8 50             	sub    $0x50,%eax
c010236d:	c6 00 00             	movb   $0x0,(%eax)
c0102370:	83 ec 0c             	sub    $0xc,%esp
c0102373:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102376:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102379:	c1 e8 04             	shr    $0x4,%eax
c010237c:	83 e0 01             	and    $0x1,%eax
c010237f:	50                   	push   %eax
c0102380:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102383:	83 e0 01             	and    $0x1,%eax
c0102386:	85 c0                	test   %eax,%eax
c0102388:	74 09                	je     c0102393 <_vsnprintf+0x55c>
c010238a:	c7 45 84 30 00 00 00 	movl   $0x30,0xffffff84(%ebp)
c0102391:	eb 07                	jmp    c010239a <_vsnprintf+0x563>
c0102393:	c7 45 84 20 00 00 00 	movl   $0x20,0xffffff84(%ebp)
c010239a:	ff 75 84             	pushl  0xffffff84(%ebp)
c010239d:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c01023a0:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01023a3:	50                   	push   %eax
c01023a4:	e8 37 f7 ff ff       	call   c0101ae0 <__leading_chars>
c01023a9:	83 c4 20             	add    $0x20,%esp
c01023ac:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c01023b3:	83 ec 0c             	sub    $0xc,%esp
c01023b6:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01023b9:	50                   	push   %eax
c01023ba:	e8 01 09 00 00       	call   c0102cc0 <_strlen>
c01023bf:	83 c4 10             	add    $0x10,%esp
c01023c2:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c01023c5:	7c 02                	jl     c01023c9 <_vsnprintf+0x592>
c01023c7:	eb 2a                	jmp    c01023f3 <_vsnprintf+0x5bc>
c01023c9:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01023cc:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c01023cf:	0f 87 ae 02 00 00    	ja     c0102683 <_vsnprintf+0x84c>
c01023d5:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01023d8:	89 c2                	mov    %eax,%edx
c01023da:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01023dd:	03 45 94             	add    0xffffff94(%ebp),%eax
c01023e0:	83 e8 50             	sub    $0x50,%eax
c01023e3:	8a 00                	mov    (%eax),%al
c01023e5:	88 02                	mov    %al,(%edx)
c01023e7:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c01023ea:	ff 00                	incl   (%eax)
c01023ec:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c01023ef:	ff 00                	incl   (%eax)
c01023f1:	eb c0                	jmp    c01023b3 <_vsnprintf+0x57c>
c01023f3:	8d 45 10             	lea    0x10(%ebp),%eax
c01023f6:	ff 00                	incl   (%eax)
c01023f8:	e9 70 fa ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c01023fd:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102400:	c6 00 25             	movb   $0x25,(%eax)
c0102403:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0102406:	ff 00                	incl   (%eax)
c0102408:	8d 45 10             	lea    0x10(%ebp),%eax
c010240b:	ff 00                	incl   (%eax)
c010240d:	e9 5b fa ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c0102412:	8d 45 14             	lea    0x14(%ebp),%eax
c0102415:	83 00 04             	addl   $0x4,(%eax)
c0102418:	8b 45 14             	mov    0x14(%ebp),%eax
c010241b:	83 e8 04             	sub    $0x4,%eax
c010241e:	8b 00                	mov    (%eax),%eax
c0102420:	89 45 90             	mov    %eax,0xffffff90(%ebp)
c0102423:	8b 4d 90             	mov    0xffffff90(%ebp),%ecx
c0102426:	8b 55 08             	mov    0x8(%ebp),%edx
c0102429:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010242c:	29 d0                	sub    %edx,%eax
c010242e:	89 01                	mov    %eax,(%ecx)
c0102430:	8d 45 10             	lea    0x10(%ebp),%eax
c0102433:	ff 00                	incl   (%eax)
c0102435:	e9 33 fa ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c010243a:	83 7d a0 ff          	cmpl   $0xffffffff,0xffffffa0(%ebp)
c010243e:	75 07                	jne    c0102447 <_vsnprintf+0x610>
c0102440:	c7 45 a0 08 00 00 00 	movl   $0x8,0xffffffa0(%ebp)
c0102447:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c010244a:	83 08 01             	orl    $0x1,(%eax)
c010244d:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102450:	81 20 ef 00 00 00    	andl   $0xef,(%eax)
c0102456:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102459:	83 08 40             	orl    $0x40,(%eax)
c010245c:	83 ec 04             	sub    $0x4,%esp
c010245f:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102462:	50                   	push   %eax
c0102463:	ff 75 ec             	pushl  0xffffffec(%ebp)
c0102466:	6a 10                	push   $0x10
c0102468:	8d 45 14             	lea    0x14(%ebp),%eax
c010246b:	83 00 04             	addl   $0x4,(%eax)
c010246e:	8b 45 14             	mov    0x14(%ebp),%eax
c0102471:	83 e8 04             	sub    $0x4,%eax
c0102474:	8b 00                	mov    (%eax),%eax
c0102476:	ba 00 00 00 00       	mov    $0x0,%edx
c010247b:	52                   	push   %edx
c010247c:	50                   	push   %eax
c010247d:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c0102480:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102483:	50                   	push   %eax
c0102484:	e8 9e f7 ff ff       	call   c0101c27 <__makestr>
c0102489:	83 c4 20             	add    $0x20,%esp
c010248c:	83 ec 0c             	sub    $0xc,%esp
c010248f:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102492:	6a 00                	push   $0x0
c0102494:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102497:	83 e0 01             	and    $0x1,%eax
c010249a:	85 c0                	test   %eax,%eax
c010249c:	74 09                	je     c01024a7 <_vsnprintf+0x670>
c010249e:	c7 45 80 30 00 00 00 	movl   $0x30,0xffffff80(%ebp)
c01024a5:	eb 07                	jmp    c01024ae <_vsnprintf+0x677>
c01024a7:	c7 45 80 20 00 00 00 	movl   $0x20,0xffffff80(%ebp)
c01024ae:	ff 75 80             	pushl  0xffffff80(%ebp)
c01024b1:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c01024b4:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01024b7:	50                   	push   %eax
c01024b8:	e8 23 f6 ff ff       	call   c0101ae0 <__leading_chars>
c01024bd:	83 c4 20             	add    $0x20,%esp
c01024c0:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c01024c7:	83 ec 0c             	sub    $0xc,%esp
c01024ca:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01024cd:	50                   	push   %eax
c01024ce:	e8 ed 07 00 00       	call   c0102cc0 <_strlen>
c01024d3:	83 c4 10             	add    $0x10,%esp
c01024d6:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c01024d9:	7c 02                	jl     c01024dd <_vsnprintf+0x6a6>
c01024db:	eb 2a                	jmp    c0102507 <_vsnprintf+0x6d0>
c01024dd:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01024e0:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c01024e3:	0f 87 9a 01 00 00    	ja     c0102683 <_vsnprintf+0x84c>
c01024e9:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01024ec:	89 c2                	mov    %eax,%edx
c01024ee:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01024f1:	03 45 94             	add    0xffffff94(%ebp),%eax
c01024f4:	83 e8 50             	sub    $0x50,%eax
c01024f7:	8a 00                	mov    (%eax),%al
c01024f9:	88 02                	mov    %al,(%edx)
c01024fb:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c01024fe:	ff 00                	incl   (%eax)
c0102500:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102503:	ff 00                	incl   (%eax)
c0102505:	eb c0                	jmp    c01024c7 <_vsnprintf+0x690>
c0102507:	8d 45 10             	lea    0x10(%ebp),%eax
c010250a:	ff 00                	incl   (%eax)
c010250c:	e9 5c f9 ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c0102511:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102514:	83 08 02             	orl    $0x2,(%eax)
c0102517:	c7 45 a4 0a 00 00 00 	movl   $0xa,0xffffffa4(%ebp)
c010251e:	eb 16                	jmp    c0102536 <_vsnprintf+0x6ff>
c0102520:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102523:	83 08 40             	orl    $0x40,(%eax)
c0102526:	c7 45 a4 10 00 00 00 	movl   $0x10,0xffffffa4(%ebp)
c010252d:	eb 07                	jmp    c0102536 <_vsnprintf+0x6ff>
c010252f:	c7 45 a4 08 00 00 00 	movl   $0x8,0xffffffa4(%ebp)
c0102536:	83 7d 98 4c          	cmpl   $0x4c,0xffffff98(%ebp)
c010253a:	75 13                	jne    c010254f <_vsnprintf+0x718>
c010253c:	8d 45 14             	lea    0x14(%ebp),%eax
c010253f:	83 00 08             	addl   $0x8,(%eax)
c0102542:	8b 45 14             	mov    0x14(%ebp),%eax
c0102545:	83 e8 08             	sub    $0x8,%eax
c0102548:	8b 00                	mov    (%eax),%eax
c010254a:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010254d:	eb 73                	jmp    c01025c2 <_vsnprintf+0x78b>
c010254f:	83 7d 98 6c          	cmpl   $0x6c,0xffffff98(%ebp)
c0102553:	75 13                	jne    c0102568 <_vsnprintf+0x731>
c0102555:	8d 45 14             	lea    0x14(%ebp),%eax
c0102558:	83 00 04             	addl   $0x4,(%eax)
c010255b:	8b 45 14             	mov    0x14(%ebp),%eax
c010255e:	83 e8 04             	sub    $0x4,%eax
c0102561:	8b 00                	mov    (%eax),%eax
c0102563:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0102566:	eb 5a                	jmp    c01025c2 <_vsnprintf+0x78b>
c0102568:	83 7d 98 5a          	cmpl   $0x5a,0xffffff98(%ebp)
c010256c:	75 13                	jne    c0102581 <_vsnprintf+0x74a>
c010256e:	8d 45 14             	lea    0x14(%ebp),%eax
c0102571:	83 00 04             	addl   $0x4,(%eax)
c0102574:	8b 45 14             	mov    0x14(%ebp),%eax
c0102577:	83 e8 04             	sub    $0x4,%eax
c010257a:	8b 00                	mov    (%eax),%eax
c010257c:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010257f:	eb 41                	jmp    c01025c2 <_vsnprintf+0x78b>
c0102581:	83 7d 98 68          	cmpl   $0x68,0xffffff98(%ebp)
c0102585:	75 2a                	jne    c01025b1 <_vsnprintf+0x77a>
c0102587:	8d 45 14             	lea    0x14(%ebp),%eax
c010258a:	83 00 04             	addl   $0x4,(%eax)
c010258d:	8b 45 14             	mov    0x14(%ebp),%eax
c0102590:	83 e8 04             	sub    $0x4,%eax
c0102593:	66 8b 00             	mov    (%eax),%ax
c0102596:	25 ff ff 00 00       	and    $0xffff,%eax
c010259b:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010259e:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c01025a1:	83 e0 02             	and    $0x2,%eax
c01025a4:	85 c0                	test   %eax,%eax
c01025a6:	74 1a                	je     c01025c2 <_vsnprintf+0x78b>
c01025a8:	0f bf 45 e8          	movswl 0xffffffe8(%ebp),%eax
c01025ac:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01025af:	eb 11                	jmp    c01025c2 <_vsnprintf+0x78b>
c01025b1:	8d 45 14             	lea    0x14(%ebp),%eax
c01025b4:	83 00 04             	addl   $0x4,(%eax)
c01025b7:	8b 45 14             	mov    0x14(%ebp),%eax
c01025ba:	83 e8 04             	sub    $0x4,%eax
c01025bd:	8b 00                	mov    (%eax),%eax
c01025bf:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01025c2:	83 ec 04             	sub    $0x4,%esp
c01025c5:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01025c8:	50                   	push   %eax
c01025c9:	ff 75 ec             	pushl  0xffffffec(%ebp)
c01025cc:	ff 75 a4             	pushl  0xffffffa4(%ebp)
c01025cf:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01025d2:	89 c2                	mov    %eax,%edx
c01025d4:	c1 fa 1f             	sar    $0x1f,%edx
c01025d7:	52                   	push   %edx
c01025d8:	50                   	push   %eax
c01025d9:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c01025dc:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01025df:	50                   	push   %eax
c01025e0:	e8 42 f6 ff ff       	call   c0101c27 <__makestr>
c01025e5:	83 c4 20             	add    $0x20,%esp
c01025e8:	85 c0                	test   %eax,%eax
c01025ea:	75 05                	jne    c01025f1 <_vsnprintf+0x7ba>
c01025ec:	e9 92 00 00 00       	jmp    c0102683 <_vsnprintf+0x84c>
c01025f1:	83 ec 0c             	sub    $0xc,%esp
c01025f4:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c01025f7:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c01025fa:	c1 e8 04             	shr    $0x4,%eax
c01025fd:	83 e0 01             	and    $0x1,%eax
c0102600:	50                   	push   %eax
c0102601:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102604:	83 e0 01             	and    $0x1,%eax
c0102607:	85 c0                	test   %eax,%eax
c0102609:	74 0c                	je     c0102617 <_vsnprintf+0x7e0>
c010260b:	c7 85 78 ff ff ff 30 	movl   $0x30,0xffffff78(%ebp)
c0102612:	00 00 00 
c0102615:	eb 0a                	jmp    c0102621 <_vsnprintf+0x7ea>
c0102617:	c7 85 78 ff ff ff 20 	movl   $0x20,0xffffff78(%ebp)
c010261e:	00 00 00 
c0102621:	ff b5 78 ff ff ff    	pushl  0xffffff78(%ebp)
c0102627:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c010262a:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c010262d:	50                   	push   %eax
c010262e:	e8 ad f4 ff ff       	call   c0101ae0 <__leading_chars>
c0102633:	83 c4 20             	add    $0x20,%esp
c0102636:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c010263d:	83 ec 0c             	sub    $0xc,%esp
c0102640:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102643:	50                   	push   %eax
c0102644:	e8 77 06 00 00       	call   c0102cc0 <_strlen>
c0102649:	83 c4 10             	add    $0x10,%esp
c010264c:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c010264f:	7c 02                	jl     c0102653 <_vsnprintf+0x81c>
c0102651:	eb 26                	jmp    c0102679 <_vsnprintf+0x842>
c0102653:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102656:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c0102659:	77 28                	ja     c0102683 <_vsnprintf+0x84c>
c010265b:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010265e:	89 c2                	mov    %eax,%edx
c0102660:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102663:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102666:	83 e8 50             	sub    $0x50,%eax
c0102669:	8a 00                	mov    (%eax),%al
c010266b:	88 02                	mov    %al,(%edx)
c010266d:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0102670:	ff 00                	incl   (%eax)
c0102672:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102675:	ff 00                	incl   (%eax)
c0102677:	eb c4                	jmp    c010263d <_vsnprintf+0x806>
c0102679:	8d 45 10             	lea    0x10(%ebp),%eax
c010267c:	ff 00                	incl   (%eax)
c010267e:	e9 ea f7 ff ff       	jmp    c0101e6d <_vsnprintf+0x36>
c0102683:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102686:	c6 00 00             	movb   $0x0,(%eax)
c0102689:	8b 55 08             	mov    0x8(%ebp),%edx
c010268c:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010268f:	29 d0                	sub    %edx,%eax
c0102691:	c9                   	leave  
c0102692:	c3                   	ret    

c0102693 <_snprintf>:
c0102693:	55                   	push   %ebp
c0102694:	89 e5                	mov    %esp,%ebp
c0102696:	83 ec 08             	sub    $0x8,%esp
c0102699:	8d 45 10             	lea    0x10(%ebp),%eax
c010269c:	83 c0 04             	add    $0x4,%eax
c010269f:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01026a2:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01026a5:	ff 75 10             	pushl  0x10(%ebp)
c01026a8:	ff 75 0c             	pushl  0xc(%ebp)
c01026ab:	ff 75 08             	pushl  0x8(%ebp)
c01026ae:	e8 84 f7 ff ff       	call   c0101e37 <_vsnprintf>
c01026b3:	83 c4 10             	add    $0x10,%esp
c01026b6:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01026b9:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01026bc:	c9                   	leave  
c01026bd:	c3                   	ret    

c01026be <_sprintf>:
c01026be:	55                   	push   %ebp
c01026bf:	89 e5                	mov    %esp,%ebp
c01026c1:	83 ec 08             	sub    $0x8,%esp
c01026c4:	8d 45 0c             	lea    0xc(%ebp),%eax
c01026c7:	83 c0 04             	add    $0x4,%eax
c01026ca:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01026cd:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01026d0:	ff 75 0c             	pushl  0xc(%ebp)
c01026d3:	6a ff                	push   $0xffffffff
c01026d5:	ff 75 08             	pushl  0x8(%ebp)
c01026d8:	e8 5a f7 ff ff       	call   c0101e37 <_vsnprintf>
c01026dd:	83 c4 10             	add    $0x10,%esp
c01026e0:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01026e3:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01026e6:	c9                   	leave  
c01026e7:	c3                   	ret    
c01026e8:	90                   	nop    
c01026e9:	90                   	nop    
c01026ea:	90                   	nop    
c01026eb:	90                   	nop    
c01026ec:	90                   	nop    
c01026ed:	90                   	nop    
c01026ee:	90                   	nop    
c01026ef:	90                   	nop    

c01026f0 <_outb>:
c01026f0:	55                   	push   %ebp
c01026f1:	89 e5                	mov    %esp,%ebp
c01026f3:	83 ec 04             	sub    $0x4,%esp
c01026f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01026f9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01026fc:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c0102700:	88 55 fd             	mov    %dl,0xfffffffd(%ebp)
c0102703:	66 8b 55 fe          	mov    0xfffffffe(%ebp),%dx
c0102707:	8a 45 fd             	mov    0xfffffffd(%ebp),%al
c010270a:	ee                   	out    %al,(%dx)
c010270b:	c9                   	leave  
c010270c:	c3                   	ret    

c010270d <_GetColor>:
c010270d:	55                   	push   %ebp
c010270e:	89 e5                	mov    %esp,%ebp
c0102710:	a1 c8 40 10 c0       	mov    0xc01040c8,%eax
c0102715:	5d                   	pop    %ebp
c0102716:	c3                   	ret    

c0102717 <_SetColor>:
c0102717:	55                   	push   %ebp
c0102718:	89 e5                	mov    %esp,%ebp
c010271a:	8b 45 08             	mov    0x8(%ebp),%eax
c010271d:	a3 c8 40 10 c0       	mov    %eax,0xc01040c8
c0102722:	5d                   	pop    %ebp
c0102723:	c3                   	ret    

c0102724 <_SetXY>:
c0102724:	55                   	push   %ebp
c0102725:	89 e5                	mov    %esp,%ebp
c0102727:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c010272c:	48                   	dec    %eax
c010272d:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102730:	76 09                	jbe    c010273b <_SetXY+0x17>
c0102732:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c0102737:	48                   	dec    %eax
c0102738:	89 45 08             	mov    %eax,0x8(%ebp)
c010273b:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c0102740:	48                   	dec    %eax
c0102741:	39 45 08             	cmp    %eax,0x8(%ebp)
c0102744:	76 09                	jbe    c010274f <_SetXY+0x2b>
c0102746:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c010274b:	48                   	dec    %eax
c010274c:	89 45 08             	mov    %eax,0x8(%ebp)
c010274f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102752:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c0102759:	03 45 08             	add    0x8(%ebp),%eax
c010275c:	01 c0                	add    %eax,%eax
c010275e:	a3 c4 40 10 c0       	mov    %eax,0xc01040c4
c0102763:	5d                   	pop    %ebp
c0102764:	c3                   	ret    

c0102765 <_GetXY>:
c0102765:	55                   	push   %ebp
c0102766:	89 e5                	mov    %esp,%ebp
c0102768:	53                   	push   %ebx
c0102769:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c010276c:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c0102771:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0102774:	a1 c4 40 10 c0       	mov    0xc01040c4,%eax
c0102779:	89 d3                	mov    %edx,%ebx
c010277b:	ba 00 00 00 00       	mov    $0x0,%edx
c0102780:	f7 f3                	div    %ebx
c0102782:	89 01                	mov    %eax,(%ecx)
c0102784:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102787:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c010278c:	8d 14 00             	lea    (%eax,%eax,1),%edx
c010278f:	a1 c4 40 10 c0       	mov    0xc01040c4,%eax
c0102794:	89 d3                	mov    %edx,%ebx
c0102796:	ba 00 00 00 00       	mov    $0x0,%edx
c010279b:	f7 f3                	div    %ebx
c010279d:	89 d0                	mov    %edx,%eax
c010279f:	d1 e8                	shr    %eax
c01027a1:	89 01                	mov    %eax,(%ecx)
c01027a3:	5b                   	pop    %ebx
c01027a4:	5d                   	pop    %ebp
c01027a5:	c3                   	ret    

c01027a6 <_SetCursor>:
c01027a6:	55                   	push   %ebp
c01027a7:	89 e5                	mov    %esp,%ebp
c01027a9:	83 ec 08             	sub    $0x8,%esp
c01027ac:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c01027b1:	0f af 45 0c          	imul   0xc(%ebp),%eax
c01027b5:	03 45 08             	add    0x8(%ebp),%eax
c01027b8:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01027bb:	83 ec 08             	sub    $0x8,%esp
c01027be:	6a 0f                	push   $0xf
c01027c0:	68 d4 03 00 00       	push   $0x3d4
c01027c5:	e8 26 ff ff ff       	call   c01026f0 <_outb>
c01027ca:	83 c4 10             	add    $0x10,%esp
c01027cd:	83 ec 08             	sub    $0x8,%esp
c01027d0:	b8 00 00 00 00       	mov    $0x0,%eax
c01027d5:	8a 45 fc             	mov    0xfffffffc(%ebp),%al
c01027d8:	50                   	push   %eax
c01027d9:	68 d5 03 00 00       	push   $0x3d5
c01027de:	e8 0d ff ff ff       	call   c01026f0 <_outb>
c01027e3:	83 c4 10             	add    $0x10,%esp
c01027e6:	83 ec 08             	sub    $0x8,%esp
c01027e9:	6a 0e                	push   $0xe
c01027eb:	68 d4 03 00 00       	push   $0x3d4
c01027f0:	e8 fb fe ff ff       	call   c01026f0 <_outb>
c01027f5:	83 c4 10             	add    $0x10,%esp
c01027f8:	83 ec 08             	sub    $0x8,%esp
c01027fb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01027fe:	c1 f8 08             	sar    $0x8,%eax
c0102801:	25 ff 00 00 00       	and    $0xff,%eax
c0102806:	50                   	push   %eax
c0102807:	68 d5 03 00 00       	push   $0x3d5
c010280c:	e8 df fe ff ff       	call   c01026f0 <_outb>
c0102811:	83 c4 10             	add    $0x10,%esp
c0102814:	c9                   	leave  
c0102815:	c3                   	ret    

c0102816 <_MoveUp>:
c0102816:	55                   	push   %ebp
c0102817:	89 e5                	mov    %esp,%ebp
c0102819:	83 ec 08             	sub    $0x8,%esp
c010281c:	a1 cc 40 10 c0       	mov    0xc01040cc,%eax
c0102821:	01 c0                	add    %eax,%eax
c0102823:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102826:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c010282d:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c0102832:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c0102839:	01 c0                	add    %eax,%eax
c010283b:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
c010283e:	72 02                	jb     c0102842 <_MoveUp+0x2c>
c0102840:	eb 24                	jmp    c0102866 <_MoveUp+0x50>
c0102842:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102845:	8b 15 c0 40 10 c0    	mov    0xc01040c0,%edx
c010284b:	01 c2                	add    %eax,%edx
c010284d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102850:	03 05 c0 40 10 c0    	add    0xc01040c0,%eax
c0102856:	8a 00                	mov    (%eax),%al
c0102858:	88 02                	mov    %al,(%edx)
c010285a:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c010285d:	ff 00                	incl   (%eax)
c010285f:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102862:	ff 00                	incl   (%eax)
c0102864:	eb c7                	jmp    c010282d <_MoveUp+0x17>
c0102866:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c010286b:	48                   	dec    %eax
c010286c:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c0102873:	01 c0                	add    %eax,%eax
c0102875:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102878:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c010287d:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c0102884:	01 c0                	add    %eax,%eax
c0102886:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
c0102889:	72 02                	jb     c010288d <_MoveUp+0x77>
c010288b:	eb 26                	jmp    c01028b3 <_MoveUp+0x9d>
c010288d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102890:	8b 15 c0 40 10 c0    	mov    0xc01040c0,%edx
c0102896:	01 c2                	add    %eax,%edx
c0102898:	a0 c8 40 10 c0       	mov    0xc01040c8,%al
c010289d:	88 02                	mov    %al,(%edx)
c010289f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01028a2:	03 05 c0 40 10 c0    	add    0xc01040c0,%eax
c01028a8:	c6 00 00             	movb   $0x0,(%eax)
c01028ab:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01028ae:	83 00 02             	addl   $0x2,(%eax)
c01028b1:	eb c5                	jmp    c0102878 <_MoveUp+0x62>
c01028b3:	c9                   	leave  
c01028b4:	c3                   	ret    

c01028b5 <_ClearScreen>:
c01028b5:	55                   	push   %ebp
c01028b6:	89 e5                	mov    %esp,%ebp
c01028b8:	83 ec 08             	sub    $0x8,%esp
c01028bb:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01028c2:	81 7d fc 9f 0f 00 00 	cmpl   $0xf9f,0xfffffffc(%ebp)
c01028c9:	7e 02                	jle    c01028cd <_ClearScreen+0x18>
c01028cb:	eb 27                	jmp    c01028f4 <_ClearScreen+0x3f>
c01028cd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01028d0:	03 05 c0 40 10 c0    	add    0xc01040c0,%eax
c01028d6:	c6 00 00             	movb   $0x0,(%eax)
c01028d9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01028dc:	03 05 c0 40 10 c0    	add    0xc01040c0,%eax
c01028e2:	8d 50 01             	lea    0x1(%eax),%edx
c01028e5:	a0 c8 40 10 c0       	mov    0xc01040c8,%al
c01028ea:	88 02                	mov    %al,(%edx)
c01028ec:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01028ef:	83 00 02             	addl   $0x2,(%eax)
c01028f2:	eb ce                	jmp    c01028c2 <_ClearScreen+0xd>
c01028f4:	83 ec 08             	sub    $0x8,%esp
c01028f7:	6a ff                	push   $0xffffffff
c01028f9:	6a ff                	push   $0xffffffff
c01028fb:	e8 a6 fe ff ff       	call   c01027a6 <_SetCursor>
c0102900:	83 c4 10             	add    $0x10,%esp
c0102903:	c7 05 c4 40 10 c0 00 	movl   $0x0,0xc01040c4
c010290a:	00 00 00 
c010290d:	c9                   	leave  
c010290e:	c3                   	ret    

c010290f <_putc>:
c010290f:	55                   	push   %ebp
c0102910:	89 e5                	mov    %esp,%ebp
c0102912:	83 ec 18             	sub    $0x18,%esp
c0102915:	8b 45 08             	mov    0x8(%ebp),%eax
c0102918:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c010291b:	0f be 45 ff          	movsbl 0xffffffff(%ebp),%eax
c010291f:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0102922:	83 7d f0 0a          	cmpl   $0xa,0xfffffff0(%ebp)
c0102926:	74 16                	je     c010293e <_putc+0x2f>
c0102928:	83 7d f0 0a          	cmpl   $0xa,0xfffffff0(%ebp)
c010292c:	7f 08                	jg     c0102936 <_putc+0x27>
c010292e:	83 7d f0 09          	cmpl   $0x9,0xfffffff0(%ebp)
c0102932:	74 56                	je     c010298a <_putc+0x7b>
c0102934:	eb 7c                	jmp    c01029b2 <_putc+0xa3>
c0102936:	83 7d f0 0d          	cmpl   $0xd,0xfffffff0(%ebp)
c010293a:	74 29                	je     c0102965 <_putc+0x56>
c010293c:	eb 74                	jmp    c01029b2 <_putc+0xa3>
c010293e:	83 ec 08             	sub    $0x8,%esp
c0102941:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0102944:	50                   	push   %eax
c0102945:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102948:	50                   	push   %eax
c0102949:	e8 17 fe ff ff       	call   c0102765 <_GetXY>
c010294e:	83 c4 10             	add    $0x10,%esp
c0102951:	83 ec 08             	sub    $0x8,%esp
c0102954:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102957:	40                   	inc    %eax
c0102958:	50                   	push   %eax
c0102959:	6a 00                	push   $0x0
c010295b:	e8 c4 fd ff ff       	call   c0102724 <_SetXY>
c0102960:	83 c4 10             	add    $0x10,%esp
c0102963:	eb 4d                	jmp    c01029b2 <_putc+0xa3>
c0102965:	83 ec 08             	sub    $0x8,%esp
c0102968:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c010296b:	50                   	push   %eax
c010296c:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c010296f:	50                   	push   %eax
c0102970:	e8 f0 fd ff ff       	call   c0102765 <_GetXY>
c0102975:	83 c4 10             	add    $0x10,%esp
c0102978:	83 ec 08             	sub    $0x8,%esp
c010297b:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c010297e:	6a 00                	push   $0x0
c0102980:	e8 9f fd ff ff       	call   c0102724 <_SetXY>
c0102985:	83 c4 10             	add    $0x10,%esp
c0102988:	eb 28                	jmp    c01029b2 <_putc+0xa3>
c010298a:	83 ec 08             	sub    $0x8,%esp
c010298d:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0102990:	50                   	push   %eax
c0102991:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102994:	50                   	push   %eax
c0102995:	e8 cb fd ff ff       	call   c0102765 <_GetXY>
c010299a:	83 c4 10             	add    $0x10,%esp
c010299d:	83 ec 08             	sub    $0x8,%esp
c01029a0:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c01029a3:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01029a6:	83 c0 08             	add    $0x8,%eax
c01029a9:	50                   	push   %eax
c01029aa:	e8 75 fd ff ff       	call   c0102724 <_SetXY>
c01029af:	83 c4 10             	add    $0x10,%esp
c01029b2:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c01029b7:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c01029be:	01 c0                	add    %eax,%eax
c01029c0:	39 05 c4 40 10 c0    	cmp    %eax,0xc01040c4
c01029c6:	72 19                	jb     c01029e1 <_putc+0xd2>
c01029c8:	e8 49 fe ff ff       	call   c0102816 <_MoveUp>
c01029cd:	a1 d0 40 10 c0       	mov    0xc01040d0,%eax
c01029d2:	48                   	dec    %eax
c01029d3:	0f af 05 cc 40 10 c0 	imul   0xc01040cc,%eax
c01029da:	01 c0                	add    %eax,%eax
c01029dc:	a3 c4 40 10 c0       	mov    %eax,0xc01040c4
c01029e1:	80 7d ff 0a          	cmpb   $0xa,0xffffffff(%ebp)
c01029e5:	74 3e                	je     c0102a25 <_putc+0x116>
c01029e7:	80 7d ff 0d          	cmpb   $0xd,0xffffffff(%ebp)
c01029eb:	74 38                	je     c0102a25 <_putc+0x116>
c01029ed:	80 7d ff 09          	cmpb   $0x9,0xffffffff(%ebp)
c01029f1:	74 32                	je     c0102a25 <_putc+0x116>
c01029f3:	a1 c4 40 10 c0       	mov    0xc01040c4,%eax
c01029f8:	89 c2                	mov    %eax,%edx
c01029fa:	03 15 c0 40 10 c0    	add    0xc01040c0,%edx
c0102a00:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c0102a03:	88 02                	mov    %al,(%edx)
c0102a05:	ff 05 c4 40 10 c0    	incl   0xc01040c4
c0102a0b:	a1 c4 40 10 c0       	mov    0xc01040c4,%eax
c0102a10:	89 c2                	mov    %eax,%edx
c0102a12:	03 15 c0 40 10 c0    	add    0xc01040c0,%edx
c0102a18:	a0 c8 40 10 c0       	mov    0xc01040c8,%al
c0102a1d:	88 02                	mov    %al,(%edx)
c0102a1f:	ff 05 c4 40 10 c0    	incl   0xc01040c4
c0102a25:	c9                   	leave  
c0102a26:	c3                   	ret    

c0102a27 <_print>:
c0102a27:	55                   	push   %ebp
c0102a28:	89 e5                	mov    %esp,%ebp
c0102a2a:	83 ec 08             	sub    $0x8,%esp
c0102a2d:	90                   	nop    
c0102a2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a31:	80 38 00             	cmpb   $0x0,(%eax)
c0102a34:	75 02                	jne    c0102a38 <_print+0x11>
c0102a36:	eb 17                	jmp    c0102a4f <_print+0x28>
c0102a38:	83 ec 0c             	sub    $0xc,%esp
c0102a3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a3e:	0f be 00             	movsbl (%eax),%eax
c0102a41:	50                   	push   %eax
c0102a42:	ff 45 08             	incl   0x8(%ebp)
c0102a45:	e8 c5 fe ff ff       	call   c010290f <_putc>
c0102a4a:	83 c4 10             	add    $0x10,%esp
c0102a4d:	eb df                	jmp    c0102a2e <_print+0x7>
c0102a4f:	c9                   	leave  
c0102a50:	c3                   	ret    

c0102a51 <_printf>:
c0102a51:	55                   	push   %ebp
c0102a52:	89 e5                	mov    %esp,%ebp
c0102a54:	81 ec 18 04 00 00    	sub    $0x418,%esp
c0102a5a:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102a5d:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102a60:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c0102a63:	ff 75 08             	pushl  0x8(%ebp)
c0102a66:	6a ff                	push   $0xffffffff
c0102a68:	8d 85 e8 fb ff ff    	lea    0xfffffbe8(%ebp),%eax
c0102a6e:	50                   	push   %eax
c0102a6f:	e8 c3 f3 ff ff       	call   c0101e37 <_vsnprintf>
c0102a74:	83 c4 10             	add    $0x10,%esp
c0102a77:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0102a7a:	83 ec 0c             	sub    $0xc,%esp
c0102a7d:	8d 85 e8 fb ff ff    	lea    0xfffffbe8(%ebp),%eax
c0102a83:	50                   	push   %eax
c0102a84:	e8 9e ff ff ff       	call   c0102a27 <_print>
c0102a89:	83 c4 10             	add    $0x10,%esp
c0102a8c:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0102a8f:	c9                   	leave  
c0102a90:	c3                   	ret    
c0102a91:	90                   	nop    
c0102a92:	90                   	nop    
c0102a93:	90                   	nop    
c0102a94:	90                   	nop    
c0102a95:	90                   	nop    
c0102a96:	90                   	nop    
c0102a97:	90                   	nop    
c0102a98:	90                   	nop    
c0102a99:	90                   	nop    
c0102a9a:	90                   	nop    
c0102a9b:	90                   	nop    
c0102a9c:	90                   	nop    
c0102a9d:	90                   	nop    
c0102a9e:	90                   	nop    
c0102a9f:	90                   	nop    

c0102aa0 <_itoaex>:
c0102aa0:	55                   	push   %ebp
c0102aa1:	89 e5                	mov    %esp,%ebp
c0102aa3:	83 ec 58             	sub    $0x58,%esp
c0102aa6:	c7 45 c0 00 00 00 00 	movl   $0x0,0xffffffc0(%ebp)
c0102aad:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c0102ab1:	74 12                	je     c0102ac5 <_itoaex+0x25>
c0102ab3:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
c0102ab7:	74 0c                	je     c0102ac5 <_itoaex+0x25>
c0102ab9:	c7 45 b4 00 00 00 00 	movl   $0x0,0xffffffb4(%ebp)
c0102ac0:	e9 e4 00 00 00       	jmp    c0102ba9 <_itoaex+0x109>
c0102ac5:	90                   	nop    
c0102ac6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac9:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102acc:	8b 55 b8             	mov    0xffffffb8(%ebp),%edx
c0102acf:	89 d0                	mov    %edx,%eax
c0102ad1:	ba 00 00 00 00       	mov    $0x0,%edx
c0102ad6:	f7 75 10             	divl   0x10(%ebp)
c0102ad9:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102adc:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102adf:	0f af 45 10          	imul   0x10(%ebp),%eax
c0102ae3:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102ae6:	8b 55 b8             	mov    0xffffffb8(%ebp),%edx
c0102ae9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aec:	29 d0                	sub    %edx,%eax
c0102aee:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0102af1:	83 7d c4 09          	cmpl   $0x9,0xffffffc4(%ebp)
c0102af5:	7e 06                	jle    c0102afd <_itoaex+0x5d>
c0102af7:	c6 45 b3 57          	movb   $0x57,0xffffffb3(%ebp)
c0102afb:	eb 04                	jmp    c0102b01 <_itoaex+0x61>
c0102afd:	c6 45 b3 30          	movb   $0x30,0xffffffb3(%ebp)
c0102b01:	8a 55 b3             	mov    0xffffffb3(%ebp),%dl
c0102b04:	88 55 bf             	mov    %dl,0xffffffbf(%ebp)
c0102b07:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102b0a:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102b0d:	01 d0                	add    %edx,%eax
c0102b0f:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0102b12:	8a 45 c4             	mov    0xffffffc4(%ebp),%al
c0102b15:	02 45 bf             	add    0xffffffbf(%ebp),%al
c0102b18:	88 02                	mov    %al,(%edx)
c0102b1a:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102b1d:	ff 00                	incl   (%eax)
c0102b1f:	8b 55 08             	mov    0x8(%ebp),%edx
c0102b22:	89 d0                	mov    %edx,%eax
c0102b24:	ba 00 00 00 00       	mov    $0x0,%edx
c0102b29:	f7 75 10             	divl   0x10(%ebp)
c0102b2c:	89 45 08             	mov    %eax,0x8(%ebp)
c0102b2f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102b33:	75 91                	jne    c0102ac6 <_itoaex+0x26>
c0102b35:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c0102b39:	74 13                	je     c0102b4e <_itoaex+0xae>
c0102b3b:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102b3e:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102b41:	01 d0                	add    %edx,%eax
c0102b43:	83 e8 30             	sub    $0x30,%eax
c0102b46:	c6 00 2d             	movb   $0x2d,(%eax)
c0102b49:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102b4c:	ff 00                	incl   (%eax)
c0102b4e:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102b51:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102b54:	01 d0                	add    %edx,%eax
c0102b56:	83 e8 30             	sub    $0x30,%eax
c0102b59:	c6 00 00             	movb   $0x0,(%eax)
c0102b5c:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102b5f:	ff 08                	decl   (%eax)
c0102b61:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102b64:	40                   	inc    %eax
c0102b65:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0102b68:	c7 45 b8 00 00 00 00 	movl   $0x0,0xffffffb8(%ebp)
c0102b6f:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102b72:	3b 45 c4             	cmp    0xffffffc4(%ebp),%eax
c0102b75:	72 02                	jb     c0102b79 <_itoaex+0xd9>
c0102b77:	eb 21                	jmp    c0102b9a <_itoaex+0xfa>
c0102b79:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102b7c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102b7f:	01 c2                	add    %eax,%edx
c0102b81:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102b84:	03 45 c0             	add    0xffffffc0(%ebp),%eax
c0102b87:	83 e8 30             	sub    $0x30,%eax
c0102b8a:	8a 00                	mov    (%eax),%al
c0102b8c:	88 02                	mov    %al,(%edx)
c0102b8e:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102b91:	ff 08                	decl   (%eax)
c0102b93:	8d 45 b8             	lea    0xffffffb8(%ebp),%eax
c0102b96:	ff 00                	incl   (%eax)
c0102b98:	eb d5                	jmp    c0102b6f <_itoaex+0xcf>
c0102b9a:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102b9d:	03 45 0c             	add    0xc(%ebp),%eax
c0102ba0:	c6 00 00             	movb   $0x0,(%eax)
c0102ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ba6:	89 45 b4             	mov    %eax,0xffffffb4(%ebp)
c0102ba9:	8b 45 b4             	mov    0xffffffb4(%ebp),%eax
c0102bac:	c9                   	leave  
c0102bad:	c3                   	ret    

c0102bae <_itoa>:
c0102bae:	55                   	push   %ebp
c0102baf:	89 e5                	mov    %esp,%ebp
c0102bb1:	83 ec 48             	sub    $0x48,%esp
c0102bb4:	c7 45 c0 00 00 00 00 	movl   $0x0,0xffffffc0(%ebp)
c0102bbb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102bbf:	79 0a                	jns    c0102bcb <_itoa+0x1d>
c0102bc1:	f7 5d 08             	negl   0x8(%ebp)
c0102bc4:	c7 45 c0 01 00 00 00 	movl   $0x1,0xffffffc0(%ebp)
c0102bcb:	ff 75 c0             	pushl  0xffffffc0(%ebp)
c0102bce:	6a 0a                	push   $0xa
c0102bd0:	8d 45 c8             	lea    0xffffffc8(%ebp),%eax
c0102bd3:	50                   	push   %eax
c0102bd4:	ff 75 08             	pushl  0x8(%ebp)
c0102bd7:	e8 c4 fe ff ff       	call   c0102aa0 <_itoaex>
c0102bdc:	83 c4 10             	add    $0x10,%esp
c0102bdf:	c7 45 c4 00 00 00 00 	movl   $0x0,0xffffffc4(%ebp)
c0102be6:	83 ec 0c             	sub    $0xc,%esp
c0102be9:	8d 45 c8             	lea    0xffffffc8(%ebp),%eax
c0102bec:	50                   	push   %eax
c0102bed:	e8 ce 00 00 00       	call   c0102cc0 <_strlen>
c0102bf2:	83 c4 10             	add    $0x10,%esp
c0102bf5:	39 45 c4             	cmp    %eax,0xffffffc4(%ebp)
c0102bf8:	7c 02                	jl     c0102bfc <_itoa+0x4e>
c0102bfa:	eb 1c                	jmp    c0102c18 <_itoa+0x6a>
c0102bfc:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0102bff:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c02:	01 c2                	add    %eax,%edx
c0102c04:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102c07:	03 45 c4             	add    0xffffffc4(%ebp),%eax
c0102c0a:	83 e8 30             	sub    $0x30,%eax
c0102c0d:	8a 00                	mov    (%eax),%al
c0102c0f:	88 02                	mov    %al,(%edx)
c0102c11:	8d 45 c4             	lea    0xffffffc4(%ebp),%eax
c0102c14:	ff 00                	incl   (%eax)
c0102c16:	eb ce                	jmp    c0102be6 <_itoa+0x38>
c0102c18:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0102c1b:	03 45 0c             	add    0xc(%ebp),%eax
c0102c1e:	c6 00 00             	movb   $0x0,(%eax)
c0102c21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c24:	c9                   	leave  
c0102c25:	c3                   	ret    

c0102c26 <_atoi>:
c0102c26:	55                   	push   %ebp
c0102c27:	89 e5                	mov    %esp,%ebp
c0102c29:	83 ec 18             	sub    $0x18,%esp
c0102c2c:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0102c33:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0102c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c3d:	80 38 2d             	cmpb   $0x2d,(%eax)
c0102c40:	75 0a                	jne    c0102c4c <_atoi+0x26>
c0102c42:	c7 45 f0 01 00 00 00 	movl   $0x1,0xfffffff0(%ebp)
c0102c49:	ff 45 08             	incl   0x8(%ebp)
c0102c4c:	83 ec 0c             	sub    $0xc,%esp
c0102c4f:	ff 75 08             	pushl  0x8(%ebp)
c0102c52:	e8 69 00 00 00       	call   c0102cc0 <_strlen>
c0102c57:	83 c4 10             	add    $0x10,%esp
c0102c5a:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102c5d:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c0102c64:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102c67:	3b 45 fc             	cmp    0xfffffffc(%ebp),%eax
c0102c6a:	7c 02                	jl     c0102c6e <_atoi+0x48>
c0102c6c:	eb 32                	jmp    c0102ca0 <_atoi+0x7a>
c0102c6e:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102c71:	03 45 08             	add    0x8(%ebp),%eax
c0102c74:	0f be 00             	movsbl (%eax),%eax
c0102c77:	03 45 f4             	add    0xfffffff4(%ebp),%eax
c0102c7a:	83 e8 30             	sub    $0x30,%eax
c0102c7d:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102c80:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102c83:	48                   	dec    %eax
c0102c84:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
c0102c87:	74 10                	je     c0102c99 <_atoi+0x73>
c0102c89:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102c8c:	89 c2                	mov    %eax,%edx
c0102c8e:	c1 e2 02             	shl    $0x2,%edx
c0102c91:	01 c2                	add    %eax,%edx
c0102c93:	8d 04 12             	lea    (%edx,%edx,1),%eax
c0102c96:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102c99:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102c9c:	ff 00                	incl   (%eax)
c0102c9e:	eb c4                	jmp    c0102c64 <_atoi+0x3e>
c0102ca0:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c0102ca4:	74 0a                	je     c0102cb0 <_atoi+0x8a>
c0102ca6:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102ca9:	f7 d8                	neg    %eax
c0102cab:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102cae:	eb 06                	jmp    c0102cb6 <_atoi+0x90>
c0102cb0:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102cb3:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102cb6:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0102cb9:	c9                   	leave  
c0102cba:	c3                   	ret    
c0102cbb:	90                   	nop    
c0102cbc:	90                   	nop    
c0102cbd:	90                   	nop    
c0102cbe:	90                   	nop    
c0102cbf:	90                   	nop    

c0102cc0 <_strlen>:
c0102cc0:	55                   	push   %ebp
c0102cc1:	89 e5                	mov    %esp,%ebp
c0102cc3:	83 ec 04             	sub    $0x4,%esp
c0102cc6:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102ccd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cd0:	ff 45 08             	incl   0x8(%ebp)
c0102cd3:	80 38 00             	cmpb   $0x0,(%eax)
c0102cd6:	75 02                	jne    c0102cda <_strlen+0x1a>
c0102cd8:	eb 07                	jmp    c0102ce1 <_strlen+0x21>
c0102cda:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102cdd:	ff 00                	incl   (%eax)
c0102cdf:	eb ec                	jmp    c0102ccd <_strlen+0xd>
c0102ce1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102ce4:	c9                   	leave  
c0102ce5:	c3                   	ret    

c0102ce6 <__strupr>:
c0102ce6:	55                   	push   %ebp
c0102ce7:	89 e5                	mov    %esp,%ebp
c0102ce9:	83 ec 08             	sub    $0x8,%esp
c0102cec:	83 ec 0c             	sub    $0xc,%esp
c0102cef:	ff 75 08             	pushl  0x8(%ebp)
c0102cf2:	e8 c9 ff ff ff       	call   c0102cc0 <_strlen>
c0102cf7:	83 c4 10             	add    $0x10,%esp
c0102cfa:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102cfd:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102d04:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d07:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0102d0a:	7c 02                	jl     c0102d0e <__strupr+0x28>
c0102d0c:	eb 32                	jmp    c0102d40 <__strupr+0x5a>
c0102d0e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d11:	03 45 08             	add    0x8(%ebp),%eax
c0102d14:	80 38 60             	cmpb   $0x60,(%eax)
c0102d17:	7e 20                	jle    c0102d39 <__strupr+0x53>
c0102d19:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d1c:	03 45 08             	add    0x8(%ebp),%eax
c0102d1f:	80 38 7a             	cmpb   $0x7a,(%eax)
c0102d22:	7f 15                	jg     c0102d39 <__strupr+0x53>
c0102d24:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d27:	8b 55 08             	mov    0x8(%ebp),%edx
c0102d2a:	01 c2                	add    %eax,%edx
c0102d2c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d2f:	03 45 08             	add    0x8(%ebp),%eax
c0102d32:	8a 00                	mov    (%eax),%al
c0102d34:	83 e0 5f             	and    $0x5f,%eax
c0102d37:	88 02                	mov    %al,(%edx)
c0102d39:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102d3c:	ff 00                	incl   (%eax)
c0102d3e:	eb c4                	jmp    c0102d04 <__strupr+0x1e>
c0102d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d43:	c9                   	leave  
c0102d44:	c3                   	ret    

c0102d45 <__strlwr>:
c0102d45:	55                   	push   %ebp
c0102d46:	89 e5                	mov    %esp,%ebp
c0102d48:	83 ec 08             	sub    $0x8,%esp
c0102d4b:	83 ec 0c             	sub    $0xc,%esp
c0102d4e:	ff 75 08             	pushl  0x8(%ebp)
c0102d51:	e8 6a ff ff ff       	call   c0102cc0 <_strlen>
c0102d56:	83 c4 10             	add    $0x10,%esp
c0102d59:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102d5c:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102d63:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d66:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0102d69:	7c 02                	jl     c0102d6d <__strlwr+0x28>
c0102d6b:	eb 32                	jmp    c0102d9f <__strlwr+0x5a>
c0102d6d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d70:	03 45 08             	add    0x8(%ebp),%eax
c0102d73:	80 38 40             	cmpb   $0x40,(%eax)
c0102d76:	7e 20                	jle    c0102d98 <__strlwr+0x53>
c0102d78:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d7b:	03 45 08             	add    0x8(%ebp),%eax
c0102d7e:	80 38 5a             	cmpb   $0x5a,(%eax)
c0102d81:	7f 15                	jg     c0102d98 <__strlwr+0x53>
c0102d83:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d86:	8b 55 08             	mov    0x8(%ebp),%edx
c0102d89:	01 c2                	add    %eax,%edx
c0102d8b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d8e:	03 45 08             	add    0x8(%ebp),%eax
c0102d91:	8a 00                	mov    (%eax),%al
c0102d93:	83 c8 20             	or     $0x20,%eax
c0102d96:	88 02                	mov    %al,(%edx)
c0102d98:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102d9b:	ff 00                	incl   (%eax)
c0102d9d:	eb c4                	jmp    c0102d63 <__strlwr+0x1e>
c0102d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102da2:	c9                   	leave  
c0102da3:	c3                   	ret    

c0102da4 <_memset>:
c0102da4:	55                   	push   %ebp
c0102da5:	89 e5                	mov    %esp,%ebp
c0102da7:	83 ec 04             	sub    $0x4,%esp
c0102daa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dad:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102db0:	8d 45 10             	lea    0x10(%ebp),%eax
c0102db3:	ff 08                	decl   (%eax)
c0102db5:	83 7d 10 ff          	cmpl   $0xffffffff,0x10(%ebp)
c0102db9:	75 02                	jne    c0102dbd <_memset+0x19>
c0102dbb:	eb 11                	jmp    c0102dce <_memset+0x2a>
c0102dbd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102dc0:	89 c2                	mov    %eax,%edx
c0102dc2:	8a 45 0c             	mov    0xc(%ebp),%al
c0102dc5:	88 02                	mov    %al,(%edx)
c0102dc7:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102dca:	ff 00                	incl   (%eax)
c0102dcc:	eb e2                	jmp    c0102db0 <_memset+0xc>
c0102dce:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dd1:	c9                   	leave  
c0102dd2:	c3                   	ret    

c0102dd3 <_memcpy>:
c0102dd3:	55                   	push   %ebp
c0102dd4:	89 e5                	mov    %esp,%ebp
c0102dd6:	83 ec 08             	sub    $0x8,%esp
c0102dd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ddc:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102de2:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102de5:	8d 45 10             	lea    0x10(%ebp),%eax
c0102de8:	ff 08                	decl   (%eax)
c0102dea:	83 7d 10 ff          	cmpl   $0xffffffff,0x10(%ebp)
c0102dee:	75 02                	jne    c0102df2 <_memcpy+0x1f>
c0102df0:	eb 18                	jmp    c0102e0a <_memcpy+0x37>
c0102df2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102df5:	89 c2                	mov    %eax,%edx
c0102df7:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102dfa:	8a 00                	mov    (%eax),%al
c0102dfc:	88 02                	mov    %al,(%edx)
c0102dfe:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102e01:	ff 00                	incl   (%eax)
c0102e03:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102e06:	ff 00                	incl   (%eax)
c0102e08:	eb db                	jmp    c0102de5 <_memcpy+0x12>
c0102e0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e0d:	c9                   	leave  
c0102e0e:	c3                   	ret    
c0102e0f:	90                   	nop    

c0102e10 <.text>:
c0102e10:	65 6e                	outsb  %gs:(%esi),(%dx)
c0102e12:	64 20 6f 66          	and    %ch,%fs:0x66(%edi)
c0102e16:	20 4b 65             	and    %cl,0x65(%ebx)
c0102e19:	72 6e                	jb     c0102e89 <_KePanic+0x8>
c0102e1b:	65                   	gs
c0102e1c:	6c                   	insb   (%dx),%es:(%edi)
c0102e1d:	4d                   	dec    %ebp
c0102e1e:	61                   	popa   
c0102e1f:	69 6e 00 55 89 e5 83 	imul   $0x83e58955,0x0(%esi),%ebp

c0102e22 <_KernelMain>:
c0102e22:	55                   	push   %ebp
c0102e23:	89 e5                	mov    %esp,%ebp
c0102e25:	83 ec 08             	sub    $0x8,%esp
c0102e28:	e8 17 00 00 00       	call   c0102e44 <_KeInit>
c0102e2d:	e8 93 01 00 00       	call   c0102fc5 <_MmInit>
c0102e32:	83 ec 0c             	sub    $0xc,%esp
c0102e35:	68 10 2e 10 c0       	push   $0xc0102e10
c0102e3a:	e8 12 fc ff ff       	call   c0102a51 <_printf>
c0102e3f:	83 c4 10             	add    $0x10,%esp
c0102e42:	eb fe                	jmp    c0102e42 <_KernelMain+0x20>

c0102e44 <_KeInit>:
c0102e44:	55                   	push   %ebp
c0102e45:	89 e5                	mov    %esp,%ebp
c0102e47:	83 ec 08             	sub    $0x8,%esp
c0102e4a:	e8 0c 00 00 00       	call   c0102e5b <_KeGetCubekrnlSize>
c0102e4f:	05 00 00 10 00       	add    $0x100000,%eax
c0102e54:	a3 10 69 10 c0       	mov    %eax,0xc0106910
c0102e59:	c9                   	leave  
c0102e5a:	c3                   	ret    

c0102e5b <_KeGetCubekrnlSize>:
c0102e5b:	55                   	push   %ebp
c0102e5c:	89 e5                	mov    %esp,%ebp
c0102e5e:	a1 04 f0 00 c0       	mov    0xc000f004,%eax
c0102e63:	a3 00 69 10 c0       	mov    %eax,0xc0106900
c0102e68:	a1 00 69 10 c0       	mov    0xc0106900,%eax
c0102e6d:	5d                   	pop    %ebp
c0102e6e:	c3                   	ret    
c0102e6f:	0a 4b 45             	or     0x45(%ebx),%cl
c0102e72:	52                   	push   %edx
c0102e73:	4e                   	dec    %esi
c0102e74:	45                   	inc    %ebp
c0102e75:	4c                   	dec    %esp
c0102e76:	20 50 41             	and    %dl,0x41(%eax)
c0102e79:	4e                   	dec    %esi
c0102e7a:	49                   	dec    %ecx
c0102e7b:	43                   	inc    %ebx
c0102e7c:	3a 20                	cmp    (%eax),%ah
c0102e7e:	25 73 00 55 89       	and    $0x89550073,%eax

c0102e81 <_KePanic>:
c0102e81:	55                   	push   %ebp
c0102e82:	89 e5                	mov    %esp,%ebp
c0102e84:	83 ec 08             	sub    $0x8,%esp
c0102e87:	83 ec 08             	sub    $0x8,%esp
c0102e8a:	ff 75 08             	pushl  0x8(%ebp)
c0102e8d:	68 6f 2e 10 c0       	push   $0xc0102e6f
c0102e92:	e8 ba fb ff ff       	call   c0102a51 <_printf>
c0102e97:	83 c4 10             	add    $0x10,%esp
c0102e9a:	e8 80 00 00 00       	call   c0102f1f <_KeHaltCPU>
c0102e9f:	c9                   	leave  
c0102ea0:	c3                   	ret    
c0102ea1:	4b                   	dec    %ebx
c0102ea2:	45                   	inc    %ebp
c0102ea3:	52                   	push   %edx
c0102ea4:	4e                   	dec    %esi
c0102ea5:	45                   	inc    %ebp
c0102ea6:	4c                   	dec    %esp
c0102ea7:	20 50 41             	and    %dl,0x41(%eax)
c0102eaa:	4e                   	dec    %esi
c0102eab:	49                   	dec    %ecx
c0102eac:	43                   	inc    %ebx
c0102ead:	3a 20                	cmp    (%eax),%ah
	...

c0102eb0 <_KePanicStr>:
c0102eb0:	55                   	push   %ebp
c0102eb1:	89 e5                	mov    %esp,%ebp
c0102eb3:	81 ec 18 04 00 00    	sub    $0x418,%esp
c0102eb9:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102ebc:	89 85 f4 fb ff ff    	mov    %eax,0xfffffbf4(%ebp)
c0102ec2:	83 ec 0c             	sub    $0xc,%esp
c0102ec5:	68 a1 2e 10 c0       	push   $0xc0102ea1
c0102eca:	e8 82 fb ff ff       	call   c0102a51 <_printf>
c0102ecf:	83 c4 10             	add    $0x10,%esp
c0102ed2:	ff b5 f4 fb ff ff    	pushl  0xfffffbf4(%ebp)
c0102ed8:	ff 75 08             	pushl  0x8(%ebp)
c0102edb:	6a ff                	push   $0xffffffff
c0102edd:	8d 85 f8 fb ff ff    	lea    0xfffffbf8(%ebp),%eax
c0102ee3:	50                   	push   %eax
c0102ee4:	e8 4e ef ff ff       	call   c0101e37 <_vsnprintf>
c0102ee9:	83 c4 10             	add    $0x10,%esp
c0102eec:	83 ec 0c             	sub    $0xc,%esp
c0102eef:	8d 85 f8 fb ff ff    	lea    0xfffffbf8(%ebp),%eax
c0102ef5:	50                   	push   %eax
c0102ef6:	e8 2c fb ff ff       	call   c0102a27 <_print>
c0102efb:	83 c4 10             	add    $0x10,%esp
c0102efe:	e8 1c 00 00 00       	call   c0102f1f <_KeHaltCPU>
c0102f03:	c9                   	leave  
c0102f04:	c3                   	ret    

c0102f05 <_KeInitializeSpinlock>:
c0102f05:	55                   	push   %ebp
c0102f06:	89 e5                	mov    %esp,%ebp
c0102f08:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f0b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102f11:	5d                   	pop    %ebp
c0102f12:	c3                   	ret    

c0102f13 <_KeAcquireSpinlock>:
c0102f13:	55                   	push   %ebp
c0102f14:	89 e5                	mov    %esp,%ebp
c0102f16:	fa                   	cli    
c0102f17:	5d                   	pop    %ebp
c0102f18:	c3                   	ret    

c0102f19 <_KeReleaseSpinlock>:
c0102f19:	55                   	push   %ebp
c0102f1a:	89 e5                	mov    %esp,%ebp
c0102f1c:	fb                   	sti    
c0102f1d:	5d                   	pop    %ebp
c0102f1e:	c3                   	ret    

c0102f1f <_KeHaltCPU>:
c0102f1f:	55                   	push   %ebp
c0102f20:	89 e5                	mov    %esp,%ebp
c0102f22:	83 ec 08             	sub    $0x8,%esp
c0102f25:	fa                   	cli    
c0102f26:	e8 e2 e0 ff ff       	call   c010100d <_HALIdleThread>
c0102f2b:	c9                   	leave  
c0102f2c:	c3                   	ret    

c0102f2d <_KeHeapAlloc>:
c0102f2d:	55                   	push   %ebp
c0102f2e:	89 e5                	mov    %esp,%ebp
c0102f30:	83 ec 08             	sub    $0x8,%esp
c0102f33:	83 ec 08             	sub    $0x8,%esp
c0102f36:	ff 75 08             	pushl  0x8(%ebp)
c0102f39:	68 40 69 10 c0       	push   $0xc0106940
c0102f3e:	e8 2a 05 00 00       	call   c010346d <_MmHeapAlloc>
c0102f43:	83 c4 10             	add    $0x10,%esp
c0102f46:	c9                   	leave  
c0102f47:	c3                   	ret    

c0102f48 <_KeHeapFree>:
c0102f48:	55                   	push   %ebp
c0102f49:	89 e5                	mov    %esp,%ebp
c0102f4b:	83 ec 08             	sub    $0x8,%esp
c0102f4e:	83 ec 08             	sub    $0x8,%esp
c0102f51:	ff 75 08             	pushl  0x8(%ebp)
c0102f54:	68 40 69 10 c0       	push   $0xc0106940
c0102f59:	e8 b0 06 00 00       	call   c010360e <_MmHeapFree>
c0102f5e:	83 c4 10             	add    $0x10,%esp
c0102f61:	c9                   	leave  
c0102f62:	c3                   	ret    

c0102f63 <_KeAttachProcess>:
c0102f63:	55                   	push   %ebp
c0102f64:	89 e5                	mov    %esp,%ebp
c0102f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f69:	8b 40 0c             	mov    0xc(%eax),%eax
c0102f6c:	0f 22 d8             	mov    %eax,%cr3
c0102f6f:	5d                   	pop    %ebp
c0102f70:	c3                   	ret    
c0102f71:	90                   	nop    
c0102f72:	90                   	nop    
c0102f73:	90                   	nop    
c0102f74:	90                   	nop    
c0102f75:	90                   	nop    
c0102f76:	90                   	nop    
c0102f77:	90                   	nop    
c0102f78:	90                   	nop    
c0102f79:	90                   	nop    
c0102f7a:	90                   	nop    
c0102f7b:	90                   	nop    
c0102f7c:	90                   	nop    
c0102f7d:	90                   	nop    
c0102f7e:	90                   	nop    
c0102f7f:	90                   	nop    

c0102f80 <.text>:
c0102f80:	66 69 72 73 74 5f    	imul   $0x5f74,0x73(%edx),%si
c0102f86:	6d                   	insl   (%dx),%es:(%edi)
c0102f87:	61                   	popa   
c0102f88:	70 2d                	jo     c0102fb7 <.text+0x37>
c0102f8a:	3e 73 69             	jae,pt c0102ff6 <_MmInit+0x31>
c0102f8d:	7a 65                	jp     c0102ff4 <_MmInit+0x2f>
c0102f8f:	20 3e                	and    %bh,(%esi)
c0102f91:	20 6b 65             	and    %ch,0x65(%ebx)
c0102f94:	72 6e                	jb     c0103004 <_MmInit+0x3f>
c0102f96:	65                   	gs
c0102f97:	6c                   	insb   (%dx),%es:(%edi)
c0102f98:	5f                   	pop    %edi
c0102f99:	73 69                	jae    c0103004 <_MmInit+0x3f>
c0102f9b:	7a 65                	jp     c0103002 <_MmInit+0x3d>
c0102f9d:	20 2b                	and    %ch,(%ebx)
c0102f9f:	20 4e 4f             	and    %cl,0x4f(%esi)
c0102fa2:	4e                   	dec    %esi
c0102fa3:	5f                   	pop    %edi
c0102fa4:	50                   	push   %eax
c0102fa5:	41                   	inc    %ecx
c0102fa6:	47                   	inc    %edi
c0102fa7:	45                   	inc    %ebp
c0102fa8:	44                   	inc    %esp
c0102fa9:	5f                   	pop    %edi
c0102faa:	50                   	push   %eax
c0102fab:	4f                   	dec    %edi
c0102fac:	4f                   	dec    %edi
c0102fad:	4c                   	dec    %esp
c0102fae:	5f                   	pop    %edi
c0102faf:	53                   	push   %ebx
c0102fb0:	49                   	dec    %ecx
c0102fb1:	5a                   	pop    %edx
c0102fb2:	45                   	inc    %ebp
c0102fb3:	00 6d 6d             	add    %ch,0x6d(%ebp)
c0102fb6:	2f                   	das    
c0102fb7:	6d                   	insl   (%dx),%es:(%edi)
c0102fb8:	6d                   	insl   (%dx),%es:(%edi)
c0102fb9:	2e 63 00             	arpl   %ax,%cs:(%eax)
c0102fbc:	25 73 3a 25 64       	and    $0x64253a73,%eax
c0102fc1:	20 25 73 00 55 89    	and    %ah,0x89550073

c0102fc5 <_MmInit>:
c0102fc5:	55                   	push   %ebp
c0102fc6:	89 e5                	mov    %esp,%ebp
c0102fc8:	83 ec 18             	sub    $0x18,%esp
c0102fcb:	e8 f6 0c 00 00       	call   c0103cc6 <_i386MmGetPageDirSize>
c0102fd0:	03 05 00 69 10 c0    	add    0xc0106900,%eax
c0102fd6:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102fd9:	e8 de 0c 00 00       	call   c0103cbc <_i386MmGetFreeMemoryList>
c0102fde:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102fe1:	83 ec 0c             	sub    $0xc,%esp
c0102fe4:	68 e8 68 10 c0       	push   $0xc01068e8
c0102fe9:	e8 17 ff ff ff       	call   c0102f05 <_KeInitializeSpinlock>
c0102fee:	83 c4 10             	add    $0x10,%esp
c0102ff1:	c7 05 e0 68 10 c0 00 	movl   $0x0,0xc01068e0
c0102ff8:	00 00 00 
c0102ffb:	c7 05 e4 68 10 c0 00 	movl   $0x0,0xc01068e4
c0103002:	00 00 00 
c0103005:	c7 05 ec 68 10 c0 00 	movl   $0x0,0xc01068ec
c010300c:	00 00 00 
c010300f:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103012:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c0103017:	a3 60 69 10 c0       	mov    %eax,0xc0106960
c010301c:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c010301f:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0103022:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103025:	8b 00                	mov    (%eax),%eax
c0103027:	c1 e8 0c             	shr    $0xc,%eax
c010302a:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010302d:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0103034:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103037:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010303a:	3b 42 04             	cmp    0x4(%edx),%eax
c010303d:	72 05                	jb     c0103044 <_MmInit+0x7f>
c010303f:	e9 87 00 00 00       	jmp    c01030cb <_MmInit+0x106>
c0103044:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103047:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010304e:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c0103053:	c7 44 10 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,1)
c010305a:	00 
c010305b:	83 3d e0 68 10 c0 00 	cmpl   $0x0,0xc01068e0
c0103062:	75 13                	jne    c0103077 <_MmInit+0xb2>
c0103064:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103067:	c1 e0 03             	shl    $0x3,%eax
c010306a:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c0103070:	a3 e0 68 10 c0       	mov    %eax,0xc01068e0
c0103075:	eb 14                	jmp    c010308b <_MmInit+0xc6>
c0103077:	8b 15 e4 68 10 c0    	mov    0xc01068e4,%edx
c010307d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103080:	c1 e0 03             	shl    $0x3,%eax
c0103083:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c0103089:	89 02                	mov    %eax,(%edx)
c010308b:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010308e:	c1 e0 03             	shl    $0x3,%eax
c0103091:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c0103097:	a3 e4 68 10 c0       	mov    %eax,0xc01068e4
c010309c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010309f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01030a6:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c01030ab:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
c01030b2:	ff 05 ec 68 10 c0    	incl   0xc01068ec
c01030b8:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01030bb:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c01030c1:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01030c4:	ff 00                	incl   (%eax)
c01030c6:	e9 69 ff ff ff       	jmp    c0103034 <_MmInit+0x6f>
c01030cb:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c01030ce:	83 00 08             	addl   $0x8,(%eax)
c01030d1:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01030d4:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c01030d8:	0f 85 44 ff ff ff    	jne    c0103022 <_MmInit+0x5d>
c01030de:	a1 30 69 10 c0       	mov    0xc0106930,%eax
c01030e3:	c1 e8 0c             	shr    $0xc,%eax
c01030e6:	c1 e0 03             	shl    $0x3,%eax
c01030e9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01030ee:	89 c2                	mov    %eax,%edx
c01030f0:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c01030f6:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c01030f9:	01 10                	add    %edx,(%eax)
c01030fb:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
c01030fe:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103101:	05 00 00 40 00       	add    $0x400000,%eax
c0103106:	39 42 04             	cmp    %eax,0x4(%edx)
c0103109:	77 19                	ja     c0103124 <_MmInit+0x15f>
c010310b:	68 80 2f 10 c0       	push   $0xc0102f80
c0103110:	6a 6a                	push   $0x6a
c0103112:	68 b4 2f 10 c0       	push   $0xc0102fb4
c0103117:	68 bc 2f 10 c0       	push   $0xc0102fbc
c010311c:	e8 8f fd ff ff       	call   c0102eb0 <_KePanicStr>
c0103121:	83 c4 10             	add    $0x10,%esp
c0103124:	6a 00                	push   $0x0
c0103126:	68 00 00 40 00       	push   $0x400000
c010312b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010312e:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c0103133:	50                   	push   %eax
c0103134:	68 40 69 10 c0       	push   $0xc0106940
c0103139:	e8 a7 02 00 00       	call   c01033e5 <_MmCreateHeap>
c010313e:	83 c4 10             	add    $0x10,%esp
c0103141:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0103144:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c010314a:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0103151:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103154:	3b 45 f4             	cmp    0xfffffff4(%ebp),%eax
c0103157:	72 05                	jb     c010315e <_MmInit+0x199>
c0103159:	e9 b4 00 00 00       	jmp    c0103212 <_MmInit+0x24d>
c010315e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103161:	05 00 00 10 00       	add    $0x100000,%eax
c0103166:	c1 e8 0c             	shr    $0xc,%eax
c0103169:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010316c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010316f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0103176:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c010317b:	ff 44 10 04          	incl   0x4(%eax,%edx,1)
c010317f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103182:	c1 e0 03             	shl    $0x3,%eax
c0103185:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c010318b:	39 05 e0 68 10 c0    	cmp    %eax,0xc01068e0
c0103191:	74 54                	je     c01031e7 <_MmInit+0x222>
c0103193:	83 3d e0 68 10 c0 00 	cmpl   $0x0,0xc01068e0
c010319a:	74 2f                	je     c01031cb <_MmInit+0x206>
c010319c:	a1 e0 68 10 c0       	mov    0xc01068e0,%eax
c01031a1:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01031a4:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01031a7:	83 38 00             	cmpl   $0x0,(%eax)
c01031aa:	74 1f                	je     c01031cb <_MmInit+0x206>
c01031ac:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c01031af:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01031b2:	c1 e0 03             	shl    $0x3,%eax
c01031b5:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c01031bb:	39 02                	cmp    %eax,(%edx)
c01031bd:	75 02                	jne    c01031c1 <_MmInit+0x1fc>
c01031bf:	eb 0a                	jmp    c01031cb <_MmInit+0x206>
c01031c1:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01031c4:	8b 00                	mov    (%eax),%eax
c01031c6:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01031c9:	eb d9                	jmp    c01031a4 <_MmInit+0x1df>
c01031cb:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01031ce:	83 38 00             	cmpl   $0x0,(%eax)
c01031d1:	74 31                	je     c0103204 <_MmInit+0x23f>
c01031d3:	ff 0d ec 68 10 c0    	decl   0xc01068ec
c01031d9:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c01031dc:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01031df:	8b 00                	mov    (%eax),%eax
c01031e1:	8b 00                	mov    (%eax),%eax
c01031e3:	89 02                	mov    %eax,(%edx)
c01031e5:	eb 1d                	jmp    c0103204 <_MmInit+0x23f>
c01031e7:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01031ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01031f1:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c01031f6:	8b 04 10             	mov    (%eax,%edx,1),%eax
c01031f9:	a3 e0 68 10 c0       	mov    %eax,0xc01068e0
c01031fe:	ff 0d ec 68 10 c0    	decl   0xc01068ec
c0103204:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0103207:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c010320d:	e9 3f ff ff ff       	jmp    c0103151 <_MmInit+0x18c>
c0103212:	c9                   	leave  
c0103213:	c3                   	ret    

c0103214 <_MmAllocPhysPage>:
c0103214:	55                   	push   %ebp
c0103215:	89 e5                	mov    %esp,%ebp
c0103217:	83 ec 18             	sub    $0x18,%esp
c010321a:	83 ec 0c             	sub    $0xc,%esp
c010321d:	68 e8 68 10 c0       	push   $0xc01068e8
c0103222:	e8 ec fc ff ff       	call   c0102f13 <_KeAcquireSpinlock>
c0103227:	83 c4 10             	add    $0x10,%esp
c010322a:	a1 e0 68 10 c0       	mov    0xc01068e0,%eax
c010322f:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103232:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c0103236:	75 1c                	jne    c0103254 <_MmAllocPhysPage+0x40>
c0103238:	83 ec 0c             	sub    $0xc,%esp
c010323b:	68 e8 68 10 c0       	push   $0xc01068e8
c0103240:	e8 d4 fc ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c0103245:	83 c4 10             	add    $0x10,%esp
c0103248:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c010324f:	e9 95 00 00 00       	jmp    c01032e9 <_MmAllocPhysPage+0xd5>
c0103254:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103257:	ff 40 04             	incl   0x4(%eax)
c010325a:	a1 e0 68 10 c0       	mov    0xc01068e0,%eax
c010325f:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0103262:	74 4b                	je     c01032af <_MmAllocPhysPage+0x9b>
c0103264:	83 3d e0 68 10 c0 00 	cmpl   $0x0,0xc01068e0
c010326b:	74 26                	je     c0103293 <_MmAllocPhysPage+0x7f>
c010326d:	a1 e0 68 10 c0       	mov    0xc01068e0,%eax
c0103272:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103275:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103278:	83 38 00             	cmpl   $0x0,(%eax)
c010327b:	74 16                	je     c0103293 <_MmAllocPhysPage+0x7f>
c010327d:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103280:	8b 00                	mov    (%eax),%eax
c0103282:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0103285:	75 02                	jne    c0103289 <_MmAllocPhysPage+0x75>
c0103287:	eb 0a                	jmp    c0103293 <_MmAllocPhysPage+0x7f>
c0103289:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010328c:	8b 00                	mov    (%eax),%eax
c010328e:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103291:	eb e2                	jmp    c0103275 <_MmAllocPhysPage+0x61>
c0103293:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103296:	83 38 00             	cmpl   $0x0,(%eax)
c0103299:	74 24                	je     c01032bf <_MmAllocPhysPage+0xab>
c010329b:	ff 0d ec 68 10 c0    	decl   0xc01068ec
c01032a1:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
c01032a4:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01032a7:	8b 00                	mov    (%eax),%eax
c01032a9:	8b 00                	mov    (%eax),%eax
c01032ab:	89 02                	mov    %eax,(%edx)
c01032ad:	eb 10                	jmp    c01032bf <_MmAllocPhysPage+0xab>
c01032af:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01032b2:	8b 00                	mov    (%eax),%eax
c01032b4:	a3 e0 68 10 c0       	mov    %eax,0xc01068e0
c01032b9:	ff 0d ec 68 10 c0    	decl   0xc01068ec
c01032bf:	8b 15 60 69 10 c0    	mov    0xc0106960,%edx
c01032c5:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01032c8:	29 d0                	sub    %edx,%eax
c01032ca:	c1 e8 03             	shr    $0x3,%eax
c01032cd:	c1 e0 0c             	shl    $0xc,%eax
c01032d0:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01032d3:	83 ec 0c             	sub    $0xc,%esp
c01032d6:	68 e8 68 10 c0       	push   $0xc01068e8
c01032db:	e8 39 fc ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c01032e0:	83 c4 10             	add    $0x10,%esp
c01032e3:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01032e6:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01032e9:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01032ec:	c9                   	leave  
c01032ed:	c3                   	ret    
c01032ee:	28 70 61             	sub    %dh,0x61(%eax)
c01032f1:	67 65 20 26 20 50    	addr16 and %ah,%gs:20512
c01032f7:	41                   	inc    %ecx
c01032f8:	47                   	inc    %edi
c01032f9:	45                   	inc    %ebp
c01032fa:	5f                   	pop    %edi
c01032fb:	4d                   	dec    %ebp
c01032fc:	41                   	inc    %ecx
c01032fd:	53                   	push   %ebx
c01032fe:	4b                   	dec    %ebx
c01032ff:	29 20                	sub    %esp,(%eax)
c0103301:	3d 3d 20 30 00       	cmp    $0x30203d,%eax

c0103306 <_MmFreePhysPage>:
c0103306:	55                   	push   %ebp
c0103307:	89 e5                	mov    %esp,%ebp
c0103309:	83 ec 08             	sub    $0x8,%esp
c010330c:	8b 45 08             	mov    0x8(%ebp),%eax
c010330f:	25 ff 0f 00 00       	and    $0xfff,%eax
c0103314:	85 c0                	test   %eax,%eax
c0103316:	74 1c                	je     c0103334 <_MmFreePhysPage+0x2e>
c0103318:	68 ee 32 10 c0       	push   $0xc01032ee
c010331d:	68 cb 00 00 00       	push   $0xcb
c0103322:	68 b4 2f 10 c0       	push   $0xc0102fb4
c0103327:	68 bc 2f 10 c0       	push   $0xc0102fbc
c010332c:	e8 7f fb ff ff       	call   c0102eb0 <_KePanicStr>
c0103331:	83 c4 10             	add    $0x10,%esp
c0103334:	83 ec 0c             	sub    $0xc,%esp
c0103337:	68 e8 68 10 c0       	push   $0xc01068e8
c010333c:	e8 d2 fb ff ff       	call   c0102f13 <_KeAcquireSpinlock>
c0103341:	83 c4 10             	add    $0x10,%esp
c0103344:	8b 45 08             	mov    0x8(%ebp),%eax
c0103347:	c1 e8 0c             	shr    $0xc,%eax
c010334a:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010334d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103350:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0103357:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c010335c:	ff 4c 10 04          	decl   0x4(%eax,%edx,1)
c0103360:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103363:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010336a:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c010336f:	83 7c 10 04 00       	cmpl   $0x0,0x4(%eax,%edx,1)
c0103374:	75 5d                	jne    c01033d3 <_MmFreePhysPage+0xcd>
c0103376:	83 3d e0 68 10 c0 00 	cmpl   $0x0,0xc01068e0
c010337d:	75 13                	jne    c0103392 <_MmFreePhysPage+0x8c>
c010337f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103382:	c1 e0 03             	shl    $0x3,%eax
c0103385:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c010338b:	a3 e0 68 10 c0       	mov    %eax,0xc01068e0
c0103390:	eb 14                	jmp    c01033a6 <_MmFreePhysPage+0xa0>
c0103392:	8b 15 e4 68 10 c0    	mov    0xc01068e4,%edx
c0103398:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010339b:	c1 e0 03             	shl    $0x3,%eax
c010339e:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c01033a4:	89 02                	mov    %eax,(%edx)
c01033a6:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01033a9:	c1 e0 03             	shl    $0x3,%eax
c01033ac:	03 05 60 69 10 c0    	add    0xc0106960,%eax
c01033b2:	a3 e4 68 10 c0       	mov    %eax,0xc01068e4
c01033b7:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01033ba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01033c1:	a1 60 69 10 c0       	mov    0xc0106960,%eax
c01033c6:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
c01033cd:	ff 05 ec 68 10 c0    	incl   0xc01068ec
c01033d3:	83 ec 0c             	sub    $0xc,%esp
c01033d6:	68 e8 68 10 c0       	push   $0xc01068e8
c01033db:	e8 39 fb ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c01033e0:	83 c4 10             	add    $0x10,%esp
c01033e3:	c9                   	leave  
c01033e4:	c3                   	ret    

c01033e5 <_MmCreateHeap>:
c01033e5:	55                   	push   %ebp
c01033e6:	89 e5                	mov    %esp,%ebp
c01033e8:	83 ec 08             	sub    $0x8,%esp
c01033eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01033ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01033f1:	89 42 08             	mov    %eax,0x8(%edx)
c01033f4:	8b 55 08             	mov    0x8(%ebp),%edx
c01033f7:	8b 45 10             	mov    0x10(%ebp),%eax
c01033fa:	89 42 0c             	mov    %eax,0xc(%edx)
c01033fd:	8b 55 08             	mov    0x8(%ebp),%edx
c0103400:	8b 45 14             	mov    0x14(%ebp),%eax
c0103403:	89 42 14             	mov    %eax,0x14(%edx)
c0103406:	8b 45 08             	mov    0x8(%ebp),%eax
c0103409:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0103410:	8b 55 08             	mov    0x8(%ebp),%edx
c0103413:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103416:	89 02                	mov    %eax,(%edx)
c0103418:	8b 45 08             	mov    0x8(%ebp),%eax
c010341b:	8b 10                	mov    (%eax),%edx
c010341d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103420:	83 c0 10             	add    $0x10,%eax
c0103423:	89 02                	mov    %eax,(%edx)
c0103425:	8b 45 08             	mov    0x8(%ebp),%eax
c0103428:	8b 10                	mov    (%eax),%edx
c010342a:	8b 45 10             	mov    0x10(%ebp),%eax
c010342d:	83 e8 10             	sub    $0x10,%eax
c0103430:	89 42 04             	mov    %eax,0x4(%edx)
c0103433:	8b 45 08             	mov    0x8(%ebp),%eax
c0103436:	8b 00                	mov    (%eax),%eax
c0103438:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010343f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103442:	8b 00                	mov    (%eax),%eax
c0103444:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010344b:	8b 55 08             	mov    0x8(%ebp),%edx
c010344e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103451:	8b 00                	mov    (%eax),%eax
c0103453:	8b 40 04             	mov    0x4(%eax),%eax
c0103456:	89 42 10             	mov    %eax,0x10(%edx)
c0103459:	83 ec 0c             	sub    $0xc,%esp
c010345c:	8b 45 08             	mov    0x8(%ebp),%eax
c010345f:	83 c0 18             	add    $0x18,%eax
c0103462:	50                   	push   %eax
c0103463:	e8 9d fa ff ff       	call   c0102f05 <_KeInitializeSpinlock>
c0103468:	83 c4 10             	add    $0x10,%esp
c010346b:	c9                   	leave  
c010346c:	c3                   	ret    

c010346d <_MmHeapAlloc>:
c010346d:	55                   	push   %ebp
c010346e:	89 e5                	mov    %esp,%ebp
c0103470:	83 ec 18             	sub    $0x18,%esp
c0103473:	83 ec 0c             	sub    $0xc,%esp
c0103476:	8b 45 08             	mov    0x8(%ebp),%eax
c0103479:	83 c0 18             	add    $0x18,%eax
c010347c:	50                   	push   %eax
c010347d:	e8 91 fa ff ff       	call   c0102f13 <_KeAcquireSpinlock>
c0103482:	83 c4 10             	add    $0x10,%esp
c0103485:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103488:	83 c0 0f             	add    $0xf,%eax
c010348b:	83 e0 f0             	and    $0xfffffff0,%eax
c010348e:	83 c0 10             	add    $0x10,%eax
c0103491:	89 45 0c             	mov    %eax,0xc(%ebp)
c0103494:	8b 45 08             	mov    0x8(%ebp),%eax
c0103497:	8b 00                	mov    (%eax),%eax
c0103499:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010349c:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01034a0:	74 18                	je     c01034ba <_MmHeapAlloc+0x4d>
c01034a2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01034a5:	8b 40 04             	mov    0x4(%eax),%eax
c01034a8:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01034ab:	72 02                	jb     c01034af <_MmHeapAlloc+0x42>
c01034ad:	eb 0b                	jmp    c01034ba <_MmHeapAlloc+0x4d>
c01034af:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01034b2:	8b 40 08             	mov    0x8(%eax),%eax
c01034b5:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01034b8:	eb e2                	jmp    c010349c <_MmHeapAlloc+0x2f>
c01034ba:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01034be:	75 1e                	jne    c01034de <_MmHeapAlloc+0x71>
c01034c0:	83 ec 0c             	sub    $0xc,%esp
c01034c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c6:	83 c0 18             	add    $0x18,%eax
c01034c9:	50                   	push   %eax
c01034ca:	e8 4a fa ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c01034cf:	83 c4 10             	add    $0x10,%esp
c01034d2:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,0xfffffff4(%ebp)
c01034d9:	e9 06 01 00 00       	jmp    c01035e4 <_MmHeapAlloc+0x177>
c01034de:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01034e1:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01034e4:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01034e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034ea:	03 02                	add    (%edx),%eax
c01034ec:	83 e8 10             	sub    $0x10,%eax
c01034ef:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01034f2:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c01034f5:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c01034f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034fb:	03 02                	add    (%edx),%eax
c01034fd:	89 01                	mov    %eax,(%ecx)
c01034ff:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103502:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103505:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103508:	8b 40 04             	mov    0x4(%eax),%eax
c010350b:	29 d0                	sub    %edx,%eax
c010350d:	89 41 04             	mov    %eax,0x4(%ecx)
c0103510:	8b 55 08             	mov    0x8(%ebp),%edx
c0103513:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103516:	3b 02                	cmp    (%edx),%eax
c0103518:	75 08                	jne    c0103522 <_MmHeapAlloc+0xb5>
c010351a:	8b 55 08             	mov    0x8(%ebp),%edx
c010351d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103520:	89 02                	mov    %eax,(%edx)
c0103522:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103525:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
c0103529:	74 1a                	je     c0103545 <_MmHeapAlloc+0xd8>
c010352b:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010352e:	8b 50 0c             	mov    0xc(%eax),%edx
c0103531:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103534:	89 42 08             	mov    %eax,0x8(%edx)
c0103537:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c010353a:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010353d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103540:	89 42 0c             	mov    %eax,0xc(%edx)
c0103543:	eb 0a                	jmp    c010354f <_MmHeapAlloc+0xe2>
c0103545:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103548:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010354f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103552:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103556:	74 1a                	je     c0103572 <_MmHeapAlloc+0x105>
c0103558:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010355b:	8b 50 08             	mov    0x8(%eax),%edx
c010355e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103561:	89 42 0c             	mov    %eax,0xc(%edx)
c0103564:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103567:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010356a:	8b 40 08             	mov    0x8(%eax),%eax
c010356d:	89 42 08             	mov    %eax,0x8(%edx)
c0103570:	eb 0a                	jmp    c010357c <_MmHeapAlloc+0x10f>
c0103572:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103575:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010357c:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c010357f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103582:	89 42 04             	mov    %eax,0x4(%edx)
c0103585:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103588:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010358f:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103592:	8b 45 08             	mov    0x8(%ebp),%eax
c0103595:	8b 40 04             	mov    0x4(%eax),%eax
c0103598:	89 42 08             	mov    %eax,0x8(%edx)
c010359b:	8b 45 08             	mov    0x8(%ebp),%eax
c010359e:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c01035a2:	74 0c                	je     c01035b0 <_MmHeapAlloc+0x143>
c01035a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a7:	8b 50 04             	mov    0x4(%eax),%edx
c01035aa:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01035ad:	89 42 0c             	mov    %eax,0xc(%edx)
c01035b0:	8b 55 08             	mov    0x8(%ebp),%edx
c01035b3:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01035b6:	89 42 04             	mov    %eax,0x4(%edx)
c01035b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01035bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01035bf:	8b 55 0c             	mov    0xc(%ebp),%edx
c01035c2:	8b 40 10             	mov    0x10(%eax),%eax
c01035c5:	29 d0                	sub    %edx,%eax
c01035c7:	89 41 10             	mov    %eax,0x10(%ecx)
c01035ca:	83 ec 0c             	sub    $0xc,%esp
c01035cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01035d0:	83 c0 18             	add    $0x18,%eax
c01035d3:	50                   	push   %eax
c01035d4:	e8 40 f9 ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c01035d9:	83 c4 10             	add    $0x10,%esp
c01035dc:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01035df:	8b 00                	mov    (%eax),%eax
c01035e1:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c01035e4:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01035e7:	c9                   	leave  
c01035e8:	c3                   	ret    
c01035e9:	28 28                	sub    %ch,(%eax)
c01035eb:	75 6c                	jne    c0103659 <_MmHeapFree+0x4b>
c01035ed:	6f                   	outsl  %ds:(%esi),(%dx)
c01035ee:	6e                   	outsb  %ds:(%esi),(%dx)
c01035ef:	67 29 20             	addr16 sub %esp,(%bx,%si)
c01035f2:	70 74                	jo     c0103668 <_MmHeapFree+0x5a>
c01035f4:	72 20                	jb     c0103616 <_MmHeapFree+0x8>
c01035f6:	26 20 31             	and    %dh,%es:(%ecx)
c01035f9:	35 29 20 3d 3d       	xor    $0x3d3d2029,%eax
c01035fe:	20 30                	and    %dh,(%eax)
c0103600:	00 6c 69 73          	add    %ch,0x73(%ecx,%ebp,2)
c0103604:	74 20                	je     c0103626 <_MmHeapFree+0x18>
c0103606:	21 3d 20 4e 55 4c    	and    %edi,0x4c554e20
c010360c:	4c                   	dec    %esp
	...

c010360e <_MmHeapFree>:
c010360e:	55                   	push   %ebp
c010360f:	89 e5                	mov    %esp,%ebp
c0103611:	83 ec 18             	sub    $0x18,%esp
c0103614:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103618:	75 05                	jne    c010361f <_MmHeapFree+0x11>
c010361a:	e9 66 02 00 00       	jmp    c0103885 <_MmHeapFree+0x277>
c010361f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103622:	83 e0 0f             	and    $0xf,%eax
c0103625:	85 c0                	test   %eax,%eax
c0103627:	74 1c                	je     c0103645 <_MmHeapFree+0x37>
c0103629:	68 e9 35 10 c0       	push   $0xc01035e9
c010362e:	68 62 01 00 00       	push   $0x162
c0103633:	68 b4 2f 10 c0       	push   $0xc0102fb4
c0103638:	68 bc 2f 10 c0       	push   $0xc0102fbc
c010363d:	e8 6e f8 ff ff       	call   c0102eb0 <_KePanicStr>
c0103642:	83 c4 10             	add    $0x10,%esp
c0103645:	83 ec 0c             	sub    $0xc,%esp
c0103648:	8b 45 08             	mov    0x8(%ebp),%eax
c010364b:	83 c0 18             	add    $0x18,%eax
c010364e:	50                   	push   %eax
c010364f:	e8 bf f8 ff ff       	call   c0102f13 <_KeAcquireSpinlock>
c0103654:	83 c4 10             	add    $0x10,%esp
c0103657:	8b 45 08             	mov    0x8(%ebp),%eax
c010365a:	8b 40 04             	mov    0x4(%eax),%eax
c010365d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103660:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103664:	74 17                	je     c010367d <_MmHeapFree+0x6f>
c0103666:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103669:	8b 00                	mov    (%eax),%eax
c010366b:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010366e:	75 02                	jne    c0103672 <_MmHeapFree+0x64>
c0103670:	eb 0b                	jmp    c010367d <_MmHeapFree+0x6f>
c0103672:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103675:	8b 40 08             	mov    0x8(%eax),%eax
c0103678:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010367b:	eb e3                	jmp    c0103660 <_MmHeapFree+0x52>
c010367d:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103681:	75 1c                	jne    c010369f <_MmHeapFree+0x91>
c0103683:	68 01 36 10 c0       	push   $0xc0103601
c0103688:	68 6a 01 00 00       	push   $0x16a
c010368d:	68 b4 2f 10 c0       	push   $0xc0102fb4
c0103692:	68 bc 2f 10 c0       	push   $0xc0102fbc
c0103697:	e8 14 f8 ff ff       	call   c0102eb0 <_KePanicStr>
c010369c:	83 c4 10             	add    $0x10,%esp
c010369f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01036a2:	8b 55 08             	mov    0x8(%ebp),%edx
c01036a5:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036a8:	8b 40 04             	mov    0x4(%eax),%eax
c01036ab:	03 42 10             	add    0x10(%edx),%eax
c01036ae:	89 41 10             	mov    %eax,0x10(%ecx)
c01036b1:	8b 55 08             	mov    0x8(%ebp),%edx
c01036b4:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036b7:	3b 42 04             	cmp    0x4(%edx),%eax
c01036ba:	75 30                	jne    c01036ec <_MmHeapFree+0xde>
c01036bc:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036bf:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c01036c3:	74 1b                	je     c01036e0 <_MmHeapFree+0xd2>
c01036c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01036c8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036cb:	8b 40 08             	mov    0x8(%eax),%eax
c01036ce:	89 42 04             	mov    %eax,0x4(%edx)
c01036d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01036d4:	8b 40 04             	mov    0x4(%eax),%eax
c01036d7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c01036de:	eb 3c                	jmp    c010371c <_MmHeapFree+0x10e>
c01036e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c01036ea:	eb 30                	jmp    c010371c <_MmHeapFree+0x10e>
c01036ec:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036ef:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
c01036f3:	74 0f                	je     c0103704 <_MmHeapFree+0xf6>
c01036f5:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036f8:	8b 50 0c             	mov    0xc(%eax),%edx
c01036fb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036fe:	8b 40 08             	mov    0x8(%eax),%eax
c0103701:	89 42 08             	mov    %eax,0x8(%edx)
c0103704:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103707:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c010370b:	74 0f                	je     c010371c <_MmHeapFree+0x10e>
c010370d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103710:	8b 50 08             	mov    0x8(%eax),%edx
c0103713:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103716:	8b 40 0c             	mov    0xc(%eax),%eax
c0103719:	89 42 0c             	mov    %eax,0xc(%edx)
c010371c:	8b 55 08             	mov    0x8(%ebp),%edx
c010371f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103722:	3b 02                	cmp    (%edx),%eax
c0103724:	72 08                	jb     c010372e <_MmHeapFree+0x120>
c0103726:	8b 45 08             	mov    0x8(%ebp),%eax
c0103729:	83 38 00             	cmpl   $0x0,(%eax)
c010372c:	75 41                	jne    c010376f <_MmHeapFree+0x161>
c010372e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103731:	8b 00                	mov    (%eax),%eax
c0103733:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103736:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c010373d:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103740:	8b 45 08             	mov    0x8(%ebp),%eax
c0103743:	8b 00                	mov    (%eax),%eax
c0103745:	89 42 08             	mov    %eax,0x8(%edx)
c0103748:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010374b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0103752:	8b 45 08             	mov    0x8(%ebp),%eax
c0103755:	83 38 00             	cmpl   $0x0,(%eax)
c0103758:	74 0b                	je     c0103765 <_MmHeapFree+0x157>
c010375a:	8b 45 08             	mov    0x8(%ebp),%eax
c010375d:	8b 10                	mov    (%eax),%edx
c010375f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103762:	89 42 0c             	mov    %eax,0xc(%edx)
c0103765:	8b 55 08             	mov    0x8(%ebp),%edx
c0103768:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010376b:	89 02                	mov    %eax,(%edx)
c010376d:	eb 6a                	jmp    c01037d9 <_MmHeapFree+0x1cb>
c010376f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103772:	8b 00                	mov    (%eax),%eax
c0103774:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103777:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c010377b:	74 17                	je     c0103794 <_MmHeapFree+0x186>
c010377d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103780:	8b 00                	mov    (%eax),%eax
c0103782:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103785:	72 02                	jb     c0103789 <_MmHeapFree+0x17b>
c0103787:	eb 0b                	jmp    c0103794 <_MmHeapFree+0x186>
c0103789:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010378c:	8b 40 08             	mov    0x8(%eax),%eax
c010378f:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103792:	eb e3                	jmp    c0103777 <_MmHeapFree+0x169>
c0103794:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103797:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c010379a:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010379d:	8b 40 0c             	mov    0xc(%eax),%eax
c01037a0:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01037a3:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c01037a7:	74 14                	je     c01037bd <_MmHeapFree+0x1af>
c01037a9:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
c01037ac:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01037af:	89 42 0c             	mov    %eax,0xc(%edx)
c01037b2:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01037b5:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01037b8:	89 42 08             	mov    %eax,0x8(%edx)
c01037bb:	eb 0a                	jmp    c01037c7 <_MmHeapFree+0x1b9>
c01037bd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01037c0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01037c7:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c01037ca:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01037cd:	89 42 08             	mov    %eax,0x8(%edx)
c01037d0:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01037d3:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01037d6:	89 42 0c             	mov    %eax,0xc(%edx)
c01037d9:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c01037dd:	74 47                	je     c0103826 <_MmHeapFree+0x218>
c01037df:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01037e2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01037e5:	8b 40 04             	mov    0x4(%eax),%eax
c01037e8:	8b 12                	mov    (%edx),%edx
c01037ea:	01 c2                	add    %eax,%edx
c01037ec:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01037ef:	3b 10                	cmp    (%eax),%edx
c01037f1:	75 1e                	jne    c0103811 <_MmHeapFree+0x203>
c01037f3:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c01037f6:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01037f9:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01037fc:	8b 40 04             	mov    0x4(%eax),%eax
c01037ff:	03 42 04             	add    0x4(%edx),%eax
c0103802:	89 41 04             	mov    %eax,0x4(%ecx)
c0103805:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103808:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010380b:	8b 40 08             	mov    0x8(%eax),%eax
c010380e:	89 42 08             	mov    %eax,0x8(%edx)
c0103811:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103814:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103818:	74 0c                	je     c0103826 <_MmHeapFree+0x218>
c010381a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010381d:	8b 50 08             	mov    0x8(%eax),%edx
c0103820:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103823:	89 42 0c             	mov    %eax,0xc(%edx)
c0103826:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c010382a:	74 47                	je     c0103873 <_MmHeapFree+0x265>
c010382c:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c010382f:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103832:	8b 40 04             	mov    0x4(%eax),%eax
c0103835:	8b 12                	mov    (%edx),%edx
c0103837:	01 c2                	add    %eax,%edx
c0103839:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010383c:	3b 10                	cmp    (%eax),%edx
c010383e:	75 1e                	jne    c010385e <_MmHeapFree+0x250>
c0103840:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
c0103843:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103846:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103849:	8b 40 04             	mov    0x4(%eax),%eax
c010384c:	03 42 04             	add    0x4(%edx),%eax
c010384f:	89 41 04             	mov    %eax,0x4(%ecx)
c0103852:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103855:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103858:	8b 40 08             	mov    0x8(%eax),%eax
c010385b:	89 42 08             	mov    %eax,0x8(%edx)
c010385e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103861:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103865:	74 0c                	je     c0103873 <_MmHeapFree+0x265>
c0103867:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010386a:	8b 50 08             	mov    0x8(%eax),%edx
c010386d:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103870:	89 42 0c             	mov    %eax,0xc(%edx)
c0103873:	83 ec 0c             	sub    $0xc,%esp
c0103876:	8b 45 08             	mov    0x8(%ebp),%eax
c0103879:	83 c0 18             	add    $0x18,%eax
c010387c:	50                   	push   %eax
c010387d:	e8 97 f6 ff ff       	call   c0102f19 <_KeReleaseSpinlock>
c0103882:	83 c4 10             	add    $0x10,%esp
c0103885:	c9                   	leave  
c0103886:	c3                   	ret    

c0103887 <_MmGetFreePageCount>:
c0103887:	55                   	push   %ebp
c0103888:	89 e5                	mov    %esp,%ebp
c010388a:	a1 ec 68 10 c0       	mov    0xc01068ec,%eax
c010388f:	5d                   	pop    %ebp
c0103890:	c3                   	ret    
c0103891:	90                   	nop    
c0103892:	90                   	nop    
c0103893:	90                   	nop    
c0103894:	90                   	nop    
c0103895:	90                   	nop    
c0103896:	90                   	nop    
c0103897:	90                   	nop    
c0103898:	90                   	nop    
c0103899:	90                   	nop    
c010389a:	90                   	nop    
c010389b:	90                   	nop    
c010389c:	90                   	nop    
c010389d:	90                   	nop    
c010389e:	90                   	nop    
c010389f:	90                   	nop    

c01038a0 <.text>:
c01038a0:	4d                   	dec    %ebp
c01038a1:	6d                   	insl   (%dx),%es:(%edi)
c01038a2:	54                   	push   %esp
c01038a3:	6f                   	outsl  %ds:(%esi),(%dx)
c01038a4:	74 61                	je     c0103907 <_i386MmInit+0x32>
c01038a6:	6c                   	insb   (%dx),%es:(%edi)
c01038a7:	46                   	inc    %esi
c01038a8:	72 65                	jb     c010390f <_i386MmInit+0x3a>
c01038aa:	65                   	gs
c01038ab:	4d                   	dec    %ebp
c01038ac:	65                   	gs
c01038ad:	6d                   	insl   (%dx),%es:(%edi)
c01038ae:	6f                   	outsl  %ds:(%esi),(%dx)
c01038af:	72 79                	jb     c010392a <_i386MmInit+0x55>
c01038b1:	20 21                	and    %ah,(%ecx)
c01038b3:	3d 20 46 41 4c       	cmp    $0x4c414620,%eax
c01038b8:	53                   	push   %ebx
c01038b9:	45                   	inc    %ebp
c01038ba:	00 6d 6d             	add    %ch,0x6d(%ebp)
c01038bd:	2f                   	das    
c01038be:	69 33 38 36 2f 6d    	imul   $0x6d2f3638,(%ebx),%esi
c01038c4:	6d                   	insl   (%dx),%es:(%edi)
c01038c5:	69 33 38 36 2e 63    	imul   $0x632e3638,(%ebx),%esi
c01038cb:	00 25 73 3a 25 64    	add    %ah,0x64253a73
c01038d1:	20 25 73 00 55 89    	and    %ah,0x89550073

c01038d5 <_i386MmInit>:
c01038d5:	55                   	push   %ebp
c01038d6:	89 e5                	mov    %esp,%ebp
c01038d8:	53                   	push   %ebx
c01038d9:	83 ec 24             	sub    $0x24,%esp
c01038dc:	e8 3d 02 00 00       	call   c0103b1e <_i386MmGetFreeMemory>
c01038e1:	83 3d 20 69 10 c0 00 	cmpl   $0x0,0xc0106920
c01038e8:	75 19                	jne    c0103903 <_i386MmInit+0x2e>
c01038ea:	68 a0 38 10 c0       	push   $0xc01038a0
c01038ef:	6a 20                	push   $0x20
c01038f1:	68 bb 38 10 c0       	push   $0xc01038bb
c01038f6:	68 cc 38 10 c0       	push   $0xc01038cc
c01038fb:	e8 b0 f5 ff ff       	call   c0102eb0 <_KePanicStr>
c0103900:	83 c4 10             	add    $0x10,%esp
c0103903:	e8 53 f5 ff ff       	call   c0102e5b <_KeGetCubekrnlSize>
c0103908:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c010390d:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103910:	83 ec 0c             	sub    $0xc,%esp
c0103913:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c0103916:	e8 a1 e1 ff ff       	call   c0101abc <_ZeroPage>
c010391b:	83 c4 10             	add    $0x10,%esp
c010391e:	83 ec 0c             	sub    $0xc,%esp
c0103921:	6a 0d                	push   $0xd
c0103923:	e8 97 dd ff ff       	call   c01016bf <_i386QueryFeature>
c0103928:	83 c4 10             	add    $0x10,%esp
c010392b:	3c 01                	cmp    $0x1,%al
c010392d:	75 0d                	jne    c010393c <_i386MmInit+0x67>
c010392f:	bb 80 00 00 00       	mov    $0x80,%ebx
c0103934:	0f 20 e0             	mov    %cr4,%eax
c0103937:	09 d8                	or     %ebx,%eax
c0103939:	0f 22 e0             	mov    %eax,%cr4
c010393c:	83 ec 0c             	sub    $0xc,%esp
c010393f:	6a 03                	push   $0x3
c0103941:	e8 79 dd ff ff       	call   c01016bf <_i386QueryFeature>
c0103946:	83 c4 10             	add    $0x10,%esp
c0103949:	3c 01                	cmp    $0x1,%al
c010394b:	0f 85 85 00 00 00    	jne    c01039d6 <_i386MmInit+0x101>
c0103951:	bb 10 00 00 00       	mov    $0x10,%ebx
c0103956:	0f 20 e0             	mov    %cr4,%eax
c0103959:	09 d8                	or     %ebx,%eax
c010395b:	0f 22 e0             	mov    %eax,%cr4
c010395e:	6a 01                	push   $0x1
c0103960:	6a 01                	push   $0x1
c0103962:	6a 00                	push   $0x0
c0103964:	6a 01                	push   $0x1
c0103966:	6a 01                	push   $0x1
c0103968:	6a 00                	push   $0x0
c010396a:	6a 00                	push   $0x0
c010396c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010396f:	05 00 0c 00 00       	add    $0xc00,%eax
c0103974:	50                   	push   %eax
c0103975:	e8 56 03 00 00       	call   c0103cd0 <_i386SetPte>
c010397a:	83 c4 20             	add    $0x20,%esp
c010397d:	c7 45 f4 00 00 40 00 	movl   $0x400000,0xfffffff4(%ebp)
c0103984:	81 7d f4 ff ff ff 0f 	cmpl   $0xfffffff,0xfffffff4(%ebp)
c010398b:	76 02                	jbe    c010398f <_i386MmInit+0xba>
c010398d:	eb 38                	jmp    c01039c7 <_i386MmInit+0xf2>
c010398f:	6a 00                	push   $0x0
c0103991:	6a 01                	push   $0x1
c0103993:	6a 00                	push   $0x0
c0103995:	6a 01                	push   $0x1
c0103997:	6a 01                	push   $0x1
c0103999:	6a 00                	push   $0x0
c010399b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010399e:	c1 e8 0c             	shr    $0xc,%eax
c01039a1:	50                   	push   %eax
c01039a2:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01039a5:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01039aa:	c1 e8 16             	shr    $0x16,%eax
c01039ad:	c1 e0 02             	shl    $0x2,%eax
c01039b0:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c01039b3:	50                   	push   %eax
c01039b4:	e8 17 03 00 00       	call   c0103cd0 <_i386SetPte>
c01039b9:	83 c4 20             	add    $0x20,%esp
c01039bc:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c01039bf:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c01039c5:	eb bd                	jmp    c0103984 <_i386MmInit+0xaf>
c01039c7:	c7 05 f0 68 10 c0 00 	movl   $0x1000,0xc01068f0
c01039ce:	10 00 00 
c01039d1:	e9 e2 00 00 00       	jmp    c0103ab8 <_i386MmInit+0x1e3>
c01039d6:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01039d9:	05 00 10 00 00       	add    $0x1000,%eax
c01039de:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01039e1:	81 3d 30 69 10 c0 ff 	cmpl   $0xfefffff,0xc0106930
c01039e8:	ff ef 0f 
c01039eb:	77 16                	ja     c0103a03 <_i386MmInit+0x12e>
c01039ed:	a1 30 69 10 c0       	mov    0xc0106930,%eax
c01039f2:	05 ff ff 4f 00       	add    $0x4fffff,%eax
c01039f7:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
c01039fa:	81 65 e4 00 00 c0 ff 	andl   $0xffc00000,0xffffffe4(%ebp)
c0103a01:	eb 07                	jmp    c0103a0a <_i386MmInit+0x135>
c0103a03:	c7 45 e4 00 00 00 10 	movl   $0x10000000,0xffffffe4(%ebp)
c0103a0a:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
c0103a0d:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0103a10:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0103a17:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103a1a:	3b 45 e8             	cmp    0xffffffe8(%ebp),%eax
c0103a1d:	72 05                	jb     c0103a24 <_i386MmInit+0x14f>
c0103a1f:	e9 85 00 00 00       	jmp    c0103aa9 <_i386MmInit+0x1d4>
c0103a24:	6a 00                	push   $0x0
c0103a26:	6a 00                	push   $0x0
c0103a28:	6a 00                	push   $0x0
c0103a2a:	6a 01                	push   $0x1
c0103a2c:	6a 01                	push   $0x1
c0103a2e:	6a 00                	push   $0x0
c0103a30:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103a33:	05 00 00 00 40       	add    $0x40000000,%eax
c0103a38:	c1 e8 0c             	shr    $0xc,%eax
c0103a3b:	50                   	push   %eax
c0103a3c:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103a3f:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0103a44:	c1 e8 16             	shr    $0x16,%eax
c0103a47:	c1 e0 02             	shl    $0x2,%eax
c0103a4a:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c0103a4d:	50                   	push   %eax
c0103a4e:	e8 7d 02 00 00       	call   c0103cd0 <_i386SetPte>
c0103a53:	83 c4 20             	add    $0x20,%esp
c0103a56:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
c0103a5d:	81 7d ec ff ff 3f 00 	cmpl   $0x3fffff,0xffffffec(%ebp)
c0103a64:	76 02                	jbe    c0103a68 <_i386MmInit+0x193>
c0103a66:	eb 33                	jmp    c0103a9b <_i386MmInit+0x1c6>
c0103a68:	6a 00                	push   $0x0
c0103a6a:	6a 00                	push   $0x0
c0103a6c:	6a 00                	push   $0x0
c0103a6e:	6a 01                	push   $0x1
c0103a70:	6a 01                	push   $0x1
c0103a72:	6a 00                	push   $0x0
c0103a74:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0103a77:	03 45 f4             	add    0xfffffff4(%ebp),%eax
c0103a7a:	c1 e8 0c             	shr    $0xc,%eax
c0103a7d:	50                   	push   %eax
c0103a7e:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103a81:	8d 42 04             	lea    0x4(%edx),%eax
c0103a84:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0103a87:	52                   	push   %edx
c0103a88:	e8 43 02 00 00       	call   c0103cd0 <_i386SetPte>
c0103a8d:	83 c4 20             	add    $0x20,%esp
c0103a90:	8d 45 ec             	lea    0xffffffec(%ebp),%eax
c0103a93:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c0103a99:	eb c2                	jmp    c0103a5d <_i386MmInit+0x188>
c0103a9b:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0103a9e:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c0103aa4:	e9 6e ff ff ff       	jmp    c0103a17 <_i386MmInit+0x142>
c0103aa9:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103aac:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103aaf:	29 c2                	sub    %eax,%edx
c0103ab1:	89 d0                	mov    %edx,%eax
c0103ab3:	a3 f0 68 10 c0       	mov    %eax,0xc01068f0
c0103ab8:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103abb:	05 00 00 00 40       	add    $0x40000000,%eax
c0103ac0:	0f 22 d8             	mov    %eax,%cr3
c0103ac3:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
c0103ac6:	c9                   	leave  
c0103ac7:	c3                   	ret    

c0103ac8 <_AddMemToList>:
c0103ac8:	55                   	push   %ebp
c0103ac9:	89 e5                	mov    %esp,%ebp
c0103acb:	a1 e4 40 10 c0       	mov    0xc01040e4,%eax
c0103ad0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
c0103ad7:	8b 15 e0 40 10 c0    	mov    0xc01040e0,%edx
c0103add:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ae0:	89 04 0a             	mov    %eax,(%edx,%ecx,1)
c0103ae3:	a1 e4 40 10 c0       	mov    0xc01040e4,%eax
c0103ae8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
c0103aef:	8b 15 e0 40 10 c0    	mov    0xc01040e0,%edx
c0103af5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103af8:	89 44 0a 04          	mov    %eax,0x4(%edx,%ecx,1)
c0103afc:	ff 05 e4 40 10 c0    	incl   0xc01040e4
c0103b02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b05:	01 05 20 69 10 c0    	add    %eax,0xc0106920
c0103b0b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103b0f:	74 0b                	je     c0103b1c <_AddMemToList+0x54>
c0103b11:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b14:	03 45 08             	add    0x8(%ebp),%eax
c0103b17:	a3 30 69 10 c0       	mov    %eax,0xc0106930
c0103b1c:	5d                   	pop    %ebp
c0103b1d:	c3                   	ret    

c0103b1e <_i386MmGetFreeMemory>:
c0103b1e:	55                   	push   %ebp
c0103b1f:	89 e5                	mov    %esp,%ebp
c0103b21:	83 ec 18             	sub    $0x18,%esp
c0103b24:	c7 45 fc 00 d0 00 c0 	movl   $0xc000d000,0xfffffffc(%ebp)
c0103b2b:	c7 05 20 69 10 c0 00 	movl   $0x0,0xc0106920
c0103b32:	00 00 00 
c0103b35:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b38:	66 81 38 20 e8       	cmpw   $0xe820,(%eax)
c0103b3d:	0f 85 bf 00 00 00    	jne    c0103c02 <_i386MmGetFreeMemory+0xe4>
c0103b43:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b46:	66 8b 40 02          	mov    0x2(%eax),%ax
c0103b4a:	89 c1                	mov    %eax,%ecx
c0103b4c:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
c0103b52:	89 c8                	mov    %ecx,%eax
c0103b54:	01 c0                	add    %eax,%eax
c0103b56:	01 c8                	add    %ecx,%eax
c0103b58:	89 c2                	mov    %eax,%edx
c0103b5a:	c1 e2 04             	shl    $0x4,%edx
c0103b5d:	01 d0                	add    %edx,%eax
c0103b5f:	89 c2                	mov    %eax,%edx
c0103b61:	c1 e2 08             	shl    $0x8,%edx
c0103b64:	01 d0                	add    %edx,%eax
c0103b66:	c1 e0 02             	shl    $0x2,%eax
c0103b69:	01 c8                	add    %ecx,%eax
c0103b6b:	c1 e8 10             	shr    $0x10,%eax
c0103b6e:	66 c1 e8 04          	shr    $0x4,%ax
c0103b72:	25 ff ff 00 00       	and    $0xffff,%eax
c0103b77:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103b7a:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0103b7d:	ff 08                	decl   (%eax)
c0103b7f:	83 7d f8 ff          	cmpl   $0xffffffff,0xfffffff8(%ebp)
c0103b83:	75 05                	jne    c0103b8a <_i386MmGetFreeMemory+0x6c>
c0103b85:	e9 16 01 00 00       	jmp    c0103ca0 <_i386MmGetFreeMemory+0x182>
c0103b8a:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103b8d:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103b90:	89 d0                	mov    %edx,%eax
c0103b92:	c1 e0 02             	shl    $0x2,%eax
c0103b95:	01 d0                	add    %edx,%eax
c0103b97:	c1 e0 02             	shl    $0x2,%eax
c0103b9a:	01 c8                	add    %ecx,%eax
c0103b9c:	83 c0 10             	add    $0x10,%eax
c0103b9f:	83 78 04 01          	cmpl   $0x1,0x4(%eax)
c0103ba3:	75 d5                	jne    c0103b7a <_i386MmGetFreeMemory+0x5c>
c0103ba5:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103ba8:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103bab:	89 d0                	mov    %edx,%eax
c0103bad:	c1 e0 02             	shl    $0x2,%eax
c0103bb0:	01 d0                	add    %edx,%eax
c0103bb2:	c1 e0 02             	shl    $0x2,%eax
c0103bb5:	81 7c 01 04 ff ff 0f 	cmpl   $0xfffff,0x4(%ecx,%eax,1)
c0103bbc:	00 
c0103bbd:	76 bb                	jbe    c0103b7a <_i386MmGetFreeMemory+0x5c>
c0103bbf:	83 ec 08             	sub    $0x8,%esp
c0103bc2:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103bc5:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103bc8:	89 d0                	mov    %edx,%eax
c0103bca:	c1 e0 02             	shl    $0x2,%eax
c0103bcd:	01 d0                	add    %edx,%eax
c0103bcf:	c1 e0 02             	shl    $0x2,%eax
c0103bd2:	ff 74 01 0c          	pushl  0xc(%ecx,%eax,1)
c0103bd6:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103bd9:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103bdc:	89 d0                	mov    %edx,%eax
c0103bde:	c1 e0 02             	shl    $0x2,%eax
c0103be1:	01 d0                	add    %edx,%eax
c0103be3:	c1 e0 02             	shl    $0x2,%eax
c0103be6:	8b 44 01 04          	mov    0x4(%ecx,%eax,1),%eax
c0103bea:	05 ff 0f 00 00       	add    $0xfff,%eax
c0103bef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103bf4:	50                   	push   %eax
c0103bf5:	e8 ce fe ff ff       	call   c0103ac8 <_AddMemToList>
c0103bfa:	83 c4 10             	add    $0x10,%esp
c0103bfd:	e9 78 ff ff ff       	jmp    c0103b7a <_i386MmGetFreeMemory+0x5c>
c0103c02:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103c05:	66 81 38 01 e8       	cmpw   $0xe801,(%eax)
c0103c0a:	75 5f                	jne    c0103c6b <_i386MmGetFreeMemory+0x14d>
c0103c0c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103c0f:	83 c0 02             	add    $0x2,%eax
c0103c12:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103c15:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103c18:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
c0103c1d:	74 20                	je     c0103c3f <_i386MmGetFreeMemory+0x121>
c0103c1f:	83 ec 08             	sub    $0x8,%esp
c0103c22:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103c25:	66 8b 40 04          	mov    0x4(%eax),%ax
c0103c29:	25 ff ff 00 00       	and    $0xffff,%eax
c0103c2e:	c1 e0 0a             	shl    $0xa,%eax
c0103c31:	50                   	push   %eax
c0103c32:	68 00 00 10 00       	push   $0x100000
c0103c37:	e8 8c fe ff ff       	call   c0103ac8 <_AddMemToList>
c0103c3c:	83 c4 10             	add    $0x10,%esp
c0103c3f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103c42:	66 83 78 06 00       	cmpw   $0x0,0x6(%eax)
c0103c47:	74 57                	je     c0103ca0 <_i386MmGetFreeMemory+0x182>
c0103c49:	83 ec 08             	sub    $0x8,%esp
c0103c4c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103c4f:	66 8b 40 06          	mov    0x6(%eax),%ax
c0103c53:	25 ff ff 00 00       	and    $0xffff,%eax
c0103c58:	c1 e0 10             	shl    $0x10,%eax
c0103c5b:	50                   	push   %eax
c0103c5c:	68 00 00 00 01       	push   $0x1000000
c0103c61:	e8 62 fe ff ff       	call   c0103ac8 <_AddMemToList>
c0103c66:	83 c4 10             	add    $0x10,%esp
c0103c69:	eb 35                	jmp    c0103ca0 <_i386MmGetFreeMemory+0x182>
c0103c6b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103c6e:	66 81 38 00 88       	cmpw   $0x8800,(%eax)
c0103c73:	75 22                	jne    c0103c97 <_i386MmGetFreeMemory+0x179>
c0103c75:	83 ec 08             	sub    $0x8,%esp
c0103c78:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103c7b:	66 8b 40 02          	mov    0x2(%eax),%ax
c0103c7f:	25 ff ff 00 00       	and    $0xffff,%eax
c0103c84:	c1 e0 0a             	shl    $0xa,%eax
c0103c87:	50                   	push   %eax
c0103c88:	68 00 00 10 00       	push   $0x100000
c0103c8d:	e8 36 fe ff ff       	call   c0103ac8 <_AddMemToList>
c0103c92:	83 c4 10             	add    $0x10,%esp
c0103c95:	eb 09                	jmp    c0103ca0 <_i386MmGetFreeMemory+0x182>
c0103c97:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0103c9e:	eb 17                	jmp    c0103cb7 <_i386MmGetFreeMemory+0x199>
c0103ca0:	83 ec 08             	sub    $0x8,%esp
c0103ca3:	6a 00                	push   $0x0
c0103ca5:	6a 00                	push   $0x0
c0103ca7:	e8 1c fe ff ff       	call   c0103ac8 <_AddMemToList>
c0103cac:	83 c4 10             	add    $0x10,%esp
c0103caf:	a1 20 69 10 c0       	mov    0xc0106920,%eax
c0103cb4:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103cb7:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103cba:	c9                   	leave  
c0103cbb:	c3                   	ret    

c0103cbc <_i386MmGetFreeMemoryList>:
c0103cbc:	55                   	push   %ebp
c0103cbd:	89 e5                	mov    %esp,%ebp
c0103cbf:	a1 e0 40 10 c0       	mov    0xc01040e0,%eax
c0103cc4:	5d                   	pop    %ebp
c0103cc5:	c3                   	ret    

c0103cc6 <_i386MmGetPageDirSize>:
c0103cc6:	55                   	push   %ebp
c0103cc7:	89 e5                	mov    %esp,%ebp
c0103cc9:	a1 f0 68 10 c0       	mov    0xc01068f0,%eax
c0103cce:	5d                   	pop    %ebp
c0103ccf:	c3                   	ret    

c0103cd0 <_i386SetPte>:
c0103cd0:	55                   	push   %ebp
c0103cd1:	89 e5                	mov    %esp,%ebp
c0103cd3:	57                   	push   %edi
c0103cd4:	56                   	push   %esi
c0103cd5:	53                   	push   %ebx
c0103cd6:	83 ec 0c             	sub    $0xc,%esp
c0103cd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0103cdc:	8b 55 14             	mov    0x14(%ebp),%edx
c0103cdf:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0103ce2:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
c0103ce5:	8b 75 20             	mov    0x20(%ebp),%esi
c0103ce8:	8b 7d 24             	mov    0x24(%ebp),%edi
c0103ceb:	88 45 f3             	mov    %al,0xfffffff3(%ebp)
c0103cee:	88 55 f2             	mov    %dl,0xfffffff2(%ebp)
c0103cf1:	88 4d f1             	mov    %cl,0xfffffff1(%ebp)
c0103cf4:	88 5d f0             	mov    %bl,0xfffffff0(%ebp)
c0103cf7:	89 f0                	mov    %esi,%eax
c0103cf9:	88 45 ef             	mov    %al,0xffffffef(%ebp)
c0103cfc:	89 f8                	mov    %edi,%eax
c0103cfe:	88 45 ee             	mov    %al,0xffffffee(%ebp)
c0103d01:	83 ec 08             	sub    $0x8,%esp
c0103d04:	6a 04                	push   $0x4
c0103d06:	ff 75 08             	pushl  0x8(%ebp)
c0103d09:	e8 78 dd ff ff       	call   c0101a86 <_ZeroMemory>
c0103d0e:	83 c4 10             	add    $0x10,%esp
c0103d11:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d14:	8b 01                	mov    (%ecx),%eax
c0103d16:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103d19:	c1 e2 0c             	shl    $0xc,%edx
c0103d1c:	25 ff 0f 00 00       	and    $0xfff,%eax
c0103d21:	09 d0                	or     %edx,%eax
c0103d23:	89 01                	mov    %eax,(%ecx)
c0103d25:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d28:	ba 00 00 00 00       	mov    $0x0,%edx
c0103d2d:	8a 55 f3             	mov    0xfffffff3(%ebp),%dl
c0103d30:	8b 01                	mov    (%ecx),%eax
c0103d32:	83 e2 01             	and    $0x1,%edx
c0103d35:	c1 e2 02             	shl    $0x2,%edx
c0103d38:	83 e0 fb             	and    $0xfffffffb,%eax
c0103d3b:	09 d0                	or     %edx,%eax
c0103d3d:	89 01                	mov    %eax,(%ecx)
c0103d3f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d42:	ba 00 00 00 00       	mov    $0x0,%edx
c0103d47:	8a 55 f2             	mov    0xfffffff2(%ebp),%dl
c0103d4a:	8b 01                	mov    (%ecx),%eax
c0103d4c:	83 e2 01             	and    $0x1,%edx
c0103d4f:	83 e0 fe             	and    $0xfffffffe,%eax
c0103d52:	09 d0                	or     %edx,%eax
c0103d54:	89 01                	mov    %eax,(%ecx)
c0103d56:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d59:	ba 00 00 00 00       	mov    $0x0,%edx
c0103d5e:	8a 55 f1             	mov    0xfffffff1(%ebp),%dl
c0103d61:	8b 01                	mov    (%ecx),%eax
c0103d63:	83 e2 01             	and    $0x1,%edx
c0103d66:	01 d2                	add    %edx,%edx
c0103d68:	83 e0 fd             	and    $0xfffffffd,%eax
c0103d6b:	09 d0                	or     %edx,%eax
c0103d6d:	89 01                	mov    %eax,(%ecx)
c0103d6f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d72:	ba 00 00 00 00       	mov    $0x0,%edx
c0103d77:	8a 55 f0             	mov    0xfffffff0(%ebp),%dl
c0103d7a:	8b 01                	mov    (%ecx),%eax
c0103d7c:	83 e2 01             	and    $0x1,%edx
c0103d7f:	c1 e2 04             	shl    $0x4,%edx
c0103d82:	83 e0 ef             	and    $0xffffffef,%eax
c0103d85:	09 d0                	or     %edx,%eax
c0103d87:	89 01                	mov    %eax,(%ecx)
c0103d89:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103d8c:	ba 00 00 00 00       	mov    $0x0,%edx
c0103d91:	8a 55 ef             	mov    0xffffffef(%ebp),%dl
c0103d94:	8b 01                	mov    (%ecx),%eax
c0103d96:	83 e2 01             	and    $0x1,%edx
c0103d99:	c1 e2 07             	shl    $0x7,%edx
c0103d9c:	25 7f ff ff ff       	and    $0xffffff7f,%eax
c0103da1:	09 d0                	or     %edx,%eax
c0103da3:	89 01                	mov    %eax,(%ecx)
c0103da5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103da8:	ba 00 00 00 00       	mov    $0x0,%edx
c0103dad:	8a 55 ee             	mov    0xffffffee(%ebp),%dl
c0103db0:	8b 01                	mov    (%ecx),%eax
c0103db2:	83 e2 01             	and    $0x1,%edx
c0103db5:	c1 e2 08             	shl    $0x8,%edx
c0103db8:	25 ff fe ff ff       	and    $0xfffffeff,%eax
c0103dbd:	09 d0                	or     %edx,%eax
c0103dbf:	89 01                	mov    %eax,(%ecx)
c0103dc1:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
c0103dc4:	5b                   	pop    %ebx
c0103dc5:	5e                   	pop    %esi
c0103dc6:	5f                   	pop    %edi
c0103dc7:	5d                   	pop    %ebp
c0103dc8:	c3                   	ret    

c0103dc9 <_i386InvalidatePte>:
c0103dc9:	55                   	push   %ebp
c0103dca:	89 e5                	mov    %esp,%ebp
c0103dcc:	5d                   	pop    %ebp
c0103dcd:	c3                   	ret    
c0103dce:	90                   	nop    
c0103dcf:	90                   	nop    

c0103dd0 <__CTOR_LIST__>:
c0103dd0:	ff                   	(bad)  
c0103dd1:	ff                   	(bad)  
c0103dd2:	ff                   	(bad)  
c0103dd3:	ff 00                	incl   (%eax)
c0103dd5:	00 00                	add    %al,(%eax)
	...

c0103dd8 <__DTOR_LIST__>:
c0103dd8:	ff                   	(bad)  
c0103dd9:	ff                   	(bad)  
c0103dda:	ff                   	(bad)  
c0103ddb:	ff 00                	incl   (%eax)
c0103ddd:	00 00                	add    %al,(%eax)
	...
