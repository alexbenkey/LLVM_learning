; Simple LLVM IR example demonstrating basic arithmetic operations
; This can be used as input for various lit tests

define i32 @multiply(i32 %a, i32 %b) {
entry:
  %result = mul i32 %a, %b
  ret i32 %result
}

define i32 @divide(i32 %a, i32 %b) {
entry:
  %result = sdiv i32 %a, %b
  ret i32 %result
}

define i32 @calculate(i32 %x) {
entry:
  %doubled = call i32 @multiply(i32 %x, i32 2)
  %result = call i32 @divide(i32 %doubled, i32 4)
  ret i32 %result
}