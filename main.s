	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	returnNewRocket
	.type	returnNewRocket, @function
returnNewRocket:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	.cfi_offset 3, -24
	mov	QWORD PTR -72[rbp], rdi
	movsd	QWORD PTR -80[rbp], xmm0
	movsd	QWORD PTR -88[rbp], xmm1
	movsd	QWORD PTR -96[rbp], xmm2
	movsd	xmm0, QWORD PTR -80[rbp]
	movsd	QWORD PTR -64[rbp], xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -40[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR -88[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -72[rbp]
	mov	rcx, QWORD PTR -64[rbp]
	mov	rbx, QWORD PTR -56[rbp]
	mov	QWORD PTR [rax], rcx
	mov	QWORD PTR 8[rax], rbx
	mov	rcx, QWORD PTR -48[rbp]
	mov	rbx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rcx
	mov	QWORD PTR 24[rax], rbx
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rax], rdx
	mov	rax, QWORD PTR -72[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	returnNewRocket, .-returnNewRocket
	.globl	returnPIDController
	.type	returnPIDController, @function
returnPIDController:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -40[rbp], rdi
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	QWORD PTR -56[rbp], xmm1
	movsd	QWORD PTR -64[rbp], xmm2
	movsd	xmm0, QWORD PTR -48[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -64[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rcx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rcx], rax
	mov	rax, QWORD PTR -40[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	returnPIDController, .-returnPIDController
	.section	.rodata
.LC2:
	.string	"P: %f, D: %f, I: %f.\n"
	.text
	.globl	calculateCS
	.type	calculateCS, @function
calculateCS:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	mov	QWORD PTR -40[rbp], rdi
	movsd	QWORD PTR -48[rbp], xmm2
	movsd	QWORD PTR -56[rbp], xmm3
	mov	DWORD PTR -60[rbp], esi
	mov	rax, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm0, QWORD PTR 16[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm2, QWORD PTR 32[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -32[rbp]
	mulsd	xmm0, xmm2
	divsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm1, xmm0
	mov	rax, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR [rax]
	movapd	xmm2, xmm0
	mulsd	xmm2, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR 24[rbp]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR -56[rbp]
	jbe	.L6
	movsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
.L6:
	cmp	DWORD PTR -60[rbp], 0
	jne	.L8
	mov	rax, QWORD PTR -40[rbp]
	movsd	xmm0, QWORD PTR [rax]
	movapd	xmm1, xmm0
	mulsd	xmm1, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR 24[rbp]
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm0
	movsd	xmm1, QWORD PTR 32[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -32[rbp]
	mulsd	xmm0, xmm1
	movapd	xmm1, xmm0
	divsd	xmm1, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR 16[rbp]
	mulsd	xmm0, QWORD PTR -24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 3
	call	printf@PLT
.L8:
	movsd	xmm0, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	calculateCS, .-calculateCS
	.section	.rodata
	.align 8
.LC9:
	.string	"Rocket acceleration: %f, rocket velocity: %f."
	.align 8
.LC10:
	.string	"Time: %f, rocket position: %f, position error: %f, control: %f.\n\n"
	.text
	.globl	performSimulation
	.type	performSimulation, @function
performSimulation:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 160
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	QWORD PTR -144[rbp], xmm1
	movsd	QWORD PTR -152[rbp], xmm2
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	pxor	xmm0, xmm0
	movsd	QWORD PTR -104[rbp], xmm0
	mov	DWORD PTR -116[rbp], 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -96[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -88[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -112[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -80[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -48[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -40[rbp], xmm0
	lea	rax, -32[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	rdx, QWORD PTR .LC4[rip]
	movapd	xmm2, xmm0
	pxor	xmm1, xmm1
	movq	xmm0, rdx
	mov	rdi, rax
	call	returnPIDController
	movsd	xmm0, QWORD PTR 48[rbp]
	movsd	QWORD PTR -88[rbp], xmm0
	jmp	.L12
.L21:
	movsd	xmm0, QWORD PTR -96[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC5[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, QWORD PTR -96[rbp]
	jbe	.L13
	movsd	xmm0, QWORD PTR -64[rbp]
	movq	xmm1, QWORD PTR .LC6[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -64[rbp], xmm0
.L13:
	movsd	xmm0, QWORD PTR -64[rbp]
	comisd	xmm0, QWORD PTR -72[rbp]
	jb	.L15
	movsd	xmm0, QWORD PTR -72[rbp]
	movsd	QWORD PTR -64[rbp], xmm0
.L15:
	movsd	xmm0, QWORD PTR -72[rbp]
	subsd	xmm0, QWORD PTR -64[rbp]
	movsd	xmm1, QWORD PTR 40[rbp]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR 72[rbp], xmm0
	movsd	xmm0, QWORD PTR 72[rbp]
	mulsd	xmm0, QWORD PTR -144[rbp]
	addsd	xmm0, QWORD PTR -96[rbp]
	movsd	QWORD PTR 64[rbp], xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	mulsd	xmm0, QWORD PTR -144[rbp]
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 72[rbp]
	mulsd	xmm0, QWORD PTR -144[rbp]
	mulsd	xmm0, QWORD PTR -144[rbp]
	movsd	xmm2, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR 48[rbp], xmm0
	movsd	xmm2, QWORD PTR 56[rbp]
	movsd	xmm1, QWORD PTR 48[rbp]
	movsd	xmm0, QWORD PTR -152[rbp]
	subsd	xmm0, xmm1
	movq	r8, xmm0
	mov	esi, DWORD PTR -116[rbp]
	movsd	xmm1, QWORD PTR -144[rbp]
	lea	rdi, -112[rbp]
	movsd	xmm0, QWORD PTR -80[rbp]
	sub	rsp, 8
	sub	rsp, 24
	mov	rcx, rsp
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR 24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR 16[rcx], rax
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, r8
	call	calculateCS
	add	rsp, 32
	movq	rax, xmm0
	mov	QWORD PTR -72[rbp], rax
	movsd	xmm1, QWORD PTR 48[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jb	.L17
	pxor	xmm0, xmm0
	movsd	QWORD PTR 48[rbp], xmm0
	movsd	xmm1, QWORD PTR 64[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L17
	pxor	xmm0, xmm0
	movsd	QWORD PTR 64[rbp], xmm0
.L17:
	movsd	xmm1, QWORD PTR -144[rbp]
	movsd	xmm0, QWORD PTR .LC8[rip]
	mulsd	xmm0, xmm1
	cvttsd2si	rax, xmm0
	mov	edi, eax
	call	usleep@PLT
	add	DWORD PTR -116[rbp], 1
	cmp	DWORD PTR -116[rbp], 100
	jne	.L20
	mov	DWORD PTR -116[rbp], 0
	movsd	xmm0, QWORD PTR 64[rbp]
	mov	rax, QWORD PTR 72[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	movsd	xmm1, QWORD PTR 48[rbp]
	movsd	xmm0, QWORD PTR -152[rbp]
	movapd	xmm2, xmm0
	subsd	xmm2, xmm1
	movsd	xmm0, QWORD PTR 48[rbp]
	movsd	xmm1, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -104[rbp]
	movapd	xmm3, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 4
	call	printf@PLT
.L20:
	movsd	xmm0, QWORD PTR -104[rbp]
	addsd	xmm0, QWORD PTR -144[rbp]
	movsd	QWORD PTR -104[rbp], xmm0
	movsd	xmm0, QWORD PTR 48[rbp]
	movsd	QWORD PTR -88[rbp], xmm0
	movsd	xmm0, QWORD PTR 64[rbp]
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm0, QWORD PTR 72[rbp]
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC11[rip]
	subsd	xmm0, QWORD PTR -72[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm1, QWORD PTR 48[rbp]
	movsd	xmm0, QWORD PTR -152[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -80[rbp], xmm0
.L12:
	movsd	xmm0, QWORD PTR -136[rbp]
	comisd	xmm0, QWORD PTR -104[rbp]
	jnb	.L21
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	performSimulation, .-performSimulation
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 120
	.cfi_offset 3, -24
	mov	QWORD PTR -120[rbp], rdi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	lea	rax, -64[rbp]
	movsd	xmm1, QWORD PTR .LC12[rip]
	movsd	xmm0, QWORD PTR .LC11[rip]
	mov	rdx, QWORD PTR .LC3[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	mov	rdi, rax
	call	returnNewRocket
	lea	rax, -96[rbp]
	movsd	xmm1, QWORD PTR .LC13[rip]
	movsd	xmm0, QWORD PTR .LC14[rip]
	mov	rdx, QWORD PTR .LC5[rip]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	mov	rdi, rax
	call	returnPIDController
	movsd	xmm0, QWORD PTR .LC15[rip]
	movsd	QWORD PTR -112[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC16[rip]
	movsd	QWORD PTR -104[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	mov	rsi, QWORD PTR -112[rbp]
	sub	rsp, 40
	mov	rax, rsp
	mov	rcx, QWORD PTR -64[rbp]
	mov	rbx, QWORD PTR -56[rbp]
	mov	QWORD PTR [rax], rcx
	mov	QWORD PTR 8[rax], rbx
	mov	rcx, QWORD PTR -48[rbp]
	mov	rbx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rcx
	mov	QWORD PTR 24[rax], rbx
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 32[rax], rdx
	sub	rsp, 24
	mov	rcx, rsp
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -88[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR -80[rbp]
	mov	QWORD PTR 16[rcx], rax
	pxor	xmm2, xmm2
	movapd	xmm1, xmm0
	movq	xmm0, rsi
	call	performSimulation
	add	rsp, 64
	mov	eax, 0
	mov	rdx, QWORD PTR -24[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	1374389535
	.long	1076076216
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC5:
	.long	1202590843
	.long	1065646817
	.align 16
.LC6:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC7:
	.long	0
	.long	1073741824
	.align 8
.LC8:
	.long	0
	.long	1093567616
	.align 8
.LC11:
	.long	0
	.long	1077149696
	.align 8
.LC12:
	.long	0
	.long	1082081280
	.align 8
.LC13:
	.long	0
	.long	1070596096
	.align 8
.LC14:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC15:
	.long	0
	.long	1080623104
	.align 8
.LC16:
	.long	-755914244
	.long	1062232653
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
