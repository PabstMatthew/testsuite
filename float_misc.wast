;; Platforms intended to run WebAssembly must support IEEE 754 arithmetic.
;; This testsuite is not currently sufficient for full IEEE 754 conformance
;; testing; platforms are currently expected to meet these requirements in
;; their own way (widely-used hardware platforms already do this).
;;
;; What this testsuite does test is that (a) the platform is basically IEEE 754
;; rather than something else entirely, (b) it's configured correctly for
;; WebAssembly (rounding direction, exception masks, precision level, subnormal
;; mode, etc.), (c) the WebAssembly implementation doesn't perform any common
;; value-changing optimizations, and (d) that the WebAssembly implementation
;; doesn't exhibit any known implementation bugs.
;;
;; This file supplements f32.wast, f64.wast, f32_bitwise.wast, f64_bitwise.wast,
;; f32_cmp.wast, and f64_cmp.wast with additional single-instruction tests
;; covering additional miscellaneous interesting cases.

(module
  (func (export "f32.add") (param $x f32) (param $y f32) (result f32) (f32.add (local.get $x) (local.get $y)))
  (func (export "f32.sub") (param $x f32) (param $y f32) (result f32) (f32.sub (local.get $x) (local.get $y)))
  (func (export "f32.mul") (param $x f32) (param $y f32) (result f32) (f32.mul (local.get $x) (local.get $y)))
  (func (export "f32.div") (param $x f32) (param $y f32) (result f32) (f32.div (local.get $x) (local.get $y)))
  (func (export "f32.sqrt") (param $x f32) (result f32) (f32.sqrt (local.get $x)))
  (func (export "f32.abs") (param $x f32) (result f32) (f32.abs (local.get $x)))
  (func (export "f32.neg") (param $x f32) (result f32) (f32.neg (local.get $x)))
  (func (export "f32.copysign") (param $x f32) (param $y f32) (result f32) (f32.copysign (local.get $x) (local.get $y)))
  (func (export "f32.ceil") (param $x f32) (result f32) (f32.ceil (local.get $x)))
  (func (export "f32.floor") (param $x f32) (result f32) (f32.floor (local.get $x)))
  (func (export "f32.trunc") (param $x f32) (result f32) (f32.trunc (local.get $x)))
  (func (export "f32.nearest") (param $x f32) (result f32) (f32.nearest (local.get $x)))
  (func (export "f32.min") (param $x f32) (param $y f32) (result f32) (f32.min (local.get $x) (local.get $y)))
  (func (export "f32.max") (param $x f32) (param $y f32) (result f32) (f32.max (local.get $x) (local.get $y)))

  (func (export "f64.add") (param $x f64) (param $y f64) (result f64) (f64.add (local.get $x) (local.get $y)))
  (func (export "f64.sub") (param $x f64) (param $y f64) (result f64) (f64.sub (local.get $x) (local.get $y)))
  (func (export "f64.mul") (param $x f64) (param $y f64) (result f64) (f64.mul (local.get $x) (local.get $y)))
  (func (export "f64.div") (param $x f64) (param $y f64) (result f64) (f64.div (local.get $x) (local.get $y)))
  (func (export "f64.sqrt") (param $x f64) (result f64) (f64.sqrt (local.get $x)))
  (func (export "f64.abs") (param $x f64) (result f64) (f64.abs (local.get $x)))
  (func (export "f64.neg") (param $x f64) (result f64) (f64.neg (local.get $x)))
  (func (export "f64.copysign") (param $x f64) (param $y f64) (result f64) (f64.copysign (local.get $x) (local.get $y)))
  (func (export "f64.ceil") (param $x f64) (result f64) (f64.ceil (local.get $x)))
  (func (export "f64.floor") (param $x f64) (result f64) (f64.floor (local.get $x)))
  (func (export "f64.trunc") (param $x f64) (result f64) (f64.trunc (local.get $x)))
  (func (export "f64.nearest") (param $x f64) (result f64) (f64.nearest (local.get $x)))
  (func (export "f64.min") (param $x f64) (param $y f64) (result f64) (f64.min (local.get $x) (local.get $y)))
  (func (export "f64.max") (param $x f64) (param $y f64) (result f64) (f64.max (local.get $x) (local.get $y)))
)

