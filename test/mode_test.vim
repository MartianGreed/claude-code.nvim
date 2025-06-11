" Test for mode configuration
set rtp+=.
set nocompatible

" Test 1: Default mode (window)
lua << EOF
local claude_code = require('claude-code')
claude_code.setup({})
local config = claude_code.config
assert(config.mode == 'window', 'Default mode should be window')
print('✓ Default mode is window')
EOF

" Test 2: Buffer mode configuration
lua << EOF
local claude_code = require('claude-code')
claude_code.setup({
  mode = 'buffer'
})
local config = claude_code.config
assert(config.mode == 'buffer', 'Mode should be buffer when configured')
print('✓ Buffer mode configuration works')
EOF

" Test 3: Invalid mode configuration
lua << EOF
local claude_code = require('claude-code')
-- This should fall back to default config due to validation error
claude_code.setup({
  mode = 'invalid'
})
local config = claude_code.config
assert(config.mode == 'window', 'Invalid mode should fall back to default')
print('✓ Invalid mode falls back to default')
EOF

echo "All mode tests passed!"
quit