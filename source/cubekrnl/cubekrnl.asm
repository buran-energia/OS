
cubekrnl.exe:     file format pei-i386

Disassembly of section .text:

c0101000 <_HALSetup>:
c0101000:	55                   	push   %ebp
c0101001:	89 e5                	mov    %esp,%ebp
c0101003:	83 ec 08             	sub    $0x8,%esp
c0101006:	e8 c3 00 00 00       	call   c01010ce <_i386CPUInit>
c010100b:	c9                   	leave  
c010100c:	c3                   	ret    

c010100d <_HALIdleThread>:
c010100d:	55                   	push   %ebp
c010100e:	89 e5                	mov    %esp,%ebp
c0101010:	83 ec 08             	sub    $0x8,%esp
c0101013:	e8 2c 03 00 00       	call   c0101344 <_i386HaltCPU>
c0101018:	c9                   	leave  
c0101019:	c3                   	ret    

c010101a <_HALSetTimerFreq>:
c010101a:	55                   	push   %ebp
c010101b:	89 e5                	mov    %esp,%ebp
c010101d:	83 ec 08             	sub    $0x8,%esp
c0101020:	83 ec 0c             	sub    $0xc,%esp
c0101023:	ff 75 08             	pushl  0x8(%ebp)
c0101026:	e8 d7 02 00 00       	call   c0101302 <_i386SetTimerFreq>
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
c0101042:	e8 9b 03 00 00       	call   c01013e2 <_i386InitContext>
c0101047:	83 c4 10             	add    $0x10,%esp
c010104a:	c9                   	leave  
c010104b:	c3                   	ret    

c010104c <_HALEnableIRQ>:
c010104c:	55                   	push   %ebp
c010104d:	89 e5                	mov    %esp,%ebp
c010104f:	83 ec 08             	sub    $0x8,%esp
c0101052:	83 ec 0c             	sub    $0xc,%esp
c0101055:	ff 75 08             	pushl  0x8(%ebp)
c0101058:	e8 ed 02 00 00       	call   c010134a <_i386EnableIRQ>
c010105d:	83 c4 10             	add    $0x10,%esp
c0101060:	c9                   	leave  
c0101061:	c3                   	ret    

c0101062 <_HALDisableIRQ>:
c0101062:	55                   	push   %ebp
c0101063:	89 e5                	mov    %esp,%ebp
c0101065:	83 ec 08             	sub    $0x8,%esp
c0101068:	83 ec 0c             	sub    $0xc,%esp
c010106b:	ff 75 08             	pushl  0x8(%ebp)
c010106e:	e8 0f 03 00 00       	call   c0101382 <_i386DisableIRQ>
c0101073:	83 c4 10             	add    $0x10,%esp
c0101076:	c9                   	leave  
c0101077:	c3                   	ret    

c0101078 <_HALAckInterrupt>:
c0101078:	55                   	push   %ebp
c0101079:	89 e5                	mov    %esp,%ebp
c010107b:	83 ec 08             	sub    $0x8,%esp
c010107e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101081:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c0101084:	83 ec 0c             	sub    $0xc,%esp
c0101087:	b8 00 00 00 00       	mov    $0x0,%eax
c010108c:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c010108f:	50                   	push   %eax
c0101090:	e8 23 03 00 00       	call   c01013b8 <_i386AckInterrupt>
c0101095:	83 c4 10             	add    $0x10,%esp
c0101098:	c9                   	leave  
c0101099:	c3                   	ret    

c010109a <_HALShutDown>:
c010109a:	55                   	push   %ebp
c010109b:	89 e5                	mov    %esp,%ebp
c010109d:	5d                   	pop    %ebp
c010109e:	c3                   	ret    
c010109f:	90                   	nop    

c01010a0 <.text>:
c01010a0:	4f                   	dec    %edi
c01010a1:	6e                   	outsb  %ds:(%esi),(%dx)
c01010a2:	6c                   	insb   (%dx),%es:(%edi)
c01010a3:	79 20                	jns    c01010c5 <.text+0x25>
c01010a5:	69 34 38 36 20 61 6e 	imul   $0x6e612036,(%eax,%edi,1),%esi
c01010ac:	64 20 6e 65          	and    %ch,%fs:0x65(%esi)
c01010b0:	77 65                	ja     c0101117 <_i386CPUInit+0x49>
c01010b2:	72 20                	jb     c01010d4 <_i386CPUInit+0x6>
c01010b4:	70 72                	jo     c0101128 <_i386CPUInit+0x5a>
c01010b6:	6f                   	outsl  %ds:(%esi),(%dx)
c01010b7:	63 65 73             	arpl   %sp,0x73(%ebp)
c01010ba:	73 6f                	jae    c010112b <_i386CPUInit+0x5d>
c01010bc:	72 73                	jb     c0101131 <_i386CPUInit+0x63>
c01010be:	20 61 72             	and    %ah,0x72(%ecx)
c01010c1:	65 20 73 75          	and    %dh,%gs:0x75(%ebx)
c01010c5:	70 70                	jo     c0101137 <_i386CPUInit+0x69>
c01010c7:	6f                   	outsl  %ds:(%esi),(%dx)
c01010c8:	72 74                	jb     c010113e <_i386CPUInit+0x70>
c01010ca:	65 64 2e 00 55 89    	add    %dl,%cs:%fs:%gs:0xffffff89(%ebp)

c01010ce <_i386CPUInit>:
c01010ce:	55                   	push   %ebp
c01010cf:	89 e5                	mov    %esp,%ebp
c01010d1:	83 ec 08             	sub    $0x8,%esp
c01010d4:	e8 6c 18 00 00       	call   c0102945 <_ClearScreen>
c01010d9:	e8 cb 05 00 00       	call   c01016a9 <_i386IsCPUSupported>
c01010de:	84 c0                	test   %al,%al
c01010e0:	75 15                	jne    c01010f7 <_i386CPUInit+0x29>
c01010e2:	83 ec 0c             	sub    $0xc,%esp
c01010e5:	68 a0 10 10 c0       	push   $0xc01010a0
c01010ea:	e8 f2 19 00 00       	call   c0102ae1 <_printf>
c01010ef:	83 c4 10             	add    $0x10,%esp
c01010f2:	e8 4d 02 00 00       	call   c0101344 <_i386HaltCPU>
c01010f7:	83 ec 08             	sub    $0x8,%esp
c01010fa:	6a 08                	push   $0x8
c01010fc:	68 60 70 10 c0       	push   $0xc0107060
c0101101:	e8 e0 09 00 00       	call   c0101ae6 <_ZeroMemory>
c0101106:	83 c4 10             	add    $0x10,%esp
c0101109:	6a 01                	push   $0x1
c010110b:	6a 01                	push   $0x1
c010110d:	6a 01                	push   $0x1
c010110f:	6a 00                	push   $0x0
c0101111:	6a 1a                	push   $0x1a
c0101113:	68 ff ff 0f 00       	push   $0xfffff
c0101118:	6a 00                	push   $0x0
c010111a:	68 68 70 10 c0       	push   $0xc0107068
c010111f:	e8 ec 02 00 00       	call   c0101410 <_i386SetSegment>
c0101124:	83 c4 20             	add    $0x20,%esp
c0101127:	6a 01                	push   $0x1
c0101129:	6a 01                	push   $0x1
c010112b:	6a 01                	push   $0x1
c010112d:	6a 00                	push   $0x0
c010112f:	6a 12                	push   $0x12
c0101131:	68 ff ff 0f 00       	push   $0xfffff
c0101136:	6a 00                	push   $0x0
c0101138:	68 70 70 10 c0       	push   $0xc0107070
c010113d:	e8 ce 02 00 00       	call   c0101410 <_i386SetSegment>
c0101142:	83 c4 20             	add    $0x20,%esp
c0101145:	6a 01                	push   $0x1
c0101147:	6a 01                	push   $0x1
c0101149:	6a 01                	push   $0x1
c010114b:	6a 03                	push   $0x3
c010114d:	6a 1a                	push   $0x1a
c010114f:	68 ff ff 0f 00       	push   $0xfffff
c0101154:	6a 00                	push   $0x0
c0101156:	68 78 70 10 c0       	push   $0xc0107078
c010115b:	e8 b0 02 00 00       	call   c0101410 <_i386SetSegment>
c0101160:	83 c4 20             	add    $0x20,%esp
c0101163:	6a 01                	push   $0x1
c0101165:	6a 01                	push   $0x1
c0101167:	6a 01                	push   $0x1
c0101169:	6a 03                	push   $0x3
c010116b:	6a 12                	push   $0x12
c010116d:	68 ff ff 0f 00       	push   $0xfffff
c0101172:	6a 00                	push   $0x0
c0101174:	68 80 70 10 c0       	push   $0xc0107080
c0101179:	e8 92 02 00 00       	call   c0101410 <_i386SetSegment>
c010117e:	83 c4 20             	add    $0x20,%esp
c0101181:	6a 01                	push   $0x1
c0101183:	6a 01                	push   $0x1
c0101185:	6a 01                	push   $0x1
c0101187:	6a 00                	push   $0x0
c0101189:	6a 09                	push   $0x9
c010118b:	6a 68                	push   $0x68
c010118d:	68 90 78 10 c0       	push   $0xc0107890
c0101192:	68 88 70 10 c0       	push   $0xc0107088
c0101197:	e8 74 02 00 00       	call   c0101410 <_i386SetSegment>
c010119c:	83 c4 20             	add    $0x20,%esp
c010119f:	c7 05 98 78 10 c0 90 	movl   $0x90,0xc0107898
c01011a6:	00 00 00 
c01011a9:	c7 05 f4 78 10 c0 68 	movl   $0x68,0xc01078f4
c01011b0:	00 00 00 
c01011b3:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01011ba:	83 7d fc 2f          	cmpl   $0x2f,0xfffffffc(%ebp)
c01011be:	7e 02                	jle    c01011c2 <_i386CPUInit+0xf4>
c01011c0:	eb 32                	jmp    c01011f4 <_i386CPUInit+0x126>
c01011c2:	83 ec 04             	sub    $0x4,%esp
c01011c5:	6a 01                	push   $0x1
c01011c7:	6a 00                	push   $0x0
c01011c9:	6a 01                	push   $0x1
c01011cb:	6a 0e                	push   $0xe
c01011cd:	6a 08                	push   $0x8
c01011cf:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01011d2:	ff 34 85 00 50 10 c0 	pushl  0xc0105000(,%eax,4)
c01011d9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01011dc:	c1 e0 03             	shl    $0x3,%eax
c01011df:	05 90 70 10 c0       	add    $0xc0107090,%eax
c01011e4:	50                   	push   %eax
c01011e5:	e8 14 03 00 00       	call   c01014fe <_i386SetGate>
c01011ea:	83 c4 20             	add    $0x20,%esp
c01011ed:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01011f0:	ff 00                	incl   (%eax)
c01011f2:	eb c6                	jmp    c01011ba <_i386CPUInit+0xec>
c01011f4:	c7 05 42 70 10 c0 60 	movl   $0xc0107060,0xc0107042
c01011fb:	70 10 c0 
c01011fe:	66 c7 05 40 70 10 c0 	movw   $0x2f,0xc0107040
c0101205:	2f 00 
c0101207:	c7 05 52 70 10 c0 90 	movl   $0xc0107090,0xc0107052
c010120e:	70 10 c0 
c0101211:	66 c7 05 50 70 10 c0 	movw   $0x7ff,0xc0107050
c0101218:	ff 07 
c010121a:	83 ec 0c             	sub    $0xc,%esp
c010121d:	68 40 70 10 c0       	push   $0xc0107040
c0101222:	e8 c0 01 00 00       	call   c01013e7 <_i386LoadGDTR>
c0101227:	83 c4 10             	add    $0x10,%esp
c010122a:	83 ec 0c             	sub    $0xc,%esp
c010122d:	68 50 70 10 c0       	push   $0xc0107050
c0101232:	e8 bb 01 00 00       	call   c01013f2 <_i386LoadIDTR>
c0101237:	83 c4 10             	add    $0x10,%esp
c010123a:	83 ec 0c             	sub    $0xc,%esp
c010123d:	6a 28                	push   $0x28
c010123f:	e8 b9 01 00 00       	call   c01013fd <_i386LoadTSS>
c0101244:	83 c4 10             	add    $0x10,%esp
c0101247:	83 ec 08             	sub    $0x8,%esp
c010124a:	6a 28                	push   $0x28
c010124c:	6a 20                	push   $0x20
c010124e:	e8 35 00 00 00       	call   c0101288 <_i386InitPIC>
c0101253:	83 c4 10             	add    $0x10,%esp
c0101256:	83 ec 0c             	sub    $0xc,%esp
c0101259:	6a 64                	push   $0x64
c010125b:	e8 a2 00 00 00       	call   c0101302 <_i386SetTimerFreq>
c0101260:	83 c4 10             	add    $0x10,%esp
c0101263:	83 ec 0c             	sub    $0xc,%esp
c0101266:	68 20 70 10 c0       	push   $0xc0107020
c010126b:	e8 75 03 00 00       	call   c01015e5 <_i386GetCPUID>
c0101270:	83 c4 10             	add    $0x10,%esp
c0101273:	b8 00 7c 00 c0       	mov    $0xc0007c00,%eax
c0101278:	89 c4                	mov    %eax,%esp
c010127a:	e8 b6 34 00 00       	call   c0104735 <_i386MmInit>
c010127f:	ea a0 2e 10 c0 08 00 	ljmp   $0x8,$0xc0102ea0
c0101286:	c9                   	leave  
c0101287:	c3                   	ret    

c0101288 <_i386InitPIC>:
c0101288:	55                   	push   %ebp
c0101289:	89 e5                	mov    %esp,%ebp
c010128b:	ba 20 00 00 00       	mov    $0x20,%edx
c0101290:	b8 11 00 00 00       	mov    $0x11,%eax
c0101295:	ee                   	out    %al,(%dx)
c0101296:	ba 21 00 00 00       	mov    $0x21,%edx
c010129b:	8b 45 08             	mov    0x8(%ebp),%eax
c010129e:	ee                   	out    %al,(%dx)
c010129f:	ba 21 00 00 00       	mov    $0x21,%edx
c01012a4:	b8 04 00 00 00       	mov    $0x4,%eax
c01012a9:	ee                   	out    %al,(%dx)
c01012aa:	ba 21 00 00 00       	mov    $0x21,%edx
c01012af:	b8 01 00 00 00       	mov    $0x1,%eax
c01012b4:	ee                   	out    %al,(%dx)
c01012b5:	ba 21 00 00 00       	mov    $0x21,%edx
c01012ba:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
c01012bf:	ee                   	out    %al,(%dx)
c01012c0:	ba 21 00 00 00       	mov    $0x21,%edx
c01012c5:	b8 ff 00 00 00       	mov    $0xff,%eax
c01012ca:	ee                   	out    %al,(%dx)
c01012cb:	ba a0 00 00 00       	mov    $0xa0,%edx
c01012d0:	b8 11 00 00 00       	mov    $0x11,%eax
c01012d5:	ee                   	out    %al,(%dx)
c01012d6:	ba a1 00 00 00       	mov    $0xa1,%edx
c01012db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012de:	ee                   	out    %al,(%dx)
c01012df:	ba a1 00 00 00       	mov    $0xa1,%edx
c01012e4:	b8 02 00 00 00       	mov    $0x2,%eax
c01012e9:	ee                   	out    %al,(%dx)
c01012ea:	ba a1 00 00 00       	mov    $0xa1,%edx
c01012ef:	b8 01 00 00 00       	mov    $0x1,%eax
c01012f4:	ee                   	out    %al,(%dx)
c01012f5:	ba a1 00 00 00       	mov    $0xa1,%edx
c01012fa:	b8 ff 00 00 00       	mov    $0xff,%eax
c01012ff:	ee                   	out    %al,(%dx)
c0101300:	5d                   	pop    %ebp
c0101301:	c3                   	ret    

c0101302 <_i386SetTimerFreq>:
c0101302:	55                   	push   %ebp
c0101303:	89 e5                	mov    %esp,%ebp
c0101305:	ba 43 00 00 00       	mov    $0x43,%edx
c010130a:	b8 36 00 00 00       	mov    $0x36,%eax
c010130f:	ee                   	out    %al,(%dx)
c0101310:	b9 40 00 00 00       	mov    $0x40,%ecx
c0101315:	ba de 34 12 00       	mov    $0x1234de,%edx
c010131a:	89 d0                	mov    %edx,%eax
c010131c:	c1 fa 1f             	sar    $0x1f,%edx
c010131f:	f7 7d 08             	idivl  0x8(%ebp)
c0101322:	25 ff 00 00 00       	and    $0xff,%eax
c0101327:	89 ca                	mov    %ecx,%edx
c0101329:	ee                   	out    %al,(%dx)
c010132a:	b9 40 00 00 00       	mov    $0x40,%ecx
c010132f:	ba de 34 12 00       	mov    $0x1234de,%edx
c0101334:	89 d0                	mov    %edx,%eax
c0101336:	c1 fa 1f             	sar    $0x1f,%edx
c0101339:	f7 7d 08             	idivl  0x8(%ebp)
c010133c:	c1 f8 08             	sar    $0x8,%eax
c010133f:	89 ca                	mov    %ecx,%edx
c0101341:	ee                   	out    %al,(%dx)
c0101342:	5d                   	pop    %ebp
c0101343:	c3                   	ret    

c0101344 <_i386HaltCPU>:
c0101344:	55                   	push   %ebp
c0101345:	89 e5                	mov    %esp,%ebp
c0101347:	f4                   	hlt    
c0101348:	5d                   	pop    %ebp
c0101349:	c3                   	ret    

c010134a <_i386EnableIRQ>:
c010134a:	55                   	push   %ebp
c010134b:	89 e5                	mov    %esp,%ebp
c010134d:	b8 01 00 00 00       	mov    $0x1,%eax
c0101352:	8a 4d 08             	mov    0x8(%ebp),%cl
c0101355:	d3 e0                	shl    %cl,%eax
c0101357:	f7 d0                	not    %eax
c0101359:	21 05 00 70 10 c0    	and    %eax,0xc0107000
c010135f:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
c0101363:	7f 0d                	jg     c0101372 <_i386EnableIRQ+0x28>
c0101365:	ba 21 00 00 00       	mov    $0x21,%edx
c010136a:	a1 00 70 10 c0       	mov    0xc0107000,%eax
c010136f:	ee                   	out    %al,(%dx)
c0101370:	eb 0e                	jmp    c0101380 <_i386EnableIRQ+0x36>
c0101372:	ba a1 00 00 00       	mov    $0xa1,%edx
c0101377:	a1 00 70 10 c0       	mov    0xc0107000,%eax
c010137c:	c1 e8 08             	shr    $0x8,%eax
c010137f:	ee                   	out    %al,(%dx)
c0101380:	5d                   	pop    %ebp
c0101381:	c3                   	ret    

c0101382 <_i386DisableIRQ>:
c0101382:	55                   	push   %ebp
c0101383:	89 e5                	mov    %esp,%ebp
c0101385:	b8 01 00 00 00       	mov    $0x1,%eax
c010138a:	8a 4d 08             	mov    0x8(%ebp),%cl
c010138d:	d3 e0                	shl    %cl,%eax
c010138f:	09 05 10 70 10 c0    	or     %eax,0xc0107010
c0101395:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
c0101399:	7f 0d                	jg     c01013a8 <_i386DisableIRQ+0x26>
c010139b:	ba 21 00 00 00       	mov    $0x21,%edx
c01013a0:	a1 10 70 10 c0       	mov    0xc0107010,%eax
c01013a5:	ee                   	out    %al,(%dx)
c01013a6:	eb 0e                	jmp    c01013b6 <_i386DisableIRQ+0x34>
c01013a8:	ba a1 00 00 00       	mov    $0xa1,%edx
c01013ad:	a1 10 70 10 c0       	mov    0xc0107010,%eax
c01013b2:	c1 e8 08             	shr    $0x8,%eax
c01013b5:	ee                   	out    %al,(%dx)
c01013b6:	5d                   	pop    %ebp
c01013b7:	c3                   	ret    

c01013b8 <_i386AckInterrupt>:
c01013b8:	55                   	push   %ebp
c01013b9:	89 e5                	mov    %esp,%ebp
c01013bb:	83 ec 04             	sub    $0x4,%esp
c01013be:	8b 45 08             	mov    0x8(%ebp),%eax
c01013c1:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c01013c4:	ba 20 00 00 00       	mov    $0x20,%edx
c01013c9:	b8 20 00 00 00       	mov    $0x20,%eax
c01013ce:	ee                   	out    %al,(%dx)
c01013cf:	80 7d ff 07          	cmpb   $0x7,0xffffffff(%ebp)
c01013d3:	76 0b                	jbe    c01013e0 <_i386AckInterrupt+0x28>
c01013d5:	ba a0 00 00 00       	mov    $0xa0,%edx
c01013da:	b8 20 00 00 00       	mov    $0x20,%eax
c01013df:	ee                   	out    %al,(%dx)
c01013e0:	c9                   	leave  
c01013e1:	c3                   	ret    

c01013e2 <_i386InitContext>:
c01013e2:	55                   	push   %ebp
c01013e3:	89 e5                	mov    %esp,%ebp
c01013e5:	5d                   	pop    %ebp
c01013e6:	c3                   	ret    

c01013e7 <_i386LoadGDTR>:
c01013e7:	55                   	push   %ebp
c01013e8:	89 e5                	mov    %esp,%ebp
c01013ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ed:	0f 01 10             	lgdtl  (%eax)
c01013f0:	5d                   	pop    %ebp
c01013f1:	c3                   	ret    

c01013f2 <_i386LoadIDTR>:
c01013f2:	55                   	push   %ebp
c01013f3:	89 e5                	mov    %esp,%ebp
c01013f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01013f8:	0f 01 18             	lidtl  (%eax)
c01013fb:	5d                   	pop    %ebp
c01013fc:	c3                   	ret    

c01013fd <_i386LoadTSS>:
c01013fd:	55                   	push   %ebp
c01013fe:	89 e5                	mov    %esp,%ebp
c0101400:	83 ec 04             	sub    $0x4,%esp
c0101403:	8b 45 08             	mov    0x8(%ebp),%eax
c0101406:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c010140a:	0f 00 5d fe          	ltr    0xfffffffe(%ebp)
c010140e:	c9                   	leave  
c010140f:	c3                   	ret    

c0101410 <_i386SetSegment>:
c0101410:	55                   	push   %ebp
c0101411:	89 e5                	mov    %esp,%ebp
c0101413:	83 ec 08             	sub    $0x8,%esp
c0101416:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0101419:	8b 55 20             	mov    0x20(%ebp),%edx
c010141c:	8b 4d 24             	mov    0x24(%ebp),%ecx
c010141f:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c0101422:	88 55 fe             	mov    %dl,0xfffffffe(%ebp)
c0101425:	88 4d fd             	mov    %cl,0xfffffffd(%ebp)
c0101428:	83 ec 08             	sub    $0x8,%esp
c010142b:	6a 08                	push   $0x8
c010142d:	ff 75 08             	pushl  0x8(%ebp)
c0101430:	e8 b1 06 00 00       	call   c0101ae6 <_ZeroMemory>
c0101435:	83 c4 10             	add    $0x10,%esp
c0101438:	8b 55 08             	mov    0x8(%ebp),%edx
c010143b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010143e:	66 89 42 02          	mov    %ax,0x2(%edx)
c0101442:	8b 55 08             	mov    0x8(%ebp),%edx
c0101445:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101448:	c1 e8 10             	shr    $0x10,%eax
c010144b:	88 42 04             	mov    %al,0x4(%edx)
c010144e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101451:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101454:	c1 e8 18             	shr    $0x18,%eax
c0101457:	88 42 07             	mov    %al,0x7(%edx)
c010145a:	8b 55 08             	mov    0x8(%ebp),%edx
c010145d:	8b 45 10             	mov    0x10(%ebp),%eax
c0101460:	66 89 02             	mov    %ax,(%edx)
c0101463:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101466:	8b 45 10             	mov    0x10(%ebp),%eax
c0101469:	89 c2                	mov    %eax,%edx
c010146b:	c1 ea 10             	shr    $0x10,%edx
c010146e:	8a 41 06             	mov    0x6(%ecx),%al
c0101471:	83 e2 0f             	and    $0xf,%edx
c0101474:	83 e0 f0             	and    $0xfffffff0,%eax
c0101477:	09 d0                	or     %edx,%eax
c0101479:	88 41 06             	mov    %al,0x6(%ecx)
c010147c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010147f:	8a 41 05             	mov    0x5(%ecx),%al
c0101482:	8a 55 14             	mov    0x14(%ebp),%dl
c0101485:	83 e2 1f             	and    $0x1f,%edx
c0101488:	83 e0 e0             	and    $0xffffffe0,%eax
c010148b:	09 d0                	or     %edx,%eax
c010148d:	88 41 05             	mov    %al,0x5(%ecx)
c0101490:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101493:	8a 41 05             	mov    0x5(%ecx),%al
c0101496:	8a 55 18             	mov    0x18(%ebp),%dl
c0101499:	83 e2 03             	and    $0x3,%edx
c010149c:	c1 e2 05             	shl    $0x5,%edx
c010149f:	83 e0 9f             	and    $0xffffff9f,%eax
c01014a2:	09 d0                	or     %edx,%eax
c01014a4:	88 41 05             	mov    %al,0x5(%ecx)
c01014a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014aa:	ba 00 00 00 00       	mov    $0x0,%edx
c01014af:	8a 55 ff             	mov    0xffffffff(%ebp),%dl
c01014b2:	8a 41 05             	mov    0x5(%ecx),%al
c01014b5:	c1 e2 07             	shl    $0x7,%edx
c01014b8:	83 e0 7f             	and    $0x7f,%eax
c01014bb:	09 d0                	or     %edx,%eax
c01014bd:	88 41 05             	mov    %al,0x5(%ecx)
c01014c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014c3:	ba 00 00 00 00       	mov    $0x0,%edx
c01014c8:	8a 55 fe             	mov    0xfffffffe(%ebp),%dl
c01014cb:	8a 41 06             	mov    0x6(%ecx),%al
c01014ce:	83 e2 01             	and    $0x1,%edx
c01014d1:	c1 e2 06             	shl    $0x6,%edx
c01014d4:	83 e0 bf             	and    $0xffffffbf,%eax
c01014d7:	09 d0                	or     %edx,%eax
c01014d9:	88 41 06             	mov    %al,0x6(%ecx)
c01014dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01014df:	80 60 06 df          	andb   $0xdf,0x6(%eax)
c01014e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014e6:	ba 00 00 00 00       	mov    $0x0,%edx
c01014eb:	8a 55 fd             	mov    0xfffffffd(%ebp),%dl
c01014ee:	8a 41 06             	mov    0x6(%ecx),%al
c01014f1:	c1 e2 07             	shl    $0x7,%edx
c01014f4:	83 e0 7f             	and    $0x7f,%eax
c01014f7:	09 d0                	or     %edx,%eax
c01014f9:	88 41 06             	mov    %al,0x6(%ecx)
c01014fc:	c9                   	leave  
c01014fd:	c3                   	ret    

c01014fe <_i386SetGate>:
c01014fe:	55                   	push   %ebp
c01014ff:	89 e5                	mov    %esp,%ebp
c0101501:	83 ec 08             	sub    $0x8,%esp
c0101504:	8b 45 10             	mov    0x10(%ebp),%eax
c0101507:	8b 55 18             	mov    0x18(%ebp),%edx
c010150a:	8b 4d 20             	mov    0x20(%ebp),%ecx
c010150d:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c0101511:	88 55 fd             	mov    %dl,0xfffffffd(%ebp)
c0101514:	88 4d fc             	mov    %cl,0xfffffffc(%ebp)
c0101517:	83 ec 08             	sub    $0x8,%esp
c010151a:	6a 08                	push   $0x8
c010151c:	ff 75 08             	pushl  0x8(%ebp)
c010151f:	e8 c2 05 00 00       	call   c0101ae6 <_ZeroMemory>
c0101524:	83 c4 10             	add    $0x10,%esp
c0101527:	8b 55 08             	mov    0x8(%ebp),%edx
c010152a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010152d:	66 89 02             	mov    %ax,(%edx)
c0101530:	8b 55 08             	mov    0x8(%ebp),%edx
c0101533:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101536:	c1 e8 10             	shr    $0x10,%eax
c0101539:	66 89 42 06          	mov    %ax,0x6(%edx)
c010153d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101540:	66 8b 45 fe          	mov    0xfffffffe(%ebp),%ax
c0101544:	66 89 42 02          	mov    %ax,0x2(%edx)
c0101548:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010154b:	8a 41 05             	mov    0x5(%ecx),%al
c010154e:	8a 55 14             	mov    0x14(%ebp),%dl
c0101551:	83 e2 07             	and    $0x7,%edx
c0101554:	83 e0 f8             	and    $0xfffffff8,%eax
c0101557:	09 d0                	or     %edx,%eax
c0101559:	88 41 05             	mov    %al,0x5(%ecx)
c010155c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010155f:	ba 00 00 00 00       	mov    $0x0,%edx
c0101564:	8a 55 fd             	mov    0xfffffffd(%ebp),%dl
c0101567:	8a 41 05             	mov    0x5(%ecx),%al
c010156a:	83 e2 01             	and    $0x1,%edx
c010156d:	c1 e2 03             	shl    $0x3,%edx
c0101570:	83 e0 f7             	and    $0xfffffff7,%eax
c0101573:	09 d0                	or     %edx,%eax
c0101575:	88 41 05             	mov    %al,0x5(%ecx)
c0101578:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010157b:	8a 41 05             	mov    0x5(%ecx),%al
c010157e:	8a 55 1c             	mov    0x1c(%ebp),%dl
c0101581:	83 e2 03             	and    $0x3,%edx
c0101584:	c1 e2 05             	shl    $0x5,%edx
c0101587:	83 e0 9f             	and    $0xffffff9f,%eax
c010158a:	09 d0                	or     %edx,%eax
c010158c:	88 41 05             	mov    %al,0x5(%ecx)
c010158f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101592:	ba 00 00 00 00       	mov    $0x0,%edx
c0101597:	8a 55 fc             	mov    0xfffffffc(%ebp),%dl
c010159a:	8a 41 05             	mov    0x5(%ecx),%al
c010159d:	c1 e2 07             	shl    $0x7,%edx
c01015a0:	83 e0 7f             	and    $0x7f,%eax
c01015a3:	09 d0                	or     %edx,%eax
c01015a5:	88 41 05             	mov    %al,0x5(%ecx)
c01015a8:	c9                   	leave  
c01015a9:	c3                   	ret    

c01015aa <_i386CanChangeFlag>:
c01015aa:	55                   	push   %ebp
c01015ab:	89 e5                	mov    %esp,%ebp
c01015ad:	83 ec 08             	sub    $0x8,%esp
c01015b0:	b8 01 00 00 00       	mov    $0x1,%eax
c01015b5:	8a 4d 08             	mov    0x8(%ebp),%cl
c01015b8:	d3 e0                	shl    %cl,%eax
c01015ba:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01015bd:	9c                   	pushf  
c01015be:	58                   	pop    %eax
c01015bf:	89 c3                	mov    %eax,%ebx
c01015c1:	33 45 f8             	xor    0xfffffff8(%ebp),%eax
c01015c4:	50                   	push   %eax
c01015c5:	9d                   	popf   
c01015c6:	9c                   	pushf  
c01015c7:	58                   	pop    %eax
c01015c8:	33 45 f8             	xor    0xfffffff8(%ebp),%eax
c01015cb:	39 d8                	cmp    %ebx,%eax
c01015cd:	74 04                	je     c01015d3 <_i386CanChangeFlag+0x29>
c01015cf:	31 c0                	xor    %eax,%eax
c01015d1:	eb 05                	jmp    c01015d8 <_i386CanChangeFlag+0x2e>
c01015d3:	b8 01 00 00 00       	mov    $0x1,%eax
c01015d8:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c01015db:	b8 00 00 00 00       	mov    $0x0,%eax
c01015e0:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c01015e3:	c9                   	leave  
c01015e4:	c3                   	ret    

c01015e5 <_i386GetCPUID>:
c01015e5:	55                   	push   %ebp
c01015e6:	89 e5                	mov    %esp,%ebp
c01015e8:	53                   	push   %ebx
c01015e9:	83 ec 14             	sub    $0x14,%esp
c01015ec:	83 ec 08             	sub    $0x8,%esp
c01015ef:	6a 1c                	push   $0x1c
c01015f1:	ff 75 08             	pushl  0x8(%ebp)
c01015f4:	e8 ed 04 00 00       	call   c0101ae6 <_ZeroMemory>
c01015f9:	83 c4 10             	add    $0x10,%esp
c01015fc:	83 ec 0c             	sub    $0xc,%esp
c01015ff:	6a 15                	push   $0x15
c0101601:	e8 a4 ff ff ff       	call   c01015aa <_i386CanChangeFlag>
c0101606:	83 c4 10             	add    $0x10,%esp
c0101609:	84 c0                	test   %al,%al
c010160b:	75 0c                	jne    c0101619 <_i386GetCPUID+0x34>
c010160d:	c7 45 e8 00 00 00 00 	movl   $0x0,0xffffffe8(%ebp)
c0101614:	e9 88 00 00 00       	jmp    c01016a1 <_i386GetCPUID+0xbc>
c0101619:	b8 00 00 00 00       	mov    $0x0,%eax
c010161e:	0f a2                	cpuid  
c0101620:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0101623:	89 d8                	mov    %ebx,%eax
c0101625:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0101628:	89 c8                	mov    %ecx,%eax
c010162a:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c010162d:	89 d0                	mov    %edx,%eax
c010162f:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0101632:	8b 55 08             	mov    0x8(%ebp),%edx
c0101635:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0101638:	89 02                	mov    %eax,(%edx)
c010163a:	8b 55 08             	mov    0x8(%ebp),%edx
c010163d:	83 c2 04             	add    $0x4,%edx
c0101640:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0101643:	89 02                	mov    %eax,(%edx)
c0101645:	8b 55 08             	mov    0x8(%ebp),%edx
c0101648:	83 c2 08             	add    $0x8,%edx
c010164b:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c010164e:	89 02                	mov    %eax,(%edx)
c0101650:	8b 55 08             	mov    0x8(%ebp),%edx
c0101653:	83 c2 0c             	add    $0xc,%edx
c0101656:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101659:	89 02                	mov    %eax,(%edx)
c010165b:	8b 45 08             	mov    0x8(%ebp),%eax
c010165e:	83 38 00             	cmpl   $0x0,(%eax)
c0101661:	74 37                	je     c010169a <_i386GetCPUID+0xb5>
c0101663:	b8 01 00 00 00       	mov    $0x1,%eax
c0101668:	0f a2                	cpuid  
c010166a:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010166d:	89 d8                	mov    %ebx,%eax
c010166f:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0101672:	89 c8                	mov    %ecx,%eax
c0101674:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0101677:	89 d0                	mov    %edx,%eax
c0101679:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c010167c:	8b 55 08             	mov    0x8(%ebp),%edx
c010167f:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0101682:	c1 e8 10             	shr    $0x10,%eax
c0101685:	88 42 11             	mov    %al,0x11(%edx)
c0101688:	8b 55 08             	mov    0x8(%ebp),%edx
c010168b:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c010168e:	89 42 14             	mov    %eax,0x14(%edx)
c0101691:	8b 55 08             	mov    0x8(%ebp),%edx
c0101694:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101697:	89 42 18             	mov    %eax,0x18(%edx)
c010169a:	c7 45 e8 01 00 00 00 	movl   $0x1,0xffffffe8(%ebp)
c01016a1:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c01016a4:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
c01016a7:	c9                   	leave  
c01016a8:	c3                   	ret    

c01016a9 <_i386IsCPUSupported>:
c01016a9:	55                   	push   %ebp
c01016aa:	89 e5                	mov    %esp,%ebp
c01016ac:	83 ec 08             	sub    $0x8,%esp
c01016af:	83 ec 0c             	sub    $0xc,%esp
c01016b2:	6a 12                	push   $0x12
c01016b4:	e8 f1 fe ff ff       	call   c01015aa <_i386CanChangeFlag>
c01016b9:	83 c4 10             	add    $0x10,%esp
c01016bc:	25 ff 00 00 00       	and    $0xff,%eax
c01016c1:	c9                   	leave  
c01016c2:	c3                   	ret    

c01016c3 <_i386QueryFeature>:
c01016c3:	55                   	push   %ebp
c01016c4:	89 e5                	mov    %esp,%ebp
c01016c6:	83 ec 04             	sub    $0x4,%esp
c01016c9:	b8 01 00 00 00       	mov    $0x1,%eax
c01016ce:	8a 4d 08             	mov    0x8(%ebp),%cl
c01016d1:	d3 e0                	shl    %cl,%eax
c01016d3:	23 05 34 70 10 c0    	and    0xc0107034,%eax
c01016d9:	85 c0                	test   %eax,%eax
c01016db:	74 09                	je     c01016e6 <_i386QueryFeature+0x23>
c01016dd:	c7 45 fc 01 00 00 00 	movl   $0x1,0xfffffffc(%ebp)
c01016e4:	eb 07                	jmp    c01016ed <_i386QueryFeature+0x2a>
c01016e6:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01016ed:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01016f0:	c9                   	leave  
c01016f1:	c3                   	ret    
c01016f2:	0a 49 4e             	or     0x4e(%ecx),%cl
c01016f5:	54                   	push   %esp
c01016f6:	45                   	inc    %ebp
c01016f7:	52                   	push   %edx
c01016f8:	52                   	push   %edx
c01016f9:	55                   	push   %ebp
c01016fa:	50                   	push   %eax
c01016fb:	54                   	push   %esp
c01016fc:	20 25 6c 64 0a 00    	and    %ah,0xa646c

c0101702 <_i386InterruptHandler>:
c0101702:	55                   	push   %ebp
c0101703:	89 e5                	mov    %esp,%ebp
c0101705:	83 ec 08             	sub    $0x8,%esp
c0101708:	83 ec 08             	sub    $0x8,%esp
c010170b:	8b 45 08             	mov    0x8(%ebp),%eax
c010170e:	ff 70 30             	pushl  0x30(%eax)
c0101711:	68 f2 16 10 c0       	push   $0xc01016f2
c0101716:	e8 c6 13 00 00       	call   c0102ae1 <_printf>
c010171b:	83 c4 10             	add    $0x10,%esp
c010171e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101721:	8b 40 30             	mov    0x30(%eax),%eax
c0101724:	83 f8 0e             	cmp    $0xe,%eax
c0101727:	74 02                	je     c010172b <_i386InterruptHandler+0x29>
c0101729:	eb 1a                	jmp    c0101745 <_i386InterruptHandler+0x43>
c010172b:	0f 20 d0             	mov    %cr2,%eax
c010172e:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0101731:	83 ec 08             	sub    $0x8,%esp
c0101734:	8b 45 08             	mov    0x8(%ebp),%eax
c0101737:	ff 70 34             	pushl  0x34(%eax)
c010173a:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c010173d:	e8 c4 2e 00 00       	call   c0104606 <_MmPageFault>
c0101742:	83 c4 10             	add    $0x10,%esp
c0101745:	b8 00 00 00 00       	mov    $0x0,%eax
c010174a:	c9                   	leave  
c010174b:	c3                   	ret    
c010174c:	90                   	nop    
c010174d:	90                   	nop    
c010174e:	90                   	nop    
c010174f:	90                   	nop    
c0101750:	90                   	nop    
c0101751:	90                   	nop    
c0101752:	90                   	nop    
c0101753:	90                   	nop    
c0101754:	90                   	nop    
c0101755:	90                   	nop    
c0101756:	90                   	nop    
c0101757:	90                   	nop    
c0101758:	90                   	nop    
c0101759:	90                   	nop    
c010175a:	90                   	nop    
c010175b:	90                   	nop    
c010175c:	90                   	nop    
c010175d:	90                   	nop    
c010175e:	90                   	nop    
c010175f:	90                   	nop    

c0101760 <_interrupt_0>:
c0101760:	68 00 00 00 00       	push   $0x0
c0101765:	68 00 00 00 00       	push   $0x0
c010176a:	e9 01 03 00 00       	jmp    c0101a70 <_isr>
c010176f:	90                   	nop    

c0101770 <_interrupt_1>:
c0101770:	68 00 00 00 00       	push   $0x0
c0101775:	68 01 00 00 00       	push   $0x1
c010177a:	e9 f1 02 00 00       	jmp    c0101a70 <_isr>
c010177f:	90                   	nop    

c0101780 <_interrupt_2>:
c0101780:	68 00 00 00 00       	push   $0x0
c0101785:	68 02 00 00 00       	push   $0x2
c010178a:	e9 e1 02 00 00       	jmp    c0101a70 <_isr>
c010178f:	90                   	nop    

c0101790 <_interrupt_3>:
c0101790:	68 00 00 00 00       	push   $0x0
c0101795:	68 03 00 00 00       	push   $0x3
c010179a:	e9 d1 02 00 00       	jmp    c0101a70 <_isr>
c010179f:	90                   	nop    

c01017a0 <_interrupt_4>:
c01017a0:	68 00 00 00 00       	push   $0x0
c01017a5:	68 04 00 00 00       	push   $0x4
c01017aa:	e9 c1 02 00 00       	jmp    c0101a70 <_isr>
c01017af:	90                   	nop    

c01017b0 <_interrupt_5>:
c01017b0:	68 00 00 00 00       	push   $0x0
c01017b5:	68 05 00 00 00       	push   $0x5
c01017ba:	e9 b1 02 00 00       	jmp    c0101a70 <_isr>
c01017bf:	90                   	nop    

c01017c0 <_interrupt_6>:
c01017c0:	68 00 00 00 00       	push   $0x0
c01017c5:	68 06 00 00 00       	push   $0x6
c01017ca:	e9 a1 02 00 00       	jmp    c0101a70 <_isr>
c01017cf:	90                   	nop    

c01017d0 <_interrupt_7>:
c01017d0:	68 00 00 00 00       	push   $0x0
c01017d5:	68 07 00 00 00       	push   $0x7
c01017da:	e9 91 02 00 00       	jmp    c0101a70 <_isr>
c01017df:	90                   	nop    

c01017e0 <_interrupt_8>:
c01017e0:	68 08 00 00 00       	push   $0x8
c01017e5:	e9 86 02 00 00       	jmp    c0101a70 <_isr>
c01017ea:	90                   	nop    
c01017eb:	90                   	nop    
c01017ec:	90                   	nop    
c01017ed:	90                   	nop    
c01017ee:	90                   	nop    
c01017ef:	90                   	nop    

c01017f0 <_interrupt_9>:
c01017f0:	68 00 00 00 00       	push   $0x0
c01017f5:	68 09 00 00 00       	push   $0x9
c01017fa:	e9 71 02 00 00       	jmp    c0101a70 <_isr>
c01017ff:	90                   	nop    

c0101800 <_interrupt_10>:
c0101800:	68 0a 00 00 00       	push   $0xa
c0101805:	e9 66 02 00 00       	jmp    c0101a70 <_isr>
c010180a:	90                   	nop    
c010180b:	90                   	nop    
c010180c:	90                   	nop    
c010180d:	90                   	nop    
c010180e:	90                   	nop    
c010180f:	90                   	nop    

c0101810 <_interrupt_11>:
c0101810:	68 0b 00 00 00       	push   $0xb
c0101815:	e9 56 02 00 00       	jmp    c0101a70 <_isr>
c010181a:	90                   	nop    
c010181b:	90                   	nop    
c010181c:	90                   	nop    
c010181d:	90                   	nop    
c010181e:	90                   	nop    
c010181f:	90                   	nop    

c0101820 <_interrupt_12>:
c0101820:	68 0c 00 00 00       	push   $0xc
c0101825:	e9 46 02 00 00       	jmp    c0101a70 <_isr>
c010182a:	90                   	nop    
c010182b:	90                   	nop    
c010182c:	90                   	nop    
c010182d:	90                   	nop    
c010182e:	90                   	nop    
c010182f:	90                   	nop    

c0101830 <_interrupt_13>:
c0101830:	68 0d 00 00 00       	push   $0xd
c0101835:	e9 36 02 00 00       	jmp    c0101a70 <_isr>
c010183a:	90                   	nop    
c010183b:	90                   	nop    
c010183c:	90                   	nop    
c010183d:	90                   	nop    
c010183e:	90                   	nop    
c010183f:	90                   	nop    

c0101840 <_interrupt_14>:
c0101840:	68 0e 00 00 00       	push   $0xe
c0101845:	e9 26 02 00 00       	jmp    c0101a70 <_isr>
c010184a:	90                   	nop    
c010184b:	90                   	nop    
c010184c:	90                   	nop    
c010184d:	90                   	nop    
c010184e:	90                   	nop    
c010184f:	90                   	nop    

c0101850 <_interrupt_15>:
c0101850:	68 00 00 00 00       	push   $0x0
c0101855:	68 0f 00 00 00       	push   $0xf
c010185a:	e9 11 02 00 00       	jmp    c0101a70 <_isr>
c010185f:	90                   	nop    

c0101860 <_interrupt_16>:
c0101860:	68 00 00 00 00       	push   $0x0
c0101865:	68 10 00 00 00       	push   $0x10
c010186a:	e9 01 02 00 00       	jmp    c0101a70 <_isr>
c010186f:	90                   	nop    

c0101870 <_interrupt_17>:
c0101870:	68 11 00 00 00       	push   $0x11
c0101875:	e9 f6 01 00 00       	jmp    c0101a70 <_isr>
c010187a:	90                   	nop    
c010187b:	90                   	nop    
c010187c:	90                   	nop    
c010187d:	90                   	nop    
c010187e:	90                   	nop    
c010187f:	90                   	nop    

c0101880 <_interrupt_18>:
c0101880:	68 00 00 00 00       	push   $0x0
c0101885:	68 12 00 00 00       	push   $0x12
c010188a:	e9 e1 01 00 00       	jmp    c0101a70 <_isr>
c010188f:	90                   	nop    

c0101890 <_interrupt_19>:
c0101890:	68 00 00 00 00       	push   $0x0
c0101895:	68 13 00 00 00       	push   $0x13
c010189a:	e9 d1 01 00 00       	jmp    c0101a70 <_isr>
c010189f:	90                   	nop    

c01018a0 <_interrupt_20>:
c01018a0:	68 00 00 00 00       	push   $0x0
c01018a5:	68 14 00 00 00       	push   $0x14
c01018aa:	e9 c1 01 00 00       	jmp    c0101a70 <_isr>
c01018af:	90                   	nop    

c01018b0 <_interrupt_21>:
c01018b0:	68 00 00 00 00       	push   $0x0
c01018b5:	68 15 00 00 00       	push   $0x15
c01018ba:	e9 b1 01 00 00       	jmp    c0101a70 <_isr>
c01018bf:	90                   	nop    

c01018c0 <_interrupt_22>:
c01018c0:	68 00 00 00 00       	push   $0x0
c01018c5:	68 16 00 00 00       	push   $0x16
c01018ca:	e9 a1 01 00 00       	jmp    c0101a70 <_isr>
c01018cf:	90                   	nop    

c01018d0 <_interrupt_23>:
c01018d0:	68 00 00 00 00       	push   $0x0
c01018d5:	68 17 00 00 00       	push   $0x17
c01018da:	e9 91 01 00 00       	jmp    c0101a70 <_isr>
c01018df:	90                   	nop    

c01018e0 <_interrupt_24>:
c01018e0:	68 00 00 00 00       	push   $0x0
c01018e5:	68 18 00 00 00       	push   $0x18
c01018ea:	e9 81 01 00 00       	jmp    c0101a70 <_isr>
c01018ef:	90                   	nop    

c01018f0 <_interrupt_25>:
c01018f0:	68 00 00 00 00       	push   $0x0
c01018f5:	68 19 00 00 00       	push   $0x19
c01018fa:	e9 71 01 00 00       	jmp    c0101a70 <_isr>
c01018ff:	90                   	nop    

c0101900 <_interrupt_26>:
c0101900:	68 00 00 00 00       	push   $0x0
c0101905:	68 1a 00 00 00       	push   $0x1a
c010190a:	e9 61 01 00 00       	jmp    c0101a70 <_isr>
c010190f:	90                   	nop    

c0101910 <_interrupt_27>:
c0101910:	68 00 00 00 00       	push   $0x0
c0101915:	68 1b 00 00 00       	push   $0x1b
c010191a:	e9 51 01 00 00       	jmp    c0101a70 <_isr>
c010191f:	90                   	nop    

c0101920 <_interrupt_28>:
c0101920:	68 00 00 00 00       	push   $0x0
c0101925:	68 1c 00 00 00       	push   $0x1c
c010192a:	e9 41 01 00 00       	jmp    c0101a70 <_isr>
c010192f:	90                   	nop    

c0101930 <_interrupt_29>:
c0101930:	68 00 00 00 00       	push   $0x0
c0101935:	68 1d 00 00 00       	push   $0x1d
c010193a:	e9 31 01 00 00       	jmp    c0101a70 <_isr>
c010193f:	90                   	nop    

c0101940 <_interrupt_30>:
c0101940:	68 00 00 00 00       	push   $0x0
c0101945:	68 1e 00 00 00       	push   $0x1e
c010194a:	e9 21 01 00 00       	jmp    c0101a70 <_isr>
c010194f:	90                   	nop    

c0101950 <_interrupt_31>:
c0101950:	68 00 00 00 00       	push   $0x0
c0101955:	68 1f 00 00 00       	push   $0x1f
c010195a:	e9 11 01 00 00       	jmp    c0101a70 <_isr>
c010195f:	90                   	nop    

c0101960 <_interrupt_32>:
c0101960:	68 00 00 00 00       	push   $0x0
c0101965:	68 20 00 00 00       	push   $0x20
c010196a:	e9 01 01 00 00       	jmp    c0101a70 <_isr>
c010196f:	90                   	nop    

c0101970 <_interrupt_33>:
c0101970:	68 00 00 00 00       	push   $0x0
c0101975:	68 21 00 00 00       	push   $0x21
c010197a:	e9 f1 00 00 00       	jmp    c0101a70 <_isr>
c010197f:	90                   	nop    

c0101980 <_interrupt_34>:
c0101980:	68 00 00 00 00       	push   $0x0
c0101985:	68 22 00 00 00       	push   $0x22
c010198a:	e9 e1 00 00 00       	jmp    c0101a70 <_isr>
c010198f:	90                   	nop    

c0101990 <_interrupt_35>:
c0101990:	68 00 00 00 00       	push   $0x0
c0101995:	68 23 00 00 00       	push   $0x23
c010199a:	e9 d1 00 00 00       	jmp    c0101a70 <_isr>
c010199f:	90                   	nop    

c01019a0 <_interrupt_36>:
c01019a0:	68 00 00 00 00       	push   $0x0
c01019a5:	68 24 00 00 00       	push   $0x24
c01019aa:	e9 c1 00 00 00       	jmp    c0101a70 <_isr>
c01019af:	90                   	nop    

c01019b0 <_interrupt_37>:
c01019b0:	68 00 00 00 00       	push   $0x0
c01019b5:	68 25 00 00 00       	push   $0x25
c01019ba:	e9 b1 00 00 00       	jmp    c0101a70 <_isr>
c01019bf:	90                   	nop    

c01019c0 <_interrupt_38>:
c01019c0:	68 00 00 00 00       	push   $0x0
c01019c5:	68 26 00 00 00       	push   $0x26
c01019ca:	e9 a1 00 00 00       	jmp    c0101a70 <_isr>
c01019cf:	90                   	nop    

c01019d0 <_interrupt_39>:
c01019d0:	68 00 00 00 00       	push   $0x0
c01019d5:	68 27 00 00 00       	push   $0x27
c01019da:	e9 91 00 00 00       	jmp    c0101a70 <_isr>
c01019df:	90                   	nop    

c01019e0 <_interrupt_40>:
c01019e0:	68 00 00 00 00       	push   $0x0
c01019e5:	68 28 00 00 00       	push   $0x28
c01019ea:	e9 81 00 00 00       	jmp    c0101a70 <_isr>
c01019ef:	90                   	nop    

c01019f0 <_interrupt_41>:
c01019f0:	68 00 00 00 00       	push   $0x0
c01019f5:	68 29 00 00 00       	push   $0x29
c01019fa:	e9 71 00 00 00       	jmp    c0101a70 <_isr>
c01019ff:	90                   	nop    

c0101a00 <_interrupt_42>:
c0101a00:	68 00 00 00 00       	push   $0x0
c0101a05:	68 2a 00 00 00       	push   $0x2a
c0101a0a:	e9 61 00 00 00       	jmp    c0101a70 <_isr>
c0101a0f:	90                   	nop    

c0101a10 <_interrupt_43>:
c0101a10:	68 00 00 00 00       	push   $0x0
c0101a15:	68 2b 00 00 00       	push   $0x2b
c0101a1a:	e9 51 00 00 00       	jmp    c0101a70 <_isr>
c0101a1f:	90                   	nop    

c0101a20 <_interrupt_44>:
c0101a20:	68 00 00 00 00       	push   $0x0
c0101a25:	68 2c 00 00 00       	push   $0x2c
c0101a2a:	e9 41 00 00 00       	jmp    c0101a70 <_isr>
c0101a2f:	90                   	nop    

c0101a30 <_interrupt_45>:
c0101a30:	68 00 00 00 00       	push   $0x0
c0101a35:	68 2d 00 00 00       	push   $0x2d
c0101a3a:	e9 31 00 00 00       	jmp    c0101a70 <_isr>
c0101a3f:	90                   	nop    

c0101a40 <_interrupt_46>:
c0101a40:	68 00 00 00 00       	push   $0x0
c0101a45:	68 2e 00 00 00       	push   $0x2e
c0101a4a:	e9 21 00 00 00       	jmp    c0101a70 <_isr>
c0101a4f:	90                   	nop    

c0101a50 <_interrupt_47>:
c0101a50:	68 00 00 00 00       	push   $0x0
c0101a55:	68 2f 00 00 00       	push   $0x2f
c0101a5a:	e9 11 00 00 00       	jmp    c0101a70 <_isr>

c0101a5f <_IsrReentrance>:
c0101a5f:	00 00                	add    %al,(%eax)
c0101a61:	00 00                	add    %al,(%eax)
c0101a63:	90                   	nop    
c0101a64:	90                   	nop    
c0101a65:	90                   	nop    
c0101a66:	90                   	nop    
c0101a67:	90                   	nop    
c0101a68:	90                   	nop    
c0101a69:	90                   	nop    
c0101a6a:	90                   	nop    
c0101a6b:	90                   	nop    
c0101a6c:	90                   	nop    
c0101a6d:	90                   	nop    
c0101a6e:	90                   	nop    
c0101a6f:	90                   	nop    

c0101a70 <_isr>:
c0101a70:	60                   	pusha  
c0101a71:	1e                   	push   %ds
c0101a72:	06                   	push   %es
c0101a73:	0f a0                	push   %fs
c0101a75:	0f a8                	push   %gs
c0101a77:	66 8c d0             	mov    %ss,%ax
c0101a7a:	8e d8                	mov    %eax,%ds
c0101a7c:	8e c0                	mov    %eax,%es
c0101a7e:	8e e0                	mov    %eax,%fs
c0101a80:	8e e8                	mov    %eax,%gs
c0101a82:	89 e3                	mov    %esp,%ebx
c0101a84:	81 3d 5f 1a 10 c0 00 	cmpl   $0x0,0xc0101a5f
c0101a8b:	00 00 00 
c0101a8e:	75 00                	jne    c0101a90 <skip_save_context>

c0101a90 <skip_save_context>:
c0101a90:	ff 05 5f 1a 10 c0    	incl   0xc0101a5f
c0101a96:	53                   	push   %ebx
c0101a97:	e8 66 fc ff ff       	call   c0101702 <_i386InterruptHandler>
c0101a9c:	81 c4 04 00 00 00    	add    $0x4,%esp
c0101aa2:	ff 0d 5f 1a 10 c0    	decl   0xc0101a5f
c0101aa8:	09 c0                	or     %eax,%eax
c0101aaa:	74 02                	je     c0101aae <isr_flush>

c0101aac <_IsrReturn>:
c0101aac:	89 c4                	mov    %eax,%esp

c0101aae <isr_flush>:
c0101aae:	0f a9                	pop    %gs
c0101ab0:	0f a1                	pop    %fs
c0101ab2:	07                   	pop    %es
c0101ab3:	1f                   	pop    %ds
c0101ab4:	61                   	popa   
c0101ab5:	81 c4 08 00 00 00    	add    $0x8,%esp
c0101abb:	cf                   	iret   
c0101abc:	00 00                	add    %al,(%eax)
	...

c0101ac0 <_SetMemory>:
c0101ac0:	55                   	push   %ebp
c0101ac1:	89 e5                	mov    %esp,%ebp
c0101ac3:	57                   	push   %edi
c0101ac4:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101ac7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101aca:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101acd:	fc                   	cld    
c0101ace:	f3 aa                	repz stos %al,%es:(%edi)
c0101ad0:	5f                   	pop    %edi
c0101ad1:	5d                   	pop    %ebp
c0101ad2:	c3                   	ret    

c0101ad3 <_SetMemoryD>:
c0101ad3:	55                   	push   %ebp
c0101ad4:	89 e5                	mov    %esp,%ebp
c0101ad6:	57                   	push   %edi
c0101ad7:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101ada:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101add:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101ae0:	fc                   	cld    
c0101ae1:	f3 ab                	repz stos %eax,%es:(%edi)
c0101ae3:	5f                   	pop    %edi
c0101ae4:	5d                   	pop    %ebp
c0101ae5:	c3                   	ret    

c0101ae6 <_ZeroMemory>:
c0101ae6:	55                   	push   %ebp
c0101ae7:	89 e5                	mov    %esp,%ebp
c0101ae9:	83 ec 08             	sub    $0x8,%esp
c0101aec:	83 ec 04             	sub    $0x4,%esp
c0101aef:	ff 75 0c             	pushl  0xc(%ebp)
c0101af2:	6a 00                	push   $0x0
c0101af4:	ff 75 08             	pushl  0x8(%ebp)
c0101af7:	e8 c4 ff ff ff       	call   c0101ac0 <_SetMemory>
c0101afc:	83 c4 10             	add    $0x10,%esp
c0101aff:	c9                   	leave  
c0101b00:	c3                   	ret    

c0101b01 <_ZeroMemoryD>:
c0101b01:	55                   	push   %ebp
c0101b02:	89 e5                	mov    %esp,%ebp
c0101b04:	83 ec 08             	sub    $0x8,%esp
c0101b07:	83 ec 04             	sub    $0x4,%esp
c0101b0a:	ff 75 0c             	pushl  0xc(%ebp)
c0101b0d:	6a 00                	push   $0x0
c0101b0f:	ff 75 08             	pushl  0x8(%ebp)
c0101b12:	e8 bc ff ff ff       	call   c0101ad3 <_SetMemoryD>
c0101b17:	83 c4 10             	add    $0x10,%esp
c0101b1a:	c9                   	leave  
c0101b1b:	c3                   	ret    

c0101b1c <_ZeroPage>:
c0101b1c:	55                   	push   %ebp
c0101b1d:	89 e5                	mov    %esp,%ebp
c0101b1f:	83 ec 08             	sub    $0x8,%esp
c0101b22:	83 ec 08             	sub    $0x8,%esp
c0101b25:	68 00 10 00 00       	push   $0x1000
c0101b2a:	ff 75 08             	pushl  0x8(%ebp)
c0101b2d:	e8 cf ff ff ff       	call   c0101b01 <_ZeroMemoryD>
c0101b32:	83 c4 10             	add    $0x10,%esp
c0101b35:	c9                   	leave  
c0101b36:	c3                   	ret    

c0101b37 <_CopyMemory>:
c0101b37:	55                   	push   %ebp
c0101b38:	89 e5                	mov    %esp,%ebp
c0101b3a:	57                   	push   %edi
c0101b3b:	56                   	push   %esi
c0101b3c:	8b 75 08             	mov    0x8(%ebp),%esi
c0101b3f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0101b42:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101b45:	fc                   	cld    
c0101b46:	f3 a4                	repz movsb %ds:(%esi),%es:(%edi)
c0101b48:	5e                   	pop    %esi
c0101b49:	5f                   	pop    %edi
c0101b4a:	5d                   	pop    %ebp
c0101b4b:	c3                   	ret    

c0101b4c <_CopyMemoryD>:
c0101b4c:	55                   	push   %ebp
c0101b4d:	89 e5                	mov    %esp,%ebp
c0101b4f:	57                   	push   %edi
c0101b50:	56                   	push   %esi
c0101b51:	8b 75 08             	mov    0x8(%ebp),%esi
c0101b54:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0101b57:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101b5a:	fc                   	cld    
c0101b5b:	f3 a5                	repz movsl %ds:(%esi),%es:(%edi)
c0101b5d:	5e                   	pop    %esi
c0101b5e:	5f                   	pop    %edi
c0101b5f:	5d                   	pop    %ebp
c0101b60:	c3                   	ret    
c0101b61:	90                   	nop    
c0101b62:	90                   	nop    
c0101b63:	90                   	nop    
c0101b64:	90                   	nop    
c0101b65:	90                   	nop    
c0101b66:	90                   	nop    
c0101b67:	90                   	nop    
c0101b68:	90                   	nop    
c0101b69:	90                   	nop    
c0101b6a:	90                   	nop    
c0101b6b:	90                   	nop    
c0101b6c:	90                   	nop    
c0101b6d:	90                   	nop    
c0101b6e:	90                   	nop    
c0101b6f:	90                   	nop    

c0101b70 <__leading_chars>:
c0101b70:	55                   	push   %ebp
c0101b71:	89 e5                	mov    %esp,%ebp
c0101b73:	83 ec 48             	sub    $0x48,%esp
c0101b76:	8b 45 10             	mov    0x10(%ebp),%eax
c0101b79:	8b 55 14             	mov    0x14(%ebp),%edx
c0101b7c:	88 45 f7             	mov    %al,0xfffffff7(%ebp)
c0101b7f:	88 55 f6             	mov    %dl,0xfffffff6(%ebp)
c0101b82:	83 ec 0c             	sub    $0xc,%esp
c0101b85:	ff 75 08             	pushl  0x8(%ebp)
c0101b88:	e8 c3 11 00 00       	call   c0102d50 <_strlen>
c0101b8d:	83 c4 10             	add    $0x10,%esp
c0101b90:	89 c2                	mov    %eax,%edx
c0101b92:	8b 45 18             	mov    0x18(%ebp),%eax
c0101b95:	29 d0                	sub    %edx,%eax
c0101b97:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0101b9a:	c7 45 c8 00 00 00 00 	movl   $0x0,0xffffffc8(%ebp)
c0101ba1:	c7 45 cc 00 00 00 00 	movl   $0x0,0xffffffcc(%ebp)
c0101ba8:	c7 45 d0 00 00 00 00 	movl   $0x0,0xffffffd0(%ebp)
c0101baf:	c7 45 d4 00 00 00 00 	movl   $0x0,0xffffffd4(%ebp)
c0101bb6:	c7 45 d8 00 00 00 00 	movl   $0x0,0xffffffd8(%ebp)
c0101bbd:	c7 45 dc 00 00 00 00 	movl   $0x0,0xffffffdc(%ebp)
c0101bc4:	c7 45 e0 00 00 00 00 	movl   $0x0,0xffffffe0(%ebp)
c0101bcb:	66 c7 45 e4 00 00    	movw   $0x0,0xffffffe4(%ebp)
c0101bd1:	83 7d 18 1e          	cmpl   $0x1e,0x18(%ebp)
c0101bd5:	7f 08                	jg     c0101bdf <__leading_chars+0x6f>
c0101bd7:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
c0101bdb:	7e 02                	jle    c0101bdf <__leading_chars+0x6f>
c0101bdd:	eb 0b                	jmp    c0101bea <__leading_chars+0x7a>
c0101bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101be2:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0101be5:	e9 c8 00 00 00       	jmp    c0101cb2 <__leading_chars+0x142>
c0101bea:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0101bf1:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101bf4:	3b 45 18             	cmp    0x18(%ebp),%eax
c0101bf7:	7c 02                	jl     c0101bfb <__leading_chars+0x8b>
c0101bf9:	eb 7b                	jmp    c0101c76 <__leading_chars+0x106>
c0101bfb:	80 7d f6 00          	cmpb   $0x0,0xfffffff6(%ebp)
c0101bff:	74 38                	je     c0101c39 <__leading_chars+0xc9>
c0101c01:	83 ec 0c             	sub    $0xc,%esp
c0101c04:	ff 75 08             	pushl  0x8(%ebp)
c0101c07:	e8 44 11 00 00       	call   c0102d50 <_strlen>
c0101c0c:	83 c4 10             	add    $0x10,%esp
c0101c0f:	39 45 f0             	cmp    %eax,0xfffffff0(%ebp)
c0101c12:	7d 15                	jge    c0101c29 <__leading_chars+0xb9>
c0101c14:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c17:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c1a:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101c1d:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c20:	03 45 08             	add    0x8(%ebp),%eax
c0101c23:	8a 00                	mov    (%eax),%al
c0101c25:	88 02                	mov    %al,(%edx)
c0101c27:	eb 43                	jmp    c0101c6c <__leading_chars+0xfc>
c0101c29:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c2c:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c2f:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101c32:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c0101c35:	88 02                	mov    %al,(%edx)
c0101c37:	eb 33                	jmp    c0101c6c <__leading_chars+0xfc>
c0101c39:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c3c:	3b 45 ec             	cmp    0xffffffec(%ebp),%eax
c0101c3f:	7d 10                	jge    c0101c51 <__leading_chars+0xe1>
c0101c41:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c44:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c47:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0101c4a:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c0101c4d:	88 02                	mov    %al,(%edx)
c0101c4f:	eb 1b                	jmp    c0101c6c <__leading_chars+0xfc>
c0101c51:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c54:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c57:	8d 48 d0             	lea    0xffffffd0(%eax),%ecx
c0101c5a:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
c0101c5d:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c60:	29 d0                	sub    %edx,%eax
c0101c62:	89 c2                	mov    %eax,%edx
c0101c64:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c67:	8a 04 02             	mov    (%edx,%eax,1),%al
c0101c6a:	88 01                	mov    %al,(%ecx)
c0101c6c:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101c6f:	ff 00                	incl   (%eax)
c0101c71:	e9 7b ff ff ff       	jmp    c0101bf1 <__leading_chars+0x81>
c0101c76:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0101c7d:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c80:	3b 45 18             	cmp    0x18(%ebp),%eax
c0101c83:	7c 02                	jl     c0101c87 <__leading_chars+0x117>
c0101c85:	eb 1c                	jmp    c0101ca3 <__leading_chars+0x133>
c0101c87:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101c8a:	8b 55 08             	mov    0x8(%ebp),%edx
c0101c8d:	01 c2                	add    %eax,%edx
c0101c8f:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101c92:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c0101c95:	83 e8 30             	sub    $0x30,%eax
c0101c98:	8a 00                	mov    (%eax),%al
c0101c9a:	88 02                	mov    %al,(%edx)
c0101c9c:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101c9f:	ff 00                	incl   (%eax)
c0101ca1:	eb da                	jmp    c0101c7d <__leading_chars+0x10d>
c0101ca3:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0101ca6:	03 45 08             	add    0x8(%ebp),%eax
c0101ca9:	c6 00 00             	movb   $0x0,(%eax)
c0101cac:	8b 45 08             	mov    0x8(%ebp),%eax
c0101caf:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0101cb2:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0101cb5:	c9                   	leave  
c0101cb6:	c3                   	ret    

c0101cb7 <__makestr>:
c0101cb7:	55                   	push   %ebp
c0101cb8:	89 e5                	mov    %esp,%ebp
c0101cba:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0101cc0:	8b 45 10             	mov    0x10(%ebp),%eax
c0101cc3:	8b 55 14             	mov    0x14(%ebp),%edx
c0101cc6:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0101cc9:	89 55 f4             	mov    %edx,0xfffffff4(%ebp)
c0101ccc:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101cd3:	8b 45 20             	mov    0x20(%ebp),%eax
c0101cd6:	8b 00                	mov    (%eax),%eax
c0101cd8:	89 45 8c             	mov    %eax,0xffffff8c(%ebp)
c0101cdb:	83 7d 18 01          	cmpl   $0x1,0x18(%ebp)
c0101cdf:	7e 08                	jle    c0101ce9 <__makestr+0x32>
c0101ce1:	83 7d 18 24          	cmpl   $0x24,0x18(%ebp)
c0101ce5:	7f 02                	jg     c0101ce9 <__makestr+0x32>
c0101ce7:	eb 0c                	jmp    c0101cf5 <__makestr+0x3e>
c0101ce9:	c7 45 88 00 00 00 00 	movl   $0x0,0xffffff88(%ebp)
c0101cf0:	e9 c6 01 00 00       	jmp    c0101ebb <__makestr+0x204>
c0101cf5:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101cf8:	83 e0 10             	and    $0x10,%eax
c0101cfb:	85 c0                	test   %eax,%eax
c0101cfd:	74 0d                	je     c0101d0c <__makestr+0x55>
c0101cff:	8b 45 20             	mov    0x20(%ebp),%eax
c0101d02:	8b 55 20             	mov    0x20(%ebp),%edx
c0101d05:	8b 12                	mov    (%edx),%edx
c0101d07:	83 e2 fe             	and    $0xfffffffe,%edx
c0101d0a:	89 10                	mov    %edx,(%eax)
c0101d0c:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d0f:	83 e0 01             	and    $0x1,%eax
c0101d12:	85 c0                	test   %eax,%eax
c0101d14:	74 06                	je     c0101d1c <__makestr+0x65>
c0101d16:	c6 45 87 30          	movb   $0x30,0xffffff87(%ebp)
c0101d1a:	eb 04                	jmp    c0101d20 <__makestr+0x69>
c0101d1c:	c6 45 87 20          	movb   $0x20,0xffffff87(%ebp)
c0101d20:	8a 45 87             	mov    0xffffff87(%ebp),%al
c0101d23:	88 45 ef             	mov    %al,0xffffffef(%ebp)
c0101d26:	c6 45 ee 00          	movb   $0x0,0xffffffee(%ebp)
c0101d2a:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d2d:	83 e0 02             	and    $0x2,%eax
c0101d30:	85 c0                	test   %eax,%eax
c0101d32:	74 4b                	je     c0101d7f <__makestr+0xc8>
c0101d34:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c0101d38:	79 12                	jns    c0101d4c <__makestr+0x95>
c0101d3a:	c6 45 ee 2d          	movb   $0x2d,0xffffffee(%ebp)
c0101d3e:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c0101d41:	f7 18                	negl   (%eax)
c0101d43:	83 50 04 00          	adcl   $0x0,0x4(%eax)
c0101d47:	f7 58 04             	negl   0x4(%eax)
c0101d4a:	eb 1e                	jmp    c0101d6a <__makestr+0xb3>
c0101d4c:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d4f:	83 e0 04             	and    $0x4,%eax
c0101d52:	85 c0                	test   %eax,%eax
c0101d54:	74 06                	je     c0101d5c <__makestr+0xa5>
c0101d56:	c6 45 ee 2b          	movb   $0x2b,0xffffffee(%ebp)
c0101d5a:	eb 0e                	jmp    c0101d6a <__makestr+0xb3>
c0101d5c:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d5f:	83 e0 08             	and    $0x8,%eax
c0101d62:	85 c0                	test   %eax,%eax
c0101d64:	74 04                	je     c0101d6a <__makestr+0xb3>
c0101d66:	c6 45 ee 20          	movb   $0x20,0xffffffee(%ebp)
c0101d6a:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101d6d:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101d70:	01 d0                	add    %edx,%eax
c0101d72:	8d 50 e0             	lea    0xffffffe0(%eax),%edx
c0101d75:	8a 45 ee             	mov    0xffffffee(%ebp),%al
c0101d78:	88 02                	mov    %al,(%edx)
c0101d7a:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101d7d:	ff 00                	incl   (%eax)
c0101d7f:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101d82:	83 e0 20             	and    $0x20,%eax
c0101d85:	85 c0                	test   %eax,%eax
c0101d87:	74 47                	je     c0101dd0 <__makestr+0x119>
c0101d89:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
c0101d8d:	75 28                	jne    c0101db7 <__makestr+0x100>
c0101d8f:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101d92:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101d95:	01 d0                	add    %edx,%eax
c0101d97:	83 e8 20             	sub    $0x20,%eax
c0101d9a:	c6 00 30             	movb   $0x30,(%eax)
c0101d9d:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101da0:	ff 00                	incl   (%eax)
c0101da2:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101da5:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101da8:	01 d0                	add    %edx,%eax
c0101daa:	83 e8 20             	sub    $0x20,%eax
c0101dad:	c6 00 78             	movb   $0x78,(%eax)
c0101db0:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101db3:	ff 00                	incl   (%eax)
c0101db5:	eb 19                	jmp    c0101dd0 <__makestr+0x119>
c0101db7:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
c0101dbb:	75 13                	jne    c0101dd0 <__makestr+0x119>
c0101dbd:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101dc0:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0101dc3:	01 d0                	add    %edx,%eax
c0101dc5:	83 e8 20             	sub    $0x20,%eax
c0101dc8:	c6 00 30             	movb   $0x30,(%eax)
c0101dcb:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101dce:	ff 00                	incl   (%eax)
c0101dd0:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101dd3:	03 45 94             	add    0xffffff94(%ebp),%eax
c0101dd6:	83 e8 20             	sub    $0x20,%eax
c0101dd9:	c6 00 00             	movb   $0x0,(%eax)
c0101ddc:	6a 00                	push   $0x0
c0101dde:	ff 75 18             	pushl  0x18(%ebp)
c0101de1:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101de4:	50                   	push   %eax
c0101de5:	ff 75 f0             	pushl  0xfffffff0(%ebp)
c0101de8:	e8 43 0d 00 00       	call   c0102b30 <_itoaex>
c0101ded:	83 c4 10             	add    $0x10,%esp
c0101df0:	85 c0                	test   %eax,%eax
c0101df2:	75 0c                	jne    c0101e00 <__makestr+0x149>
c0101df4:	c7 45 88 00 00 00 00 	movl   $0x0,0xffffff88(%ebp)
c0101dfb:	e9 bb 00 00 00       	jmp    c0101ebb <__makestr+0x204>
c0101e00:	8b 45 8c             	mov    0xffffff8c(%ebp),%eax
c0101e03:	83 e0 40             	and    $0x40,%eax
c0101e06:	85 c0                	test   %eax,%eax
c0101e08:	74 0f                	je     c0101e19 <__makestr+0x162>
c0101e0a:	83 ec 0c             	sub    $0xc,%esp
c0101e0d:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101e10:	50                   	push   %eax
c0101e11:	e8 60 0f 00 00       	call   c0102d76 <__strupr>
c0101e16:	83 c4 10             	add    $0x10,%esp
c0101e19:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101e20:	c7 45 90 00 00 00 00 	movl   $0x0,0xffffff90(%ebp)
c0101e27:	83 ec 0c             	sub    $0xc,%esp
c0101e2a:	8d 45 d8             	lea    0xffffffd8(%ebp),%eax
c0101e2d:	50                   	push   %eax
c0101e2e:	e8 1d 0f 00 00       	call   c0102d50 <_strlen>
c0101e33:	83 c4 10             	add    $0x10,%esp
c0101e36:	39 45 90             	cmp    %eax,0xffffff90(%ebp)
c0101e39:	7c 02                	jl     c0101e3d <__makestr+0x186>
c0101e3b:	eb 29                	jmp    c0101e66 <__makestr+0x1af>
c0101e3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e40:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101e43:	77 21                	ja     c0101e66 <__makestr+0x1af>
c0101e45:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101e48:	8b 55 08             	mov    0x8(%ebp),%edx
c0101e4b:	01 c2                	add    %eax,%edx
c0101e4d:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101e50:	03 45 90             	add    0xffffff90(%ebp),%eax
c0101e53:	83 e8 20             	sub    $0x20,%eax
c0101e56:	8a 00                	mov    (%eax),%al
c0101e58:	88 02                	mov    %al,(%edx)
c0101e5a:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101e5d:	ff 00                	incl   (%eax)
c0101e5f:	8d 45 90             	lea    0xffffff90(%ebp),%eax
c0101e62:	ff 00                	incl   (%eax)
c0101e64:	eb c1                	jmp    c0101e27 <__makestr+0x170>
c0101e66:	c7 45 90 00 00 00 00 	movl   $0x0,0xffffff90(%ebp)
c0101e6d:	83 ec 0c             	sub    $0xc,%esp
c0101e70:	8d 45 98             	lea    0xffffff98(%ebp),%eax
c0101e73:	50                   	push   %eax
c0101e74:	e8 d7 0e 00 00       	call   c0102d50 <_strlen>
c0101e79:	83 c4 10             	add    $0x10,%esp
c0101e7c:	39 45 90             	cmp    %eax,0xffffff90(%ebp)
c0101e7f:	7c 02                	jl     c0101e83 <__makestr+0x1cc>
c0101e81:	eb 29                	jmp    c0101eac <__makestr+0x1f5>
c0101e83:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e86:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101e89:	77 21                	ja     c0101eac <__makestr+0x1f5>
c0101e8b:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101e8e:	8b 55 08             	mov    0x8(%ebp),%edx
c0101e91:	01 c2                	add    %eax,%edx
c0101e93:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0101e96:	03 45 90             	add    0xffffff90(%ebp),%eax
c0101e99:	83 e8 60             	sub    $0x60,%eax
c0101e9c:	8a 00                	mov    (%eax),%al
c0101e9e:	88 02                	mov    %al,(%edx)
c0101ea0:	8d 45 90             	lea    0xffffff90(%ebp),%eax
c0101ea3:	ff 00                	incl   (%eax)
c0101ea5:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0101ea8:	ff 00                	incl   (%eax)
c0101eaa:	eb c1                	jmp    c0101e6d <__makestr+0x1b6>
c0101eac:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0101eaf:	03 45 08             	add    0x8(%ebp),%eax
c0101eb2:	c6 00 00             	movb   $0x0,(%eax)
c0101eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eb8:	89 45 88             	mov    %eax,0xffffff88(%ebp)
c0101ebb:	8b 45 88             	mov    0xffffff88(%ebp),%eax
c0101ebe:	c9                   	leave  
c0101ebf:	c3                   	ret    
c0101ec0:	3c 4e                	cmp    $0x4e,%al
c0101ec2:	55                   	push   %ebp
c0101ec3:	4c                   	dec    %esp
c0101ec4:	4c                   	dec    %esp
c0101ec5:	3e 00 55 89          	add    %dl,%ds:0xffffff89(%ebp)

c0101ec7 <_vsnprintf>:
c0101ec7:	55                   	push   %ebp
c0101ec8:	89 e5                	mov    %esp,%ebp
c0101eca:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0101ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ed3:	89 45 e0             	mov    %eax,0xffffffe0(%ebp)
c0101ed6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101ed9:	03 45 08             	add    0x8(%ebp),%eax
c0101edc:	48                   	dec    %eax
c0101edd:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
c0101ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ee3:	48                   	dec    %eax
c0101ee4:	39 45 e4             	cmp    %eax,0xffffffe4(%ebp)
c0101ee7:	73 13                	jae    c0101efc <_vsnprintf+0x35>
c0101ee9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,0xffffffe4(%ebp)
c0101ef0:	8b 55 08             	mov    0x8(%ebp),%edx
c0101ef3:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
c0101ef6:	29 d0                	sub    %edx,%eax
c0101ef8:	40                   	inc    %eax
c0101ef9:	89 45 0c             	mov    %eax,0xc(%ebp)
c0101efc:	90                   	nop    
c0101efd:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f00:	80 38 00             	cmpb   $0x0,(%eax)
c0101f03:	75 05                	jne    c0101f0a <_vsnprintf+0x43>
c0101f05:	e9 09 08 00 00       	jmp    c0102713 <_vsnprintf+0x84c>
c0101f0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f0d:	80 38 25             	cmpb   $0x25,(%eax)
c0101f10:	74 24                	je     c0101f36 <_vsnprintf+0x6f>
c0101f12:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0101f15:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c0101f18:	0f 87 f5 07 00 00    	ja     c0102713 <_vsnprintf+0x84c>
c0101f1e:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0101f21:	89 c2                	mov    %eax,%edx
c0101f23:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f26:	8a 00                	mov    (%eax),%al
c0101f28:	88 02                	mov    %al,(%edx)
c0101f2a:	8d 45 10             	lea    0x10(%ebp),%eax
c0101f2d:	ff 00                	incl   (%eax)
c0101f2f:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0101f32:	ff 00                	incl   (%eax)
c0101f34:	eb c7                	jmp    c0101efd <_vsnprintf+0x36>
c0101f36:	c7 45 9c 00 00 00 00 	movl   $0x0,0xffffff9c(%ebp)
c0101f3d:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,0xffffffa0(%ebp)
c0101f44:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,0xffffffec(%ebp)
c0101f4b:	c7 45 a4 0a 00 00 00 	movl   $0xa,0xffffffa4(%ebp)
c0101f52:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0101f59:	8d 45 10             	lea    0x10(%ebp),%eax
c0101f5c:	ff 00                	incl   (%eax)
c0101f5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0101f61:	0f be 00             	movsbl (%eax),%eax
c0101f64:	83 e8 20             	sub    $0x20,%eax
c0101f67:	89 45 8c             	mov    %eax,0xffffff8c(%ebp)
c0101f6a:	83 7d 8c 10          	cmpl   $0x10,0xffffff8c(%ebp)
c0101f6e:	77 7e                	ja     c0101fee <_vsnprintf+0x127>
c0101f70:	8b 55 8c             	mov    0xffffff8c(%ebp),%edx
c0101f73:	8b 04 95 7c 1f 10 c0 	mov    0xc0101f7c(,%edx,4),%eax
c0101f7a:	ff e0                	jmp    *%eax
c0101f7c:	e3 1f                	jecxz  c0101f9d <_vsnprintf+0xd6>
c0101f7e:	10 c0                	adc    %al,%al
c0101f80:	ee                   	out    %al,(%dx)
c0101f81:	1f                   	pop    %ds
c0101f82:	10 c0                	adc    %al,%al
c0101f84:	ee                   	out    %al,(%dx)
c0101f85:	1f                   	pop    %ds
c0101f86:	10 c0                	adc    %al,%al
c0101f88:	d8 1f                	fcomps (%edi)
c0101f8a:	10 c0                	adc    %al,%al
c0101f8c:	ee                   	out    %al,(%dx)
c0101f8d:	1f                   	pop    %ds
c0101f8e:	10 c0                	adc    %al,%al
c0101f90:	ee                   	out    %al,(%dx)
c0101f91:	1f                   	pop    %ds
c0101f92:	10 c0                	adc    %al,%al
c0101f94:	ee                   	out    %al,(%dx)
c0101f95:	1f                   	pop    %ds
c0101f96:	10 c0                	adc    %al,%al
c0101f98:	ee                   	out    %al,(%dx)
c0101f99:	1f                   	pop    %ds
c0101f9a:	10 c0                	adc    %al,%al
c0101f9c:	ee                   	out    %al,(%dx)
c0101f9d:	1f                   	pop    %ds
c0101f9e:	10 c0                	adc    %al,%al
c0101fa0:	ee                   	out    %al,(%dx)
c0101fa1:	1f                   	pop    %ds
c0101fa2:	10 c0                	adc    %al,%al
c0101fa4:	ee                   	out    %al,(%dx)
c0101fa5:	1f                   	pop    %ds
c0101fa6:	10 c0                	adc    %al,%al
c0101fa8:	d0 1f                	rcrb   (%edi)
c0101faa:	10 c0                	adc    %al,%al
c0101fac:	ee                   	out    %al,(%dx)
c0101fad:	1f                   	pop    %ds
c0101fae:	10 c0                	adc    %al,%al
c0101fb0:	c8 1f 10 c0          	enter  $0x101f,$0xc0
c0101fb4:	ee                   	out    %al,(%dx)
c0101fb5:	1f                   	pop    %ds
c0101fb6:	10 c0                	adc    %al,%al
c0101fb8:	ee                   	out    %al,(%dx)
c0101fb9:	1f                   	pop    %ds
c0101fba:	10 c0                	adc    %al,%al
c0101fbc:	c0 1f 10             	rcrb   $0x10,(%edi)
c0101fbf:	c0 8d 45 9c 83 08 01 	rorb   $0x1,0x8839c45(%ebp)
c0101fc6:	eb 91                	jmp    c0101f59 <_vsnprintf+0x92>
c0101fc8:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101fcb:	83 08 10             	orl    $0x10,(%eax)
c0101fce:	eb 89                	jmp    c0101f59 <_vsnprintf+0x92>
c0101fd0:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101fd3:	83 08 04             	orl    $0x4,(%eax)
c0101fd6:	eb 81                	jmp    c0101f59 <_vsnprintf+0x92>
c0101fd8:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101fdb:	83 08 20             	orl    $0x20,(%eax)
c0101fde:	e9 76 ff ff ff       	jmp    c0101f59 <_vsnprintf+0x92>
c0101fe3:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0101fe6:	83 08 08             	orl    $0x8,(%eax)
c0101fe9:	e9 6b ff ff ff       	jmp    c0101f59 <_vsnprintf+0x92>
c0101fee:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ff1:	80 38 2f             	cmpb   $0x2f,(%eax)
c0101ff4:	7e 60                	jle    c0102056 <_vsnprintf+0x18f>
c0101ff6:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ff9:	80 38 39             	cmpb   $0x39,(%eax)
c0101ffc:	7f 58                	jg     c0102056 <_vsnprintf+0x18f>
c0101ffe:	8b 45 10             	mov    0x10(%ebp),%eax
c0102001:	80 38 2f             	cmpb   $0x2f,(%eax)
c0102004:	7e 28                	jle    c010202e <_vsnprintf+0x167>
c0102006:	8b 45 10             	mov    0x10(%ebp),%eax
c0102009:	80 38 39             	cmpb   $0x39,(%eax)
c010200c:	7e 02                	jle    c0102010 <_vsnprintf+0x149>
c010200e:	eb 1e                	jmp    c010202e <_vsnprintf+0x167>
c0102010:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c0102013:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102016:	01 d0                	add    %edx,%eax
c0102018:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c010201b:	8b 45 10             	mov    0x10(%ebp),%eax
c010201e:	8a 00                	mov    (%eax),%al
c0102020:	88 02                	mov    %al,(%edx)
c0102022:	8d 45 10             	lea    0x10(%ebp),%eax
c0102025:	ff 00                	incl   (%eax)
c0102027:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c010202a:	ff 00                	incl   (%eax)
c010202c:	eb d0                	jmp    c0101ffe <_vsnprintf+0x137>
c010202e:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102031:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102034:	83 e8 50             	sub    $0x50,%eax
c0102037:	c6 00 00             	movb   $0x0,(%eax)
c010203a:	83 ec 0c             	sub    $0xc,%esp
c010203d:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102040:	50                   	push   %eax
c0102041:	e8 70 0c 00 00       	call   c0102cb6 <_atoi>
c0102046:	83 c4 10             	add    $0x10,%esp
c0102049:	89 45 a0             	mov    %eax,0xffffffa0(%ebp)
c010204c:	8d 45 10             	lea    0x10(%ebp),%eax
c010204f:	ff 08                	decl   (%eax)
c0102051:	e9 03 ff ff ff       	jmp    c0101f59 <_vsnprintf+0x92>
c0102056:	8b 45 10             	mov    0x10(%ebp),%eax
c0102059:	80 38 2a             	cmpb   $0x2a,(%eax)
c010205c:	75 27                	jne    c0102085 <_vsnprintf+0x1be>
c010205e:	8d 45 10             	lea    0x10(%ebp),%eax
c0102061:	ff 00                	incl   (%eax)
c0102063:	8d 45 14             	lea    0x14(%ebp),%eax
c0102066:	83 00 04             	addl   $0x4,(%eax)
c0102069:	8b 45 14             	mov    0x14(%ebp),%eax
c010206c:	83 e8 04             	sub    $0x4,%eax
c010206f:	8b 00                	mov    (%eax),%eax
c0102071:	89 45 a0             	mov    %eax,0xffffffa0(%ebp)
c0102074:	83 7d a0 00          	cmpl   $0x0,0xffffffa0(%ebp)
c0102078:	79 0b                	jns    c0102085 <_vsnprintf+0x1be>
c010207a:	8d 45 a0             	lea    0xffffffa0(%ebp),%eax
c010207d:	f7 18                	negl   (%eax)
c010207f:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102082:	83 08 10             	orl    $0x10,(%eax)
c0102085:	8b 45 10             	mov    0x10(%ebp),%eax
c0102088:	80 38 2e             	cmpb   $0x2e,(%eax)
c010208b:	0f 85 98 00 00 00    	jne    c0102129 <_vsnprintf+0x262>
c0102091:	8d 45 10             	lea    0x10(%ebp),%eax
c0102094:	ff 00                	incl   (%eax)
c0102096:	8b 45 10             	mov    0x10(%ebp),%eax
c0102099:	80 38 2f             	cmpb   $0x2f,(%eax)
c010209c:	7e 60                	jle    c01020fe <_vsnprintf+0x237>
c010209e:	8b 45 10             	mov    0x10(%ebp),%eax
c01020a1:	80 38 39             	cmpb   $0x39,(%eax)
c01020a4:	7f 58                	jg     c01020fe <_vsnprintf+0x237>
c01020a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01020a9:	80 38 2f             	cmpb   $0x2f,(%eax)
c01020ac:	7e 28                	jle    c01020d6 <_vsnprintf+0x20f>
c01020ae:	8b 45 10             	mov    0x10(%ebp),%eax
c01020b1:	80 38 39             	cmpb   $0x39,(%eax)
c01020b4:	7e 02                	jle    c01020b8 <_vsnprintf+0x1f1>
c01020b6:	eb 1e                	jmp    c01020d6 <_vsnprintf+0x20f>
c01020b8:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c01020bb:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c01020be:	01 d0                	add    %edx,%eax
c01020c0:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c01020c3:	8b 45 10             	mov    0x10(%ebp),%eax
c01020c6:	8a 00                	mov    (%eax),%al
c01020c8:	88 02                	mov    %al,(%edx)
c01020ca:	8d 45 10             	lea    0x10(%ebp),%eax
c01020cd:	ff 00                	incl   (%eax)
c01020cf:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c01020d2:	ff 00                	incl   (%eax)
c01020d4:	eb d0                	jmp    c01020a6 <_vsnprintf+0x1df>
c01020d6:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01020d9:	03 45 94             	add    0xffffff94(%ebp),%eax
c01020dc:	83 e8 50             	sub    $0x50,%eax
c01020df:	c6 00 00             	movb   $0x0,(%eax)
c01020e2:	83 ec 0c             	sub    $0xc,%esp
c01020e5:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01020e8:	50                   	push   %eax
c01020e9:	e8 c8 0b 00 00       	call   c0102cb6 <_atoi>
c01020ee:	83 c4 10             	add    $0x10,%esp
c01020f1:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c01020f4:	8d 45 10             	lea    0x10(%ebp),%eax
c01020f7:	ff 08                	decl   (%eax)
c01020f9:	e9 5b fe ff ff       	jmp    c0101f59 <_vsnprintf+0x92>
c01020fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0102101:	80 38 2a             	cmpb   $0x2a,(%eax)
c0102104:	75 16                	jne    c010211c <_vsnprintf+0x255>
c0102106:	8d 45 10             	lea    0x10(%ebp),%eax
c0102109:	ff 00                	incl   (%eax)
c010210b:	8d 45 14             	lea    0x14(%ebp),%eax
c010210e:	83 00 04             	addl   $0x4,(%eax)
c0102111:	8b 45 14             	mov    0x14(%ebp),%eax
c0102114:	83 e8 04             	sub    $0x4,%eax
c0102117:	8b 00                	mov    (%eax),%eax
c0102119:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c010211c:	83 7d ec 00          	cmpl   $0x0,0xffffffec(%ebp)
c0102120:	79 07                	jns    c0102129 <_vsnprintf+0x262>
c0102122:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
c0102129:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,0xffffff98(%ebp)
c0102130:	8b 45 10             	mov    0x10(%ebp),%eax
c0102133:	80 38 68             	cmpb   $0x68,(%eax)
c0102136:	74 1a                	je     c0102152 <_vsnprintf+0x28b>
c0102138:	8b 45 10             	mov    0x10(%ebp),%eax
c010213b:	80 38 6c             	cmpb   $0x6c,(%eax)
c010213e:	74 12                	je     c0102152 <_vsnprintf+0x28b>
c0102140:	8b 45 10             	mov    0x10(%ebp),%eax
c0102143:	80 38 4c             	cmpb   $0x4c,(%eax)
c0102146:	74 0a                	je     c0102152 <_vsnprintf+0x28b>
c0102148:	8b 45 10             	mov    0x10(%ebp),%eax
c010214b:	80 38 5a             	cmpb   $0x5a,(%eax)
c010214e:	74 02                	je     c0102152 <_vsnprintf+0x28b>
c0102150:	eb 28                	jmp    c010217a <_vsnprintf+0x2b3>
c0102152:	8b 45 10             	mov    0x10(%ebp),%eax
c0102155:	0f be 00             	movsbl (%eax),%eax
c0102158:	89 45 98             	mov    %eax,0xffffff98(%ebp)
c010215b:	8d 45 10             	lea    0x10(%ebp),%eax
c010215e:	ff 00                	incl   (%eax)
c0102160:	83 7d 98 6c          	cmpl   $0x6c,0xffffff98(%ebp)
c0102164:	75 14                	jne    c010217a <_vsnprintf+0x2b3>
c0102166:	8b 45 10             	mov    0x10(%ebp),%eax
c0102169:	80 38 6c             	cmpb   $0x6c,(%eax)
c010216c:	75 0c                	jne    c010217a <_vsnprintf+0x2b3>
c010216e:	c7 45 98 4c 00 00 00 	movl   $0x4c,0xffffff98(%ebp)
c0102175:	8d 45 10             	lea    0x10(%ebp),%eax
c0102178:	ff 00                	incl   (%eax)
c010217a:	8b 45 10             	mov    0x10(%ebp),%eax
c010217d:	0f be 00             	movsbl (%eax),%eax
c0102180:	83 e8 25             	sub    $0x25,%eax
c0102183:	89 85 7c ff ff ff    	mov    %eax,0xffffff7c(%ebp)
c0102189:	83 bd 7c ff ff ff 53 	cmpl   $0x53,0xffffff7c(%ebp)
c0102190:	0f 87 c3 fd ff ff    	ja     c0101f59 <_vsnprintf+0x92>
c0102196:	8b 95 7c ff ff ff    	mov    0xffffff7c(%ebp),%edx
c010219c:	8b 04 95 a8 21 10 c0 	mov    0xc01021a8(,%edx,4),%eax
c01021a3:	ff e0                	jmp    *%eax
c01021a5:	8d 76 00             	lea    0x0(%esi),%esi
c01021a8:	8d 24 10             	lea    (%eax,%edx,1),%esp
c01021ab:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021af:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021b3:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021b7:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021bb:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021bf:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021c3:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021c7:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021cb:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021cf:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021d3:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021d7:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021db:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021df:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021e3:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021e7:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021eb:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021ef:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021f3:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021f7:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021fb:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c01021ff:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102203:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102207:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010220b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010220f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102213:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102217:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010221b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010221f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102223:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102227:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010222b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010222f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102233:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102237:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010223b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010223f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102243:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102247:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010224b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010224f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102253:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102257:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010225b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010225f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102263:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102267:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010226b:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c010226f:	c0 59 1f 10          	rcrb   $0x10,0x1f(%ecx)
c0102273:	c0                   	(bad)  
c0102274:	b0 25                	mov    $0x25,%al
c0102276:	10 c0                	adc    %al,%al
c0102278:	59                   	pop    %ecx
c0102279:	1f                   	pop    %ds
c010227a:	10 c0                	adc    %al,%al
c010227c:	59                   	pop    %ecx
c010227d:	1f                   	pop    %ds
c010227e:	10 c0                	adc    %al,%al
c0102280:	59                   	pop    %ecx
c0102281:	1f                   	pop    %ds
c0102282:	10 c0                	adc    %al,%al
c0102284:	59                   	pop    %ecx
c0102285:	1f                   	pop    %ds
c0102286:	10 c0                	adc    %al,%al
c0102288:	59                   	pop    %ecx
c0102289:	1f                   	pop    %ds
c010228a:	10 c0                	adc    %al,%al
c010228c:	59                   	pop    %ecx
c010228d:	1f                   	pop    %ds
c010228e:	10 c0                	adc    %al,%al
c0102290:	59                   	pop    %ecx
c0102291:	1f                   	pop    %ds
c0102292:	10 c0                	adc    %al,%al
c0102294:	59                   	pop    %ecx
c0102295:	1f                   	pop    %ds
c0102296:	10 c0                	adc    %al,%al
c0102298:	59                   	pop    %ecx
c0102299:	1f                   	pop    %ds
c010229a:	10 c0                	adc    %al,%al
c010229c:	59                   	pop    %ecx
c010229d:	1f                   	pop    %ds
c010229e:	10 c0                	adc    %al,%al
c01022a0:	f8                   	clc    
c01022a1:	22 10                	and    (%eax),%dl
c01022a3:	c0 a1 25 10 c0 59 1f 	shlb   $0x1f,0x59c01025(%ecx)
c01022aa:	10 c0                	adc    %al,%al
c01022ac:	59                   	pop    %ecx
c01022ad:	1f                   	pop    %ds
c01022ae:	10 c0                	adc    %al,%al
c01022b0:	59                   	pop    %ecx
c01022b1:	1f                   	pop    %ds
c01022b2:	10 c0                	adc    %al,%al
c01022b4:	59                   	pop    %ecx
c01022b5:	1f                   	pop    %ds
c01022b6:	10 c0                	adc    %al,%al
c01022b8:	a1 25 10 c0 59       	mov    0x59c01025,%eax
c01022bd:	1f                   	pop    %ds
c01022be:	10 c0                	adc    %al,%al
c01022c0:	59                   	pop    %ecx
c01022c1:	1f                   	pop    %ds
c01022c2:	10 c0                	adc    %al,%al
c01022c4:	59                   	pop    %ecx
c01022c5:	1f                   	pop    %ds
c01022c6:	10 c0                	adc    %al,%al
c01022c8:	59                   	pop    %ecx
c01022c9:	1f                   	pop    %ds
c01022ca:	10 c0                	adc    %al,%al
c01022cc:	a2 24 10 c0 bf       	mov    %al,0xbfc01024
c01022d1:	25 10 c0 ca 24       	and    $0x24cac010,%eax
c01022d6:	10 c0                	adc    %al,%al
c01022d8:	59                   	pop    %ecx
c01022d9:	1f                   	pop    %ds
c01022da:	10 c0                	adc    %al,%al
c01022dc:	59                   	pop    %ecx
c01022dd:	1f                   	pop    %ds
c01022de:	10 c0                	adc    %al,%al
c01022e0:	a0 23 10 c0 59       	mov    0x59c01023,%al
c01022e5:	1f                   	pop    %ds
c01022e6:	10 c0                	adc    %al,%al
c01022e8:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
c01022e9:	25 10 c0 59 1f       	and    $0x1f59c010,%eax
c01022ee:	10 c0                	adc    %al,%al
c01022f0:	59                   	pop    %ecx
c01022f1:	1f                   	pop    %ds
c01022f2:	10 c0                	adc    %al,%al
c01022f4:	b6 25                	mov    $0x25,%dh
c01022f6:	10 c0                	adc    %al,%al
c01022f8:	8d 45 14             	lea    0x14(%ebp),%eax
c01022fb:	83 00 04             	addl   $0x4,(%eax)
c01022fe:	8b 45 14             	mov    0x14(%ebp),%eax
c0102301:	83 e8 04             	sub    $0x4,%eax
c0102304:	8a 00                	mov    (%eax),%al
c0102306:	88 45 f7             	mov    %al,0xfffffff7(%ebp)
c0102309:	8a 45 f7             	mov    0xfffffff7(%ebp),%al
c010230c:	88 45 a8             	mov    %al,0xffffffa8(%ebp)
c010230f:	c6 45 a9 00          	movb   $0x0,0xffffffa9(%ebp)
c0102313:	83 ec 0c             	sub    $0xc,%esp
c0102316:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102319:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c010231c:	c1 e8 04             	shr    $0x4,%eax
c010231f:	83 e0 01             	and    $0x1,%eax
c0102322:	50                   	push   %eax
c0102323:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102326:	83 e0 01             	and    $0x1,%eax
c0102329:	85 c0                	test   %eax,%eax
c010232b:	74 09                	je     c0102336 <_vsnprintf+0x46f>
c010232d:	c7 45 88 30 00 00 00 	movl   $0x30,0xffffff88(%ebp)
c0102334:	eb 07                	jmp    c010233d <_vsnprintf+0x476>
c0102336:	c7 45 88 20 00 00 00 	movl   $0x20,0xffffff88(%ebp)
c010233d:	ff 75 88             	pushl  0xffffff88(%ebp)
c0102340:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c0102343:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102346:	50                   	push   %eax
c0102347:	e8 24 f8 ff ff       	call   c0101b70 <__leading_chars>
c010234c:	83 c4 20             	add    $0x20,%esp
c010234f:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0102356:	83 ec 0c             	sub    $0xc,%esp
c0102359:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c010235c:	50                   	push   %eax
c010235d:	e8 ee 09 00 00       	call   c0102d50 <_strlen>
c0102362:	83 c4 10             	add    $0x10,%esp
c0102365:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c0102368:	7c 02                	jl     c010236c <_vsnprintf+0x4a5>
c010236a:	eb 2a                	jmp    c0102396 <_vsnprintf+0x4cf>
c010236c:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010236f:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c0102372:	0f 87 9b 03 00 00    	ja     c0102713 <_vsnprintf+0x84c>
c0102378:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010237b:	89 c2                	mov    %eax,%edx
c010237d:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102380:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102383:	83 e8 50             	sub    $0x50,%eax
c0102386:	8a 00                	mov    (%eax),%al
c0102388:	88 02                	mov    %al,(%edx)
c010238a:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c010238d:	ff 00                	incl   (%eax)
c010238f:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102392:	ff 00                	incl   (%eax)
c0102394:	eb c0                	jmp    c0102356 <_vsnprintf+0x48f>
c0102396:	8d 45 10             	lea    0x10(%ebp),%eax
c0102399:	ff 00                	incl   (%eax)
c010239b:	e9 5d fb ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c01023a0:	8d 45 14             	lea    0x14(%ebp),%eax
c01023a3:	83 00 04             	addl   $0x4,(%eax)
c01023a6:	8b 45 14             	mov    0x14(%ebp),%eax
c01023a9:	83 e8 04             	sub    $0x4,%eax
c01023ac:	8b 00                	mov    (%eax),%eax
c01023ae:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01023b1:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c01023b5:	75 07                	jne    c01023be <_vsnprintf+0x4f7>
c01023b7:	c7 45 f0 c0 1e 10 c0 	movl   $0xc0101ec0,0xfffffff0(%ebp)
c01023be:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c01023c5:	83 ec 0c             	sub    $0xc,%esp
c01023c8:	ff 75 f0             	pushl  0xfffffff0(%ebp)
c01023cb:	e8 80 09 00 00       	call   c0102d50 <_strlen>
c01023d0:	83 c4 10             	add    $0x10,%esp
c01023d3:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c01023d6:	7c 02                	jl     c01023da <_vsnprintf+0x513>
c01023d8:	eb 1a                	jmp    c01023f4 <_vsnprintf+0x52d>
c01023da:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01023dd:	03 45 94             	add    0xffffff94(%ebp),%eax
c01023e0:	8d 50 b0             	lea    0xffffffb0(%eax),%edx
c01023e3:	8b 45 94             	mov    0xffffff94(%ebp),%eax
c01023e6:	03 45 f0             	add    0xfffffff0(%ebp),%eax
c01023e9:	8a 00                	mov    (%eax),%al
c01023eb:	88 02                	mov    %al,(%edx)
c01023ed:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c01023f0:	ff 00                	incl   (%eax)
c01023f2:	eb d1                	jmp    c01023c5 <_vsnprintf+0x4fe>
c01023f4:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01023f7:	03 45 94             	add    0xffffff94(%ebp),%eax
c01023fa:	83 e8 50             	sub    $0x50,%eax
c01023fd:	c6 00 00             	movb   $0x0,(%eax)
c0102400:	83 ec 0c             	sub    $0xc,%esp
c0102403:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102406:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102409:	c1 e8 04             	shr    $0x4,%eax
c010240c:	83 e0 01             	and    $0x1,%eax
c010240f:	50                   	push   %eax
c0102410:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102413:	83 e0 01             	and    $0x1,%eax
c0102416:	85 c0                	test   %eax,%eax
c0102418:	74 09                	je     c0102423 <_vsnprintf+0x55c>
c010241a:	c7 45 84 30 00 00 00 	movl   $0x30,0xffffff84(%ebp)
c0102421:	eb 07                	jmp    c010242a <_vsnprintf+0x563>
c0102423:	c7 45 84 20 00 00 00 	movl   $0x20,0xffffff84(%ebp)
c010242a:	ff 75 84             	pushl  0xffffff84(%ebp)
c010242d:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c0102430:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102433:	50                   	push   %eax
c0102434:	e8 37 f7 ff ff       	call   c0101b70 <__leading_chars>
c0102439:	83 c4 20             	add    $0x20,%esp
c010243c:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0102443:	83 ec 0c             	sub    $0xc,%esp
c0102446:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102449:	50                   	push   %eax
c010244a:	e8 01 09 00 00       	call   c0102d50 <_strlen>
c010244f:	83 c4 10             	add    $0x10,%esp
c0102452:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c0102455:	7c 02                	jl     c0102459 <_vsnprintf+0x592>
c0102457:	eb 2a                	jmp    c0102483 <_vsnprintf+0x5bc>
c0102459:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010245c:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c010245f:	0f 87 ae 02 00 00    	ja     c0102713 <_vsnprintf+0x84c>
c0102465:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102468:	89 c2                	mov    %eax,%edx
c010246a:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c010246d:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102470:	83 e8 50             	sub    $0x50,%eax
c0102473:	8a 00                	mov    (%eax),%al
c0102475:	88 02                	mov    %al,(%edx)
c0102477:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c010247a:	ff 00                	incl   (%eax)
c010247c:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c010247f:	ff 00                	incl   (%eax)
c0102481:	eb c0                	jmp    c0102443 <_vsnprintf+0x57c>
c0102483:	8d 45 10             	lea    0x10(%ebp),%eax
c0102486:	ff 00                	incl   (%eax)
c0102488:	e9 70 fa ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c010248d:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102490:	c6 00 25             	movb   $0x25,(%eax)
c0102493:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0102496:	ff 00                	incl   (%eax)
c0102498:	8d 45 10             	lea    0x10(%ebp),%eax
c010249b:	ff 00                	incl   (%eax)
c010249d:	e9 5b fa ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c01024a2:	8d 45 14             	lea    0x14(%ebp),%eax
c01024a5:	83 00 04             	addl   $0x4,(%eax)
c01024a8:	8b 45 14             	mov    0x14(%ebp),%eax
c01024ab:	83 e8 04             	sub    $0x4,%eax
c01024ae:	8b 00                	mov    (%eax),%eax
c01024b0:	89 45 90             	mov    %eax,0xffffff90(%ebp)
c01024b3:	8b 4d 90             	mov    0xffffff90(%ebp),%ecx
c01024b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01024b9:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01024bc:	29 d0                	sub    %edx,%eax
c01024be:	89 01                	mov    %eax,(%ecx)
c01024c0:	8d 45 10             	lea    0x10(%ebp),%eax
c01024c3:	ff 00                	incl   (%eax)
c01024c5:	e9 33 fa ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c01024ca:	83 7d a0 ff          	cmpl   $0xffffffff,0xffffffa0(%ebp)
c01024ce:	75 07                	jne    c01024d7 <_vsnprintf+0x610>
c01024d0:	c7 45 a0 08 00 00 00 	movl   $0x8,0xffffffa0(%ebp)
c01024d7:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01024da:	83 08 01             	orl    $0x1,(%eax)
c01024dd:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01024e0:	81 20 ef 00 00 00    	andl   $0xef,(%eax)
c01024e6:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01024e9:	83 08 40             	orl    $0x40,(%eax)
c01024ec:	83 ec 04             	sub    $0x4,%esp
c01024ef:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01024f2:	50                   	push   %eax
c01024f3:	ff 75 ec             	pushl  0xffffffec(%ebp)
c01024f6:	6a 10                	push   $0x10
c01024f8:	8d 45 14             	lea    0x14(%ebp),%eax
c01024fb:	83 00 04             	addl   $0x4,(%eax)
c01024fe:	8b 45 14             	mov    0x14(%ebp),%eax
c0102501:	83 e8 04             	sub    $0x4,%eax
c0102504:	8b 00                	mov    (%eax),%eax
c0102506:	ba 00 00 00 00       	mov    $0x0,%edx
c010250b:	52                   	push   %edx
c010250c:	50                   	push   %eax
c010250d:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c0102510:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102513:	50                   	push   %eax
c0102514:	e8 9e f7 ff ff       	call   c0101cb7 <__makestr>
c0102519:	83 c4 20             	add    $0x20,%esp
c010251c:	83 ec 0c             	sub    $0xc,%esp
c010251f:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102522:	6a 00                	push   $0x0
c0102524:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102527:	83 e0 01             	and    $0x1,%eax
c010252a:	85 c0                	test   %eax,%eax
c010252c:	74 09                	je     c0102537 <_vsnprintf+0x670>
c010252e:	c7 45 80 30 00 00 00 	movl   $0x30,0xffffff80(%ebp)
c0102535:	eb 07                	jmp    c010253e <_vsnprintf+0x677>
c0102537:	c7 45 80 20 00 00 00 	movl   $0x20,0xffffff80(%ebp)
c010253e:	ff 75 80             	pushl  0xffffff80(%ebp)
c0102541:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c0102544:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c0102547:	50                   	push   %eax
c0102548:	e8 23 f6 ff ff       	call   c0101b70 <__leading_chars>
c010254d:	83 c4 20             	add    $0x20,%esp
c0102550:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c0102557:	83 ec 0c             	sub    $0xc,%esp
c010255a:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c010255d:	50                   	push   %eax
c010255e:	e8 ed 07 00 00       	call   c0102d50 <_strlen>
c0102563:	83 c4 10             	add    $0x10,%esp
c0102566:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c0102569:	7c 02                	jl     c010256d <_vsnprintf+0x6a6>
c010256b:	eb 2a                	jmp    c0102597 <_vsnprintf+0x6d0>
c010256d:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102570:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c0102573:	0f 87 9a 01 00 00    	ja     c0102713 <_vsnprintf+0x84c>
c0102579:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010257c:	89 c2                	mov    %eax,%edx
c010257e:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102581:	03 45 94             	add    0xffffff94(%ebp),%eax
c0102584:	83 e8 50             	sub    $0x50,%eax
c0102587:	8a 00                	mov    (%eax),%al
c0102589:	88 02                	mov    %al,(%edx)
c010258b:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c010258e:	ff 00                	incl   (%eax)
c0102590:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102593:	ff 00                	incl   (%eax)
c0102595:	eb c0                	jmp    c0102557 <_vsnprintf+0x690>
c0102597:	8d 45 10             	lea    0x10(%ebp),%eax
c010259a:	ff 00                	incl   (%eax)
c010259c:	e9 5c f9 ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c01025a1:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01025a4:	83 08 02             	orl    $0x2,(%eax)
c01025a7:	c7 45 a4 0a 00 00 00 	movl   $0xa,0xffffffa4(%ebp)
c01025ae:	eb 16                	jmp    c01025c6 <_vsnprintf+0x6ff>
c01025b0:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c01025b3:	83 08 40             	orl    $0x40,(%eax)
c01025b6:	c7 45 a4 10 00 00 00 	movl   $0x10,0xffffffa4(%ebp)
c01025bd:	eb 07                	jmp    c01025c6 <_vsnprintf+0x6ff>
c01025bf:	c7 45 a4 08 00 00 00 	movl   $0x8,0xffffffa4(%ebp)
c01025c6:	83 7d 98 4c          	cmpl   $0x4c,0xffffff98(%ebp)
c01025ca:	75 13                	jne    c01025df <_vsnprintf+0x718>
c01025cc:	8d 45 14             	lea    0x14(%ebp),%eax
c01025cf:	83 00 08             	addl   $0x8,(%eax)
c01025d2:	8b 45 14             	mov    0x14(%ebp),%eax
c01025d5:	83 e8 08             	sub    $0x8,%eax
c01025d8:	8b 00                	mov    (%eax),%eax
c01025da:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01025dd:	eb 73                	jmp    c0102652 <_vsnprintf+0x78b>
c01025df:	83 7d 98 6c          	cmpl   $0x6c,0xffffff98(%ebp)
c01025e3:	75 13                	jne    c01025f8 <_vsnprintf+0x731>
c01025e5:	8d 45 14             	lea    0x14(%ebp),%eax
c01025e8:	83 00 04             	addl   $0x4,(%eax)
c01025eb:	8b 45 14             	mov    0x14(%ebp),%eax
c01025ee:	83 e8 04             	sub    $0x4,%eax
c01025f1:	8b 00                	mov    (%eax),%eax
c01025f3:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c01025f6:	eb 5a                	jmp    c0102652 <_vsnprintf+0x78b>
c01025f8:	83 7d 98 5a          	cmpl   $0x5a,0xffffff98(%ebp)
c01025fc:	75 13                	jne    c0102611 <_vsnprintf+0x74a>
c01025fe:	8d 45 14             	lea    0x14(%ebp),%eax
c0102601:	83 00 04             	addl   $0x4,(%eax)
c0102604:	8b 45 14             	mov    0x14(%ebp),%eax
c0102607:	83 e8 04             	sub    $0x4,%eax
c010260a:	8b 00                	mov    (%eax),%eax
c010260c:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010260f:	eb 41                	jmp    c0102652 <_vsnprintf+0x78b>
c0102611:	83 7d 98 68          	cmpl   $0x68,0xffffff98(%ebp)
c0102615:	75 2a                	jne    c0102641 <_vsnprintf+0x77a>
c0102617:	8d 45 14             	lea    0x14(%ebp),%eax
c010261a:	83 00 04             	addl   $0x4,(%eax)
c010261d:	8b 45 14             	mov    0x14(%ebp),%eax
c0102620:	83 e8 04             	sub    $0x4,%eax
c0102623:	66 8b 00             	mov    (%eax),%ax
c0102626:	25 ff ff 00 00       	and    $0xffff,%eax
c010262b:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010262e:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102631:	83 e0 02             	and    $0x2,%eax
c0102634:	85 c0                	test   %eax,%eax
c0102636:	74 1a                	je     c0102652 <_vsnprintf+0x78b>
c0102638:	0f bf 45 e8          	movswl 0xffffffe8(%ebp),%eax
c010263c:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010263f:	eb 11                	jmp    c0102652 <_vsnprintf+0x78b>
c0102641:	8d 45 14             	lea    0x14(%ebp),%eax
c0102644:	83 00 04             	addl   $0x4,(%eax)
c0102647:	8b 45 14             	mov    0x14(%ebp),%eax
c010264a:	83 e8 04             	sub    $0x4,%eax
c010264d:	8b 00                	mov    (%eax),%eax
c010264f:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0102652:	83 ec 04             	sub    $0x4,%esp
c0102655:	8d 45 9c             	lea    0xffffff9c(%ebp),%eax
c0102658:	50                   	push   %eax
c0102659:	ff 75 ec             	pushl  0xffffffec(%ebp)
c010265c:	ff 75 a4             	pushl  0xffffffa4(%ebp)
c010265f:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0102662:	89 c2                	mov    %eax,%edx
c0102664:	c1 fa 1f             	sar    $0x1f,%edx
c0102667:	52                   	push   %edx
c0102668:	50                   	push   %eax
c0102669:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c010266c:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c010266f:	50                   	push   %eax
c0102670:	e8 42 f6 ff ff       	call   c0101cb7 <__makestr>
c0102675:	83 c4 20             	add    $0x20,%esp
c0102678:	85 c0                	test   %eax,%eax
c010267a:	75 05                	jne    c0102681 <_vsnprintf+0x7ba>
c010267c:	e9 92 00 00 00       	jmp    c0102713 <_vsnprintf+0x84c>
c0102681:	83 ec 0c             	sub    $0xc,%esp
c0102684:	ff 75 a0             	pushl  0xffffffa0(%ebp)
c0102687:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c010268a:	c1 e8 04             	shr    $0x4,%eax
c010268d:	83 e0 01             	and    $0x1,%eax
c0102690:	50                   	push   %eax
c0102691:	8b 45 9c             	mov    0xffffff9c(%ebp),%eax
c0102694:	83 e0 01             	and    $0x1,%eax
c0102697:	85 c0                	test   %eax,%eax
c0102699:	74 0c                	je     c01026a7 <_vsnprintf+0x7e0>
c010269b:	c7 85 78 ff ff ff 30 	movl   $0x30,0xffffff78(%ebp)
c01026a2:	00 00 00 
c01026a5:	eb 0a                	jmp    c01026b1 <_vsnprintf+0x7ea>
c01026a7:	c7 85 78 ff ff ff 20 	movl   $0x20,0xffffff78(%ebp)
c01026ae:	00 00 00 
c01026b1:	ff b5 78 ff ff ff    	pushl  0xffffff78(%ebp)
c01026b7:	ff 75 e4             	pushl  0xffffffe4(%ebp)
c01026ba:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01026bd:	50                   	push   %eax
c01026be:	e8 ad f4 ff ff       	call   c0101b70 <__leading_chars>
c01026c3:	83 c4 20             	add    $0x20,%esp
c01026c6:	c7 45 94 00 00 00 00 	movl   $0x0,0xffffff94(%ebp)
c01026cd:	83 ec 0c             	sub    $0xc,%esp
c01026d0:	8d 45 a8             	lea    0xffffffa8(%ebp),%eax
c01026d3:	50                   	push   %eax
c01026d4:	e8 77 06 00 00       	call   c0102d50 <_strlen>
c01026d9:	83 c4 10             	add    $0x10,%esp
c01026dc:	39 45 94             	cmp    %eax,0xffffff94(%ebp)
c01026df:	7c 02                	jl     c01026e3 <_vsnprintf+0x81c>
c01026e1:	eb 26                	jmp    c0102709 <_vsnprintf+0x842>
c01026e3:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01026e6:	3b 45 e4             	cmp    0xffffffe4(%ebp),%eax
c01026e9:	77 28                	ja     c0102713 <_vsnprintf+0x84c>
c01026eb:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c01026ee:	89 c2                	mov    %eax,%edx
c01026f0:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01026f3:	03 45 94             	add    0xffffff94(%ebp),%eax
c01026f6:	83 e8 50             	sub    $0x50,%eax
c01026f9:	8a 00                	mov    (%eax),%al
c01026fb:	88 02                	mov    %al,(%edx)
c01026fd:	8d 45 e0             	lea    0xffffffe0(%ebp),%eax
c0102700:	ff 00                	incl   (%eax)
c0102702:	8d 45 94             	lea    0xffffff94(%ebp),%eax
c0102705:	ff 00                	incl   (%eax)
c0102707:	eb c4                	jmp    c01026cd <_vsnprintf+0x806>
c0102709:	8d 45 10             	lea    0x10(%ebp),%eax
c010270c:	ff 00                	incl   (%eax)
c010270e:	e9 ea f7 ff ff       	jmp    c0101efd <_vsnprintf+0x36>
c0102713:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c0102716:	c6 00 00             	movb   $0x0,(%eax)
c0102719:	8b 55 08             	mov    0x8(%ebp),%edx
c010271c:	8b 45 e0             	mov    0xffffffe0(%ebp),%eax
c010271f:	29 d0                	sub    %edx,%eax
c0102721:	c9                   	leave  
c0102722:	c3                   	ret    

c0102723 <_snprintf>:
c0102723:	55                   	push   %ebp
c0102724:	89 e5                	mov    %esp,%ebp
c0102726:	83 ec 08             	sub    $0x8,%esp
c0102729:	8d 45 10             	lea    0x10(%ebp),%eax
c010272c:	83 c0 04             	add    $0x4,%eax
c010272f:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102732:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c0102735:	ff 75 10             	pushl  0x10(%ebp)
c0102738:	ff 75 0c             	pushl  0xc(%ebp)
c010273b:	ff 75 08             	pushl  0x8(%ebp)
c010273e:	e8 84 f7 ff ff       	call   c0101ec7 <_vsnprintf>
c0102743:	83 c4 10             	add    $0x10,%esp
c0102746:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102749:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010274c:	c9                   	leave  
c010274d:	c3                   	ret    

c010274e <_sprintf>:
c010274e:	55                   	push   %ebp
c010274f:	89 e5                	mov    %esp,%ebp
c0102751:	83 ec 08             	sub    $0x8,%esp
c0102754:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102757:	83 c0 04             	add    $0x4,%eax
c010275a:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010275d:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c0102760:	ff 75 0c             	pushl  0xc(%ebp)
c0102763:	6a ff                	push   $0xffffffff
c0102765:	ff 75 08             	pushl  0x8(%ebp)
c0102768:	e8 5a f7 ff ff       	call   c0101ec7 <_vsnprintf>
c010276d:	83 c4 10             	add    $0x10,%esp
c0102770:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102773:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102776:	c9                   	leave  
c0102777:	c3                   	ret    
c0102778:	90                   	nop    
c0102779:	90                   	nop    
c010277a:	90                   	nop    
c010277b:	90                   	nop    
c010277c:	90                   	nop    
c010277d:	90                   	nop    
c010277e:	90                   	nop    
c010277f:	90                   	nop    

c0102780 <_outb>:
c0102780:	55                   	push   %ebp
c0102781:	89 e5                	mov    %esp,%ebp
c0102783:	83 ec 04             	sub    $0x4,%esp
c0102786:	8b 45 08             	mov    0x8(%ebp),%eax
c0102789:	8b 55 0c             	mov    0xc(%ebp),%edx
c010278c:	66 89 45 fe          	mov    %ax,0xfffffffe(%ebp)
c0102790:	88 55 fd             	mov    %dl,0xfffffffd(%ebp)
c0102793:	66 8b 55 fe          	mov    0xfffffffe(%ebp),%dx
c0102797:	8a 45 fd             	mov    0xfffffffd(%ebp),%al
c010279a:	ee                   	out    %al,(%dx)
c010279b:	c9                   	leave  
c010279c:	c3                   	ret    

c010279d <_GetColor>:
c010279d:	55                   	push   %ebp
c010279e:	89 e5                	mov    %esp,%ebp
c01027a0:	a1 c8 50 10 c0       	mov    0xc01050c8,%eax
c01027a5:	5d                   	pop    %ebp
c01027a6:	c3                   	ret    

c01027a7 <_SetColor>:
c01027a7:	55                   	push   %ebp
c01027a8:	89 e5                	mov    %esp,%ebp
c01027aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ad:	a3 c8 50 10 c0       	mov    %eax,0xc01050c8
c01027b2:	5d                   	pop    %ebp
c01027b3:	c3                   	ret    

c01027b4 <_SetXY>:
c01027b4:	55                   	push   %ebp
c01027b5:	89 e5                	mov    %esp,%ebp
c01027b7:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c01027bc:	48                   	dec    %eax
c01027bd:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01027c0:	76 09                	jbe    c01027cb <_SetXY+0x17>
c01027c2:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c01027c7:	48                   	dec    %eax
c01027c8:	89 45 08             	mov    %eax,0x8(%ebp)
c01027cb:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c01027d0:	48                   	dec    %eax
c01027d1:	39 45 08             	cmp    %eax,0x8(%ebp)
c01027d4:	76 09                	jbe    c01027df <_SetXY+0x2b>
c01027d6:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c01027db:	48                   	dec    %eax
c01027dc:	89 45 08             	mov    %eax,0x8(%ebp)
c01027df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027e2:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c01027e9:	03 45 08             	add    0x8(%ebp),%eax
c01027ec:	01 c0                	add    %eax,%eax
c01027ee:	a3 c4 50 10 c0       	mov    %eax,0xc01050c4
c01027f3:	5d                   	pop    %ebp
c01027f4:	c3                   	ret    

c01027f5 <_GetXY>:
c01027f5:	55                   	push   %ebp
c01027f6:	89 e5                	mov    %esp,%ebp
c01027f8:	53                   	push   %ebx
c01027f9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c01027fc:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c0102801:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0102804:	a1 c4 50 10 c0       	mov    0xc01050c4,%eax
c0102809:	89 d3                	mov    %edx,%ebx
c010280b:	ba 00 00 00 00       	mov    $0x0,%edx
c0102810:	f7 f3                	div    %ebx
c0102812:	89 01                	mov    %eax,(%ecx)
c0102814:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0102817:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c010281c:	8d 14 00             	lea    (%eax,%eax,1),%edx
c010281f:	a1 c4 50 10 c0       	mov    0xc01050c4,%eax
c0102824:	89 d3                	mov    %edx,%ebx
c0102826:	ba 00 00 00 00       	mov    $0x0,%edx
c010282b:	f7 f3                	div    %ebx
c010282d:	89 d0                	mov    %edx,%eax
c010282f:	d1 e8                	shr    %eax
c0102831:	89 01                	mov    %eax,(%ecx)
c0102833:	5b                   	pop    %ebx
c0102834:	5d                   	pop    %ebp
c0102835:	c3                   	ret    

c0102836 <_SetCursor>:
c0102836:	55                   	push   %ebp
c0102837:	89 e5                	mov    %esp,%ebp
c0102839:	83 ec 08             	sub    $0x8,%esp
c010283c:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c0102841:	0f af 45 0c          	imul   0xc(%ebp),%eax
c0102845:	03 45 08             	add    0x8(%ebp),%eax
c0102848:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010284b:	83 ec 08             	sub    $0x8,%esp
c010284e:	6a 0f                	push   $0xf
c0102850:	68 d4 03 00 00       	push   $0x3d4
c0102855:	e8 26 ff ff ff       	call   c0102780 <_outb>
c010285a:	83 c4 10             	add    $0x10,%esp
c010285d:	83 ec 08             	sub    $0x8,%esp
c0102860:	b8 00 00 00 00       	mov    $0x0,%eax
c0102865:	8a 45 fc             	mov    0xfffffffc(%ebp),%al
c0102868:	50                   	push   %eax
c0102869:	68 d5 03 00 00       	push   $0x3d5
c010286e:	e8 0d ff ff ff       	call   c0102780 <_outb>
c0102873:	83 c4 10             	add    $0x10,%esp
c0102876:	83 ec 08             	sub    $0x8,%esp
c0102879:	6a 0e                	push   $0xe
c010287b:	68 d4 03 00 00       	push   $0x3d4
c0102880:	e8 fb fe ff ff       	call   c0102780 <_outb>
c0102885:	83 c4 10             	add    $0x10,%esp
c0102888:	83 ec 08             	sub    $0x8,%esp
c010288b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010288e:	c1 f8 08             	sar    $0x8,%eax
c0102891:	25 ff 00 00 00       	and    $0xff,%eax
c0102896:	50                   	push   %eax
c0102897:	68 d5 03 00 00       	push   $0x3d5
c010289c:	e8 df fe ff ff       	call   c0102780 <_outb>
c01028a1:	83 c4 10             	add    $0x10,%esp
c01028a4:	c9                   	leave  
c01028a5:	c3                   	ret    

c01028a6 <_MoveUp>:
c01028a6:	55                   	push   %ebp
c01028a7:	89 e5                	mov    %esp,%ebp
c01028a9:	83 ec 08             	sub    $0x8,%esp
c01028ac:	a1 cc 50 10 c0       	mov    0xc01050cc,%eax
c01028b1:	01 c0                	add    %eax,%eax
c01028b3:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01028b6:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c01028bd:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c01028c2:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c01028c9:	01 c0                	add    %eax,%eax
c01028cb:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
c01028ce:	72 02                	jb     c01028d2 <_MoveUp+0x2c>
c01028d0:	eb 24                	jmp    c01028f6 <_MoveUp+0x50>
c01028d2:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01028d5:	8b 15 c0 50 10 c0    	mov    0xc01050c0,%edx
c01028db:	01 c2                	add    %eax,%edx
c01028dd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01028e0:	03 05 c0 50 10 c0    	add    0xc01050c0,%eax
c01028e6:	8a 00                	mov    (%eax),%al
c01028e8:	88 02                	mov    %al,(%edx)
c01028ea:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01028ed:	ff 00                	incl   (%eax)
c01028ef:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01028f2:	ff 00                	incl   (%eax)
c01028f4:	eb c7                	jmp    c01028bd <_MoveUp+0x17>
c01028f6:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c01028fb:	48                   	dec    %eax
c01028fc:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c0102903:	01 c0                	add    %eax,%eax
c0102905:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102908:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c010290d:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c0102914:	01 c0                	add    %eax,%eax
c0102916:	39 45 fc             	cmp    %eax,0xfffffffc(%ebp)
c0102919:	72 02                	jb     c010291d <_MoveUp+0x77>
c010291b:	eb 26                	jmp    c0102943 <_MoveUp+0x9d>
c010291d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102920:	8b 15 c0 50 10 c0    	mov    0xc01050c0,%edx
c0102926:	01 c2                	add    %eax,%edx
c0102928:	a0 c8 50 10 c0       	mov    0xc01050c8,%al
c010292d:	88 02                	mov    %al,(%edx)
c010292f:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102932:	03 05 c0 50 10 c0    	add    0xc01050c0,%eax
c0102938:	c6 00 00             	movb   $0x0,(%eax)
c010293b:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c010293e:	83 00 02             	addl   $0x2,(%eax)
c0102941:	eb c5                	jmp    c0102908 <_MoveUp+0x62>
c0102943:	c9                   	leave  
c0102944:	c3                   	ret    

c0102945 <_ClearScreen>:
c0102945:	55                   	push   %ebp
c0102946:	89 e5                	mov    %esp,%ebp
c0102948:	83 ec 08             	sub    $0x8,%esp
c010294b:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102952:	81 7d fc 9f 0f 00 00 	cmpl   $0xf9f,0xfffffffc(%ebp)
c0102959:	7e 02                	jle    c010295d <_ClearScreen+0x18>
c010295b:	eb 27                	jmp    c0102984 <_ClearScreen+0x3f>
c010295d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102960:	03 05 c0 50 10 c0    	add    0xc01050c0,%eax
c0102966:	c6 00 00             	movb   $0x0,(%eax)
c0102969:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010296c:	03 05 c0 50 10 c0    	add    0xc01050c0,%eax
c0102972:	8d 50 01             	lea    0x1(%eax),%edx
c0102975:	a0 c8 50 10 c0       	mov    0xc01050c8,%al
c010297a:	88 02                	mov    %al,(%edx)
c010297c:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c010297f:	83 00 02             	addl   $0x2,(%eax)
c0102982:	eb ce                	jmp    c0102952 <_ClearScreen+0xd>
c0102984:	83 ec 08             	sub    $0x8,%esp
c0102987:	6a ff                	push   $0xffffffff
c0102989:	6a ff                	push   $0xffffffff
c010298b:	e8 a6 fe ff ff       	call   c0102836 <_SetCursor>
c0102990:	83 c4 10             	add    $0x10,%esp
c0102993:	c7 05 c4 50 10 c0 00 	movl   $0x0,0xc01050c4
c010299a:	00 00 00 
c010299d:	c9                   	leave  
c010299e:	c3                   	ret    

c010299f <_putc>:
c010299f:	55                   	push   %ebp
c01029a0:	89 e5                	mov    %esp,%ebp
c01029a2:	83 ec 18             	sub    $0x18,%esp
c01029a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01029a8:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c01029ab:	0f be 45 ff          	movsbl 0xffffffff(%ebp),%eax
c01029af:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01029b2:	83 7d f0 0a          	cmpl   $0xa,0xfffffff0(%ebp)
c01029b6:	74 16                	je     c01029ce <_putc+0x2f>
c01029b8:	83 7d f0 0a          	cmpl   $0xa,0xfffffff0(%ebp)
c01029bc:	7f 08                	jg     c01029c6 <_putc+0x27>
c01029be:	83 7d f0 09          	cmpl   $0x9,0xfffffff0(%ebp)
c01029c2:	74 56                	je     c0102a1a <_putc+0x7b>
c01029c4:	eb 7c                	jmp    c0102a42 <_putc+0xa3>
c01029c6:	83 7d f0 0d          	cmpl   $0xd,0xfffffff0(%ebp)
c01029ca:	74 29                	je     c01029f5 <_putc+0x56>
c01029cc:	eb 74                	jmp    c0102a42 <_putc+0xa3>
c01029ce:	83 ec 08             	sub    $0x8,%esp
c01029d1:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c01029d4:	50                   	push   %eax
c01029d5:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01029d8:	50                   	push   %eax
c01029d9:	e8 17 fe ff ff       	call   c01027f5 <_GetXY>
c01029de:	83 c4 10             	add    $0x10,%esp
c01029e1:	83 ec 08             	sub    $0x8,%esp
c01029e4:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01029e7:	40                   	inc    %eax
c01029e8:	50                   	push   %eax
c01029e9:	6a 00                	push   $0x0
c01029eb:	e8 c4 fd ff ff       	call   c01027b4 <_SetXY>
c01029f0:	83 c4 10             	add    $0x10,%esp
c01029f3:	eb 4d                	jmp    c0102a42 <_putc+0xa3>
c01029f5:	83 ec 08             	sub    $0x8,%esp
c01029f8:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c01029fb:	50                   	push   %eax
c01029fc:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c01029ff:	50                   	push   %eax
c0102a00:	e8 f0 fd ff ff       	call   c01027f5 <_GetXY>
c0102a05:	83 c4 10             	add    $0x10,%esp
c0102a08:	83 ec 08             	sub    $0x8,%esp
c0102a0b:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c0102a0e:	6a 00                	push   $0x0
c0102a10:	e8 9f fd ff ff       	call   c01027b4 <_SetXY>
c0102a15:	83 c4 10             	add    $0x10,%esp
c0102a18:	eb 28                	jmp    c0102a42 <_putc+0xa3>
c0102a1a:	83 ec 08             	sub    $0x8,%esp
c0102a1d:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0102a20:	50                   	push   %eax
c0102a21:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102a24:	50                   	push   %eax
c0102a25:	e8 cb fd ff ff       	call   c01027f5 <_GetXY>
c0102a2a:	83 c4 10             	add    $0x10,%esp
c0102a2d:	83 ec 08             	sub    $0x8,%esp
c0102a30:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c0102a33:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102a36:	83 c0 08             	add    $0x8,%eax
c0102a39:	50                   	push   %eax
c0102a3a:	e8 75 fd ff ff       	call   c01027b4 <_SetXY>
c0102a3f:	83 c4 10             	add    $0x10,%esp
c0102a42:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c0102a47:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c0102a4e:	01 c0                	add    %eax,%eax
c0102a50:	39 05 c4 50 10 c0    	cmp    %eax,0xc01050c4
c0102a56:	72 19                	jb     c0102a71 <_putc+0xd2>
c0102a58:	e8 49 fe ff ff       	call   c01028a6 <_MoveUp>
c0102a5d:	a1 d0 50 10 c0       	mov    0xc01050d0,%eax
c0102a62:	48                   	dec    %eax
c0102a63:	0f af 05 cc 50 10 c0 	imul   0xc01050cc,%eax
c0102a6a:	01 c0                	add    %eax,%eax
c0102a6c:	a3 c4 50 10 c0       	mov    %eax,0xc01050c4
c0102a71:	80 7d ff 0a          	cmpb   $0xa,0xffffffff(%ebp)
c0102a75:	74 3e                	je     c0102ab5 <_putc+0x116>
c0102a77:	80 7d ff 0d          	cmpb   $0xd,0xffffffff(%ebp)
c0102a7b:	74 38                	je     c0102ab5 <_putc+0x116>
c0102a7d:	80 7d ff 09          	cmpb   $0x9,0xffffffff(%ebp)
c0102a81:	74 32                	je     c0102ab5 <_putc+0x116>
c0102a83:	a1 c4 50 10 c0       	mov    0xc01050c4,%eax
c0102a88:	89 c2                	mov    %eax,%edx
c0102a8a:	03 15 c0 50 10 c0    	add    0xc01050c0,%edx
c0102a90:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c0102a93:	88 02                	mov    %al,(%edx)
c0102a95:	ff 05 c4 50 10 c0    	incl   0xc01050c4
c0102a9b:	a1 c4 50 10 c0       	mov    0xc01050c4,%eax
c0102aa0:	89 c2                	mov    %eax,%edx
c0102aa2:	03 15 c0 50 10 c0    	add    0xc01050c0,%edx
c0102aa8:	a0 c8 50 10 c0       	mov    0xc01050c8,%al
c0102aad:	88 02                	mov    %al,(%edx)
c0102aaf:	ff 05 c4 50 10 c0    	incl   0xc01050c4
c0102ab5:	c9                   	leave  
c0102ab6:	c3                   	ret    

c0102ab7 <_print>:
c0102ab7:	55                   	push   %ebp
c0102ab8:	89 e5                	mov    %esp,%ebp
c0102aba:	83 ec 08             	sub    $0x8,%esp
c0102abd:	90                   	nop    
c0102abe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac1:	80 38 00             	cmpb   $0x0,(%eax)
c0102ac4:	75 02                	jne    c0102ac8 <_print+0x11>
c0102ac6:	eb 17                	jmp    c0102adf <_print+0x28>
c0102ac8:	83 ec 0c             	sub    $0xc,%esp
c0102acb:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ace:	0f be 00             	movsbl (%eax),%eax
c0102ad1:	50                   	push   %eax
c0102ad2:	ff 45 08             	incl   0x8(%ebp)
c0102ad5:	e8 c5 fe ff ff       	call   c010299f <_putc>
c0102ada:	83 c4 10             	add    $0x10,%esp
c0102add:	eb df                	jmp    c0102abe <_print+0x7>
c0102adf:	c9                   	leave  
c0102ae0:	c3                   	ret    

c0102ae1 <_printf>:
c0102ae1:	55                   	push   %ebp
c0102ae2:	89 e5                	mov    %esp,%ebp
c0102ae4:	81 ec 18 04 00 00    	sub    $0x418,%esp
c0102aea:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102aed:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102af0:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c0102af3:	ff 75 08             	pushl  0x8(%ebp)
c0102af6:	6a ff                	push   $0xffffffff
c0102af8:	8d 85 e8 fb ff ff    	lea    0xfffffbe8(%ebp),%eax
c0102afe:	50                   	push   %eax
c0102aff:	e8 c3 f3 ff ff       	call   c0101ec7 <_vsnprintf>
c0102b04:	83 c4 10             	add    $0x10,%esp
c0102b07:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0102b0a:	83 ec 0c             	sub    $0xc,%esp
c0102b0d:	8d 85 e8 fb ff ff    	lea    0xfffffbe8(%ebp),%eax
c0102b13:	50                   	push   %eax
c0102b14:	e8 9e ff ff ff       	call   c0102ab7 <_print>
c0102b19:	83 c4 10             	add    $0x10,%esp
c0102b1c:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0102b1f:	c9                   	leave  
c0102b20:	c3                   	ret    
c0102b21:	90                   	nop    
c0102b22:	90                   	nop    
c0102b23:	90                   	nop    
c0102b24:	90                   	nop    
c0102b25:	90                   	nop    
c0102b26:	90                   	nop    
c0102b27:	90                   	nop    
c0102b28:	90                   	nop    
c0102b29:	90                   	nop    
c0102b2a:	90                   	nop    
c0102b2b:	90                   	nop    
c0102b2c:	90                   	nop    
c0102b2d:	90                   	nop    
c0102b2e:	90                   	nop    
c0102b2f:	90                   	nop    

c0102b30 <_itoaex>:
c0102b30:	55                   	push   %ebp
c0102b31:	89 e5                	mov    %esp,%ebp
c0102b33:	83 ec 58             	sub    $0x58,%esp
c0102b36:	c7 45 c0 00 00 00 00 	movl   $0x0,0xffffffc0(%ebp)
c0102b3d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c0102b41:	74 12                	je     c0102b55 <_itoaex+0x25>
c0102b43:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
c0102b47:	74 0c                	je     c0102b55 <_itoaex+0x25>
c0102b49:	c7 45 b4 00 00 00 00 	movl   $0x0,0xffffffb4(%ebp)
c0102b50:	e9 e4 00 00 00       	jmp    c0102c39 <_itoaex+0x109>
c0102b55:	90                   	nop    
c0102b56:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b59:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102b5c:	8b 55 b8             	mov    0xffffffb8(%ebp),%edx
c0102b5f:	89 d0                	mov    %edx,%eax
c0102b61:	ba 00 00 00 00       	mov    $0x0,%edx
c0102b66:	f7 75 10             	divl   0x10(%ebp)
c0102b69:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102b6c:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102b6f:	0f af 45 10          	imul   0x10(%ebp),%eax
c0102b73:	89 45 b8             	mov    %eax,0xffffffb8(%ebp)
c0102b76:	8b 55 b8             	mov    0xffffffb8(%ebp),%edx
c0102b79:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b7c:	29 d0                	sub    %edx,%eax
c0102b7e:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0102b81:	83 7d c4 09          	cmpl   $0x9,0xffffffc4(%ebp)
c0102b85:	7e 06                	jle    c0102b8d <_itoaex+0x5d>
c0102b87:	c6 45 b3 57          	movb   $0x57,0xffffffb3(%ebp)
c0102b8b:	eb 04                	jmp    c0102b91 <_itoaex+0x61>
c0102b8d:	c6 45 b3 30          	movb   $0x30,0xffffffb3(%ebp)
c0102b91:	8a 55 b3             	mov    0xffffffb3(%ebp),%dl
c0102b94:	88 55 bf             	mov    %dl,0xffffffbf(%ebp)
c0102b97:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102b9a:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102b9d:	01 d0                	add    %edx,%eax
c0102b9f:	8d 50 d0             	lea    0xffffffd0(%eax),%edx
c0102ba2:	8a 45 c4             	mov    0xffffffc4(%ebp),%al
c0102ba5:	02 45 bf             	add    0xffffffbf(%ebp),%al
c0102ba8:	88 02                	mov    %al,(%edx)
c0102baa:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102bad:	ff 00                	incl   (%eax)
c0102baf:	8b 55 08             	mov    0x8(%ebp),%edx
c0102bb2:	89 d0                	mov    %edx,%eax
c0102bb4:	ba 00 00 00 00       	mov    $0x0,%edx
c0102bb9:	f7 75 10             	divl   0x10(%ebp)
c0102bbc:	89 45 08             	mov    %eax,0x8(%ebp)
c0102bbf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102bc3:	75 91                	jne    c0102b56 <_itoaex+0x26>
c0102bc5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c0102bc9:	74 13                	je     c0102bde <_itoaex+0xae>
c0102bcb:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102bce:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102bd1:	01 d0                	add    %edx,%eax
c0102bd3:	83 e8 30             	sub    $0x30,%eax
c0102bd6:	c6 00 2d             	movb   $0x2d,(%eax)
c0102bd9:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102bdc:	ff 00                	incl   (%eax)
c0102bde:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102be1:	8d 55 f8             	lea    0xfffffff8(%ebp),%edx
c0102be4:	01 d0                	add    %edx,%eax
c0102be6:	83 e8 30             	sub    $0x30,%eax
c0102be9:	c6 00 00             	movb   $0x0,(%eax)
c0102bec:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102bef:	ff 08                	decl   (%eax)
c0102bf1:	8b 45 c0             	mov    0xffffffc0(%ebp),%eax
c0102bf4:	40                   	inc    %eax
c0102bf5:	89 45 c4             	mov    %eax,0xffffffc4(%ebp)
c0102bf8:	c7 45 b8 00 00 00 00 	movl   $0x0,0xffffffb8(%ebp)
c0102bff:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102c02:	3b 45 c4             	cmp    0xffffffc4(%ebp),%eax
c0102c05:	72 02                	jb     c0102c09 <_itoaex+0xd9>
c0102c07:	eb 21                	jmp    c0102c2a <_itoaex+0xfa>
c0102c09:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102c0c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c0f:	01 c2                	add    %eax,%edx
c0102c11:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102c14:	03 45 c0             	add    0xffffffc0(%ebp),%eax
c0102c17:	83 e8 30             	sub    $0x30,%eax
c0102c1a:	8a 00                	mov    (%eax),%al
c0102c1c:	88 02                	mov    %al,(%edx)
c0102c1e:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
c0102c21:	ff 08                	decl   (%eax)
c0102c23:	8d 45 b8             	lea    0xffffffb8(%ebp),%eax
c0102c26:	ff 00                	incl   (%eax)
c0102c28:	eb d5                	jmp    c0102bff <_itoaex+0xcf>
c0102c2a:	8b 45 b8             	mov    0xffffffb8(%ebp),%eax
c0102c2d:	03 45 0c             	add    0xc(%ebp),%eax
c0102c30:	c6 00 00             	movb   $0x0,(%eax)
c0102c33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c36:	89 45 b4             	mov    %eax,0xffffffb4(%ebp)
c0102c39:	8b 45 b4             	mov    0xffffffb4(%ebp),%eax
c0102c3c:	c9                   	leave  
c0102c3d:	c3                   	ret    

c0102c3e <_itoa>:
c0102c3e:	55                   	push   %ebp
c0102c3f:	89 e5                	mov    %esp,%ebp
c0102c41:	83 ec 48             	sub    $0x48,%esp
c0102c44:	c7 45 c0 00 00 00 00 	movl   $0x0,0xffffffc0(%ebp)
c0102c4b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0102c4f:	79 0a                	jns    c0102c5b <_itoa+0x1d>
c0102c51:	f7 5d 08             	negl   0x8(%ebp)
c0102c54:	c7 45 c0 01 00 00 00 	movl   $0x1,0xffffffc0(%ebp)
c0102c5b:	ff 75 c0             	pushl  0xffffffc0(%ebp)
c0102c5e:	6a 0a                	push   $0xa
c0102c60:	8d 45 c8             	lea    0xffffffc8(%ebp),%eax
c0102c63:	50                   	push   %eax
c0102c64:	ff 75 08             	pushl  0x8(%ebp)
c0102c67:	e8 c4 fe ff ff       	call   c0102b30 <_itoaex>
c0102c6c:	83 c4 10             	add    $0x10,%esp
c0102c6f:	c7 45 c4 00 00 00 00 	movl   $0x0,0xffffffc4(%ebp)
c0102c76:	83 ec 0c             	sub    $0xc,%esp
c0102c79:	8d 45 c8             	lea    0xffffffc8(%ebp),%eax
c0102c7c:	50                   	push   %eax
c0102c7d:	e8 ce 00 00 00       	call   c0102d50 <_strlen>
c0102c82:	83 c4 10             	add    $0x10,%esp
c0102c85:	39 45 c4             	cmp    %eax,0xffffffc4(%ebp)
c0102c88:	7c 02                	jl     c0102c8c <_itoa+0x4e>
c0102c8a:	eb 1c                	jmp    c0102ca8 <_itoa+0x6a>
c0102c8c:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0102c8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102c92:	01 c2                	add    %eax,%edx
c0102c94:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102c97:	03 45 c4             	add    0xffffffc4(%ebp),%eax
c0102c9a:	83 e8 30             	sub    $0x30,%eax
c0102c9d:	8a 00                	mov    (%eax),%al
c0102c9f:	88 02                	mov    %al,(%edx)
c0102ca1:	8d 45 c4             	lea    0xffffffc4(%ebp),%eax
c0102ca4:	ff 00                	incl   (%eax)
c0102ca6:	eb ce                	jmp    c0102c76 <_itoa+0x38>
c0102ca8:	8b 45 c4             	mov    0xffffffc4(%ebp),%eax
c0102cab:	03 45 0c             	add    0xc(%ebp),%eax
c0102cae:	c6 00 00             	movb   $0x0,(%eax)
c0102cb1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cb4:	c9                   	leave  
c0102cb5:	c3                   	ret    

c0102cb6 <_atoi>:
c0102cb6:	55                   	push   %ebp
c0102cb7:	89 e5                	mov    %esp,%ebp
c0102cb9:	83 ec 18             	sub    $0x18,%esp
c0102cbc:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0102cc3:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0102cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ccd:	80 38 2d             	cmpb   $0x2d,(%eax)
c0102cd0:	75 0a                	jne    c0102cdc <_atoi+0x26>
c0102cd2:	c7 45 f0 01 00 00 00 	movl   $0x1,0xfffffff0(%ebp)
c0102cd9:	ff 45 08             	incl   0x8(%ebp)
c0102cdc:	83 ec 0c             	sub    $0xc,%esp
c0102cdf:	ff 75 08             	pushl  0x8(%ebp)
c0102ce2:	e8 69 00 00 00       	call   c0102d50 <_strlen>
c0102ce7:	83 c4 10             	add    $0x10,%esp
c0102cea:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102ced:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c0102cf4:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102cf7:	3b 45 fc             	cmp    0xfffffffc(%ebp),%eax
c0102cfa:	7c 02                	jl     c0102cfe <_atoi+0x48>
c0102cfc:	eb 32                	jmp    c0102d30 <_atoi+0x7a>
c0102cfe:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102d01:	03 45 08             	add    0x8(%ebp),%eax
c0102d04:	0f be 00             	movsbl (%eax),%eax
c0102d07:	03 45 f4             	add    0xfffffff4(%ebp),%eax
c0102d0a:	83 e8 30             	sub    $0x30,%eax
c0102d0d:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102d10:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d13:	48                   	dec    %eax
c0102d14:	39 45 f8             	cmp    %eax,0xfffffff8(%ebp)
c0102d17:	74 10                	je     c0102d29 <_atoi+0x73>
c0102d19:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102d1c:	89 c2                	mov    %eax,%edx
c0102d1e:	c1 e2 02             	shl    $0x2,%edx
c0102d21:	01 c2                	add    %eax,%edx
c0102d23:	8d 04 12             	lea    (%edx,%edx,1),%eax
c0102d26:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0102d29:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102d2c:	ff 00                	incl   (%eax)
c0102d2e:	eb c4                	jmp    c0102cf4 <_atoi+0x3e>
c0102d30:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c0102d34:	74 0a                	je     c0102d40 <_atoi+0x8a>
c0102d36:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102d39:	f7 d8                	neg    %eax
c0102d3b:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102d3e:	eb 06                	jmp    c0102d46 <_atoi+0x90>
c0102d40:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0102d43:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0102d46:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0102d49:	c9                   	leave  
c0102d4a:	c3                   	ret    
c0102d4b:	90                   	nop    
c0102d4c:	90                   	nop    
c0102d4d:	90                   	nop    
c0102d4e:	90                   	nop    
c0102d4f:	90                   	nop    

c0102d50 <_strlen>:
c0102d50:	55                   	push   %ebp
c0102d51:	89 e5                	mov    %esp,%ebp
c0102d53:	83 ec 04             	sub    $0x4,%esp
c0102d56:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102d5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d60:	ff 45 08             	incl   0x8(%ebp)
c0102d63:	80 38 00             	cmpb   $0x0,(%eax)
c0102d66:	75 02                	jne    c0102d6a <_strlen+0x1a>
c0102d68:	eb 07                	jmp    c0102d71 <_strlen+0x21>
c0102d6a:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102d6d:	ff 00                	incl   (%eax)
c0102d6f:	eb ec                	jmp    c0102d5d <_strlen+0xd>
c0102d71:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d74:	c9                   	leave  
c0102d75:	c3                   	ret    

c0102d76 <__strupr>:
c0102d76:	55                   	push   %ebp
c0102d77:	89 e5                	mov    %esp,%ebp
c0102d79:	83 ec 08             	sub    $0x8,%esp
c0102d7c:	83 ec 0c             	sub    $0xc,%esp
c0102d7f:	ff 75 08             	pushl  0x8(%ebp)
c0102d82:	e8 c9 ff ff ff       	call   c0102d50 <_strlen>
c0102d87:	83 c4 10             	add    $0x10,%esp
c0102d8a:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102d8d:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102d94:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102d97:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0102d9a:	7c 02                	jl     c0102d9e <__strupr+0x28>
c0102d9c:	eb 32                	jmp    c0102dd0 <__strupr+0x5a>
c0102d9e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102da1:	03 45 08             	add    0x8(%ebp),%eax
c0102da4:	80 38 60             	cmpb   $0x60,(%eax)
c0102da7:	7e 20                	jle    c0102dc9 <__strupr+0x53>
c0102da9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102dac:	03 45 08             	add    0x8(%ebp),%eax
c0102daf:	80 38 7a             	cmpb   $0x7a,(%eax)
c0102db2:	7f 15                	jg     c0102dc9 <__strupr+0x53>
c0102db4:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102db7:	8b 55 08             	mov    0x8(%ebp),%edx
c0102dba:	01 c2                	add    %eax,%edx
c0102dbc:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102dbf:	03 45 08             	add    0x8(%ebp),%eax
c0102dc2:	8a 00                	mov    (%eax),%al
c0102dc4:	83 e0 5f             	and    $0x5f,%eax
c0102dc7:	88 02                	mov    %al,(%edx)
c0102dc9:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102dcc:	ff 00                	incl   (%eax)
c0102dce:	eb c4                	jmp    c0102d94 <__strupr+0x1e>
c0102dd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dd3:	c9                   	leave  
c0102dd4:	c3                   	ret    

c0102dd5 <__strlwr>:
c0102dd5:	55                   	push   %ebp
c0102dd6:	89 e5                	mov    %esp,%ebp
c0102dd8:	83 ec 08             	sub    $0x8,%esp
c0102ddb:	83 ec 0c             	sub    $0xc,%esp
c0102dde:	ff 75 08             	pushl  0x8(%ebp)
c0102de1:	e8 6a ff ff ff       	call   c0102d50 <_strlen>
c0102de6:	83 c4 10             	add    $0x10,%esp
c0102de9:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102dec:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0102df3:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102df6:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c0102df9:	7c 02                	jl     c0102dfd <__strlwr+0x28>
c0102dfb:	eb 32                	jmp    c0102e2f <__strlwr+0x5a>
c0102dfd:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e00:	03 45 08             	add    0x8(%ebp),%eax
c0102e03:	80 38 40             	cmpb   $0x40,(%eax)
c0102e06:	7e 20                	jle    c0102e28 <__strlwr+0x53>
c0102e08:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e0b:	03 45 08             	add    0x8(%ebp),%eax
c0102e0e:	80 38 5a             	cmpb   $0x5a,(%eax)
c0102e11:	7f 15                	jg     c0102e28 <__strlwr+0x53>
c0102e13:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e16:	8b 55 08             	mov    0x8(%ebp),%edx
c0102e19:	01 c2                	add    %eax,%edx
c0102e1b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e1e:	03 45 08             	add    0x8(%ebp),%eax
c0102e21:	8a 00                	mov    (%eax),%al
c0102e23:	83 c8 20             	or     $0x20,%eax
c0102e26:	88 02                	mov    %al,(%edx)
c0102e28:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102e2b:	ff 00                	incl   (%eax)
c0102e2d:	eb c4                	jmp    c0102df3 <__strlwr+0x1e>
c0102e2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e32:	c9                   	leave  
c0102e33:	c3                   	ret    

c0102e34 <_memset>:
c0102e34:	55                   	push   %ebp
c0102e35:	89 e5                	mov    %esp,%ebp
c0102e37:	83 ec 04             	sub    $0x4,%esp
c0102e3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e3d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102e40:	8d 45 10             	lea    0x10(%ebp),%eax
c0102e43:	ff 08                	decl   (%eax)
c0102e45:	83 7d 10 ff          	cmpl   $0xffffffff,0x10(%ebp)
c0102e49:	75 02                	jne    c0102e4d <_memset+0x19>
c0102e4b:	eb 11                	jmp    c0102e5e <_memset+0x2a>
c0102e4d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e50:	89 c2                	mov    %eax,%edx
c0102e52:	8a 45 0c             	mov    0xc(%ebp),%al
c0102e55:	88 02                	mov    %al,(%edx)
c0102e57:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102e5a:	ff 00                	incl   (%eax)
c0102e5c:	eb e2                	jmp    c0102e40 <_memset+0xc>
c0102e5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e61:	c9                   	leave  
c0102e62:	c3                   	ret    

c0102e63 <_memcpy>:
c0102e63:	55                   	push   %ebp
c0102e64:	89 e5                	mov    %esp,%ebp
c0102e66:	83 ec 08             	sub    $0x8,%esp
c0102e69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e6c:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0102e6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e72:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0102e75:	8d 45 10             	lea    0x10(%ebp),%eax
c0102e78:	ff 08                	decl   (%eax)
c0102e7a:	83 7d 10 ff          	cmpl   $0xffffffff,0x10(%ebp)
c0102e7e:	75 02                	jne    c0102e82 <_memcpy+0x1f>
c0102e80:	eb 18                	jmp    c0102e9a <_memcpy+0x37>
c0102e82:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0102e85:	89 c2                	mov    %eax,%edx
c0102e87:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0102e8a:	8a 00                	mov    (%eax),%al
c0102e8c:	88 02                	mov    %al,(%edx)
c0102e8e:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0102e91:	ff 00                	incl   (%eax)
c0102e93:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c0102e96:	ff 00                	incl   (%eax)
c0102e98:	eb db                	jmp    c0102e75 <_memcpy+0x12>
c0102e9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e9d:	c9                   	leave  
c0102e9e:	c3                   	ret    
c0102e9f:	90                   	nop    

c0102ea0 <_KernelMain>:
c0102ea0:	55                   	push   %ebp
c0102ea1:	89 e5                	mov    %esp,%ebp
c0102ea3:	83 ec 28             	sub    $0x28,%esp
c0102ea6:	e8 67 00 00 00       	call   c0102f12 <_KeInit>
c0102eab:	e8 b5 03 00 00       	call   c0103265 <_MmInit>
c0102eb0:	8d 45 d8             	lea    0xffffffd8(%ebp),%eax
c0102eb3:	a3 40 79 10 c0       	mov    %eax,0xc0107940
c0102eb8:	c7 45 dc 00 00 00 00 	movl   $0x0,0xffffffdc(%ebp)
c0102ebf:	83 ec 0c             	sub    $0xc,%esp
c0102ec2:	6a 06                	push   $0x6
c0102ec4:	6a 00                	push   $0x0
c0102ec6:	68 00 10 00 00       	push   $0x1000
c0102ecb:	68 00 00 20 c3       	push   $0xc3200000
c0102ed0:	8d 45 d8             	lea    0xffffffd8(%ebp),%eax
c0102ed3:	50                   	push   %eax
c0102ed4:	e8 92 10 00 00       	call   c0103f6b <_MmVirtualAlloc>
c0102ed9:	83 c4 20             	add    $0x20,%esp
c0102edc:	c7 05 00 00 20 c3 00 	movl   $0x0,0xc3200000
c0102ee3:	00 00 00 
c0102ee6:	6a 01                	push   $0x1
c0102ee8:	6a 04                	push   $0x4
c0102eea:	68 00 80 0b 00       	push   $0xb8000
c0102eef:	68 00 00 00 f0       	push   $0xf0000000
c0102ef4:	e8 6e 0d 00 00       	call   c0103c67 <_MmMapPage>
c0102ef9:	83 c4 10             	add    $0x10,%esp
c0102efc:	c7 05 00 00 00 f0 00 	movl   $0x0,0xf0000000
c0102f03:	00 00 00 
c0102f06:	c7 05 04 00 00 f0 00 	movl   $0x0,0xf0000004
c0102f0d:	00 00 00 
c0102f10:	eb fe                	jmp    c0102f10 <_KernelMain+0x70>

c0102f12 <_KeInit>:
c0102f12:	55                   	push   %ebp
c0102f13:	89 e5                	mov    %esp,%ebp
c0102f15:	83 ec 08             	sub    $0x8,%esp
c0102f18:	e8 16 00 00 00       	call   c0102f33 <_KeGetCubekrnlSize>
c0102f1d:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c0102f22:	a3 60 79 10 c0       	mov    %eax,0xc0107960
c0102f27:	c7 05 50 79 10 c0 00 	movl   $0x0,0xc0107950
c0102f2e:	00 00 00 
c0102f31:	c9                   	leave  
c0102f32:	c3                   	ret    

c0102f33 <_KeGetCubekrnlSize>:
c0102f33:	55                   	push   %ebp
c0102f34:	89 e5                	mov    %esp,%ebp
c0102f36:	a1 04 f0 00 c0       	mov    0xc000f004,%eax
c0102f3b:	a3 20 79 10 c0       	mov    %eax,0xc0107920
c0102f40:	a1 20 79 10 c0       	mov    0xc0107920,%eax
c0102f45:	5d                   	pop    %ebp
c0102f46:	c3                   	ret    
c0102f47:	0a 4b 45             	or     0x45(%ebx),%cl
c0102f4a:	52                   	push   %edx
c0102f4b:	4e                   	dec    %esi
c0102f4c:	45                   	inc    %ebp
c0102f4d:	4c                   	dec    %esp
c0102f4e:	20 50 41             	and    %dl,0x41(%eax)
c0102f51:	4e                   	dec    %esi
c0102f52:	49                   	dec    %ecx
c0102f53:	43                   	inc    %ebx
c0102f54:	3a 20                	cmp    (%eax),%ah
c0102f56:	25 73 00 55 89       	and    $0x89550073,%eax

c0102f59 <_KePanic>:
c0102f59:	55                   	push   %ebp
c0102f5a:	89 e5                	mov    %esp,%ebp
c0102f5c:	83 ec 08             	sub    $0x8,%esp
c0102f5f:	83 ec 08             	sub    $0x8,%esp
c0102f62:	ff 75 08             	pushl  0x8(%ebp)
c0102f65:	68 47 2f 10 c0       	push   $0xc0102f47
c0102f6a:	e8 72 fb ff ff       	call   c0102ae1 <_printf>
c0102f6f:	83 c4 10             	add    $0x10,%esp
c0102f72:	e8 66 00 00 00       	call   c0102fdd <_KeHaltCPU>
c0102f77:	c9                   	leave  
c0102f78:	c3                   	ret    
c0102f79:	4b                   	dec    %ebx
c0102f7a:	45                   	inc    %ebp
c0102f7b:	52                   	push   %edx
c0102f7c:	4e                   	dec    %esi
c0102f7d:	45                   	inc    %ebp
c0102f7e:	4c                   	dec    %esp
c0102f7f:	20 50 41             	and    %dl,0x41(%eax)
c0102f82:	4e                   	dec    %esi
c0102f83:	49                   	dec    %ecx
c0102f84:	43                   	inc    %ebx
c0102f85:	3a 20                	cmp    (%eax),%ah
	...

c0102f88 <_KePanicStr>:
c0102f88:	55                   	push   %ebp
c0102f89:	89 e5                	mov    %esp,%ebp
c0102f8b:	81 ec 18 04 00 00    	sub    $0x418,%esp
c0102f91:	8d 45 0c             	lea    0xc(%ebp),%eax
c0102f94:	89 85 f4 fb ff ff    	mov    %eax,0xfffffbf4(%ebp)
c0102f9a:	83 ec 0c             	sub    $0xc,%esp
c0102f9d:	68 79 2f 10 c0       	push   $0xc0102f79
c0102fa2:	e8 3a fb ff ff       	call   c0102ae1 <_printf>
c0102fa7:	83 c4 10             	add    $0x10,%esp
c0102faa:	ff b5 f4 fb ff ff    	pushl  0xfffffbf4(%ebp)
c0102fb0:	ff 75 08             	pushl  0x8(%ebp)
c0102fb3:	6a ff                	push   $0xffffffff
c0102fb5:	8d 85 f8 fb ff ff    	lea    0xfffffbf8(%ebp),%eax
c0102fbb:	50                   	push   %eax
c0102fbc:	e8 06 ef ff ff       	call   c0101ec7 <_vsnprintf>
c0102fc1:	83 c4 10             	add    $0x10,%esp
c0102fc4:	83 ec 0c             	sub    $0xc,%esp
c0102fc7:	8d 85 f8 fb ff ff    	lea    0xfffffbf8(%ebp),%eax
c0102fcd:	50                   	push   %eax
c0102fce:	e8 e4 fa ff ff       	call   c0102ab7 <_print>
c0102fd3:	83 c4 10             	add    $0x10,%esp
c0102fd6:	e8 02 00 00 00       	call   c0102fdd <_KeHaltCPU>
c0102fdb:	c9                   	leave  
c0102fdc:	c3                   	ret    

c0102fdd <_KeHaltCPU>:
c0102fdd:	55                   	push   %ebp
c0102fde:	89 e5                	mov    %esp,%ebp
c0102fe0:	83 ec 08             	sub    $0x8,%esp
c0102fe3:	fa                   	cli    
c0102fe4:	e8 24 e0 ff ff       	call   c010100d <_HALIdleThread>
c0102fe9:	c9                   	leave  
c0102fea:	c3                   	ret    

c0102feb <_KeHeapAlloc>:
c0102feb:	55                   	push   %ebp
c0102fec:	89 e5                	mov    %esp,%ebp
c0102fee:	83 ec 08             	sub    $0x8,%esp
c0102ff1:	83 ec 08             	sub    $0x8,%esp
c0102ff4:	ff 75 0c             	pushl  0xc(%ebp)
c0102ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ffa:	ff 34 85 e0 50 10 c0 	pushl  0xc01050e0(,%eax,4)
c0103001:	e8 e2 07 00 00       	call   c01037e8 <_MmHeapAlloc>
c0103006:	83 c4 10             	add    $0x10,%esp
c0103009:	c9                   	leave  
c010300a:	c3                   	ret    

c010300b <_KeHeapFree>:
c010300b:	55                   	push   %ebp
c010300c:	89 e5                	mov    %esp,%ebp
c010300e:	83 ec 08             	sub    $0x8,%esp
c0103011:	83 ec 08             	sub    $0x8,%esp
c0103014:	ff 75 0c             	pushl  0xc(%ebp)
c0103017:	8b 45 08             	mov    0x8(%ebp),%eax
c010301a:	ff 34 85 e0 50 10 c0 	pushl  0xc01050e0(,%eax,4)
c0103021:	e8 a2 09 00 00       	call   c01039c8 <_MmHeapFree>
c0103026:	83 c4 10             	add    $0x10,%esp
c0103029:	c9                   	leave  
c010302a:	c3                   	ret    

c010302b <_KeAttachProcess>:
c010302b:	55                   	push   %ebp
c010302c:	89 e5                	mov    %esp,%ebp
c010302e:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c0103033:	3b 45 08             	cmp    0x8(%ebp),%eax
c0103036:	74 09                	je     c0103041 <_KeAttachProcess+0x16>
c0103038:	8b 45 08             	mov    0x8(%ebp),%eax
c010303b:	8b 40 10             	mov    0x10(%eax),%eax
c010303e:	0f 22 d8             	mov    %eax,%cr3
c0103041:	5d                   	pop    %ebp
c0103042:	c3                   	ret    
c0103043:	90                   	nop    
c0103044:	90                   	nop    
c0103045:	90                   	nop    
c0103046:	90                   	nop    
c0103047:	90                   	nop    
c0103048:	90                   	nop    
c0103049:	90                   	nop    
c010304a:	90                   	nop    
c010304b:	90                   	nop    
c010304c:	90                   	nop    
c010304d:	90                   	nop    
c010304e:	90                   	nop    
c010304f:	90                   	nop    

c0103050 <_KeCreateProcessEnvironment>:
c0103050:	55                   	push   %ebp
c0103051:	89 e5                	mov    %esp,%ebp
c0103053:	83 ec 18             	sub    $0x18,%esp
c0103056:	e8 73 04 00 00       	call   c01034ce <_MmAllocPhysPage>
c010305b:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010305e:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103062:	75 09                	jne    c010306d <_KeCreateProcessEnvironment+0x1d>
c0103064:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,0xfffffff4(%ebp)
c010306b:	eb 61                	jmp    c01030ce <_KeCreateProcessEnvironment+0x7e>
c010306d:	83 ec 0c             	sub    $0xc,%esp
c0103070:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c0103073:	e8 53 0d 00 00       	call   c0103dcb <_MmMapTempPage>
c0103078:	83 c4 10             	add    $0x10,%esp
c010307b:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010307e:	83 ec 0c             	sub    $0xc,%esp
c0103081:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c0103084:	e8 93 ea ff ff       	call   c0101b1c <_ZeroPage>
c0103089:	83 c4 10             	add    $0x10,%esp
c010308c:	83 ec 04             	sub    $0x4,%esp
c010308f:	68 00 03 00 00       	push   $0x300
c0103094:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103097:	05 00 0c 00 00       	add    $0xc00,%eax
c010309c:	50                   	push   %eax
c010309d:	a1 60 79 10 c0       	mov    0xc0107960,%eax
c01030a2:	05 00 0c 00 00       	add    $0xc00,%eax
c01030a7:	50                   	push   %eax
c01030a8:	e8 8a ea ff ff       	call   c0101b37 <_CopyMemory>
c01030ad:	83 c4 10             	add    $0x10,%esp
c01030b0:	83 ec 0c             	sub    $0xc,%esp
c01030b3:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c01030b6:	e8 e4 0d 00 00       	call   c0103e9f <_MmUnMapTempPage>
c01030bb:	83 c4 10             	add    $0x10,%esp
c01030be:	8b 55 08             	mov    0x8(%ebp),%edx
c01030c1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01030c4:	89 42 10             	mov    %eax,0x10(%edx)
c01030c7:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c01030ce:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01030d1:	c9                   	leave  
c01030d2:	c3                   	ret    

c01030d3 <_KeFindProcess>:
c01030d3:	55                   	push   %ebp
c01030d4:	89 e5                	mov    %esp,%ebp
c01030d6:	83 ec 08             	sub    $0x8,%esp
c01030d9:	a1 50 79 10 c0       	mov    0xc0107950,%eax
c01030de:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01030e1:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01030e5:	74 17                	je     c01030fe <_KeFindProcess+0x2b>
c01030e7:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01030ea:	8b 40 0c             	mov    0xc(%eax),%eax
c01030ed:	3b 45 08             	cmp    0x8(%ebp),%eax
c01030f0:	75 02                	jne    c01030f4 <_KeFindProcess+0x21>
c01030f2:	eb 0a                	jmp    c01030fe <_KeFindProcess+0x2b>
c01030f4:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01030f7:	8b 00                	mov    (%eax),%eax
c01030f9:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01030fc:	eb e3                	jmp    c01030e1 <_KeFindProcess+0xe>
c01030fe:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103102:	75 09                	jne    c010310d <_KeFindProcess+0x3a>
c0103104:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c010310b:	eb 06                	jmp    c0103113 <_KeFindProcess+0x40>
c010310d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103110:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103113:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103116:	c9                   	leave  
c0103117:	c3                   	ret    

c0103118 <_KeCreateProcess>:
c0103118:	55                   	push   %ebp
c0103119:	89 e5                	mov    %esp,%ebp
c010311b:	83 ec 08             	sub    $0x8,%esp
c010311e:	83 ec 08             	sub    $0x8,%esp
c0103121:	6a 20                	push   $0x20
c0103123:	6a 00                	push   $0x0
c0103125:	e8 c1 fe ff ff       	call   c0102feb <_KeHeapAlloc>
c010312a:	83 c4 10             	add    $0x10,%esp
c010312d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103130:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103134:	75 0c                	jne    c0103142 <_KeCreateProcess+0x2a>
c0103136:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c010313d:	e9 a5 00 00 00       	jmp    c01031e7 <_KeCreateProcess+0xcf>
c0103142:	83 ec 0c             	sub    $0xc,%esp
c0103145:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c0103148:	e8 03 ff ff ff       	call   c0103050 <_KeCreateProcessEnvironment>
c010314d:	83 c4 10             	add    $0x10,%esp
c0103150:	85 c0                	test   %eax,%eax
c0103152:	74 19                	je     c010316d <_KeCreateProcess+0x55>
c0103154:	83 ec 08             	sub    $0x8,%esp
c0103157:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c010315a:	6a 00                	push   $0x0
c010315c:	e8 aa fe ff ff       	call   c010300b <_KeHeapFree>
c0103161:	83 c4 10             	add    $0x10,%esp
c0103164:	c7 45 f8 00 00 00 00 	movl   $0x0,0xfffffff8(%ebp)
c010316b:	eb 7a                	jmp    c01031e7 <_KeCreateProcess+0xcf>
c010316d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103170:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
c0103177:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c010317a:	8b 45 08             	mov    0x8(%ebp),%eax
c010317d:	89 42 14             	mov    %eax,0x14(%edx)
c0103180:	83 3d f0 50 10 c0 ff 	cmpl   $0xffffffff,0xc01050f0
c0103187:	75 29                	jne    c01031b2 <_KeCreateProcess+0x9a>
c0103189:	c7 05 f0 50 10 c0 00 	movl   $0x0,0xc01050f0
c0103190:	00 00 00 
c0103193:	83 ec 0c             	sub    $0xc,%esp
c0103196:	ff 35 f0 50 10 c0    	pushl  0xc01050f0
c010319c:	e8 32 ff ff ff       	call   c01030d3 <_KeFindProcess>
c01031a1:	83 c4 10             	add    $0x10,%esp
c01031a4:	85 c0                	test   %eax,%eax
c01031a6:	75 02                	jne    c01031aa <_KeCreateProcess+0x92>
c01031a8:	eb 08                	jmp    c01031b2 <_KeCreateProcess+0x9a>
c01031aa:	ff 05 f0 50 10 c0    	incl   0xc01050f0
c01031b0:	eb e1                	jmp    c0103193 <_KeCreateProcess+0x7b>
c01031b2:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01031b5:	a1 f0 50 10 c0       	mov    0xc01050f0,%eax
c01031ba:	89 42 0c             	mov    %eax,0xc(%edx)
c01031bd:	83 ec 0c             	sub    $0xc,%esp
c01031c0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01031c3:	83 c0 1c             	add    $0x1c,%eax
c01031c6:	50                   	push   %eax
c01031c7:	e8 3c 00 00 00       	call   c0103208 <_KeInitializeMutex>
c01031cc:	83 c4 10             	add    $0x10,%esp
c01031cf:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01031d2:	a1 50 79 10 c0       	mov    0xc0107950,%eax
c01031d7:	89 02                	mov    %eax,(%edx)
c01031d9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01031dc:	a3 50 79 10 c0       	mov    %eax,0xc0107950
c01031e1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01031e4:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01031e7:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01031ea:	c9                   	leave  
c01031eb:	c3                   	ret    
c01031ec:	90                   	nop    
c01031ed:	90                   	nop    
c01031ee:	90                   	nop    
c01031ef:	90                   	nop    

c01031f0 <_KeInitializeSpinlock>:
c01031f0:	55                   	push   %ebp
c01031f1:	89 e5                	mov    %esp,%ebp
c01031f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01031f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01031fc:	5d                   	pop    %ebp
c01031fd:	c3                   	ret    

c01031fe <_KeAcquireSpinlock>:
c01031fe:	55                   	push   %ebp
c01031ff:	89 e5                	mov    %esp,%ebp
c0103201:	5d                   	pop    %ebp
c0103202:	c3                   	ret    

c0103203 <_KeReleaseSpinlock>:
c0103203:	55                   	push   %ebp
c0103204:	89 e5                	mov    %esp,%ebp
c0103206:	5d                   	pop    %ebp
c0103207:	c3                   	ret    

c0103208 <_KeInitializeMutex>:
c0103208:	55                   	push   %ebp
c0103209:	89 e5                	mov    %esp,%ebp
c010320b:	8b 45 08             	mov    0x8(%ebp),%eax
c010320e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0103214:	5d                   	pop    %ebp
c0103215:	c3                   	ret    

c0103216 <_KeAcquireMutex>:
c0103216:	55                   	push   %ebp
c0103217:	89 e5                	mov    %esp,%ebp
c0103219:	5d                   	pop    %ebp
c010321a:	c3                   	ret    

c010321b <_KeReleaseMutex>:
c010321b:	55                   	push   %ebp
c010321c:	89 e5                	mov    %esp,%ebp
c010321e:	5d                   	pop    %ebp
c010321f:	c3                   	ret    

c0103220 <.text>:
c0103220:	66 69 72 73 74 5f    	imul   $0x5f74,0x73(%edx),%si
c0103226:	6d                   	insl   (%dx),%es:(%edi)
c0103227:	61                   	popa   
c0103228:	70 2d                	jo     c0103257 <.text+0x37>
c010322a:	3e 73 69             	jae,pt c0103296 <_MmInit+0x31>
c010322d:	7a 65                	jp     c0103294 <_MmInit+0x2f>
c010322f:	20 3e                	and    %bh,(%esi)
c0103231:	20 6b 65             	and    %ch,0x65(%ebx)
c0103234:	72 6e                	jb     c01032a4 <_MmInit+0x3f>
c0103236:	65                   	gs
c0103237:	6c                   	insb   (%dx),%es:(%edi)
c0103238:	5f                   	pop    %edi
c0103239:	73 69                	jae    c01032a4 <_MmInit+0x3f>
c010323b:	7a 65                	jp     c01032a2 <_MmInit+0x3d>
c010323d:	20 2b                	and    %ch,(%ebx)
c010323f:	20 4e 4f             	and    %cl,0x4f(%esi)
c0103242:	4e                   	dec    %esi
c0103243:	5f                   	pop    %edi
c0103244:	50                   	push   %eax
c0103245:	41                   	inc    %ecx
c0103246:	47                   	inc    %edi
c0103247:	45                   	inc    %ebp
c0103248:	44                   	inc    %esp
c0103249:	5f                   	pop    %edi
c010324a:	50                   	push   %eax
c010324b:	4f                   	dec    %edi
c010324c:	4f                   	dec    %edi
c010324d:	4c                   	dec    %esp
c010324e:	5f                   	pop    %edi
c010324f:	53                   	push   %ebx
c0103250:	49                   	dec    %ecx
c0103251:	5a                   	pop    %edx
c0103252:	45                   	inc    %ebp
c0103253:	00 6d 6d             	add    %ch,0x6d(%ebp)
c0103256:	2f                   	das    
c0103257:	6d                   	insl   (%dx),%es:(%edi)
c0103258:	6d                   	insl   (%dx),%es:(%edi)
c0103259:	2e 63 00             	arpl   %ax,%cs:(%eax)
c010325c:	25 73 3a 25 64       	and    $0x64253a73,%eax
c0103261:	20 25 73 00 55 89    	and    %ah,0x89550073

c0103265 <_MmInit>:
c0103265:	55                   	push   %ebp
c0103266:	89 e5                	mov    %esp,%ebp
c0103268:	83 ec 18             	sub    $0x18,%esp
c010326b:	e8 cf 19 00 00       	call   c0104c3f <_i386MmGetPageDirSize>
c0103270:	03 05 20 79 10 c0    	add    0xc0107920,%eax
c0103276:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103279:	e8 b7 19 00 00       	call   c0104c35 <_i386MmGetFreeMemoryList>
c010327e:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c0103281:	83 ec 0c             	sub    $0xc,%esp
c0103284:	68 08 79 10 c0       	push   $0xc0107908
c0103289:	e8 7a ff ff ff       	call   c0103208 <_KeInitializeMutex>
c010328e:	83 c4 10             	add    $0x10,%esp
c0103291:	c7 05 00 79 10 c0 00 	movl   $0x0,0xc0107900
c0103298:	00 00 00 
c010329b:	c7 05 04 79 10 c0 00 	movl   $0x0,0xc0107904
c01032a2:	00 00 00 
c01032a5:	c7 05 0c 79 10 c0 00 	movl   $0x0,0xc010790c
c01032ac:	00 00 00 
c01032af:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01032b2:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c01032b7:	a3 b0 79 10 c0       	mov    %eax,0xc01079b0
c01032bc:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c01032bf:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01032c2:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01032c5:	8b 00                	mov    (%eax),%eax
c01032c7:	c1 e8 0c             	shr    $0xc,%eax
c01032ca:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01032cd:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01032d4:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c01032d7:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01032da:	3b 42 04             	cmp    0x4(%edx),%eax
c01032dd:	72 05                	jb     c01032e4 <_MmInit+0x7f>
c01032df:	e9 87 00 00 00       	jmp    c010336b <_MmInit+0x106>
c01032e4:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01032e7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01032ee:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c01032f3:	c7 44 10 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,1)
c01032fa:	00 
c01032fb:	83 3d 00 79 10 c0 00 	cmpl   $0x0,0xc0107900
c0103302:	75 13                	jne    c0103317 <_MmInit+0xb2>
c0103304:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103307:	c1 e0 03             	shl    $0x3,%eax
c010330a:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c0103310:	a3 00 79 10 c0       	mov    %eax,0xc0107900
c0103315:	eb 14                	jmp    c010332b <_MmInit+0xc6>
c0103317:	8b 15 04 79 10 c0    	mov    0xc0107904,%edx
c010331d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103320:	c1 e0 03             	shl    $0x3,%eax
c0103323:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c0103329:	89 02                	mov    %eax,(%edx)
c010332b:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010332e:	c1 e0 03             	shl    $0x3,%eax
c0103331:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c0103337:	a3 04 79 10 c0       	mov    %eax,0xc0107904
c010333c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010333f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0103346:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c010334b:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
c0103352:	ff 05 0c 79 10 c0    	incl   0xc010790c
c0103358:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c010335b:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c0103361:	8d 45 f8             	lea    0xfffffff8(%ebp),%eax
c0103364:	ff 00                	incl   (%eax)
c0103366:	e9 69 ff ff ff       	jmp    c01032d4 <_MmInit+0x6f>
c010336b:	8d 45 f0             	lea    0xfffffff0(%ebp),%eax
c010336e:	83 00 08             	addl   $0x8,(%eax)
c0103371:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103374:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c0103378:	0f 85 44 ff ff ff    	jne    c01032c2 <_MmInit+0x5d>
c010337e:	a1 80 79 10 c0       	mov    0xc0107980,%eax
c0103383:	c1 e8 0c             	shr    $0xc,%eax
c0103386:	c1 e0 03             	shl    $0x3,%eax
c0103389:	05 ff 0f 00 00       	add    $0xfff,%eax
c010338e:	89 c2                	mov    %eax,%edx
c0103390:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0103396:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0103399:	01 10                	add    %edx,(%eax)
c010339b:	8b 55 ec             	mov    0xffffffec(%ebp),%edx
c010339e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01033a1:	05 00 00 40 00       	add    $0x400000,%eax
c01033a6:	39 42 04             	cmp    %eax,0x4(%edx)
c01033a9:	77 19                	ja     c01033c4 <_MmInit+0x15f>
c01033ab:	68 20 32 10 c0       	push   $0xc0103220
c01033b0:	6a 74                	push   $0x74
c01033b2:	68 54 32 10 c0       	push   $0xc0103254
c01033b7:	68 5c 32 10 c0       	push   $0xc010325c
c01033bc:	e8 c7 fb ff ff       	call   c0102f88 <_KePanicStr>
c01033c1:	83 c4 10             	add    $0x10,%esp
c01033c4:	6a 00                	push   $0x0
c01033c6:	68 00 00 40 00       	push   $0x400000
c01033cb:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01033ce:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c01033d3:	50                   	push   %eax
c01033d4:	68 90 79 10 c0       	push   $0xc0107990
c01033d9:	e8 4d 03 00 00       	call   c010372b <_MmCreateHeap>
c01033de:	83 c4 10             	add    $0x10,%esp
c01033e1:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c01033e4:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c01033ea:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c01033f1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01033f4:	3b 45 f4             	cmp    0xfffffff4(%ebp),%eax
c01033f7:	72 05                	jb     c01033fe <_MmInit+0x199>
c01033f9:	e9 b4 00 00 00       	jmp    c01034b2 <_MmInit+0x24d>
c01033fe:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103401:	05 00 00 10 00       	add    $0x100000,%eax
c0103406:	c1 e8 0c             	shr    $0xc,%eax
c0103409:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010340c:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010340f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0103416:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c010341b:	ff 44 10 04          	incl   0x4(%eax,%edx,1)
c010341f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103422:	c1 e0 03             	shl    $0x3,%eax
c0103425:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c010342b:	39 05 00 79 10 c0    	cmp    %eax,0xc0107900
c0103431:	74 54                	je     c0103487 <_MmInit+0x222>
c0103433:	83 3d 00 79 10 c0 00 	cmpl   $0x0,0xc0107900
c010343a:	74 2f                	je     c010346b <_MmInit+0x206>
c010343c:	a1 00 79 10 c0       	mov    0xc0107900,%eax
c0103441:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0103444:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0103447:	83 38 00             	cmpl   $0x0,(%eax)
c010344a:	74 1f                	je     c010346b <_MmInit+0x206>
c010344c:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c010344f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103452:	c1 e0 03             	shl    $0x3,%eax
c0103455:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c010345b:	39 02                	cmp    %eax,(%edx)
c010345d:	75 02                	jne    c0103461 <_MmInit+0x1fc>
c010345f:	eb 0a                	jmp    c010346b <_MmInit+0x206>
c0103461:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0103464:	8b 00                	mov    (%eax),%eax
c0103466:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0103469:	eb d9                	jmp    c0103444 <_MmInit+0x1df>
c010346b:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c010346e:	83 38 00             	cmpl   $0x0,(%eax)
c0103471:	74 31                	je     c01034a4 <_MmInit+0x23f>
c0103473:	ff 0d 0c 79 10 c0    	decl   0xc010790c
c0103479:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c010347c:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c010347f:	8b 00                	mov    (%eax),%eax
c0103481:	8b 00                	mov    (%eax),%eax
c0103483:	89 02                	mov    %eax,(%edx)
c0103485:	eb 1d                	jmp    c01034a4 <_MmInit+0x23f>
c0103487:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010348a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0103491:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c0103496:	8b 04 10             	mov    (%eax,%edx,1),%eax
c0103499:	a3 00 79 10 c0       	mov    %eax,0xc0107900
c010349e:	ff 0d 0c 79 10 c0    	decl   0xc010790c
c01034a4:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
c01034a7:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c01034ad:	e9 3f ff ff ff       	jmp    c01033f1 <_MmInit+0x18c>
c01034b2:	c9                   	leave  
c01034b3:	c3                   	ret    
c01034b4:	4d                   	dec    %ebp
c01034b5:	6d                   	insl   (%dx),%es:(%edi)
c01034b6:	41                   	inc    %ecx
c01034b7:	6c                   	insb   (%dx),%es:(%edi)
c01034b8:	6c                   	insb   (%dx),%es:(%edi)
c01034b9:	6f                   	outsl  %ds:(%esi),(%dx)
c01034ba:	63 50 68             	arpl   %dx,0x68(%eax)
c01034bd:	79 73                	jns    c0103532 <_MmAllocPhysPage+0x64>
c01034bf:	50                   	push   %eax
c01034c0:	61                   	popa   
c01034c1:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c01034c5:	30 78 25             	xor    %bh,0x25(%eax)
c01034c8:	30 38                	xor    %bh,(%eax)
c01034ca:	6c                   	insb   (%dx),%es:(%edi)
c01034cb:	58                   	pop    %eax
c01034cc:	0a 00                	or     (%eax),%al

c01034ce <_MmAllocPhysPage>:
c01034ce:	55                   	push   %ebp
c01034cf:	89 e5                	mov    %esp,%ebp
c01034d1:	83 ec 18             	sub    $0x18,%esp
c01034d4:	83 ec 0c             	sub    $0xc,%esp
c01034d7:	68 08 79 10 c0       	push   $0xc0107908
c01034dc:	e8 35 fd ff ff       	call   c0103216 <_KeAcquireMutex>
c01034e1:	83 c4 10             	add    $0x10,%esp
c01034e4:	a1 00 79 10 c0       	mov    0xc0107900,%eax
c01034e9:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c01034ec:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c01034f0:	75 1c                	jne    c010350e <_MmAllocPhysPage+0x40>
c01034f2:	83 ec 0c             	sub    $0xc,%esp
c01034f5:	68 08 79 10 c0       	push   $0xc0107908
c01034fa:	e8 1c fd ff ff       	call   c010321b <_KeReleaseMutex>
c01034ff:	83 c4 10             	add    $0x10,%esp
c0103502:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0103509:	e9 a8 00 00 00       	jmp    c01035b6 <_MmAllocPhysPage+0xe8>
c010350e:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103511:	ff 40 04             	incl   0x4(%eax)
c0103514:	a1 00 79 10 c0       	mov    0xc0107900,%eax
c0103519:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c010351c:	74 4b                	je     c0103569 <_MmAllocPhysPage+0x9b>
c010351e:	83 3d 00 79 10 c0 00 	cmpl   $0x0,0xc0107900
c0103525:	74 26                	je     c010354d <_MmAllocPhysPage+0x7f>
c0103527:	a1 00 79 10 c0       	mov    0xc0107900,%eax
c010352c:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c010352f:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103532:	83 38 00             	cmpl   $0x0,(%eax)
c0103535:	74 16                	je     c010354d <_MmAllocPhysPage+0x7f>
c0103537:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010353a:	8b 00                	mov    (%eax),%eax
c010353c:	3b 45 f8             	cmp    0xfffffff8(%ebp),%eax
c010353f:	75 02                	jne    c0103543 <_MmAllocPhysPage+0x75>
c0103541:	eb 0a                	jmp    c010354d <_MmAllocPhysPage+0x7f>
c0103543:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103546:	8b 00                	mov    (%eax),%eax
c0103548:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c010354b:	eb e2                	jmp    c010352f <_MmAllocPhysPage+0x61>
c010354d:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103550:	83 38 00             	cmpl   $0x0,(%eax)
c0103553:	74 24                	je     c0103579 <_MmAllocPhysPage+0xab>
c0103555:	ff 0d 0c 79 10 c0    	decl   0xc010790c
c010355b:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
c010355e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103561:	8b 00                	mov    (%eax),%eax
c0103563:	8b 00                	mov    (%eax),%eax
c0103565:	89 02                	mov    %eax,(%edx)
c0103567:	eb 10                	jmp    c0103579 <_MmAllocPhysPage+0xab>
c0103569:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010356c:	8b 00                	mov    (%eax),%eax
c010356e:	a3 00 79 10 c0       	mov    %eax,0xc0107900
c0103573:	ff 0d 0c 79 10 c0    	decl   0xc010790c
c0103579:	8b 15 b0 79 10 c0    	mov    0xc01079b0,%edx
c010357f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103582:	29 d0                	sub    %edx,%eax
c0103584:	c1 e8 03             	shr    $0x3,%eax
c0103587:	c1 e0 0c             	shl    $0xc,%eax
c010358a:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010358d:	83 ec 0c             	sub    $0xc,%esp
c0103590:	68 08 79 10 c0       	push   $0xc0107908
c0103595:	e8 81 fc ff ff       	call   c010321b <_KeReleaseMutex>
c010359a:	83 c4 10             	add    $0x10,%esp
c010359d:	83 ec 08             	sub    $0x8,%esp
c01035a0:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01035a3:	68 b4 34 10 c0       	push   $0xc01034b4
c01035a8:	e8 34 f5 ff ff       	call   c0102ae1 <_printf>
c01035ad:	83 c4 10             	add    $0x10,%esp
c01035b0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01035b3:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c01035b6:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01035b9:	c9                   	leave  
c01035ba:	c3                   	ret    
c01035bb:	90                   	nop    
c01035bc:	8d 74 26 00          	lea    0x0(%esi,1),%esi
c01035c0:	28 28                	sub    %ch,(%eax)
c01035c2:	70 61                	jo     c0103625 <_MmFreePhysPage+0x2>
c01035c4:	67 65 20 26 20 50    	addr16 and %ah,%gs:20512
c01035ca:	41                   	inc    %ecx
c01035cb:	47                   	inc    %edi
c01035cc:	45                   	inc    %ebp
c01035cd:	5f                   	pop    %edi
c01035ce:	4d                   	dec    %ebp
c01035cf:	41                   	inc    %ecx
c01035d0:	53                   	push   %ebx
c01035d1:	4b                   	dec    %ebx
c01035d2:	29 20                	sub    %esp,(%eax)
c01035d4:	3d 3d 20 30 29       	cmp    $0x2930203d,%eax
c01035d9:	20 26                	and    %ah,(%esi)
c01035db:	26 20 70 61          	and    %dh,%es:0x61(%eax)
c01035df:	67 65 20 3c          	addr16 and %bh,%gs:(%si)
c01035e3:	20 4d 6d             	and    %cl,0x6d(%ebp)
c01035e6:	4d                   	dec    %ebp
c01035e7:	61                   	popa   
c01035e8:	78 50                	js     c010363a <_MmFreePhysPage+0x17>
c01035ea:	68 79 73 41 64       	push   $0x64417379
c01035ef:	64                   	fs
c01035f0:	72 20                	jb     c0103612 <_MmAllocPhysPage+0x144>
c01035f2:	26 26 20 70 61       	and    %dh,%es:0x61(%eax)
c01035f7:	67 65 20 3e 3d 20    	addr16 and %bh,%gs:8253
c01035fd:	4d                   	dec    %ebp
c01035fe:	45                   	inc    %ebp
c01035ff:	4d                   	dec    %ebp
c0103600:	5f                   	pop    %edi
c0103601:	45                   	inc    %ebp
c0103602:	58                   	pop    %eax
c0103603:	54                   	push   %esp
c0103604:	45                   	inc    %ebp
c0103605:	4e                   	dec    %esi
c0103606:	44                   	inc    %esp
c0103607:	45                   	inc    %ebp
c0103608:	44                   	inc    %esp
c0103609:	00 4d 6d             	add    %cl,0x6d(%ebp)
c010360c:	46                   	inc    %esi
c010360d:	72 65                	jb     c0103674 <_MmFreePhysPage+0x51>
c010360f:	65                   	gs
c0103610:	50                   	push   %eax
c0103611:	68 79 73 50 61       	push   $0x61507379
c0103616:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c010361a:	30 78 25             	xor    %bh,0x25(%eax)
c010361d:	30 38                	xor    %bh,(%eax)
c010361f:	6c                   	insb   (%dx),%es:(%edi)
c0103620:	58                   	pop    %eax
c0103621:	0a 00                	or     (%eax),%al

c0103623 <_MmFreePhysPage>:
c0103623:	55                   	push   %ebp
c0103624:	89 e5                	mov    %esp,%ebp
c0103626:	83 ec 08             	sub    $0x8,%esp
c0103629:	8b 45 08             	mov    0x8(%ebp),%eax
c010362c:	25 ff 0f 00 00       	and    $0xfff,%eax
c0103631:	85 c0                	test   %eax,%eax
c0103633:	75 16                	jne    c010364b <_MmFreePhysPage+0x28>
c0103635:	8b 45 08             	mov    0x8(%ebp),%eax
c0103638:	3b 05 80 79 10 c0    	cmp    0xc0107980,%eax
c010363e:	73 0b                	jae    c010364b <_MmFreePhysPage+0x28>
c0103640:	81 7d 08 ff ff 0f 00 	cmpl   $0xfffff,0x8(%ebp)
c0103647:	76 02                	jbe    c010364b <_MmFreePhysPage+0x28>
c0103649:	eb 1c                	jmp    c0103667 <_MmFreePhysPage+0x44>
c010364b:	68 c0 35 10 c0       	push   $0xc01035c0
c0103650:	68 d9 00 00 00       	push   $0xd9
c0103655:	68 54 32 10 c0       	push   $0xc0103254
c010365a:	68 5c 32 10 c0       	push   $0xc010325c
c010365f:	e8 24 f9 ff ff       	call   c0102f88 <_KePanicStr>
c0103664:	83 c4 10             	add    $0x10,%esp
c0103667:	83 ec 0c             	sub    $0xc,%esp
c010366a:	68 08 79 10 c0       	push   $0xc0107908
c010366f:	e8 a2 fb ff ff       	call   c0103216 <_KeAcquireMutex>
c0103674:	83 c4 10             	add    $0x10,%esp
c0103677:	8b 45 08             	mov    0x8(%ebp),%eax
c010367a:	c1 e8 0c             	shr    $0xc,%eax
c010367d:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103680:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103683:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010368a:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c010368f:	ff 4c 10 04          	decl   0x4(%eax,%edx,1)
c0103693:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103696:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010369d:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c01036a2:	83 7c 10 04 00       	cmpl   $0x0,0x4(%eax,%edx,1)
c01036a7:	75 70                	jne    c0103719 <_MmFreePhysPage+0xf6>
c01036a9:	83 3d 00 79 10 c0 00 	cmpl   $0x0,0xc0107900
c01036b0:	75 13                	jne    c01036c5 <_MmFreePhysPage+0xa2>
c01036b2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036b5:	c1 e0 03             	shl    $0x3,%eax
c01036b8:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c01036be:	a3 00 79 10 c0       	mov    %eax,0xc0107900
c01036c3:	eb 14                	jmp    c01036d9 <_MmFreePhysPage+0xb6>
c01036c5:	8b 15 04 79 10 c0    	mov    0xc0107904,%edx
c01036cb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036ce:	c1 e0 03             	shl    $0x3,%eax
c01036d1:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c01036d7:	89 02                	mov    %eax,(%edx)
c01036d9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036dc:	c1 e0 03             	shl    $0x3,%eax
c01036df:	03 05 b0 79 10 c0    	add    0xc01079b0,%eax
c01036e5:	a3 04 79 10 c0       	mov    %eax,0xc0107904
c01036ea:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01036ed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01036f4:	a1 b0 79 10 c0       	mov    0xc01079b0,%eax
c01036f9:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
c0103700:	ff 05 0c 79 10 c0    	incl   0xc010790c
c0103706:	83 ec 08             	sub    $0x8,%esp
c0103709:	ff 75 08             	pushl  0x8(%ebp)
c010370c:	68 0a 36 10 c0       	push   $0xc010360a
c0103711:	e8 cb f3 ff ff       	call   c0102ae1 <_printf>
c0103716:	83 c4 10             	add    $0x10,%esp
c0103719:	83 ec 0c             	sub    $0xc,%esp
c010371c:	68 08 79 10 c0       	push   $0xc0107908
c0103721:	e8 f5 fa ff ff       	call   c010321b <_KeReleaseMutex>
c0103726:	83 c4 10             	add    $0x10,%esp
c0103729:	c9                   	leave  
c010372a:	c3                   	ret    

c010372b <_MmCreateHeap>:
c010372b:	55                   	push   %ebp
c010372c:	89 e5                	mov    %esp,%ebp
c010372e:	83 ec 08             	sub    $0x8,%esp
c0103731:	8b 55 08             	mov    0x8(%ebp),%edx
c0103734:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103737:	89 42 08             	mov    %eax,0x8(%edx)
c010373a:	8b 55 08             	mov    0x8(%ebp),%edx
c010373d:	8b 45 10             	mov    0x10(%ebp),%eax
c0103740:	89 42 0c             	mov    %eax,0xc(%edx)
c0103743:	8b 55 08             	mov    0x8(%ebp),%edx
c0103746:	8b 45 14             	mov    0x14(%ebp),%eax
c0103749:	89 42 14             	mov    %eax,0x14(%edx)
c010374c:	8b 45 08             	mov    0x8(%ebp),%eax
c010374f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0103756:	8b 55 08             	mov    0x8(%ebp),%edx
c0103759:	8b 45 0c             	mov    0xc(%ebp),%eax
c010375c:	89 02                	mov    %eax,(%edx)
c010375e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103761:	8b 10                	mov    (%eax),%edx
c0103763:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103766:	83 c0 10             	add    $0x10,%eax
c0103769:	89 02                	mov    %eax,(%edx)
c010376b:	8b 45 08             	mov    0x8(%ebp),%eax
c010376e:	8b 10                	mov    (%eax),%edx
c0103770:	8b 45 10             	mov    0x10(%ebp),%eax
c0103773:	83 e8 10             	sub    $0x10,%eax
c0103776:	89 42 04             	mov    %eax,0x4(%edx)
c0103779:	8b 45 08             	mov    0x8(%ebp),%eax
c010377c:	8b 00                	mov    (%eax),%eax
c010377e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103785:	8b 45 08             	mov    0x8(%ebp),%eax
c0103788:	8b 00                	mov    (%eax),%eax
c010378a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0103791:	8b 55 08             	mov    0x8(%ebp),%edx
c0103794:	8b 45 08             	mov    0x8(%ebp),%eax
c0103797:	8b 00                	mov    (%eax),%eax
c0103799:	8b 40 04             	mov    0x4(%eax),%eax
c010379c:	89 42 10             	mov    %eax,0x10(%edx)
c010379f:	83 ec 0c             	sub    $0xc,%esp
c01037a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01037a5:	83 c0 18             	add    $0x18,%eax
c01037a8:	50                   	push   %eax
c01037a9:	e8 5a fa ff ff       	call   c0103208 <_KeInitializeMutex>
c01037ae:	83 c4 10             	add    $0x10,%esp
c01037b1:	c9                   	leave  
c01037b2:	c3                   	ret    
c01037b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01037b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
c01037c0:	4d                   	dec    %ebp
c01037c1:	6d                   	insl   (%dx),%es:(%edi)
c01037c2:	48                   	dec    %eax
c01037c3:	65                   	gs
c01037c4:	61                   	popa   
c01037c5:	70 41                	jo     c0103808 <_MmHeapAlloc+0x20>
c01037c7:	6c                   	insb   (%dx),%es:(%edi)
c01037c8:	6c                   	insb   (%dx),%es:(%edi)
c01037c9:	6f                   	outsl  %ds:(%esi),(%dx)
c01037ca:	63 20                	arpl   %sp,(%eax)
c01037cc:	61                   	popa   
c01037cd:	74 20                	je     c01037ef <_MmHeapAlloc+0x7>
c01037cf:	30 78 25             	xor    %bh,0x25(%eax)
c01037d2:	30 38                	xor    %bh,(%eax)
c01037d4:	6c                   	insb   (%dx),%es:(%edi)
c01037d5:	58                   	pop    %eax
c01037d6:	2c 20                	sub    $0x20,%al
c01037d8:	66                   	data16
c01037d9:	72 65                	jb     c0103840 <_MmHeapAlloc+0x58>
c01037db:	65 20 25 6c 64 20 62 	and    %ah,%gs:0x6220646c
c01037e2:	79 74                	jns    c0103858 <_MmHeapAlloc+0x70>
c01037e4:	65                   	gs
c01037e5:	73 0a                	jae    c01037f1 <_MmHeapAlloc+0x9>
	...

c01037e8 <_MmHeapAlloc>:
c01037e8:	55                   	push   %ebp
c01037e9:	89 e5                	mov    %esp,%ebp
c01037eb:	83 ec 18             	sub    $0x18,%esp
c01037ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037f1:	83 c0 0f             	add    $0xf,%eax
c01037f4:	83 e0 f0             	and    $0xfffffff0,%eax
c01037f7:	83 c0 10             	add    $0x10,%eax
c01037fa:	89 45 0c             	mov    %eax,0xc(%ebp)
c01037fd:	83 ec 0c             	sub    $0xc,%esp
c0103800:	8b 45 08             	mov    0x8(%ebp),%eax
c0103803:	83 c0 18             	add    $0x18,%eax
c0103806:	50                   	push   %eax
c0103807:	e8 0a fa ff ff       	call   c0103216 <_KeAcquireMutex>
c010380c:	83 c4 10             	add    $0x10,%esp
c010380f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103812:	8b 00                	mov    (%eax),%eax
c0103814:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103817:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c010381b:	74 18                	je     c0103835 <_MmHeapAlloc+0x4d>
c010381d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103820:	8b 40 04             	mov    0x4(%eax),%eax
c0103823:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103826:	72 02                	jb     c010382a <_MmHeapAlloc+0x42>
c0103828:	eb 0b                	jmp    c0103835 <_MmHeapAlloc+0x4d>
c010382a:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010382d:	8b 40 08             	mov    0x8(%eax),%eax
c0103830:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103833:	eb e2                	jmp    c0103817 <_MmHeapAlloc+0x2f>
c0103835:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103839:	75 1e                	jne    c0103859 <_MmHeapAlloc+0x71>
c010383b:	83 ec 0c             	sub    $0xc,%esp
c010383e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103841:	83 c0 18             	add    $0x18,%eax
c0103844:	50                   	push   %eax
c0103845:	e8 d1 f9 ff ff       	call   c010321b <_KeReleaseMutex>
c010384a:	83 c4 10             	add    $0x10,%esp
c010384d:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0103854:	e9 21 01 00 00       	jmp    c010397a <_MmHeapAlloc+0x192>
c0103859:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010385c:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c010385f:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103862:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103865:	03 02                	add    (%edx),%eax
c0103867:	83 e8 10             	sub    $0x10,%eax
c010386a:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010386d:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103870:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103873:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103876:	03 02                	add    (%edx),%eax
c0103878:	89 01                	mov    %eax,(%ecx)
c010387a:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c010387d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103880:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103883:	8b 40 04             	mov    0x4(%eax),%eax
c0103886:	29 d0                	sub    %edx,%eax
c0103888:	89 41 04             	mov    %eax,0x4(%ecx)
c010388b:	8b 55 08             	mov    0x8(%ebp),%edx
c010388e:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103891:	3b 02                	cmp    (%edx),%eax
c0103893:	75 08                	jne    c010389d <_MmHeapAlloc+0xb5>
c0103895:	8b 55 08             	mov    0x8(%ebp),%edx
c0103898:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010389b:	89 02                	mov    %eax,(%edx)
c010389d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038a0:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
c01038a4:	74 1a                	je     c01038c0 <_MmHeapAlloc+0xd8>
c01038a6:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038a9:	8b 50 0c             	mov    0xc(%eax),%edx
c01038ac:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01038af:	89 42 08             	mov    %eax,0x8(%edx)
c01038b2:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01038b5:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038b8:	8b 40 0c             	mov    0xc(%eax),%eax
c01038bb:	89 42 0c             	mov    %eax,0xc(%edx)
c01038be:	eb 0a                	jmp    c01038ca <_MmHeapAlloc+0xe2>
c01038c0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01038c3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c01038ca:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038cd:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c01038d1:	74 1a                	je     c01038ed <_MmHeapAlloc+0x105>
c01038d3:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038d6:	8b 50 08             	mov    0x8(%eax),%edx
c01038d9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01038dc:	89 42 0c             	mov    %eax,0xc(%edx)
c01038df:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01038e2:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01038e5:	8b 40 08             	mov    0x8(%eax),%eax
c01038e8:	89 42 08             	mov    %eax,0x8(%edx)
c01038eb:	eb 0a                	jmp    c01038f7 <_MmHeapAlloc+0x10f>
c01038ed:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01038f0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01038f7:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c01038fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038fd:	89 42 04             	mov    %eax,0x4(%edx)
c0103900:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103903:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010390a:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c010390d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103910:	8b 40 04             	mov    0x4(%eax),%eax
c0103913:	89 42 08             	mov    %eax,0x8(%edx)
c0103916:	8b 45 08             	mov    0x8(%ebp),%eax
c0103919:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c010391d:	74 0c                	je     c010392b <_MmHeapAlloc+0x143>
c010391f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103922:	8b 50 04             	mov    0x4(%eax),%edx
c0103925:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103928:	89 42 0c             	mov    %eax,0xc(%edx)
c010392b:	8b 55 08             	mov    0x8(%ebp),%edx
c010392e:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103931:	89 42 04             	mov    %eax,0x4(%edx)
c0103934:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103937:	8b 45 08             	mov    0x8(%ebp),%eax
c010393a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010393d:	8b 40 10             	mov    0x10(%eax),%eax
c0103940:	29 d0                	sub    %edx,%eax
c0103942:	89 41 10             	mov    %eax,0x10(%ecx)
c0103945:	83 ec 0c             	sub    $0xc,%esp
c0103948:	8b 45 08             	mov    0x8(%ebp),%eax
c010394b:	83 c0 18             	add    $0x18,%eax
c010394e:	50                   	push   %eax
c010394f:	e8 c7 f8 ff ff       	call   c010321b <_KeReleaseMutex>
c0103954:	83 c4 10             	add    $0x10,%esp
c0103957:	83 ec 04             	sub    $0x4,%esp
c010395a:	8b 45 08             	mov    0x8(%ebp),%eax
c010395d:	ff 70 10             	pushl  0x10(%eax)
c0103960:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103963:	ff 30                	pushl  (%eax)
c0103965:	68 c0 37 10 c0       	push   $0xc01037c0
c010396a:	e8 72 f1 ff ff       	call   c0102ae1 <_printf>
c010396f:	83 c4 10             	add    $0x10,%esp
c0103972:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103975:	8b 00                	mov    (%eax),%eax
c0103977:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c010397a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010397d:	c9                   	leave  
c010397e:	c3                   	ret    
c010397f:	6c                   	insb   (%dx),%es:(%edi)
c0103980:	69 73 74 20 21 3d 20 	imul   $0x203d2120,0x74(%ebx),%esi
c0103987:	4e                   	dec    %esi
c0103988:	55                   	push   %ebp
c0103989:	4c                   	dec    %esp
c010398a:	4c                   	dec    %esp
c010398b:	00 90 90 90 90 90    	add    %dl,0x90909090(%eax)
c0103991:	90                   	nop    
c0103992:	90                   	nop    
c0103993:	90                   	nop    
c0103994:	90                   	nop    
c0103995:	90                   	nop    
c0103996:	90                   	nop    
c0103997:	90                   	nop    
c0103998:	90                   	nop    
c0103999:	90                   	nop    
c010399a:	90                   	nop    
c010399b:	90                   	nop    
c010399c:	90                   	nop    
c010399d:	90                   	nop    
c010399e:	90                   	nop    
c010399f:	90                   	nop    
c01039a0:	4d                   	dec    %ebp
c01039a1:	6d                   	insl   (%dx),%es:(%edi)
c01039a2:	48                   	dec    %eax
c01039a3:	65                   	gs
c01039a4:	61                   	popa   
c01039a5:	70 46                	jo     c01039ed <_MmHeapFree+0x25>
c01039a7:	72 65                	jb     c0103a0e <_MmHeapFree+0x46>
c01039a9:	65 20 61 74          	and    %ah,%gs:0x74(%ecx)
c01039ad:	20 30                	and    %dh,(%eax)
c01039af:	78 25                	js     c01039d6 <_MmHeapFree+0xe>
c01039b1:	30 38                	xor    %bh,(%eax)
c01039b3:	6c                   	insb   (%dx),%es:(%edi)
c01039b4:	58                   	pop    %eax
c01039b5:	2c 20                	sub    $0x20,%al
c01039b7:	66                   	data16
c01039b8:	72 65                	jb     c0103a1f <_MmHeapFree+0x57>
c01039ba:	65 3a 20             	cmp    %gs:(%eax),%ah
c01039bd:	25 6c 64 20 62       	and    $0x6220646c,%eax
c01039c2:	79 74                	jns    c0103a38 <_MmHeapFree+0x70>
c01039c4:	65                   	gs
c01039c5:	73 0a                	jae    c01039d1 <_MmHeapFree+0x9>
	...

c01039c8 <_MmHeapFree>:
c01039c8:	55                   	push   %ebp
c01039c9:	89 e5                	mov    %esp,%ebp
c01039cb:	83 ec 18             	sub    $0x18,%esp
c01039ce:	83 ec 0c             	sub    $0xc,%esp
c01039d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01039d4:	83 c0 18             	add    $0x18,%eax
c01039d7:	50                   	push   %eax
c01039d8:	e8 39 f8 ff ff       	call   c0103216 <_KeAcquireMutex>
c01039dd:	83 c4 10             	add    $0x10,%esp
c01039e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01039e3:	8b 40 04             	mov    0x4(%eax),%eax
c01039e6:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01039e9:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01039ed:	74 17                	je     c0103a06 <_MmHeapFree+0x3e>
c01039ef:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01039f2:	8b 00                	mov    (%eax),%eax
c01039f4:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01039f7:	75 02                	jne    c01039fb <_MmHeapFree+0x33>
c01039f9:	eb 0b                	jmp    c0103a06 <_MmHeapFree+0x3e>
c01039fb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01039fe:	8b 40 08             	mov    0x8(%eax),%eax
c0103a01:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103a04:	eb e3                	jmp    c01039e9 <_MmHeapFree+0x21>
c0103a06:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0103a0a:	75 1c                	jne    c0103a28 <_MmHeapFree+0x60>
c0103a0c:	68 7f 39 10 c0       	push   $0xc010397f
c0103a11:	68 75 01 00 00       	push   $0x175
c0103a16:	68 54 32 10 c0       	push   $0xc0103254
c0103a1b:	68 5c 32 10 c0       	push   $0xc010325c
c0103a20:	e8 63 f5 ff ff       	call   c0102f88 <_KePanicStr>
c0103a25:	83 c4 10             	add    $0x10,%esp
c0103a28:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0103a2b:	8b 55 08             	mov    0x8(%ebp),%edx
c0103a2e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a31:	8b 40 04             	mov    0x4(%eax),%eax
c0103a34:	03 42 10             	add    0x10(%edx),%eax
c0103a37:	89 41 10             	mov    %eax,0x10(%ecx)
c0103a3a:	8b 55 08             	mov    0x8(%ebp),%edx
c0103a3d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a40:	3b 42 04             	cmp    0x4(%edx),%eax
c0103a43:	75 30                	jne    c0103a75 <_MmHeapFree+0xad>
c0103a45:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a48:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103a4c:	74 1b                	je     c0103a69 <_MmHeapFree+0xa1>
c0103a4e:	8b 55 08             	mov    0x8(%ebp),%edx
c0103a51:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a54:	8b 40 08             	mov    0x8(%eax),%eax
c0103a57:	89 42 04             	mov    %eax,0x4(%edx)
c0103a5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a5d:	8b 40 04             	mov    0x4(%eax),%eax
c0103a60:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0103a67:	eb 3c                	jmp    c0103aa5 <_MmHeapFree+0xdd>
c0103a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a6c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0103a73:	eb 30                	jmp    c0103aa5 <_MmHeapFree+0xdd>
c0103a75:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a78:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
c0103a7c:	74 0f                	je     c0103a8d <_MmHeapFree+0xc5>
c0103a7e:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a81:	8b 50 0c             	mov    0xc(%eax),%edx
c0103a84:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a87:	8b 40 08             	mov    0x8(%eax),%eax
c0103a8a:	89 42 08             	mov    %eax,0x8(%edx)
c0103a8d:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a90:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103a94:	74 0f                	je     c0103aa5 <_MmHeapFree+0xdd>
c0103a96:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a99:	8b 50 08             	mov    0x8(%eax),%edx
c0103a9c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103a9f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103aa2:	89 42 0c             	mov    %eax,0xc(%edx)
c0103aa5:	8b 55 08             	mov    0x8(%ebp),%edx
c0103aa8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103aab:	3b 02                	cmp    (%edx),%eax
c0103aad:	72 08                	jb     c0103ab7 <_MmHeapFree+0xef>
c0103aaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ab2:	83 38 00             	cmpl   $0x0,(%eax)
c0103ab5:	75 41                	jne    c0103af8 <_MmHeapFree+0x130>
c0103ab7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aba:	8b 00                	mov    (%eax),%eax
c0103abc:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103abf:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0103ac6:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103ac9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103acc:	8b 00                	mov    (%eax),%eax
c0103ace:	89 42 08             	mov    %eax,0x8(%edx)
c0103ad1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103ad4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0103adb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ade:	83 38 00             	cmpl   $0x0,(%eax)
c0103ae1:	74 0b                	je     c0103aee <_MmHeapFree+0x126>
c0103ae3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ae6:	8b 10                	mov    (%eax),%edx
c0103ae8:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103aeb:	89 42 0c             	mov    %eax,0xc(%edx)
c0103aee:	8b 55 08             	mov    0x8(%ebp),%edx
c0103af1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103af4:	89 02                	mov    %eax,(%edx)
c0103af6:	eb 6a                	jmp    c0103b62 <_MmHeapFree+0x19a>
c0103af8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103afb:	8b 00                	mov    (%eax),%eax
c0103afd:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103b00:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c0103b04:	74 17                	je     c0103b1d <_MmHeapFree+0x155>
c0103b06:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103b09:	8b 00                	mov    (%eax),%eax
c0103b0b:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103b0e:	72 02                	jb     c0103b12 <_MmHeapFree+0x14a>
c0103b10:	eb 0b                	jmp    c0103b1d <_MmHeapFree+0x155>
c0103b12:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103b15:	8b 40 08             	mov    0x8(%eax),%eax
c0103b18:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103b1b:	eb e3                	jmp    c0103b00 <_MmHeapFree+0x138>
c0103b1d:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103b20:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0103b23:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103b26:	8b 40 0c             	mov    0xc(%eax),%eax
c0103b29:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0103b2c:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c0103b30:	74 14                	je     c0103b46 <_MmHeapFree+0x17e>
c0103b32:	8b 55 f4             	mov    0xfffffff4(%ebp),%edx
c0103b35:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b38:	89 42 0c             	mov    %eax,0xc(%edx)
c0103b3b:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103b3e:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103b41:	89 42 08             	mov    %eax,0x8(%edx)
c0103b44:	eb 0a                	jmp    c0103b50 <_MmHeapFree+0x188>
c0103b46:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b49:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103b50:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103b53:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b56:	89 42 08             	mov    %eax,0x8(%edx)
c0103b59:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103b5c:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103b5f:	89 42 0c             	mov    %eax,0xc(%edx)
c0103b62:	83 7d f4 00          	cmpl   $0x0,0xfffffff4(%ebp)
c0103b66:	74 47                	je     c0103baf <_MmHeapFree+0x1e7>
c0103b68:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103b6b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103b6e:	8b 40 04             	mov    0x4(%eax),%eax
c0103b71:	8b 12                	mov    (%edx),%edx
c0103b73:	01 c2                	add    %eax,%edx
c0103b75:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103b78:	3b 10                	cmp    (%eax),%edx
c0103b7a:	75 1e                	jne    c0103b9a <_MmHeapFree+0x1d2>
c0103b7c:	8b 4d fc             	mov    0xfffffffc(%ebp),%ecx
c0103b7f:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103b82:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103b85:	8b 40 04             	mov    0x4(%eax),%eax
c0103b88:	03 42 04             	add    0x4(%edx),%eax
c0103b8b:	89 41 04             	mov    %eax,0x4(%ecx)
c0103b8e:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0103b91:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103b94:	8b 40 08             	mov    0x8(%eax),%eax
c0103b97:	89 42 08             	mov    %eax,0x8(%edx)
c0103b9a:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103b9d:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103ba1:	74 0c                	je     c0103baf <_MmHeapFree+0x1e7>
c0103ba3:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0103ba6:	8b 50 08             	mov    0x8(%eax),%edx
c0103ba9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103bac:	89 42 0c             	mov    %eax,0xc(%edx)
c0103baf:	83 7d f0 00          	cmpl   $0x0,0xfffffff0(%ebp)
c0103bb3:	74 47                	je     c0103bfc <_MmHeapFree+0x234>
c0103bb5:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103bb8:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103bbb:	8b 40 04             	mov    0x4(%eax),%eax
c0103bbe:	8b 12                	mov    (%edx),%edx
c0103bc0:	01 c2                	add    %eax,%edx
c0103bc2:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103bc5:	3b 10                	cmp    (%eax),%edx
c0103bc7:	75 1e                	jne    c0103be7 <_MmHeapFree+0x21f>
c0103bc9:	8b 4d f0             	mov    0xfffffff0(%ebp),%ecx
c0103bcc:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103bcf:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103bd2:	8b 40 04             	mov    0x4(%eax),%eax
c0103bd5:	03 42 04             	add    0x4(%edx),%eax
c0103bd8:	89 41 04             	mov    %eax,0x4(%ecx)
c0103bdb:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c0103bde:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103be1:	8b 40 08             	mov    0x8(%eax),%eax
c0103be4:	89 42 08             	mov    %eax,0x8(%edx)
c0103be7:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103bea:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
c0103bee:	74 0c                	je     c0103bfc <_MmHeapFree+0x234>
c0103bf0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103bf3:	8b 50 08             	mov    0x8(%eax),%edx
c0103bf6:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c0103bf9:	89 42 0c             	mov    %eax,0xc(%edx)
c0103bfc:	83 ec 0c             	sub    $0xc,%esp
c0103bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c02:	83 c0 18             	add    $0x18,%eax
c0103c05:	50                   	push   %eax
c0103c06:	e8 10 f6 ff ff       	call   c010321b <_KeReleaseMutex>
c0103c0b:	83 c4 10             	add    $0x10,%esp
c0103c0e:	83 ec 04             	sub    $0x4,%esp
c0103c11:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c14:	ff 70 10             	pushl  0x10(%eax)
c0103c17:	ff 75 0c             	pushl  0xc(%ebp)
c0103c1a:	68 a0 39 10 c0       	push   $0xc01039a0
c0103c1f:	e8 bd ee ff ff       	call   c0102ae1 <_printf>
c0103c24:	83 c4 10             	add    $0x10,%esp
c0103c27:	c9                   	leave  
c0103c28:	c3                   	ret    

c0103c29 <_MmGetFreePageCount>:
c0103c29:	55                   	push   %ebp
c0103c2a:	89 e5                	mov    %esp,%ebp
c0103c2c:	a1 0c 79 10 c0       	mov    0xc010790c,%eax
c0103c31:	5d                   	pop    %ebp
c0103c32:	c3                   	ret    
c0103c33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
c0103c40:	4d                   	dec    %ebp
c0103c41:	6d                   	insl   (%dx),%es:(%edi)
c0103c42:	4d                   	dec    %ebp
c0103c43:	61                   	popa   
c0103c44:	70 50                	jo     c0103c96 <_MmMapPage+0x2f>
c0103c46:	61                   	popa   
c0103c47:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c0103c4b:	70 68                	jo     c0103cb5 <_MmMapPage+0x4e>
c0103c4d:	79 73                	jns    c0103cc2 <_MmMapPage+0x5b>
c0103c4f:	20 30                	and    %dh,(%eax)
c0103c51:	78 25                	js     c0103c78 <_MmMapPage+0x11>
c0103c53:	30 38                	xor    %bh,(%eax)
c0103c55:	6c                   	insb   (%dx),%es:(%edi)
c0103c56:	58                   	pop    %eax
c0103c57:	2c 20                	sub    $0x20,%al
c0103c59:	76 69                	jbe    c0103cc4 <_MmMapPage+0x5d>
c0103c5b:	72 74                	jb     c0103cd1 <_MmMapPage+0x6a>
c0103c5d:	20 30                	and    %dh,(%eax)
c0103c5f:	78 25                	js     c0103c86 <_MmMapPage+0x1f>
c0103c61:	30 38                	xor    %bh,(%eax)
c0103c63:	6c                   	insb   (%dx),%es:(%edi)
c0103c64:	58                   	pop    %eax
c0103c65:	0a 00                	or     (%eax),%al

c0103c67 <_MmMapPage>:
c0103c67:	55                   	push   %ebp
c0103c68:	89 e5                	mov    %esp,%ebp
c0103c6a:	83 ec 08             	sub    $0x8,%esp
c0103c6d:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c70:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c0103c73:	83 ec 04             	sub    $0x4,%esp
c0103c76:	ff 75 08             	pushl  0x8(%ebp)
c0103c79:	ff 75 0c             	pushl  0xc(%ebp)
c0103c7c:	68 40 3c 10 c0       	push   $0xc0103c40
c0103c81:	e8 5b ee ff ff       	call   c0102ae1 <_printf>
c0103c86:	83 c4 10             	add    $0x10,%esp
c0103c89:	6a 00                	push   $0x0
c0103c8b:	6a 00                	push   $0x0
c0103c8d:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c90:	c1 e8 04             	shr    $0x4,%eax
c0103c93:	83 e0 01             	and    $0x1,%eax
c0103c96:	50                   	push   %eax
c0103c97:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c9a:	c1 e8 02             	shr    $0x2,%eax
c0103c9d:	83 e0 01             	and    $0x1,%eax
c0103ca0:	50                   	push   %eax
c0103ca1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0103ca5:	0f 95 c0             	setne  %al
c0103ca8:	25 ff 00 00 00       	and    $0xff,%eax
c0103cad:	50                   	push   %eax
c0103cae:	b8 00 00 00 00       	mov    $0x0,%eax
c0103cb3:	8a 45 ff             	mov    0xffffffff(%ebp),%al
c0103cb6:	50                   	push   %eax
c0103cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cba:	c1 e8 0c             	shr    $0xc,%eax
c0103cbd:	50                   	push   %eax
c0103cbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cc1:	c1 e8 0c             	shr    $0xc,%eax
c0103cc4:	c1 e0 02             	shl    $0x2,%eax
c0103cc7:	2d 00 00 00 20       	sub    $0x20000000,%eax
c0103ccc:	50                   	push   %eax
c0103ccd:	e8 77 0f 00 00       	call   c0104c49 <_i386SetPte>
c0103cd2:	83 c4 20             	add    $0x20,%esp
c0103cd5:	83 ec 0c             	sub    $0xc,%esp
c0103cd8:	ff 75 0c             	pushl  0xc(%ebp)
c0103cdb:	e8 62 10 00 00       	call   c0104d42 <_i386InvalidatePage>
c0103ce0:	83 c4 10             	add    $0x10,%esp
c0103ce3:	c9                   	leave  
c0103ce4:	c3                   	ret    
c0103ce5:	4d                   	dec    %ebp
c0103ce6:	6d                   	insl   (%dx),%es:(%edi)
c0103ce7:	55                   	push   %ebp
c0103ce8:	6e                   	outsb  %ds:(%esi),(%dx)
c0103ce9:	4d                   	dec    %ebp
c0103cea:	61                   	popa   
c0103ceb:	70 50                	jo     c0103d3d <_MmUnMapPage+0x3d>
c0103ced:	61                   	popa   
c0103cee:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c0103cf2:	76 69                	jbe    c0103d5d <_MmUnMapPage+0x5d>
c0103cf4:	72 74                	jb     c0103d6a <_MmUnMapPage+0x6a>
c0103cf6:	20 30                	and    %dh,(%eax)
c0103cf8:	78 25                	js     c0103d1f <_MmUnMapPage+0x1f>
c0103cfa:	30 38                	xor    %bh,(%eax)
c0103cfc:	6c                   	insb   (%dx),%es:(%edi)
c0103cfd:	58                   	pop    %eax
c0103cfe:	0a 00                	or     (%eax),%al

c0103d00 <_MmUnMapPage>:
c0103d00:	55                   	push   %ebp
c0103d01:	89 e5                	mov    %esp,%ebp
c0103d03:	83 ec 08             	sub    $0x8,%esp
c0103d06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d09:	88 45 ff             	mov    %al,0xffffffff(%ebp)
c0103d0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d0f:	c1 e8 0c             	shr    $0xc,%eax
c0103d12:	c1 e0 02             	shl    $0x2,%eax
c0103d15:	2d 00 00 00 20       	sub    $0x20000000,%eax
c0103d1a:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103d1d:	83 ec 0c             	sub    $0xc,%esp
c0103d20:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0103d23:	8b 00                	mov    (%eax),%eax
c0103d25:	c1 e8 0c             	shr    $0xc,%eax
c0103d28:	50                   	push   %eax
c0103d29:	e8 f5 f8 ff ff       	call   c0103623 <_MmFreePhysPage>
c0103d2e:	83 c4 10             	add    $0x10,%esp
c0103d31:	83 ec 08             	sub    $0x8,%esp
c0103d34:	6a 04                	push   $0x4
c0103d36:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c0103d39:	e8 a8 dd ff ff       	call   c0101ae6 <_ZeroMemory>
c0103d3e:	83 c4 10             	add    $0x10,%esp
c0103d41:	83 ec 08             	sub    $0x8,%esp
c0103d44:	ff 75 08             	pushl  0x8(%ebp)
c0103d47:	68 e5 3c 10 c0       	push   $0xc0103ce5
c0103d4c:	e8 90 ed ff ff       	call   c0102ae1 <_printf>
c0103d51:	83 c4 10             	add    $0x10,%esp
c0103d54:	c9                   	leave  
c0103d55:	c3                   	ret    
c0103d56:	8d 76 00             	lea    0x0(%esi),%esi
c0103d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
c0103d60:	63 75 72             	arpl   %si,0x72(%ebp)
c0103d63:	72 65                	jb     c0103dca <_MmUnMapPage+0xca>
c0103d65:	6e                   	outsb  %ds:(%esi),(%dx)
c0103d66:	74 5f                	je     c0103dc7 <_MmUnMapPage+0xc7>
c0103d68:	61                   	popa   
c0103d69:	64                   	fs
c0103d6a:	64                   	fs
c0103d6b:	72 20                	jb     c0103d8d <_MmUnMapPage+0x8d>
c0103d6d:	3c 20                	cmp    $0x20,%al
c0103d6f:	50                   	push   %eax
c0103d70:	52                   	push   %edx
c0103d71:	4f                   	dec    %edi
c0103d72:	43                   	inc    %ebx
c0103d73:	45                   	inc    %ebp
c0103d74:	53                   	push   %ebx
c0103d75:	53                   	push   %ebx
c0103d76:	5f                   	pop    %edi
c0103d77:	54                   	push   %esp
c0103d78:	45                   	inc    %ebp
c0103d79:	4d                   	dec    %ebp
c0103d7a:	50                   	push   %eax
c0103d7b:	5f                   	pop    %edi
c0103d7c:	4d                   	dec    %ebp
c0103d7d:	41                   	inc    %ecx
c0103d7e:	50                   	push   %eax
c0103d7f:	5f                   	pop    %edi
c0103d80:	4d                   	dec    %ebp
c0103d81:	41                   	inc    %ecx
c0103d82:	58                   	pop    %eax
c0103d83:	5f                   	pop    %edi
c0103d84:	41                   	inc    %ecx
c0103d85:	44                   	inc    %esp
c0103d86:	44                   	inc    %esp
c0103d87:	52                   	push   %edx
c0103d88:	00 90 90 90 90 90    	add    %dl,0x90909090(%eax)
c0103d8e:	90                   	nop    
c0103d8f:	90                   	nop    
c0103d90:	90                   	nop    
c0103d91:	90                   	nop    
c0103d92:	90                   	nop    
c0103d93:	90                   	nop    
c0103d94:	90                   	nop    
c0103d95:	90                   	nop    
c0103d96:	90                   	nop    
c0103d97:	90                   	nop    
c0103d98:	90                   	nop    
c0103d99:	90                   	nop    
c0103d9a:	90                   	nop    
c0103d9b:	90                   	nop    
c0103d9c:	90                   	nop    
c0103d9d:	90                   	nop    
c0103d9e:	90                   	nop    
c0103d9f:	90                   	nop    
c0103da0:	4d                   	dec    %ebp
c0103da1:	6d                   	insl   (%dx),%es:(%edi)
c0103da2:	4d                   	dec    %ebp
c0103da3:	61                   	popa   
c0103da4:	70 54                	jo     c0103dfa <_MmMapTempPage+0x2f>
c0103da6:	65                   	gs
c0103da7:	6d                   	insl   (%dx),%es:(%edi)
c0103da8:	70 50                	jo     c0103dfa <_MmMapTempPage+0x2f>
c0103daa:	61                   	popa   
c0103dab:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c0103daf:	70 68                	jo     c0103e19 <_MmMapTempPage+0x4e>
c0103db1:	79 73                	jns    c0103e26 <_MmMapTempPage+0x5b>
c0103db3:	20 30                	and    %dh,(%eax)
c0103db5:	78 25                	js     c0103ddc <_MmMapTempPage+0x11>
c0103db7:	30 38                	xor    %bh,(%eax)
c0103db9:	6c                   	insb   (%dx),%es:(%edi)
c0103dba:	58                   	pop    %eax
c0103dbb:	2c 20                	sub    $0x20,%al
c0103dbd:	76 69                	jbe    c0103e28 <_MmMapTempPage+0x5d>
c0103dbf:	72 74                	jb     c0103e35 <_MmMapTempPage+0x6a>
c0103dc1:	20 30                	and    %dh,(%eax)
c0103dc3:	78 25                	js     c0103dea <_MmMapTempPage+0x1f>
c0103dc5:	30 38                	xor    %bh,(%eax)
c0103dc7:	6c                   	insb   (%dx),%es:(%edi)
c0103dc8:	58                   	pop    %eax
c0103dc9:	0a 00                	or     (%eax),%al

c0103dcb <_MmMapTempPage>:
c0103dcb:	55                   	push   %ebp
c0103dcc:	89 e5                	mov    %esp,%ebp
c0103dce:	83 ec 08             	sub    $0x8,%esp
c0103dd1:	81 3d 00 51 10 c0 ff 	cmpl   $0xe07fffff,0xc0105100
c0103dd8:	ff 7f e0 
c0103ddb:	76 1c                	jbe    c0103df9 <_MmMapTempPage+0x2e>
c0103ddd:	68 60 3d 10 c0       	push   $0xc0103d60
c0103de2:	68 39 02 00 00       	push   $0x239
c0103de7:	68 54 32 10 c0       	push   $0xc0103254
c0103dec:	68 5c 32 10 c0       	push   $0xc010325c
c0103df1:	e8 92 f1 ff ff       	call   c0102f88 <_KePanicStr>
c0103df6:	83 c4 10             	add    $0x10,%esp
c0103df9:	81 7d 08 ff ff ff 1f 	cmpl   $0x1fffffff,0x8(%ebp)
c0103e00:	77 29                	ja     c0103e2b <_MmMapTempPage+0x60>
c0103e02:	83 ec 04             	sub    $0x4,%esp
c0103e05:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e08:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0103e0d:	50                   	push   %eax
c0103e0e:	ff 75 08             	pushl  0x8(%ebp)
c0103e11:	68 a0 3d 10 c0       	push   $0xc0103da0
c0103e16:	e8 c6 ec ff ff       	call   c0102ae1 <_printf>
c0103e1b:	83 c4 10             	add    $0x10,%esp
c0103e1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e21:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0103e26:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103e29:	eb 4a                	jmp    c0103e75 <_MmMapTempPage+0xaa>
c0103e2b:	6a 00                	push   $0x0
c0103e2d:	6a 06                	push   $0x6
c0103e2f:	ff 75 08             	pushl  0x8(%ebp)
c0103e32:	ff 35 00 51 10 c0    	pushl  0xc0105100
c0103e38:	e8 2a fe ff ff       	call   c0103c67 <_MmMapPage>
c0103e3d:	83 c4 10             	add    $0x10,%esp
c0103e40:	81 05 00 51 10 c0 00 	addl   $0x1000,0xc0105100
c0103e47:	10 00 00 
c0103e4a:	83 ec 04             	sub    $0x4,%esp
c0103e4d:	a1 00 51 10 c0       	mov    0xc0105100,%eax
c0103e52:	2d 00 10 00 00       	sub    $0x1000,%eax
c0103e57:	50                   	push   %eax
c0103e58:	ff 75 08             	pushl  0x8(%ebp)
c0103e5b:	68 a0 3d 10 c0       	push   $0xc0103da0
c0103e60:	e8 7c ec ff ff       	call   c0102ae1 <_printf>
c0103e65:	83 c4 10             	add    $0x10,%esp
c0103e68:	a1 00 51 10 c0       	mov    0xc0105100,%eax
c0103e6d:	2d 00 10 00 00       	sub    $0x1000,%eax
c0103e72:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0103e75:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103e78:	c9                   	leave  
c0103e79:	c3                   	ret    
c0103e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103e80:	4d                   	dec    %ebp
c0103e81:	6d                   	insl   (%dx),%es:(%edi)
c0103e82:	55                   	push   %ebp
c0103e83:	6e                   	outsb  %ds:(%esi),(%dx)
c0103e84:	4d                   	dec    %ebp
c0103e85:	61                   	popa   
c0103e86:	70 54                	jo     c0103edc <_MmUnMapTempPage+0x3d>
c0103e88:	65                   	gs
c0103e89:	6d                   	insl   (%dx),%es:(%edi)
c0103e8a:	70 50                	jo     c0103edc <_MmUnMapTempPage+0x3d>
c0103e8c:	61                   	popa   
c0103e8d:	67 65 3a 20          	addr16 cmp %gs:(%bx,%si),%ah
c0103e91:	76 69                	jbe    c0103efc <_MmCollision+0x1c>
c0103e93:	72 74                	jb     c0103f09 <_MmCollision+0x29>
c0103e95:	20 30                	and    %dh,(%eax)
c0103e97:	78 25                	js     c0103ebe <_MmUnMapTempPage+0x1f>
c0103e99:	30 38                	xor    %bh,(%eax)
c0103e9b:	6c                   	insb   (%dx),%es:(%edi)
c0103e9c:	58                   	pop    %eax
c0103e9d:	0a 00                	or     (%eax),%al

c0103e9f <_MmUnMapTempPage>:
c0103e9f:	55                   	push   %ebp
c0103ea0:	89 e5                	mov    %esp,%ebp
c0103ea2:	83 ec 08             	sub    $0x8,%esp
c0103ea5:	83 ec 08             	sub    $0x8,%esp
c0103ea8:	ff 75 08             	pushl  0x8(%ebp)
c0103eab:	68 80 3e 10 c0       	push   $0xc0103e80
c0103eb0:	e8 2c ec ff ff       	call   c0102ae1 <_printf>
c0103eb5:	83 c4 10             	add    $0x10,%esp
c0103eb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ebb:	05 00 00 00 40       	add    $0x40000000,%eax
c0103ec0:	3d ff ff ff 1f       	cmp    $0x1fffffff,%eax
c0103ec5:	77 02                	ja     c0103ec9 <_MmUnMapTempPage+0x2a>
c0103ec7:	eb 10                	jmp    c0103ed9 <_MmUnMapTempPage+0x3a>
c0103ec9:	83 ec 08             	sub    $0x8,%esp
c0103ecc:	6a 00                	push   $0x0
c0103ece:	ff 75 08             	pushl  0x8(%ebp)
c0103ed1:	e8 2a fe ff ff       	call   c0103d00 <_MmUnMapPage>
c0103ed6:	83 c4 10             	add    $0x10,%esp
c0103ed9:	c9                   	leave  
c0103eda:	c3                   	ret    
c0103edb:	90                   	nop    
c0103edc:	90                   	nop    
c0103edd:	90                   	nop    
c0103ede:	90                   	nop    
c0103edf:	90                   	nop    

c0103ee0 <_MmCollision>:
c0103ee0:	55                   	push   %ebp
c0103ee1:	89 e5                	mov    %esp,%ebp
c0103ee3:	83 ec 04             	sub    $0x4,%esp
c0103ee6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103eea:	74 34                	je     c0103f20 <_MmCollision+0x40>
c0103eec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0103ef0:	74 2e                	je     c0103f20 <_MmCollision+0x40>
c0103ef2:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ef5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef8:	8b 40 08             	mov    0x8(%eax),%eax
c0103efb:	8b 52 04             	mov    0x4(%edx),%edx
c0103efe:	01 c2                	add    %eax,%edx
c0103f00:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f03:	3b 50 04             	cmp    0x4(%eax),%edx
c0103f06:	76 18                	jbe    c0103f20 <_MmCollision+0x40>
c0103f08:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103f0b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f0e:	8b 40 08             	mov    0x8(%eax),%eax
c0103f11:	8b 52 04             	mov    0x4(%edx),%edx
c0103f14:	01 c2                	add    %eax,%edx
c0103f16:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f19:	3b 50 04             	cmp    0x4(%eax),%edx
c0103f1c:	76 02                	jbe    c0103f20 <_MmCollision+0x40>
c0103f1e:	eb 09                	jmp    c0103f29 <_MmCollision+0x49>
c0103f20:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c0103f27:	eb 07                	jmp    c0103f30 <_MmCollision+0x50>
c0103f29:	c7 45 fc 01 00 00 00 	movl   $0x1,0xfffffffc(%ebp)
c0103f30:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0103f33:	c9                   	leave  
c0103f34:	c3                   	ret    
c0103f35:	8d 74 26 00          	lea    0x0(%esi,1),%esi
c0103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,1),%edi
c0103f40:	4d                   	dec    %ebp
c0103f41:	6d                   	insl   (%dx),%es:(%edi)
c0103f42:	56                   	push   %esi
c0103f43:	69 72 74 75 61 6c 41 	imul   $0x416c6175,0x74(%edx),%esi
c0103f4a:	6c                   	insb   (%dx),%es:(%edi)
c0103f4b:	6c                   	insb   (%dx),%es:(%edi)
c0103f4c:	6f                   	outsl  %ds:(%esi),(%dx)
c0103f4d:	63 3a                	arpl   %di,(%edx)
c0103f4f:	20 61 64             	and    %ah,0x64(%ecx)
c0103f52:	64                   	fs
c0103f53:	72 20                	jb     c0103f75 <_MmVirtualAlloc+0xa>
c0103f55:	30 78 25             	xor    %bh,0x25(%eax)
c0103f58:	30 38                	xor    %bh,(%eax)
c0103f5a:	6c                   	insb   (%dx),%es:(%edi)
c0103f5b:	58                   	pop    %eax
c0103f5c:	20 73 69             	and    %dh,0x69(%ebx)
c0103f5f:	7a 65                	jp     c0103fc6 <_MmVirtualAlloc+0x5b>
c0103f61:	20 30                	and    %dh,(%eax)
c0103f63:	78 25                	js     c0103f8a <_MmVirtualAlloc+0x1f>
c0103f65:	30 38                	xor    %bh,(%eax)
c0103f67:	6c                   	insb   (%dx),%es:(%edi)
c0103f68:	58                   	pop    %eax
c0103f69:	0a 00                	or     (%eax),%al

c0103f6b <_MmVirtualAlloc>:
c0103f6b:	55                   	push   %ebp
c0103f6c:	89 e5                	mov    %esp,%ebp
c0103f6e:	83 ec 18             	sub    $0x18,%esp
c0103f71:	83 ec 08             	sub    $0x8,%esp
c0103f74:	6a 10                	push   $0x10
c0103f76:	6a 00                	push   $0x0
c0103f78:	e8 6e f0 ff ff       	call   c0102feb <_KeHeapAlloc>
c0103f7d:	83 c4 10             	add    $0x10,%esp
c0103f80:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0103f83:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c0103f87:	75 0c                	jne    c0103f95 <_MmVirtualAlloc+0x2a>
c0103f89:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,0xffffffec(%ebp)
c0103f90:	e9 4e 02 00 00       	jmp    c01041e3 <_MmVirtualAlloc+0x278>
c0103f95:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f98:	05 ff ff 00 00       	add    $0xffff,%eax
c0103f9d:	25 00 00 ff ff       	and    $0xffff0000,%eax
c0103fa2:	89 45 0c             	mov    %eax,0xc(%ebp)
c0103fa5:	8b 45 10             	mov    0x10(%ebp),%eax
c0103fa8:	05 ff ff 00 00       	add    $0xffff,%eax
c0103fad:	25 00 00 ff ff       	and    $0xffff0000,%eax
c0103fb2:	89 45 10             	mov    %eax,0x10(%ebp)
c0103fb5:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103fb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103fbb:	89 42 04             	mov    %eax,0x4(%edx)
c0103fbe:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103fc1:	8b 45 10             	mov    0x10(%ebp),%eax
c0103fc4:	89 42 08             	mov    %eax,0x8(%edx)
c0103fc7:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0103fca:	8b 45 18             	mov    0x18(%ebp),%eax
c0103fcd:	89 42 0c             	mov    %eax,0xc(%edx)
c0103fd0:	83 ec 0c             	sub    $0xc,%esp
c0103fd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd6:	83 c0 1c             	add    $0x1c,%eax
c0103fd9:	50                   	push   %eax
c0103fda:	e8 37 f2 ff ff       	call   c0103216 <_KeAcquireMutex>
c0103fdf:	83 c4 10             	add    $0x10,%esp
c0103fe2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe5:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c0103fe9:	74 1c                	je     c0104007 <_MmVirtualAlloc+0x9c>
c0103feb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fee:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
c0103ff2:	74 60                	je     c0104054 <_MmVirtualAlloc+0xe9>
c0103ff4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff7:	8b 50 04             	mov    0x4(%eax),%edx
c0103ffa:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ffd:	03 45 0c             	add    0xc(%ebp),%eax
c0104000:	39 42 04             	cmp    %eax,0x4(%edx)
c0104003:	73 02                	jae    c0104007 <_MmVirtualAlloc+0x9c>
c0104005:	eb 4d                	jmp    c0104054 <_MmVirtualAlloc+0xe9>
c0104007:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c010400a:	8b 45 08             	mov    0x8(%ebp),%eax
c010400d:	8b 40 04             	mov    0x4(%eax),%eax
c0104010:	89 02                	mov    %eax,(%edx)
c0104012:	8b 55 08             	mov    0x8(%ebp),%edx
c0104015:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104018:	89 42 04             	mov    %eax,0x4(%edx)
c010401b:	83 ec 0c             	sub    $0xc,%esp
c010401e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104021:	83 c0 1c             	add    $0x1c,%eax
c0104024:	50                   	push   %eax
c0104025:	e8 f1 f1 ff ff       	call   c010321b <_KeReleaseMutex>
c010402a:	83 c4 10             	add    $0x10,%esp
c010402d:	83 ec 04             	sub    $0x4,%esp
c0104030:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104033:	ff 70 08             	pushl  0x8(%eax)
c0104036:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104039:	ff 70 04             	pushl  0x4(%eax)
c010403c:	68 40 3f 10 c0       	push   $0xc0103f40
c0104041:	e8 9b ea ff ff       	call   c0102ae1 <_printf>
c0104046:	83 c4 10             	add    $0x10,%esp
c0104049:	8b 45 0c             	mov    0xc(%ebp),%eax
c010404c:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c010404f:	e9 8f 01 00 00       	jmp    c01041e3 <_MmVirtualAlloc+0x278>
c0104054:	c6 45 f3 00          	movb   $0x0,0xfffffff3(%ebp)
c0104058:	8b 45 08             	mov    0x8(%ebp),%eax
c010405b:	8b 40 04             	mov    0x4(%eax),%eax
c010405e:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0104061:	80 7d f3 01          	cmpb   $0x1,0xfffffff3(%ebp)
c0104065:	75 70                	jne    c01040d7 <_MmVirtualAlloc+0x16c>
c0104067:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010406a:	83 38 00             	cmpl   $0x0,(%eax)
c010406d:	75 1a                	jne    c0104089 <_MmVirtualAlloc+0x11e>
c010406f:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0104072:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104075:	8b 40 08             	mov    0x8(%eax),%eax
c0104078:	8b 52 04             	mov    0x4(%edx),%edx
c010407b:	01 c2                	add    %eax,%edx
c010407d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104082:	29 d0                	sub    %edx,%eax
c0104084:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0104087:	eb 1b                	jmp    c01040a4 <_MmVirtualAlloc+0x139>
c0104089:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010408c:	8b 08                	mov    (%eax),%ecx
c010408e:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0104091:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104094:	8b 40 08             	mov    0x8(%eax),%eax
c0104097:	8b 52 04             	mov    0x4(%edx),%edx
c010409a:	01 c2                	add    %eax,%edx
c010409c:	8b 41 04             	mov    0x4(%ecx),%eax
c010409f:	29 d0                	sub    %edx,%eax
c01040a1:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c01040a4:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01040a7:	3b 45 10             	cmp    0x10(%ebp),%eax
c01040aa:	73 17                	jae    c01040c3 <_MmVirtualAlloc+0x158>
c01040ac:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01040af:	8b 00                	mov    (%eax),%eax
c01040b1:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01040b4:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01040b8:	0f 85 8a 00 00 00    	jne    c0104148 <_MmVirtualAlloc+0x1dd>
c01040be:	e9 8f 00 00 00       	jmp    c0104152 <_MmVirtualAlloc+0x1e7>
c01040c3:	8b 4d f8             	mov    0xfffffff8(%ebp),%ecx
c01040c6:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01040c9:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01040cc:	8b 40 08             	mov    0x8(%eax),%eax
c01040cf:	03 42 04             	add    0x4(%edx),%eax
c01040d2:	89 41 04             	mov    %eax,0x4(%ecx)
c01040d5:	eb 7b                	jmp    c0104152 <_MmVirtualAlloc+0x1e7>
c01040d7:	83 ec 08             	sub    $0x8,%esp
c01040da:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c01040dd:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01040e0:	e8 fb fd ff ff       	call   c0103ee0 <_MmCollision>
c01040e5:	83 c4 10             	add    $0x10,%esp
c01040e8:	3c 01                	cmp    $0x1,%al
c01040ea:	75 0f                	jne    c01040fb <_MmVirtualAlloc+0x190>
c01040ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ef:	8b 40 04             	mov    0x4(%eax),%eax
c01040f2:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01040f5:	c6 45 f3 01          	movb   $0x1,0xfffffff3(%ebp)
c01040f9:	eb 4d                	jmp    c0104148 <_MmVirtualAlloc+0x1dd>
c01040fb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01040fe:	83 38 00             	cmpl   $0x0,(%eax)
c0104101:	74 12                	je     c0104115 <_MmVirtualAlloc+0x1aa>
c0104103:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104106:	8b 10                	mov    (%eax),%edx
c0104108:	8b 45 10             	mov    0x10(%ebp),%eax
c010410b:	03 45 0c             	add    0xc(%ebp),%eax
c010410e:	39 42 04             	cmp    %eax,0x4(%edx)
c0104111:	72 02                	jb     c0104115 <_MmVirtualAlloc+0x1aa>
c0104113:	eb 3d                	jmp    c0104152 <_MmVirtualAlloc+0x1e7>
c0104115:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104118:	83 38 00             	cmpl   $0x0,(%eax)
c010411b:	75 23                	jne    c0104140 <_MmVirtualAlloc+0x1d5>
c010411d:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0104120:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104123:	8b 40 08             	mov    0x8(%eax),%eax
c0104126:	8b 52 04             	mov    0x4(%edx),%edx
c0104129:	01 c2                	add    %eax,%edx
c010412b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104130:	29 d0                	sub    %edx,%eax
c0104132:	39 45 10             	cmp    %eax,0x10(%ebp)
c0104135:	76 1b                	jbe    c0104152 <_MmVirtualAlloc+0x1e7>
c0104137:	c7 45 fc 00 00 00 00 	movl   $0x0,0xfffffffc(%ebp)
c010413e:	eb 12                	jmp    c0104152 <_MmVirtualAlloc+0x1e7>
c0104140:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104143:	8b 00                	mov    (%eax),%eax
c0104145:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0104148:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c010414c:	0f 85 0f ff ff ff    	jne    c0104061 <_MmVirtualAlloc+0xf6>
c0104152:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0104156:	75 2b                	jne    c0104183 <_MmVirtualAlloc+0x218>
c0104158:	83 ec 0c             	sub    $0xc,%esp
c010415b:	8b 45 08             	mov    0x8(%ebp),%eax
c010415e:	83 c0 1c             	add    $0x1c,%eax
c0104161:	50                   	push   %eax
c0104162:	e8 b4 f0 ff ff       	call   c010321b <_KeReleaseMutex>
c0104167:	83 c4 10             	add    $0x10,%esp
c010416a:	83 ec 08             	sub    $0x8,%esp
c010416d:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c0104170:	6a 00                	push   $0x0
c0104172:	e8 94 ee ff ff       	call   c010300b <_KeHeapFree>
c0104177:	83 c4 10             	add    $0x10,%esp
c010417a:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,0xffffffec(%ebp)
c0104181:	eb 60                	jmp    c01041e3 <_MmVirtualAlloc+0x278>
c0104183:	8b 55 f8             	mov    0xfffffff8(%ebp),%edx
c0104186:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104189:	8b 00                	mov    (%eax),%eax
c010418b:	89 02                	mov    %eax,(%edx)
c010418d:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c0104190:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104193:	89 02                	mov    %eax,(%edx)
c0104195:	83 ec 0c             	sub    $0xc,%esp
c0104198:	8b 45 08             	mov    0x8(%ebp),%eax
c010419b:	83 c0 1c             	add    $0x1c,%eax
c010419e:	50                   	push   %eax
c010419f:	e8 77 f0 ff ff       	call   c010321b <_KeReleaseMutex>
c01041a4:	83 c4 10             	add    $0x10,%esp
c01041a7:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c01041ab:	75 11                	jne    c01041be <_MmVirtualAlloc+0x253>
c01041ad:	83 ec 08             	sub    $0x8,%esp
c01041b0:	ff 75 10             	pushl  0x10(%ebp)
c01041b3:	ff 75 0c             	pushl  0xc(%ebp)
c01041b6:	e8 87 02 00 00       	call   c0104442 <_MmCommit>
c01041bb:	83 c4 10             	add    $0x10,%esp
c01041be:	83 ec 04             	sub    $0x4,%esp
c01041c1:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01041c4:	ff 70 08             	pushl  0x8(%eax)
c01041c7:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01041ca:	ff 70 04             	pushl  0x4(%eax)
c01041cd:	68 40 3f 10 c0       	push   $0xc0103f40
c01041d2:	e8 0a e9 ff ff       	call   c0102ae1 <_printf>
c01041d7:	83 c4 10             	add    $0x10,%esp
c01041da:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01041dd:	8b 40 04             	mov    0x4(%eax),%eax
c01041e0:	89 45 ec             	mov    %eax,0xffffffec(%ebp)
c01041e3:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c01041e6:	c9                   	leave  
c01041e7:	c3                   	ret    
c01041e8:	76 61                	jbe    c010424b <_MmVirtualAlloc+0x2e0>
c01041ea:	72 65                	jb     c0104251 <_MmVirtualAlloc+0x2e6>
c01041ec:	61                   	popa   
c01041ed:	20 21                	and    %ah,(%ecx)
c01041ef:	3d 20 4e 55 4c       	cmp    $0x4c554e20,%eax
c01041f4:	4c                   	dec    %esp
c01041f5:	00 6d 6d             	add    %ch,0x6d(%ebp)
c01041f8:	2f                   	das    
c01041f9:	76 6d                	jbe    c0104268 <_MmVirtualFree+0xa>
c01041fb:	2e 63 00             	arpl   %ax,%cs:(%eax)
c01041fe:	25 73 3a 25 64       	and    $0x64253a73,%eax
c0104203:	20 25 73 00 90 90    	and    %ah,0x90900073
c0104209:	90                   	nop    
c010420a:	90                   	nop    
c010420b:	90                   	nop    
c010420c:	90                   	nop    
c010420d:	90                   	nop    
c010420e:	90                   	nop    
c010420f:	90                   	nop    
c0104210:	90                   	nop    
c0104211:	90                   	nop    
c0104212:	90                   	nop    
c0104213:	90                   	nop    
c0104214:	90                   	nop    
c0104215:	90                   	nop    
c0104216:	90                   	nop    
c0104217:	90                   	nop    
c0104218:	90                   	nop    
c0104219:	90                   	nop    
c010421a:	90                   	nop    
c010421b:	90                   	nop    
c010421c:	90                   	nop    
c010421d:	90                   	nop    
c010421e:	90                   	nop    
c010421f:	90                   	nop    
c0104220:	4d                   	dec    %ebp
c0104221:	6d                   	insl   (%dx),%es:(%edi)
c0104222:	56                   	push   %esi
c0104223:	69 72 74 75 61 6c 46 	imul   $0x466c6175,0x74(%edx),%esi
c010422a:	72 65                	jb     c0104291 <_MmVirtualFree+0x33>
c010422c:	65 3a 20             	cmp    %gs:(%eax),%ah
c010422f:	61                   	popa   
c0104230:	64                   	fs
c0104231:	64                   	fs
c0104232:	72 20                	jb     c0104254 <_MmVirtualAlloc+0x2e9>
c0104234:	30 78 25             	xor    %bh,0x25(%eax)
c0104237:	30 38                	xor    %bh,(%eax)
c0104239:	6c                   	insb   (%dx),%es:(%edi)
c010423a:	58                   	pop    %eax
c010423b:	20 73 69             	and    %dh,0x69(%ebx)
c010423e:	7a 65                	jp     c01042a5 <_MmVirtualFree+0x47>
c0104240:	20 30                	and    %dh,(%eax)
c0104242:	78 25                	js     c0104269 <_MmVirtualFree+0xb>
c0104244:	30 38                	xor    %bh,(%eax)
c0104246:	6c                   	insb   (%dx),%es:(%edi)
c0104247:	58                   	pop    %eax
c0104248:	0a 00                	or     (%eax),%al
c010424a:	76 61                	jbe    c01042ad <_MmVirtualFree+0x4f>
c010424c:	72 65                	jb     c01042b3 <_MmVirtualFree+0x55>
c010424e:	61                   	popa   
c010424f:	2d 3e 6e 65 78       	sub    $0x78656e3e,%eax
c0104254:	74 20                	je     c0104276 <_MmVirtualFree+0x18>
c0104256:	21 3d 20 4e 55 4c    	and    %edi,0x4c554e20
c010425c:	4c                   	dec    %esp
	...

c010425e <_MmVirtualFree>:
c010425e:	55                   	push   %ebp
c010425f:	89 e5                	mov    %esp,%ebp
c0104261:	83 ec 08             	sub    $0x8,%esp
c0104264:	83 ec 0c             	sub    $0xc,%esp
c0104267:	8b 45 08             	mov    0x8(%ebp),%eax
c010426a:	83 c0 1c             	add    $0x1c,%eax
c010426d:	50                   	push   %eax
c010426e:	e8 a3 ef ff ff       	call   c0103216 <_KeAcquireMutex>
c0104273:	83 c4 10             	add    $0x10,%esp
c0104276:	8b 45 08             	mov    0x8(%ebp),%eax
c0104279:	8b 40 04             	mov    0x4(%eax),%eax
c010427c:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010427f:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0104283:	75 1c                	jne    c01042a1 <_MmVirtualFree+0x43>
c0104285:	68 e8 41 10 c0       	push   $0xc01041e8
c010428a:	68 0c 01 00 00       	push   $0x10c
c010428f:	68 f6 41 10 c0       	push   $0xc01041f6
c0104294:	68 fe 41 10 c0       	push   $0xc01041fe
c0104299:	e8 ea ec ff ff       	call   c0102f88 <_KePanicStr>
c010429e:	83 c4 10             	add    $0x10,%esp
c01042a1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01042a4:	8b 40 04             	mov    0x4(%eax),%eax
c01042a7:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01042aa:	75 4e                	jne    c01042fa <_MmVirtualFree+0x9c>
c01042ac:	8b 55 08             	mov    0x8(%ebp),%edx
c01042af:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01042b2:	8b 00                	mov    (%eax),%eax
c01042b4:	89 42 04             	mov    %eax,0x4(%edx)
c01042b7:	83 ec 04             	sub    $0x4,%esp
c01042ba:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01042bd:	ff 70 08             	pushl  0x8(%eax)
c01042c0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01042c3:	ff 70 04             	pushl  0x4(%eax)
c01042c6:	68 20 42 10 c0       	push   $0xc0104220
c01042cb:	e8 11 e8 ff ff       	call   c0102ae1 <_printf>
c01042d0:	83 c4 10             	add    $0x10,%esp
c01042d3:	83 ec 08             	sub    $0x8,%esp
c01042d6:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c01042d9:	6a 00                	push   $0x0
c01042db:	e8 2b ed ff ff       	call   c010300b <_KeHeapFree>
c01042e0:	83 c4 10             	add    $0x10,%esp
c01042e3:	83 ec 0c             	sub    $0xc,%esp
c01042e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e9:	83 c0 1c             	add    $0x1c,%eax
c01042ec:	50                   	push   %eax
c01042ed:	e8 29 ef ff ff       	call   c010321b <_KeReleaseMutex>
c01042f2:	83 c4 10             	add    $0x10,%esp
c01042f5:	e9 9c 00 00 00       	jmp    c0104396 <_MmVirtualFree+0x138>
c01042fa:	90                   	nop    
c01042fb:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01042fe:	83 38 00             	cmpl   $0x0,(%eax)
c0104301:	74 19                	je     c010431c <_MmVirtualFree+0xbe>
c0104303:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104306:	8b 00                	mov    (%eax),%eax
c0104308:	8b 40 04             	mov    0x4(%eax),%eax
c010430b:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010430e:	75 02                	jne    c0104312 <_MmVirtualFree+0xb4>
c0104310:	eb 0a                	jmp    c010431c <_MmVirtualFree+0xbe>
c0104312:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104315:	8b 00                	mov    (%eax),%eax
c0104317:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c010431a:	eb df                	jmp    c01042fb <_MmVirtualFree+0x9d>
c010431c:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010431f:	83 38 00             	cmpl   $0x0,(%eax)
c0104322:	75 1c                	jne    c0104340 <_MmVirtualFree+0xe2>
c0104324:	68 4a 42 10 c0       	push   $0xc010424a
c0104329:	68 29 01 00 00       	push   $0x129
c010432e:	68 f6 41 10 c0       	push   $0xc01041f6
c0104333:	68 fe 41 10 c0       	push   $0xc01041fe
c0104338:	e8 4b ec ff ff       	call   c0102f88 <_KePanicStr>
c010433d:	83 c4 10             	add    $0x10,%esp
c0104340:	83 ec 04             	sub    $0x4,%esp
c0104343:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104346:	8b 00                	mov    (%eax),%eax
c0104348:	ff 70 08             	pushl  0x8(%eax)
c010434b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010434e:	8b 00                	mov    (%eax),%eax
c0104350:	ff 70 04             	pushl  0x4(%eax)
c0104353:	68 20 42 10 c0       	push   $0xc0104220
c0104358:	e8 84 e7 ff ff       	call   c0102ae1 <_printf>
c010435d:	83 c4 10             	add    $0x10,%esp
c0104360:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104363:	8b 00                	mov    (%eax),%eax
c0104365:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0104368:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c010436b:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010436e:	8b 00                	mov    (%eax),%eax
c0104370:	8b 00                	mov    (%eax),%eax
c0104372:	89 02                	mov    %eax,(%edx)
c0104374:	83 ec 0c             	sub    $0xc,%esp
c0104377:	8b 45 08             	mov    0x8(%ebp),%eax
c010437a:	83 c0 1c             	add    $0x1c,%eax
c010437d:	50                   	push   %eax
c010437e:	e8 98 ee ff ff       	call   c010321b <_KeReleaseMutex>
c0104383:	83 c4 10             	add    $0x10,%esp
c0104386:	83 ec 08             	sub    $0x8,%esp
c0104389:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c010438c:	6a 00                	push   $0x0
c010438e:	e8 78 ec ff ff       	call   c010300b <_KeHeapFree>
c0104393:	83 c4 10             	add    $0x10,%esp
c0104396:	c9                   	leave  
c0104397:	c3                   	ret    

c0104398 <_MmGetAreaByAddress>:
c0104398:	55                   	push   %ebp
c0104399:	89 e5                	mov    %esp,%ebp
c010439b:	83 ec 08             	sub    $0x8,%esp
c010439e:	83 ec 0c             	sub    $0xc,%esp
c01043a1:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c01043a6:	83 c0 1c             	add    $0x1c,%eax
c01043a9:	50                   	push   %eax
c01043aa:	e8 67 ee ff ff       	call   c0103216 <_KeAcquireMutex>
c01043af:	83 c4 10             	add    $0x10,%esp
c01043b2:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c01043b7:	8b 40 04             	mov    0x4(%eax),%eax
c01043ba:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01043bd:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c01043c1:	74 28                	je     c01043eb <_MmGetAreaByAddress+0x53>
c01043c3:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01043c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01043c9:	3b 42 04             	cmp    0x4(%edx),%eax
c01043cc:	72 13                	jb     c01043e1 <_MmGetAreaByAddress+0x49>
c01043ce:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01043d1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01043d4:	8b 40 08             	mov    0x8(%eax),%eax
c01043d7:	03 42 04             	add    0x4(%edx),%eax
c01043da:	39 45 08             	cmp    %eax,0x8(%ebp)
c01043dd:	73 02                	jae    c01043e1 <_MmGetAreaByAddress+0x49>
c01043df:	eb 0a                	jmp    c01043eb <_MmGetAreaByAddress+0x53>
c01043e1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01043e4:	8b 00                	mov    (%eax),%eax
c01043e6:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c01043e9:	eb d2                	jmp    c01043bd <_MmGetAreaByAddress+0x25>
c01043eb:	83 ec 0c             	sub    $0xc,%esp
c01043ee:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c01043f3:	83 c0 1c             	add    $0x1c,%eax
c01043f6:	50                   	push   %eax
c01043f7:	e8 1f ee ff ff       	call   c010321b <_KeReleaseMutex>
c01043fc:	83 c4 10             	add    $0x10,%esp
c01043ff:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c0104402:	c9                   	leave  
c0104403:	c3                   	ret    
c0104404:	90                   	nop    
c0104405:	90                   	nop    
c0104406:	90                   	nop    
c0104407:	90                   	nop    
c0104408:	90                   	nop    
c0104409:	90                   	nop    
c010440a:	90                   	nop    
c010440b:	90                   	nop    
c010440c:	90                   	nop    
c010440d:	90                   	nop    
c010440e:	90                   	nop    
c010440f:	90                   	nop    
c0104410:	90                   	nop    
c0104411:	90                   	nop    
c0104412:	90                   	nop    
c0104413:	90                   	nop    
c0104414:	90                   	nop    
c0104415:	90                   	nop    
c0104416:	90                   	nop    
c0104417:	90                   	nop    
c0104418:	90                   	nop    
c0104419:	90                   	nop    
c010441a:	90                   	nop    
c010441b:	90                   	nop    
c010441c:	90                   	nop    
c010441d:	90                   	nop    
c010441e:	90                   	nop    
c010441f:	90                   	nop    
c0104420:	61                   	popa   
c0104421:	64                   	fs
c0104422:	64                   	fs
c0104423:	72 20                	jb     c0104445 <_MmCommit+0x3>
c0104425:	2b 20                	sub    (%eax),%esp
c0104427:	73 69                	jae    c0104492 <_MmCommit+0x50>
c0104429:	7a 65                	jp     c0104490 <_MmCommit+0x4e>
c010442b:	20 3c 3d 20 56 4d 5f 	and    %bh,0x5f4d5620(,%edi,1)
c0104432:	4d                   	dec    %ebp
c0104433:	41                   	inc    %ecx
c0104434:	58                   	pop    %eax
c0104435:	5f                   	pop    %edi
c0104436:	41                   	inc    %ecx
c0104437:	44                   	inc    %esp
c0104438:	44                   	inc    %esp
c0104439:	52                   	push   %edx
c010443a:	28 76 61             	sub    %dh,0x61(%esi)
c010443d:	72 65                	jb     c01044a4 <_MmCommit+0x62>
c010443f:	61                   	popa   
c0104440:	29 00                	sub    %eax,(%eax)

c0104442 <_MmCommit>:
c0104442:	55                   	push   %ebp
c0104443:	89 e5                	mov    %esp,%ebp
c0104445:	83 ec 18             	sub    $0x18,%esp
c0104448:	81 65 08 00 f0 ff ff 	andl   $0xfffff000,0x8(%ebp)
c010444f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104452:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104457:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010445c:	89 45 0c             	mov    %eax,0xc(%ebp)
c010445f:	83 ec 0c             	sub    $0xc,%esp
c0104462:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c0104467:	83 c0 1c             	add    $0x1c,%eax
c010446a:	50                   	push   %eax
c010446b:	e8 a6 ed ff ff       	call   c0103216 <_KeAcquireMutex>
c0104470:	83 c4 10             	add    $0x10,%esp
c0104473:	83 ec 0c             	sub    $0xc,%esp
c0104476:	ff 75 08             	pushl  0x8(%ebp)
c0104479:	e8 1a ff ff ff       	call   c0104398 <_MmGetAreaByAddress>
c010447e:	83 c4 10             	add    $0x10,%esp
c0104481:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0104484:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c0104488:	75 0c                	jne    c0104496 <_MmCommit+0x54>
c010448a:	c7 45 f0 fe ff ff ff 	movl   $0xfffffffe,0xfffffff0(%ebp)
c0104491:	e9 d3 00 00 00       	jmp    c0104569 <_MmCommit+0x127>
c0104496:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104499:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010449c:	01 c1                	add    %eax,%ecx
c010449e:	8b 55 fc             	mov    0xfffffffc(%ebp),%edx
c01044a1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01044a4:	8b 40 08             	mov    0x8(%eax),%eax
c01044a7:	03 42 04             	add    0x4(%edx),%eax
c01044aa:	39 c1                	cmp    %eax,%ecx
c01044ac:	76 1c                	jbe    c01044ca <_MmCommit+0x88>
c01044ae:	68 20 44 10 c0       	push   $0xc0104420
c01044b3:	68 6d 01 00 00       	push   $0x16d
c01044b8:	68 f6 41 10 c0       	push   $0xc01041f6
c01044bd:	68 fe 41 10 c0       	push   $0xc01041fe
c01044c2:	e8 c1 ea ff ff       	call   c0102f88 <_KePanicStr>
c01044c7:	83 c4 10             	add    $0x10,%esp
c01044ca:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01044cd:	83 78 0c 00          	cmpl   $0x0,0xc(%eax)
c01044d1:	75 1d                	jne    c01044f0 <_MmCommit+0xae>
c01044d3:	83 ec 0c             	sub    $0xc,%esp
c01044d6:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c01044db:	83 c0 1c             	add    $0x1c,%eax
c01044de:	50                   	push   %eax
c01044df:	e8 37 ed ff ff       	call   c010321b <_KeReleaseMutex>
c01044e4:	83 c4 10             	add    $0x10,%esp
c01044e7:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c01044ee:	eb 79                	jmp    c0104569 <_MmCommit+0x127>
c01044f0:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c01044f7:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01044fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01044fd:	72 02                	jb     c0104501 <_MmCommit+0xbf>
c01044ff:	eb 4d                	jmp    c010454e <_MmCommit+0x10c>
c0104501:	e8 c8 ef ff ff       	call   c01034ce <_MmAllocPhysPage>
c0104506:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0104509:	83 7d f8 00          	cmpl   $0x0,0xfffffff8(%ebp)
c010450d:	75 16                	jne    c0104525 <_MmCommit+0xe3>
c010450f:	83 ec 08             	sub    $0x8,%esp
c0104512:	6a 01                	push   $0x1
c0104514:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0104517:	03 45 08             	add    0x8(%ebp),%eax
c010451a:	50                   	push   %eax
c010451b:	e8 e0 f7 ff ff       	call   c0103d00 <_MmUnMapPage>
c0104520:	83 c4 10             	add    $0x10,%esp
c0104523:	eb ea                	jmp    c010450f <_MmCommit+0xcd>
c0104525:	6a 01                	push   $0x1
c0104527:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c010452a:	ff 70 0c             	pushl  0xc(%eax)
c010452d:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0104530:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c0104533:	50                   	push   %eax
c0104534:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0104537:	03 45 08             	add    0x8(%ebp),%eax
c010453a:	50                   	push   %eax
c010453b:	e8 27 f7 ff ff       	call   c0103c67 <_MmMapPage>
c0104540:	83 c4 10             	add    $0x10,%esp
c0104543:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0104546:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c010454c:	eb a9                	jmp    c01044f7 <_MmCommit+0xb5>
c010454e:	83 ec 0c             	sub    $0xc,%esp
c0104551:	a1 40 79 10 c0       	mov    0xc0107940,%eax
c0104556:	83 c0 1c             	add    $0x1c,%eax
c0104559:	50                   	push   %eax
c010455a:	e8 bc ec ff ff       	call   c010321b <_KeReleaseMutex>
c010455f:	83 c4 10             	add    $0x10,%esp
c0104562:	c7 45 f0 00 00 00 00 	movl   $0x0,0xfffffff0(%ebp)
c0104569:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c010456c:	c9                   	leave  
c010456d:	c3                   	ret    
c010456e:	90                   	nop    
c010456f:	90                   	nop    
c0104570:	90                   	nop    
c0104571:	90                   	nop    
c0104572:	90                   	nop    
c0104573:	90                   	nop    
c0104574:	90                   	nop    
c0104575:	90                   	nop    
c0104576:	90                   	nop    
c0104577:	90                   	nop    
c0104578:	90                   	nop    
c0104579:	90                   	nop    
c010457a:	90                   	nop    
c010457b:	90                   	nop    
c010457c:	90                   	nop    
c010457d:	90                   	nop    
c010457e:	90                   	nop    
c010457f:	90                   	nop    

c0104580 <.text>:
c0104580:	50                   	push   %eax
c0104581:	61                   	popa   
c0104582:	67 65 20 66 61       	addr16 and %ah,%gs:97(%bp)
c0104587:	75 6c                	jne    c01045f5 <.text+0x75>
c0104589:	74 20                	je     c01045ab <.text+0x2b>
c010458b:	61                   	popa   
c010458c:	74 20                	je     c01045ae <.text+0x2e>
c010458e:	61                   	popa   
c010458f:	64                   	fs
c0104590:	64                   	fs
c0104591:	72 65                	jb     c01045f8 <.text+0x78>
c0104593:	73 73                	jae    c0104608 <_MmPageFault+0x2>
c0104595:	20 30                	and    %dh,(%eax)
c0104597:	78 25                	js     c01045be <.text+0x3e>
c0104599:	30 38                	xor    %bh,(%eax)
c010459b:	6c                   	insb   (%dx),%es:(%edi)
c010459c:	58                   	pop    %eax
c010459d:	0a 00                	or     (%eax),%al
c010459f:	28 76 6f             	sub    %dh,0x6f(%esi)
c01045a2:	69 64 20 2a 29 20 70 	imul   $0x61702029,0x2a(%eax,1),%esp
c01045a9:	61 
c01045aa:	67 65 20 21          	addr16 and %ah,%gs:(%bx,%di)
c01045ae:	3d 20 4e 55 4c       	cmp    $0x4c554e20,%eax
c01045b3:	4c                   	dec    %esp
c01045b4:	00 6d 6d             	add    %ch,0x6d(%ebp)
c01045b7:	2f                   	das    
c01045b8:	70 61                	jo     c010461b <_MmPageFault+0x15>
c01045ba:	67                   	addr16
c01045bb:	65                   	gs
c01045bc:	66 61                	popaw  
c01045be:	75 6c                	jne    c010462c <_MmPageFault+0x26>
c01045c0:	74 2e                	je     c01045f0 <.text+0x70>
c01045c2:	63 00                	arpl   %ax,(%eax)
c01045c4:	25 73 3a 25 64       	and    $0x64253a73,%eax
c01045c9:	20 25 73 00 90 90    	and    %ah,0x90900073
c01045cf:	90                   	nop    
c01045d0:	90                   	nop    
c01045d1:	90                   	nop    
c01045d2:	90                   	nop    
c01045d3:	90                   	nop    
c01045d4:	90                   	nop    
c01045d5:	90                   	nop    
c01045d6:	90                   	nop    
c01045d7:	90                   	nop    
c01045d8:	90                   	nop    
c01045d9:	90                   	nop    
c01045da:	90                   	nop    
c01045db:	90                   	nop    
c01045dc:	90                   	nop    
c01045dd:	90                   	nop    
c01045de:	90                   	nop    
c01045df:	90                   	nop    
c01045e0:	53                   	push   %ebx
c01045e1:	55                   	push   %ebp
c01045e2:	43                   	inc    %ebx
c01045e3:	43                   	inc    %ebx
c01045e4:	45                   	inc    %ebp
c01045e5:	53                   	push   %ebx
c01045e6:	53                   	push   %ebx
c01045e7:	28 4d 6d             	sub    %cl,0x6d(%ebp)
c01045ea:	43                   	inc    %ebx
c01045eb:	6f                   	outsl  %ds:(%esi),(%dx)
c01045ec:	6d                   	insl   (%dx),%es:(%edi)
c01045ed:	6d                   	insl   (%dx),%es:(%edi)
c01045ee:	69 74 28 61 64 64 72 	imul   $0x65726464,0x61(%eax,%ebp,1),%esi
c01045f5:	65 
c01045f6:	73 73                	jae    c010466b <_MmPageFault+0x65>
c01045f8:	2c 20                	sub    $0x20,%al
c01045fa:	50                   	push   %eax
c01045fb:	41                   	inc    %ecx
c01045fc:	47                   	inc    %edi
c01045fd:	45                   	inc    %ebp
c01045fe:	5f                   	pop    %edi
c01045ff:	53                   	push   %ebx
c0104600:	49                   	dec    %ecx
c0104601:	5a                   	pop    %edx
c0104602:	45                   	inc    %ebp
c0104603:	29 29                	sub    %ebp,(%ecx)
	...

c0104606 <_MmPageFault>:
c0104606:	55                   	push   %ebp
c0104607:	89 e5                	mov    %esp,%ebp
c0104609:	83 ec 18             	sub    $0x18,%esp
c010460c:	83 ec 08             	sub    $0x8,%esp
c010460f:	ff 75 08             	pushl  0x8(%ebp)
c0104612:	68 80 45 10 c0       	push   $0xc0104580
c0104617:	e8 c5 e4 ff ff       	call   c0102ae1 <_printf>
c010461c:	83 c4 10             	add    $0x10,%esp
c010461f:	81 7d 08 ff ff ff df 	cmpl   $0xdfffffff,0x8(%ebp)
c0104626:	0f 86 98 00 00 00    	jbe    c01046c4 <_MmPageFault+0xbe>
c010462c:	81 7d 08 ff ff 3f e0 	cmpl   $0xe03fffff,0x8(%ebp)
c0104633:	0f 87 8b 00 00 00    	ja     c01046c4 <_MmPageFault+0xbe>
c0104639:	8b 45 08             	mov    0x8(%ebp),%eax
c010463c:	05 00 00 00 20       	add    $0x20000000,%eax
c0104641:	c1 e8 0c             	shr    $0xc,%eax
c0104644:	c1 e0 02             	shl    $0x2,%eax
c0104647:	03 05 60 79 10 c0    	add    0xc0107960,%eax
c010464d:	89 45 f4             	mov    %eax,0xfffffff4(%ebp)
c0104650:	e8 79 ee ff ff       	call   c01034ce <_MmAllocPhysPage>
c0104655:	89 45 fc             	mov    %eax,0xfffffffc(%ebp)
c0104658:	83 7d fc 00          	cmpl   $0x0,0xfffffffc(%ebp)
c010465c:	75 19                	jne    c0104677 <_MmPageFault+0x71>
c010465e:	68 9f 45 10 c0       	push   $0xc010459f
c0104663:	6a 2b                	push   $0x2b
c0104665:	68 b5 45 10 c0       	push   $0xc01045b5
c010466a:	68 c4 45 10 c0       	push   $0xc01045c4
c010466f:	e8 14 e9 ff ff       	call   c0102f88 <_KePanicStr>
c0104674:	83 c4 10             	add    $0x10,%esp
c0104677:	83 ec 0c             	sub    $0xc,%esp
c010467a:	ff 75 fc             	pushl  0xfffffffc(%ebp)
c010467d:	e8 49 f7 ff ff       	call   c0103dcb <_MmMapTempPage>
c0104682:	83 c4 10             	add    $0x10,%esp
c0104685:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0104688:	83 ec 0c             	sub    $0xc,%esp
c010468b:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c010468e:	e8 89 d4 ff ff       	call   c0101b1c <_ZeroPage>
c0104693:	83 c4 10             	add    $0x10,%esp
c0104696:	83 ec 0c             	sub    $0xc,%esp
c0104699:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c010469c:	e8 fe f7 ff ff       	call   c0103e9f <_MmUnMapTempPage>
c01046a1:	83 c4 10             	add    $0x10,%esp
c01046a4:	6a 00                	push   $0x0
c01046a6:	6a 00                	push   $0x0
c01046a8:	6a 00                	push   $0x0
c01046aa:	6a 01                	push   $0x1
c01046ac:	6a 01                	push   $0x1
c01046ae:	6a 00                	push   $0x0
c01046b0:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
c01046b3:	c1 e8 0c             	shr    $0xc,%eax
c01046b6:	50                   	push   %eax
c01046b7:	ff 75 f4             	pushl  0xfffffff4(%ebp)
c01046ba:	e8 8a 05 00 00       	call   c0104c49 <_i386SetPte>
c01046bf:	83 c4 20             	add    $0x20,%esp
c01046c2:	eb 30                	jmp    c01046f4 <_MmPageFault+0xee>
c01046c4:	83 ec 08             	sub    $0x8,%esp
c01046c7:	68 00 10 00 00       	push   $0x1000
c01046cc:	ff 75 08             	pushl  0x8(%ebp)
c01046cf:	e8 6e fd ff ff       	call   c0104442 <_MmCommit>
c01046d4:	83 c4 10             	add    $0x10,%esp
c01046d7:	85 c0                	test   %eax,%eax
c01046d9:	74 19                	je     c01046f4 <_MmPageFault+0xee>
c01046db:	68 e0 45 10 c0       	push   $0xc01045e0
c01046e0:	6a 48                	push   $0x48
c01046e2:	68 b5 45 10 c0       	push   $0xc01045b5
c01046e7:	68 c4 45 10 c0       	push   $0xc01045c4
c01046ec:	e8 97 e8 ff ff       	call   c0102f88 <_KePanicStr>
c01046f1:	83 c4 10             	add    $0x10,%esp
c01046f4:	c9                   	leave  
c01046f5:	c3                   	ret    
c01046f6:	90                   	nop    
c01046f7:	90                   	nop    
c01046f8:	90                   	nop    
c01046f9:	90                   	nop    
c01046fa:	90                   	nop    
c01046fb:	90                   	nop    
c01046fc:	90                   	nop    
c01046fd:	90                   	nop    
c01046fe:	90                   	nop    
c01046ff:	90                   	nop    

c0104700 <.text>:
c0104700:	4d                   	dec    %ebp
c0104701:	6d                   	insl   (%dx),%es:(%edi)
c0104702:	54                   	push   %esp
c0104703:	6f                   	outsl  %ds:(%esi),(%dx)
c0104704:	74 61                	je     c0104767 <_i386MmInit+0x32>
c0104706:	6c                   	insb   (%dx),%es:(%edi)
c0104707:	46                   	inc    %esi
c0104708:	72 65                	jb     c010476f <_i386MmInit+0x3a>
c010470a:	65                   	gs
c010470b:	4d                   	dec    %ebp
c010470c:	65                   	gs
c010470d:	6d                   	insl   (%dx),%es:(%edi)
c010470e:	6f                   	outsl  %ds:(%esi),(%dx)
c010470f:	72 79                	jb     c010478a <_i386MmInit+0x55>
c0104711:	20 21                	and    %ah,(%ecx)
c0104713:	3d 20 46 41 4c       	cmp    $0x4c414620,%eax
c0104718:	53                   	push   %ebx
c0104719:	45                   	inc    %ebp
c010471a:	00 6d 6d             	add    %ch,0x6d(%ebp)
c010471d:	2f                   	das    
c010471e:	69 33 38 36 2f 6d    	imul   $0x6d2f3638,(%ebx),%esi
c0104724:	6d                   	insl   (%dx),%es:(%edi)
c0104725:	69 33 38 36 2e 63    	imul   $0x632e3638,(%ebx),%esi
c010472b:	00 25 73 3a 25 64    	add    %ah,0x64253a73
c0104731:	20 25 73 00 55 89    	and    %ah,0x89550073

c0104735 <_i386MmInit>:
c0104735:	55                   	push   %ebp
c0104736:	89 e5                	mov    %esp,%ebp
c0104738:	53                   	push   %ebx
c0104739:	83 ec 14             	sub    $0x14,%esp
c010473c:	e8 a5 02 00 00       	call   c01049e6 <_i386MmGetFreeMemory>
c0104741:	83 3d 70 79 10 c0 00 	cmpl   $0x0,0xc0107970
c0104748:	75 19                	jne    c0104763 <_i386MmInit+0x2e>
c010474a:	68 00 47 10 c0       	push   $0xc0104700
c010474f:	6a 21                	push   $0x21
c0104751:	68 1b 47 10 c0       	push   $0xc010471b
c0104756:	68 2c 47 10 c0       	push   $0xc010472c
c010475b:	e8 28 e8 ff ff       	call   c0102f88 <_KePanicStr>
c0104760:	83 c4 10             	add    $0x10,%esp
c0104763:	e8 cb e7 ff ff       	call   c0102f33 <_KeGetCubekrnlSize>
c0104768:	2d 00 00 f0 3f       	sub    $0x3ff00000,%eax
c010476d:	89 45 f8             	mov    %eax,0xfffffff8(%ebp)
c0104770:	83 ec 0c             	sub    $0xc,%esp
c0104773:	ff 75 f8             	pushl  0xfffffff8(%ebp)
c0104776:	e8 a1 d3 ff ff       	call   c0101b1c <_ZeroPage>
c010477b:	83 c4 10             	add    $0x10,%esp
c010477e:	83 ec 0c             	sub    $0xc,%esp
c0104781:	6a 0d                	push   $0xd
c0104783:	e8 3b cf ff ff       	call   c01016c3 <_i386QueryFeature>
c0104788:	83 c4 10             	add    $0x10,%esp
c010478b:	3c 01                	cmp    $0x1,%al
c010478d:	75 0d                	jne    c010479c <_i386MmInit+0x67>
c010478f:	bb 80 00 00 00       	mov    $0x80,%ebx
c0104794:	0f 20 e0             	mov    %cr4,%eax
c0104797:	09 d8                	or     %ebx,%eax
c0104799:	0f 22 e0             	mov    %eax,%cr4
c010479c:	6a 00                	push   $0x0
c010479e:	6a 00                	push   $0x0
c01047a0:	6a 00                	push   $0x0
c01047a2:	6a 01                	push   $0x1
c01047a4:	6a 01                	push   $0x1
c01047a6:	6a 00                	push   $0x0
c01047a8:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01047ab:	05 00 00 00 40       	add    $0x40000000,%eax
c01047b0:	c1 e8 0c             	shr    $0xc,%eax
c01047b3:	50                   	push   %eax
c01047b4:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01047b7:	05 00 0e 00 00       	add    $0xe00,%eax
c01047bc:	50                   	push   %eax
c01047bd:	e8 87 04 00 00       	call   c0104c49 <_i386SetPte>
c01047c2:	83 c4 20             	add    $0x20,%esp
c01047c5:	83 ec 0c             	sub    $0xc,%esp
c01047c8:	6a 03                	push   $0x3
c01047ca:	e8 f4 ce ff ff       	call   c01016c3 <_i386QueryFeature>
c01047cf:	83 c4 10             	add    $0x10,%esp
c01047d2:	3c 01                	cmp    $0x1,%al
c01047d4:	0f 85 85 00 00 00    	jne    c010485f <_i386MmInit+0x12a>
c01047da:	bb 10 00 00 00       	mov    $0x10,%ebx
c01047df:	0f 20 e0             	mov    %cr4,%eax
c01047e2:	09 d8                	or     %ebx,%eax
c01047e4:	0f 22 e0             	mov    %eax,%cr4
c01047e7:	6a 01                	push   $0x1
c01047e9:	6a 01                	push   $0x1
c01047eb:	6a 00                	push   $0x0
c01047ed:	6a 01                	push   $0x1
c01047ef:	6a 01                	push   $0x1
c01047f1:	6a 00                	push   $0x0
c01047f3:	6a 00                	push   $0x0
c01047f5:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c01047f8:	05 00 0c 00 00       	add    $0xc00,%eax
c01047fd:	50                   	push   %eax
c01047fe:	e8 46 04 00 00       	call   c0104c49 <_i386SetPte>
c0104803:	83 c4 20             	add    $0x20,%esp
c0104806:	c7 45 f4 00 00 40 00 	movl   $0x400000,0xfffffff4(%ebp)
c010480d:	81 7d f4 ff ff bf 1f 	cmpl   $0x1fbfffff,0xfffffff4(%ebp)
c0104814:	76 02                	jbe    c0104818 <_i386MmInit+0xe3>
c0104816:	eb 38                	jmp    c0104850 <_i386MmInit+0x11b>
c0104818:	6a 00                	push   $0x0
c010481a:	6a 01                	push   $0x1
c010481c:	6a 00                	push   $0x0
c010481e:	6a 01                	push   $0x1
c0104820:	6a 01                	push   $0x1
c0104822:	6a 00                	push   $0x0
c0104824:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0104827:	c1 e8 0c             	shr    $0xc,%eax
c010482a:	50                   	push   %eax
c010482b:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c010482e:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0104833:	c1 e8 16             	shr    $0x16,%eax
c0104836:	c1 e0 02             	shl    $0x2,%eax
c0104839:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c010483c:	50                   	push   %eax
c010483d:	e8 07 04 00 00       	call   c0104c49 <_i386SetPte>
c0104842:	83 c4 20             	add    $0x20,%esp
c0104845:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c0104848:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c010484e:	eb bd                	jmp    c010480d <_i386MmInit+0xd8>
c0104850:	c7 05 10 79 10 c0 00 	movl   $0x1000,0xc0107910
c0104857:	10 00 00 
c010485a:	e9 d5 00 00 00       	jmp    c0104934 <_i386MmInit+0x1ff>
c010485f:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104862:	05 00 10 00 00       	add    $0x1000,%eax
c0104867:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c010486a:	a1 80 79 10 c0       	mov    0xc0107980,%eax
c010486f:	05 ff ff 3f 00       	add    $0x3fffff,%eax
c0104874:	25 00 00 c0 ff       	and    $0xffc00000,%eax
c0104879:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c010487c:	81 7d e8 00 00 c0 1f 	cmpl   $0x1fc00000,0xffffffe8(%ebp)
c0104883:	76 07                	jbe    c010488c <_i386MmInit+0x157>
c0104885:	c7 45 e8 00 00 c0 1f 	movl   $0x1fc00000,0xffffffe8(%ebp)
c010488c:	c7 45 f4 00 00 00 00 	movl   $0x0,0xfffffff4(%ebp)
c0104893:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c0104896:	3b 45 e8             	cmp    0xffffffe8(%ebp),%eax
c0104899:	72 05                	jb     c01048a0 <_i386MmInit+0x16b>
c010489b:	e9 85 00 00 00       	jmp    c0104925 <_i386MmInit+0x1f0>
c01048a0:	6a 00                	push   $0x0
c01048a2:	6a 00                	push   $0x0
c01048a4:	6a 00                	push   $0x0
c01048a6:	6a 01                	push   $0x1
c01048a8:	6a 01                	push   $0x1
c01048aa:	6a 00                	push   $0x0
c01048ac:	8b 45 f0             	mov    0xfffffff0(%ebp),%eax
c01048af:	05 00 00 00 40       	add    $0x40000000,%eax
c01048b4:	c1 e8 0c             	shr    $0xc,%eax
c01048b7:	50                   	push   %eax
c01048b8:	8b 45 f4             	mov    0xfffffff4(%ebp),%eax
c01048bb:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01048c0:	c1 e8 16             	shr    $0x16,%eax
c01048c3:	c1 e0 02             	shl    $0x2,%eax
c01048c6:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c01048c9:	50                   	push   %eax
c01048ca:	e8 7a 03 00 00       	call   c0104c49 <_i386SetPte>
c01048cf:	83 c4 20             	add    $0x20,%esp
c01048d2:	c7 45 ec 00 00 00 00 	movl   $0x0,0xffffffec(%ebp)
c01048d9:	81 7d ec ff ff 3f 00 	cmpl   $0x3fffff,0xffffffec(%ebp)
c01048e0:	76 02                	jbe    c01048e4 <_i386MmInit+0x1af>
c01048e2:	eb 33                	jmp    c0104917 <_i386MmInit+0x1e2>
c01048e4:	6a 00                	push   $0x0
c01048e6:	6a 00                	push   $0x0
c01048e8:	6a 00                	push   $0x0
c01048ea:	6a 01                	push   $0x1
c01048ec:	6a 01                	push   $0x1
c01048ee:	6a 00                	push   $0x0
c01048f0:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c01048f3:	03 45 f4             	add    0xfffffff4(%ebp),%eax
c01048f6:	c1 e8 0c             	shr    $0xc,%eax
c01048f9:	50                   	push   %eax
c01048fa:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c01048fd:	8d 42 04             	lea    0x4(%edx),%eax
c0104900:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
c0104903:	52                   	push   %edx
c0104904:	e8 40 03 00 00       	call   c0104c49 <_i386SetPte>
c0104909:	83 c4 20             	add    $0x20,%esp
c010490c:	8d 45 ec             	lea    0xffffffec(%ebp),%eax
c010490f:	81 00 00 10 00 00    	addl   $0x1000,(%eax)
c0104915:	eb c2                	jmp    c01048d9 <_i386MmInit+0x1a4>
c0104917:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
c010491a:	81 00 00 00 40 00    	addl   $0x400000,(%eax)
c0104920:	e9 6e ff ff ff       	jmp    c0104893 <_i386MmInit+0x15e>
c0104925:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104928:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
c010492b:	29 c2                	sub    %eax,%edx
c010492d:	89 d0                	mov    %edx,%eax
c010492f:	a3 10 79 10 c0       	mov    %eax,0xc0107910
c0104934:	81 05 10 79 10 c0 00 	addl   $0x1000,0xc0107910
c010493b:	10 00 00 
c010493e:	6a 00                	push   $0x0
c0104940:	6a 00                	push   $0x0
c0104942:	6a 00                	push   $0x0
c0104944:	6a 01                	push   $0x1
c0104946:	6a 01                	push   $0x1
c0104948:	6a 01                	push   $0x1
c010494a:	a1 10 79 10 c0       	mov    0xc0107910,%eax
c010494f:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c0104952:	05 00 00 00 40       	add    $0x40000000,%eax
c0104957:	c1 e8 0c             	shr    $0xc,%eax
c010495a:	50                   	push   %eax
c010495b:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c010495e:	05 04 0e 00 00       	add    $0xe04,%eax
c0104963:	50                   	push   %eax
c0104964:	e8 e0 02 00 00       	call   c0104c49 <_i386SetPte>
c0104969:	83 c4 20             	add    $0x20,%esp
c010496c:	83 ec 0c             	sub    $0xc,%esp
c010496f:	a1 10 79 10 c0       	mov    0xc0107910,%eax
c0104974:	03 45 f8             	add    0xfffffff8(%ebp),%eax
c0104977:	50                   	push   %eax
c0104978:	e8 9f d1 ff ff       	call   c0101b1c <_ZeroPage>
c010497d:	83 c4 10             	add    $0x10,%esp
c0104980:	8b 45 f8             	mov    0xfffffff8(%ebp),%eax
c0104983:	05 00 00 00 40       	add    $0x40000000,%eax
c0104988:	0f 22 d8             	mov    %eax,%cr3
c010498b:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
c010498e:	c9                   	leave  
c010498f:	c3                   	ret    

c0104990 <_AddMemToList>:
c0104990:	55                   	push   %ebp
c0104991:	89 e5                	mov    %esp,%ebp
c0104993:	a1 14 51 10 c0       	mov    0xc0105114,%eax
c0104998:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
c010499f:	8b 15 10 51 10 c0    	mov    0xc0105110,%edx
c01049a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01049a8:	89 04 0a             	mov    %eax,(%edx,%ecx,1)
c01049ab:	a1 14 51 10 c0       	mov    0xc0105114,%eax
c01049b0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
c01049b7:	8b 15 10 51 10 c0    	mov    0xc0105110,%edx
c01049bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049c0:	89 44 0a 04          	mov    %eax,0x4(%edx,%ecx,1)
c01049c4:	ff 05 14 51 10 c0    	incl   0xc0105114
c01049ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049cd:	01 05 70 79 10 c0    	add    %eax,0xc0107970
c01049d3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01049d7:	74 0b                	je     c01049e4 <_AddMemToList+0x54>
c01049d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049dc:	03 45 08             	add    0x8(%ebp),%eax
c01049df:	a3 80 79 10 c0       	mov    %eax,0xc0107980
c01049e4:	5d                   	pop    %ebp
c01049e5:	c3                   	ret    

c01049e6 <_i386MmGetFreeMemory>:
c01049e6:	55                   	push   %ebp
c01049e7:	89 e5                	mov    %esp,%ebp
c01049e9:	57                   	push   %edi
c01049ea:	56                   	push   %esi
c01049eb:	53                   	push   %ebx
c01049ec:	83 ec 2c             	sub    $0x2c,%esp
c01049ef:	c7 45 ec 00 d0 00 c0 	movl   $0xc000d000,0xffffffec(%ebp)
c01049f6:	c7 05 70 79 10 c0 00 	movl   $0x0,0xc0107970
c01049fd:	00 00 00 
c0104a00:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104a03:	66 81 38 20 e8       	cmpw   $0xe820,(%eax)
c0104a08:	0f 85 67 01 00 00    	jne    c0104b75 <_i386MmGetFreeMemory+0x18f>
c0104a0e:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104a11:	66 8b 40 02          	mov    0x2(%eax),%ax
c0104a15:	89 c1                	mov    %eax,%ecx
c0104a17:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
c0104a1d:	89 c8                	mov    %ecx,%eax
c0104a1f:	01 c0                	add    %eax,%eax
c0104a21:	01 c8                	add    %ecx,%eax
c0104a23:	89 c2                	mov    %eax,%edx
c0104a25:	c1 e2 04             	shl    $0x4,%edx
c0104a28:	01 d0                	add    %edx,%eax
c0104a2a:	89 c2                	mov    %eax,%edx
c0104a2c:	c1 e2 08             	shl    $0x8,%edx
c0104a2f:	01 d0                	add    %edx,%eax
c0104a31:	c1 e0 02             	shl    $0x2,%eax
c0104a34:	01 c8                	add    %ecx,%eax
c0104a36:	c1 e8 10             	shr    $0x10,%eax
c0104a39:	66 c1 e8 04          	shr    $0x4,%ax
c0104a3d:	25 ff ff 00 00       	and    $0xffff,%eax
c0104a42:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0104a45:	8d 45 e8             	lea    0xffffffe8(%ebp),%eax
c0104a48:	ff 08                	decl   (%eax)
c0104a4a:	83 7d e8 ff          	cmpl   $0xffffffff,0xffffffe8(%ebp)
c0104a4e:	75 05                	jne    c0104a55 <_i386MmGetFreeMemory+0x6f>
c0104a50:	e9 be 01 00 00       	jmp    c0104c13 <_i386MmGetFreeMemory+0x22d>
c0104a55:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
c0104a58:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104a5b:	89 d0                	mov    %edx,%eax
c0104a5d:	c1 e0 02             	shl    $0x2,%eax
c0104a60:	01 d0                	add    %edx,%eax
c0104a62:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
c0104a69:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
c0104a6c:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104a6f:	89 d0                	mov    %edx,%eax
c0104a71:	c1 e0 02             	shl    $0x2,%eax
c0104a74:	01 d0                	add    %edx,%eax
c0104a76:	c1 e0 02             	shl    $0x2,%eax
c0104a79:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
c0104a7c:	8b 55 d0             	mov    0xffffffd0(%ebp),%edx
c0104a7f:	8b 44 11 0c          	mov    0xc(%ecx,%edx,1),%eax
c0104a83:	8b 54 11 10          	mov    0x10(%ecx,%edx,1),%edx
c0104a87:	89 45 d0             	mov    %eax,0xffffffd0(%ebp)
c0104a8a:	89 55 d4             	mov    %edx,0xffffffd4(%ebp)
c0104a8d:	8b 45 d0             	mov    0xffffffd0(%ebp),%eax
c0104a90:	8b 55 d4             	mov    0xffffffd4(%ebp),%edx
c0104a93:	03 44 1e 04          	add    0x4(%esi,%ebx,1),%eax
c0104a97:	13 54 1e 08          	adc    0x8(%esi,%ebx,1),%edx
c0104a9b:	89 45 d8             	mov    %eax,0xffffffd8(%ebp)
c0104a9e:	89 55 dc             	mov    %edx,0xffffffdc(%ebp)
c0104aa1:	83 7d dc 00          	cmpl   $0x0,0xffffffdc(%ebp)
c0104aa5:	72 4e                	jb     c0104af5 <_i386MmGetFreeMemory+0x10f>
c0104aa7:	83 7d dc 00          	cmpl   $0x0,0xffffffdc(%ebp)
c0104aab:	77 06                	ja     c0104ab3 <_i386MmGetFreeMemory+0xcd>
c0104aad:	83 7d d8 ff          	cmpl   $0xffffffff,0xffffffd8(%ebp)
c0104ab1:	76 42                	jbe    c0104af5 <_i386MmGetFreeMemory+0x10f>
c0104ab3:	8b 7d ec             	mov    0xffffffec(%ebp),%edi
c0104ab6:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104ab9:	89 d0                	mov    %edx,%eax
c0104abb:	c1 e0 02             	shl    $0x2,%eax
c0104abe:	01 d0                	add    %edx,%eax
c0104ac0:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
c0104ac7:	8b 75 ec             	mov    0xffffffec(%ebp),%esi
c0104aca:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104acd:	89 d0                	mov    %edx,%eax
c0104acf:	c1 e0 02             	shl    $0x2,%eax
c0104ad2:	01 d0                	add    %edx,%eax
c0104ad4:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
c0104adb:	b8 00 00 00 00       	mov    $0x0,%eax
c0104ae0:	ba 01 00 00 00       	mov    $0x1,%edx
c0104ae5:	2b 44 0e 04          	sub    0x4(%esi,%ecx,1),%eax
c0104ae9:	1b 54 0e 08          	sbb    0x8(%esi,%ecx,1),%edx
c0104aed:	89 44 1f 0c          	mov    %eax,0xc(%edi,%ebx,1)
c0104af1:	89 54 1f 10          	mov    %edx,0x10(%edi,%ebx,1)
c0104af5:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
c0104af8:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104afb:	89 d0                	mov    %edx,%eax
c0104afd:	c1 e0 02             	shl    $0x2,%eax
c0104b00:	01 d0                	add    %edx,%eax
c0104b02:	c1 e0 02             	shl    $0x2,%eax
c0104b05:	01 c8                	add    %ecx,%eax
c0104b07:	83 c0 10             	add    $0x10,%eax
c0104b0a:	83 78 04 01          	cmpl   $0x1,0x4(%eax)
c0104b0e:	0f 85 31 ff ff ff    	jne    c0104a45 <_i386MmGetFreeMemory+0x5f>
c0104b14:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
c0104b17:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104b1a:	89 d0                	mov    %edx,%eax
c0104b1c:	c1 e0 02             	shl    $0x2,%eax
c0104b1f:	01 d0                	add    %edx,%eax
c0104b21:	c1 e0 02             	shl    $0x2,%eax
c0104b24:	81 7c 01 04 ff ff 0f 	cmpl   $0xfffff,0x4(%ecx,%eax,1)
c0104b2b:	00 
c0104b2c:	0f 86 13 ff ff ff    	jbe    c0104a45 <_i386MmGetFreeMemory+0x5f>
c0104b32:	83 ec 08             	sub    $0x8,%esp
c0104b35:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
c0104b38:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104b3b:	89 d0                	mov    %edx,%eax
c0104b3d:	c1 e0 02             	shl    $0x2,%eax
c0104b40:	01 d0                	add    %edx,%eax
c0104b42:	c1 e0 02             	shl    $0x2,%eax
c0104b45:	ff 74 01 0c          	pushl  0xc(%ecx,%eax,1)
c0104b49:	8b 4d ec             	mov    0xffffffec(%ebp),%ecx
c0104b4c:	8b 55 e8             	mov    0xffffffe8(%ebp),%edx
c0104b4f:	89 d0                	mov    %edx,%eax
c0104b51:	c1 e0 02             	shl    $0x2,%eax
c0104b54:	01 d0                	add    %edx,%eax
c0104b56:	c1 e0 02             	shl    $0x2,%eax
c0104b59:	8b 44 01 04          	mov    0x4(%ecx,%eax,1),%eax
c0104b5d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104b62:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104b67:	50                   	push   %eax
c0104b68:	e8 23 fe ff ff       	call   c0104990 <_AddMemToList>
c0104b6d:	83 c4 10             	add    $0x10,%esp
c0104b70:	e9 d0 fe ff ff       	jmp    c0104a45 <_i386MmGetFreeMemory+0x5f>
c0104b75:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104b78:	66 81 38 01 e8       	cmpw   $0xe801,(%eax)
c0104b7d:	75 5f                	jne    c0104bde <_i386MmGetFreeMemory+0x1f8>
c0104b7f:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104b82:	83 c0 02             	add    $0x2,%eax
c0104b85:	89 45 e8             	mov    %eax,0xffffffe8(%ebp)
c0104b88:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0104b8b:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
c0104b90:	74 20                	je     c0104bb2 <_i386MmGetFreeMemory+0x1cc>
c0104b92:	83 ec 08             	sub    $0x8,%esp
c0104b95:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0104b98:	66 8b 40 04          	mov    0x4(%eax),%ax
c0104b9c:	25 ff ff 00 00       	and    $0xffff,%eax
c0104ba1:	c1 e0 0a             	shl    $0xa,%eax
c0104ba4:	50                   	push   %eax
c0104ba5:	68 00 00 10 00       	push   $0x100000
c0104baa:	e8 e1 fd ff ff       	call   c0104990 <_AddMemToList>
c0104baf:	83 c4 10             	add    $0x10,%esp
c0104bb2:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0104bb5:	66 83 78 06 00       	cmpw   $0x0,0x6(%eax)
c0104bba:	74 57                	je     c0104c13 <_i386MmGetFreeMemory+0x22d>
c0104bbc:	83 ec 08             	sub    $0x8,%esp
c0104bbf:	8b 45 e8             	mov    0xffffffe8(%ebp),%eax
c0104bc2:	66 8b 40 06          	mov    0x6(%eax),%ax
c0104bc6:	25 ff ff 00 00       	and    $0xffff,%eax
c0104bcb:	c1 e0 10             	shl    $0x10,%eax
c0104bce:	50                   	push   %eax
c0104bcf:	68 00 00 00 01       	push   $0x1000000
c0104bd4:	e8 b7 fd ff ff       	call   c0104990 <_AddMemToList>
c0104bd9:	83 c4 10             	add    $0x10,%esp
c0104bdc:	eb 35                	jmp    c0104c13 <_i386MmGetFreeMemory+0x22d>
c0104bde:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104be1:	66 81 38 00 88       	cmpw   $0x8800,(%eax)
c0104be6:	75 22                	jne    c0104c0a <_i386MmGetFreeMemory+0x224>
c0104be8:	83 ec 08             	sub    $0x8,%esp
c0104beb:	8b 45 ec             	mov    0xffffffec(%ebp),%eax
c0104bee:	66 8b 40 02          	mov    0x2(%eax),%ax
c0104bf2:	25 ff ff 00 00       	and    $0xffff,%eax
c0104bf7:	c1 e0 0a             	shl    $0xa,%eax
c0104bfa:	50                   	push   %eax
c0104bfb:	68 00 00 10 00       	push   $0x100000
c0104c00:	e8 8b fd ff ff       	call   c0104990 <_AddMemToList>
c0104c05:	83 c4 10             	add    $0x10,%esp
c0104c08:	eb 09                	jmp    c0104c13 <_i386MmGetFreeMemory+0x22d>
c0104c0a:	c7 45 e4 00 00 00 00 	movl   $0x0,0xffffffe4(%ebp)
c0104c11:	eb 17                	jmp    c0104c2a <_i386MmGetFreeMemory+0x244>
c0104c13:	83 ec 08             	sub    $0x8,%esp
c0104c16:	6a 00                	push   $0x0
c0104c18:	6a 00                	push   $0x0
c0104c1a:	e8 71 fd ff ff       	call   c0104990 <_AddMemToList>
c0104c1f:	83 c4 10             	add    $0x10,%esp
c0104c22:	a1 70 79 10 c0       	mov    0xc0107970,%eax
c0104c27:	89 45 e4             	mov    %eax,0xffffffe4(%ebp)
c0104c2a:	8b 45 e4             	mov    0xffffffe4(%ebp),%eax
c0104c2d:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
c0104c30:	5b                   	pop    %ebx
c0104c31:	5e                   	pop    %esi
c0104c32:	5f                   	pop    %edi
c0104c33:	5d                   	pop    %ebp
c0104c34:	c3                   	ret    

c0104c35 <_i386MmGetFreeMemoryList>:
c0104c35:	55                   	push   %ebp
c0104c36:	89 e5                	mov    %esp,%ebp
c0104c38:	a1 10 51 10 c0       	mov    0xc0105110,%eax
c0104c3d:	5d                   	pop    %ebp
c0104c3e:	c3                   	ret    

c0104c3f <_i386MmGetPageDirSize>:
c0104c3f:	55                   	push   %ebp
c0104c40:	89 e5                	mov    %esp,%ebp
c0104c42:	a1 10 79 10 c0       	mov    0xc0107910,%eax
c0104c47:	5d                   	pop    %ebp
c0104c48:	c3                   	ret    

c0104c49 <_i386SetPte>:
c0104c49:	55                   	push   %ebp
c0104c4a:	89 e5                	mov    %esp,%ebp
c0104c4c:	57                   	push   %edi
c0104c4d:	56                   	push   %esi
c0104c4e:	53                   	push   %ebx
c0104c4f:	83 ec 0c             	sub    $0xc,%esp
c0104c52:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c55:	8b 55 14             	mov    0x14(%ebp),%edx
c0104c58:	8b 4d 18             	mov    0x18(%ebp),%ecx
c0104c5b:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
c0104c5e:	8b 75 20             	mov    0x20(%ebp),%esi
c0104c61:	8b 7d 24             	mov    0x24(%ebp),%edi
c0104c64:	88 45 f3             	mov    %al,0xfffffff3(%ebp)
c0104c67:	88 55 f2             	mov    %dl,0xfffffff2(%ebp)
c0104c6a:	88 4d f1             	mov    %cl,0xfffffff1(%ebp)
c0104c6d:	88 5d f0             	mov    %bl,0xfffffff0(%ebp)
c0104c70:	89 f0                	mov    %esi,%eax
c0104c72:	88 45 ef             	mov    %al,0xffffffef(%ebp)
c0104c75:	89 f8                	mov    %edi,%eax
c0104c77:	88 45 ee             	mov    %al,0xffffffee(%ebp)
c0104c7a:	83 ec 08             	sub    $0x8,%esp
c0104c7d:	6a 04                	push   $0x4
c0104c7f:	ff 75 08             	pushl  0x8(%ebp)
c0104c82:	e8 5f ce ff ff       	call   c0101ae6 <_ZeroMemory>
c0104c87:	83 c4 10             	add    $0x10,%esp
c0104c8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104c8d:	8b 01                	mov    (%ecx),%eax
c0104c8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104c92:	c1 e2 0c             	shl    $0xc,%edx
c0104c95:	25 ff 0f 00 00       	and    $0xfff,%eax
c0104c9a:	09 d0                	or     %edx,%eax
c0104c9c:	89 01                	mov    %eax,(%ecx)
c0104c9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104ca1:	ba 00 00 00 00       	mov    $0x0,%edx
c0104ca6:	8a 55 f3             	mov    0xfffffff3(%ebp),%dl
c0104ca9:	8b 01                	mov    (%ecx),%eax
c0104cab:	83 e2 01             	and    $0x1,%edx
c0104cae:	c1 e2 02             	shl    $0x2,%edx
c0104cb1:	83 e0 fb             	and    $0xfffffffb,%eax
c0104cb4:	09 d0                	or     %edx,%eax
c0104cb6:	89 01                	mov    %eax,(%ecx)
c0104cb8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104cbb:	ba 00 00 00 00       	mov    $0x0,%edx
c0104cc0:	8a 55 f2             	mov    0xfffffff2(%ebp),%dl
c0104cc3:	8b 01                	mov    (%ecx),%eax
c0104cc5:	83 e2 01             	and    $0x1,%edx
c0104cc8:	83 e0 fe             	and    $0xfffffffe,%eax
c0104ccb:	09 d0                	or     %edx,%eax
c0104ccd:	89 01                	mov    %eax,(%ecx)
c0104ccf:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104cd2:	ba 00 00 00 00       	mov    $0x0,%edx
c0104cd7:	8a 55 f1             	mov    0xfffffff1(%ebp),%dl
c0104cda:	8b 01                	mov    (%ecx),%eax
c0104cdc:	83 e2 01             	and    $0x1,%edx
c0104cdf:	01 d2                	add    %edx,%edx
c0104ce1:	83 e0 fd             	and    $0xfffffffd,%eax
c0104ce4:	09 d0                	or     %edx,%eax
c0104ce6:	89 01                	mov    %eax,(%ecx)
c0104ce8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104ceb:	ba 00 00 00 00       	mov    $0x0,%edx
c0104cf0:	8a 55 f0             	mov    0xfffffff0(%ebp),%dl
c0104cf3:	8b 01                	mov    (%ecx),%eax
c0104cf5:	83 e2 01             	and    $0x1,%edx
c0104cf8:	c1 e2 04             	shl    $0x4,%edx
c0104cfb:	83 e0 ef             	and    $0xffffffef,%eax
c0104cfe:	09 d0                	or     %edx,%eax
c0104d00:	89 01                	mov    %eax,(%ecx)
c0104d02:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104d05:	ba 00 00 00 00       	mov    $0x0,%edx
c0104d0a:	8a 55 ef             	mov    0xffffffef(%ebp),%dl
c0104d0d:	8b 01                	mov    (%ecx),%eax
c0104d0f:	83 e2 01             	and    $0x1,%edx
c0104d12:	c1 e2 07             	shl    $0x7,%edx
c0104d15:	25 7f ff ff ff       	and    $0xffffff7f,%eax
c0104d1a:	09 d0                	or     %edx,%eax
c0104d1c:	89 01                	mov    %eax,(%ecx)
c0104d1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0104d21:	ba 00 00 00 00       	mov    $0x0,%edx
c0104d26:	8a 55 ee             	mov    0xffffffee(%ebp),%dl
c0104d29:	8b 01                	mov    (%ecx),%eax
c0104d2b:	83 e2 01             	and    $0x1,%edx
c0104d2e:	c1 e2 08             	shl    $0x8,%edx
c0104d31:	25 ff fe ff ff       	and    $0xfffffeff,%eax
c0104d36:	09 d0                	or     %edx,%eax
c0104d38:	89 01                	mov    %eax,(%ecx)
c0104d3a:	8d 65 f4             	lea    0xfffffff4(%ebp),%esp
c0104d3d:	5b                   	pop    %ebx
c0104d3e:	5e                   	pop    %esi
c0104d3f:	5f                   	pop    %edi
c0104d40:	5d                   	pop    %ebp
c0104d41:	c3                   	ret    

c0104d42 <_i386InvalidatePage>:
c0104d42:	55                   	push   %ebp
c0104d43:	89 e5                	mov    %esp,%ebp
c0104d45:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d48:	0f 01 38             	invlpg (%eax)
c0104d4b:	5d                   	pop    %ebp
c0104d4c:	c3                   	ret    
c0104d4d:	90                   	nop    
c0104d4e:	90                   	nop    
c0104d4f:	90                   	nop    

c0104d50 <__CTOR_LIST__>:
c0104d50:	ff                   	(bad)  
c0104d51:	ff                   	(bad)  
c0104d52:	ff                   	(bad)  
c0104d53:	ff 00                	incl   (%eax)
c0104d55:	00 00                	add    %al,(%eax)
	...

c0104d58 <__DTOR_LIST__>:
c0104d58:	ff                   	(bad)  
c0104d59:	ff                   	(bad)  
c0104d5a:	ff                   	(bad)  
c0104d5b:	ff 00                	incl   (%eax)
c0104d5d:	00 00                	add    %al,(%eax)
	...
