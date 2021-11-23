set verbose off

break *0x401017
commands 1
  set $rdx=$rsi
  set $rsi=0x402000
  set $rdi=0x1
  continue
end
run 2
quit
