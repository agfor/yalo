;;;; -*- Mode: Lisp -*-
;;;; Author: 
;;;;     Yujian Zhang <yujian.zhang@gmail.com>
;;;; Description:
;;;;     Regression tests. Cross checked with NASM.
;;;; License: 
;;;;     GNU General Public License v2
;;;;     http://www.gnu.org/licenses/gpl-2.0.html

(in-package :cc)

(defparameter *arith-asm*
  '((bits    16)
    (org     #x7c00)

    (add     al 8)
    (add     ax 1000)
    (add     bl 3)
    (add     byte (msg) 4)
    (add     bx 1234)
    (add     (msg) 5678)
    (add     cx 9)
    (add     word (msg) 12)
    (add     al bl)
    (add     (msg) ch)
    (add     cx bx)
    (add     (msg) dx)
    (add     ch (msg))
    (add     dx (msg))
    (and     al 8)
    (and     ax 1000)
    (and     bl 3)
    (and     byte (msg) 4)
    (and     bx 1234)
    (and     (msg) 5678)
    (and     cx 9)
    (and     word (msg) 12)
    (and     al bl)
    (and     (msg) ch)
    (and     cx bx)
    (and     (msg) dx)
    (and     ch (msg))
    (and     dx (msg))w
    (cmp     al 8)
    (cmp     ax 1000)
    (cmp     bl 3)
    (cmp     byte (msg) 4)
    (cmp     bx 1234)
    (cmp     (msg) 5678)
    (cmp     cx 9)
    (cmp     word (msg) 12)
    (cmp     al bl)
    (cmp     (msg) ch)
    (cmp     cx bx)
    (cmp     (msg) dx)
    (cmp     ch (msg))
    (cmp     dx (msg))
    (div     ch)
    (div     byte (msg))
    (div     di)
    (div     word (bp si 3))
    (mul     ch)
    (mul     byte (msg))
    (mul     di)
    (mul     word (bp si 3))
    (neg     al)
    (neg     byte (bx 3))
    (neg     bx)
    (neg     word (bp si 4))
    (not     al)
    (not     byte (bx 3))
    (not     bx)
    (not     word (bp si 4))
    (or      al 8)
    (or      ax 1000)
    (or      bl 3)
    (or      byte (msg) 4)
    (or      bx 1234)
    (or      (msg) 5678)
    (or      cx 9)
    (or      word (msg) 12)
    (or      al bl)
    (or      (msg) ch)
    (or      cx bx)
    (or      (msg) dx)
    (or      ch (msg))
    (or      dx (msg))
    (shl     dh 1)
    (shl     byte (msg) 1)
    (shl     dh cl)
    (shl     byte (msg) cl)
    (shl     dh 5)
    (shl     byte (msg) 5)
    (shl     dx 1)
    (shl     word (msg) 1)
    (shl     dx cl)
    (shl     word (msg) cl)
    (shl     dx 5)
    (shl     word (msg) 5)
    (shr     dh 1)
    (shr     byte (msg) 1)
    (shr     dh cl)
    (shr     byte (msg) cl)
    (shr     dh 5)
    (shr     byte (msg) 5)
    (shr     dx 1)
    (shr     word (msg) 1)
    (shr     dx cl)
    (shr     word (msg) cl)
    (shr     dx 5)
    (shr     word (msg) 5)
    (sub     al 8)
    (sub     ax 1000)
    (sub     bl 3)
    (sub     byte (msg) 4)
    (sub     bx 1234)
    (sub     (msg) 5678)
    (sub     cx 9)
    (sub     word (msg) 12)
    (sub     al bl)
    (sub     (msg) ch)
    (sub     cx bx)
    (sub     (msg) dx)
    (sub     ch (msg))
    (sub     dx (msg))
    (test    al 8)
    (test    ax 1000)
    (test    bl 3)
    (test    byte (msg) 4)
    (test    bx 1234)
    (test    (msg) 5678)
    (test    al bl)
    (test    (msg) ch)
    (test    cx bx)
    (test    (msg) dx)
    (xor      al 8)
    (xor      ax 1000)
    (xor      bl 3)
    (xor      byte (msg) 4)
    (xor      bx 1234)
    (xor      (msg) 5678)
    (xor      cx 9)
    (xor      word (msg) 12)
    (xor      al bl)
    (xor      (msg) ch)
    (xor      cx bx)
    (xor      (msg) dx)
    (xor      ch (msg))
    (xor      dx (msg))

    (bits 32)
    (add      ax 1000)
    
    (db      msg "Hello World! ")
    endmsg)
  "Arithmetic instructions are tested separately.")

(defparameter *arith-code*
  '(4 8 5 232 3 128 195 3 128 6 211 125 4 129 195 210 4 129 6 211 125
    46 22 131 193 9 131 6 211 125 12 0 216 0 46 211 125 1 217 1 22 211
    125 2 46 211 125 3 22 211 125 36 8 37 232 3 128 227 3 128 38 211
    125 4 129 227 210 4 129 38 211 125 46 22 131 225 9 131 38 211 125
    12 32 216 32 46 211 125 33 217 33 22 211 125 34 46 211 125 35 22
    211 125 60 8 61 232 3 128 251 3 128 62 211 125 4 129 251 210 4 129
    62 211 125 46 22 131 249 9 131 62 211 125 12 56 216 56 46 211 125
    57 217 57 22 211 125 58 46 211 125 59 22 211 125 246 245 246 54
    211 125 247 247 247 114 3 246 229 246 38 211 125 247 231 247 98 3
    246 216 246 95 3 247 219 247 90 4 246 208 246 87 3 247 211 247 82
    4 12 8 13 232 3 128 203 3 128 14 211 125 4 129 203 210 4 129 14
    211 125 46 22 131 201 9 131 14 211 125 12 8 216 8 46 211 125 9 217
    9 22 211 125 10 46 211 125 11 22 211 125 208 230 208 38 211 125
    210 230 210 38 211 125 192 230 5 192 38 211 125 5 209 226 209 38
    211 125 211 226 211 38 211 125 193 226 5 193 38 211 125 5 208 238
    208 46 211 125 210 238 210 46 211 125 192 238 5 192 46 211 125 5
    209 234 209 46 211 125 211 234 211 46 211 125 193 234 5 193 46 211
    125 5 44 8 45 232 3 128 235 3 128 46 211 125 4 129 235 210 4 129
    46 211 125 46 22 131 233 9 131 46 211 125 12 40 216 40 46 211 125
    41 217 41 22 211 125 42 46 211 125 43 22 211 125 168 8 169 232 3
    246 195 3 246 6 211 125 4 247 195 210 4 247 6 211 125 46 22 132
    216 132 46 211 125 133 217 133 22 211 125 52 8 53 232 3 128 243 3
    128 54 211 125 4 129 243 210 4 129 54 211 125 46 22 131 241 9 131
    54 211 125 12 48 216 48 46 211 125 49 217 49 22 211 125 50 46 211
    125 51 22 211 125 102 5 232 3 72 101 108 108 111 32 87 111 114 108
    100 33 32))

(defparameter *misc-asm*
  '((bits    16)
    (org     #x7c00)

    start

    (call    msg)
    (clc)
    (cld)
    (cli)

    (hlt)
    (in      al 3)
    (in      ax 4)
    (in      al dx)
    (in      ax dx)
    (int     3)
    (int     #x10)
    .loop
    (jmp     short .loop)
    (lgdt    (msg))
    (lidt    (msg))
    (lldt    dx)
    (lldt    (msg))
    (lodsb)
    (lodsw)
    (loop    .loop)
    (mov     ah 9)
    (mov     bx (- endmsg msg))
    (mov     ax cx)
    (mov     (msg) bx)
    (mov     cx  (#x1c7b))
    (mov     word (msg) 123)
    (mov     es bx)
    (mov     ax cs)

    (nop)
    (out     3 al)
    (out     4 ax)
    (out     dx al)
    (out     dx ax)
    (push    cx)
    (push    cs)
    (push    ss)
    (push    ds)
    (push    es)
    (pop     dx)
    (pop     ss)
    (pop     ds)
    (pop     es)
    (rep     movsb)
    (rep     movsw)
    (rep     movsd)
    (ret)
    (stc)
    (std)
    (sti)
    (stosb)
    (stosw)

    (equ     hi 4)
    (dw      meta-msg msg)
    (db      msg "Hello World! ")
    endmsg
    (times   3 db 0)
    (dw      #xaa55) 
    (dd      (123456 7891011))
    (dq      3372036854775808))
  "Miscellaneous instructions.")

(defparameter *misc-code* 
  '(232 93 0 248 252 250 244 228 3 229 4 236 237 204 205 16 235 254 15
    1 22 96 124 15 1 30 96 124 15 0 210 15 0 22 96 124 172 173 226 232
    180 9 187 13 0 137 200 137 30 96 124 139 14 123 28 199 6 96 124
    123 0 142 195 140 200 144 230 3 231 4 238 239 81 14 22 30 6 90 23
    31 7 243 164 243 165 243 102 165 195 249 253 251 170 171 96 124 72
    101 108 108 111 32 87 111 114 108 100 33 32 0 0 0 85 170 64 226 1
    0 67 104 120 0 0 0 230 130 217 250 11 0))

(defparameter *address-asm*
  '((org     #x7c00)

    (bits    16)
    (mov     (bp) es)
    (mov     (bx si) ds)
    (mov     (bx di) es)
    (mov     (bp si) ds)
    (mov     (bp di) ss)
    (mov     (si) ds)
    (mov     (di) cs)
    (mov     (32330) ds)
    (mov     (msg) ds)
    (mov     (bx) cs)
    (mov     (bx si 1) ds)
    (mov     (bx di 2) es)
    (mov     (bp si 3) ds)
    (mov     (bp di 4) ss)
    (mov     (si 5) ds)
    (mov     (di 6) cs)
    (mov     (bp 7) ds)
    (mov     (bx 8) cs)
    (mov     ds (di))
    (mov     ds (bx si 1001))
    (mov     es (bx di 1002))
    (mov     ds (bp si 1003))
    (mov     ss (bp di 1004))
    (mov     ds (si 1005))
    (mov     es (di 1006))
    (mov     ds (bp 1007))
    (mov     es (bx 1008))

    (bits    32)
    (mov     (ebp) ebx)
    (mov     (esp) ecx)
    (mov     (123456) edx)
    (mov     (eax) edx)
    (mov     (ebp 36) ecx)
    (mov     (edi 1234) edx)
    (mov     (esi 123456) ecx)
    (mov     (esp #x23) ebx)
    (mov     (esp #x12345678) ecx)
    (mov     (eax ebx) ecx)
    (mov     (esi edi) edx)
    ; (mov     (esi ebp) edx) 
    ;(mov     (eax*2 3456) edx)
    (mov     (eax*2 esi) edx)
    ;(mov     (esi*2 ebp 123) 
    ;(mov     (ecx*4 ebp 123) 
    ;(mov     (edx*8 ebp 123456) ebx)

    (db      msg "Hello World! ")
    endmsg)
  "Test addressing modes.")

(defparameter *address-code* 
  '(140 70 0 140 24 140 1 140 26 140 19 140 28 140 13 140 30 74 126
    140 30 132 124 140 15 140 88 1 140 65 2 140 90 3 140 83 4 140 92 5
    140 77 6 140 94 7 140 79 8 142 29 142 152 233 3 142 129 234 3 142
    154 235 3 142 147 236 3 142 156 237 3 142 133 238 3 142 158 239 3
    142 135 240 3 137 93 0 137 12 36 137 21 64 226 1 0 137 16 137 77
    36 137 151 210 4 0 0 137 142 64 226 1 0 137 92 36 35 137 140 36
    120 86 52 18 137 12 24 137 20 62 137 20 70 72 101 108 108 111 32
    87 111 114 108 100 33 32))

(deftest test-cc ()
  (check 
    (equal 
     (asm *bootloader*)
     '(180 3 205 16 184 1 19 187 15 0 185 15 0 189 20 124 205 16 235
       254 72 101 108 108 111 32 87 111 114 108 100 33 32 13 10 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 85 170))
    (equal (asm *address-asm*) *address-code*)
    (equal (asm *arith-asm*) *arith-code*)
    (equal (asm *misc-asm*)  *misc-code*)))




