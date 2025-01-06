# Collatz-Sequence-Calculator

```markdown
# Optimized MIPS Collatz Sequence Generator

## Overview
MIPS assembly implementation of the Collatz sequence calculator that processes positive integers according to:
- Even numbers: n/2
- Odd numbers: 3n+1

## Features
- Input range: 1-999
- Complete sequence calculation
- Length computation
- Memory-efficient buffer
- Input validation

## Usage
1. Load into MIPS simulator
2. Default test value: 21 (modify in .data)
3. View:
   - Input value
   - Sequence length
   - Complete sequence

## Technical Details

### Memory Layout
```
.data
  Messages     # Output strings
  Buffer       # 4000-byte aligned
  Test input   # .word format
```

### Registers
- `$s0`: Current number
- `$s1`: Buffer pointer
- `$s2`: Length counter
- `$t0-$t2`: Calculations

### Error Handling
- Valid range check: 1-999
- Returns 0 for invalid input
- Stack management for reliability

## Example
```
Input: 21
Length: 8
Sequence: 21 64 32 16 8 4 2 1
```

## Optimizations
- Input validation
- Efficient memory usage
- Structured register allocation

## Notes
For educational use. Modify test input in .data segment.
```
