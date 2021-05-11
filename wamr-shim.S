  .text
  .globl main, aot_invoke_native, aot_set_exception_with_id, aot_call_indirect, wasm_runtime_enlarge_memory
main:
  # exit(0)
  mov $60, %rax
  xor %rdi, %rdi
  syscall

aot_invoke_native:
  ret

aot_set_exception_with_id:
  ret

aot_call_indirect:
  ret

wasm_runtime_enlarge_memory:
  ret
