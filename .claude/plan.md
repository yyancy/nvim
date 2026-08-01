# Neovim Configuration Optimization & Refactoring Plan

## Executive Summary
This plan addresses code organization, performance optimization, and modernization of the Neovim configuration. Key focus areas: eliminating duplication between `vimrc.local` and Lua configs, removing dead code, consolidating keymaps, and improving plugin configurations.

## Current State Analysis

### Issues Identified

1. **Configuration Overlap** (Medium Priority)
   - `vimrc.local` (161 lines) is kept as a template for server vim configurations
   - Some settings overlap with Lua configs (clipboard, indentation, keymaps)
   - **Note**: This is intentional for backward compatibility - not a problem to fix, but to document

2. **Dead/Commented Code** (Medium Priority)
   - Commented-out plugins in `editor.lua` (garymjr/nvim-snippets)
   - Disabled plugins: `yanky.nvim`, `mini.pairs`
   - Large commented sections in `coding.lua` (Tab/S-Tab mappings lines 74-98)
   - Commented telescope fzf extension load (line 192 in editor.lua)
   - Unused mappings commented in `keymaps.lua` (lines 52-54, 132-133)

3. **Code Organization** (Medium Priority)
   - 55+ keymaps in `vimrc.local` that should be in `lua/config/keymaps.lua`
   - Mixed concerns in files (e.g., global functions in `autocmds.lua`)
   - Inconsistent keymap definition style (some use `set`, some use `vim.keymap.set`)

4. **Performance Concerns** (Low-Medium Priority)
   - Some plugins set to `lazy = false` unnecessarily (`vim-textobj-variable-segment`, `vim-visual-multi`, `vim-lion`, `vim-repeat`, `vim-pasta`, `vim-bufsurf`)
   - Autocmd `VimEnter` + `CursorMoved` in yank.lua triggers excessively
   - No startup profiling or optimization

5. **Modernization Opportunities** (Low Priority)
   - Can migrate more Vimscript to Lua
   - Some plugins have better alternatives or can be replaced with built-in features
   - Highlight definitions in `vimrc.local` should use Lua API

6. **Configuration Conflicts**
   - Spell check disabled globally in markdown autocmd but enabled in text group autocmd
   - Textwidth set to 80 globally but 72 for text/markdown filetypes

## Optimization Plan

### Phase 1: Clean Up Dead Code & Consolidate Config (Priority: High)

**Goal**: Remove all dead code, resolve conflicts between vimrc.local and Lua configs

**IMPORTANT NOTE**: `vimrc.local` is kept as a template for server vim configurations and should NOT be deleted or heavily modified.

#### Task 1.1: Resolve Configuration Conflicts
- **Action**: Identify and document where `vimrc.local` and Lua configs overlap
- **Files**: `vimrc.local`, `lua/config/options.lua`, `lua/config/keymaps.lua`
- **Strategy**: 
  - Let Lua configs take precedence in Neovim
  - Keep `vimrc.local` as-is for server vim compatibility
  - Document which settings are overridden
- **Conflicts to document**:
  - `clipboard=unnamedplus` (set in both)
  - Indentation settings (tabstop, shiftwidth, softtabstop)
  - Some keymaps (Emacs-style insert mode, window navigation)

#### Task 1.2: Optional - Create Highlights Module
- **Action**: Optionally extract highlight definitions to separate Lua module
- **Files**: Create new `lua/config/highlights.lua` 
- **Note**: Keep highlights in `vimrc.local` for server compatibility, but can add Lua version for Neovim-specific enhancements
- **Benefits**: Better integration with colorscheme plugins in Neovim

#### Task 1.3: Remove Dead Code
- **Action**: Delete or uncomment decisively
  - Remove commented plugins: `garymjr/nvim-snippets` in `editor.lua:2-4`
  - Remove disabled plugins or document why disabled: `yanky.nvim`, `mini.pairs`
  - Clean up commented Tab/S-Tab mappings in `coding.lua:74-98`
  - Remove commented telescope fzf line or enable it: `editor.lua:192`
  - Remove commented keymaps in `keymaps.lua:52-54, 132-133`
  - Clean up commented VM_maps in `coding.lua:126-128`
- **Files**: `lua/plugins/editor.lua`, `lua/plugins/coding.lua`, `lua/config/keymaps.lua`

### Phase 2: Improve Code Organization (Priority: Medium)

**Goal**: Better separation of concerns, clearer structure

#### Task 2.1: Extract Global Functions
- **Action**: Move `Make_repeatable_keymap` from `autocmds.lua` to `lua/util/keymaps.lua`
- **Files**: `lua/config/autocmds.lua`, create `lua/util/keymaps.lua`
- **Rationale**: Autocmds file should only contain autocmds

#### Task 2.2: Consolidate Filetype Settings
- **Action**: Review and consolidate filetype-specific autocmds
- **Files**: `lua/config/autocmds.lua`, `after/ftplugin/*.lua`
- **Conflicts to resolve**:
  - Markdown spell check: disabled globally but enabled in text group
  - Textwidth: 80 global vs 72 for text files
- **Decision needed**: Where should each filetype config live? (autocmds vs ftplugin)

#### Task 2.3: Standardize Keymap Definitions
- **Action**: Use consistent pattern throughout - `vim.keymap.set()` with descriptive opts
- **Files**: All keymap definitions
- **Pattern to enforce**:
  ```lua
  vim.keymap.set("n", "<leader>key", function() ... end, { desc = "Description" })
  ```

### Phase 3: Performance Optimization (Priority: Medium)

**Goal**: Reduce startup time and runtime overhead

#### Task 3.1: Lazy-load Plugins Properly
- **Action**: Review and optimize plugin lazy-loading
- **Candidates**:
  - `vim-textobj-variable-segment`: Can use `event = "VeryLazy"` instead of `lazy = false`
  - `vim-visual-multi`: Load on keys only (already has keys defined)
  - `vim-lion`, `vim-repeat`, `vim-pasta`: Can be lazy-loaded on first use
  - `vim-bufsurf`: Already has keys, remove `lazy = false`
- **Files**: `lua/plugins/coding.lua`, `lua/plugins/util.lua`
- **Measurement**: Run `:Lazy profile` before and after

#### Task 3.2: Optimize Yank Autocmd
- **Action**: Reduce frequency of cursor position tracking
- **Current**: Triggers on `VimEnter` + `CursorMoved` (very frequent)
- **Proposed**: Use `TextYankPost` only or track on entering operator-pending mode
- **Files**: `lua/util/yank.lua`
- **Rationale**: CursorMoved fires on every cursor movement, causing unnecessary overhead

#### Task 3.3: Optimize Telescope Configuration
- **Action**: Review telescope setup for performance
- **Consider**:
  - Enable fzf sorter extension (currently commented) for faster sorting
  - Review if all pickers need custom configurations
- **Files**: `lua/plugins/editor.lua`

### Phase 4: Modernization & Feature Improvements (Priority: Low)

**Goal**: Use modern Neovim features, improve maintainability

#### Task 4.1: Replace Deprecated Patterns
- **Action**: Update to modern Neovim APIs
- **Candidates**:
  - Use `vim.schedule()` wrapper pattern where appropriate
  - Consider replacing `vim.cmd()` calls with Lua equivalents
  - Review if `vim.loop` can replace any shell commands

#### Task 4.2: Improve Input Method Switching
- **Action**: Add error handling and platform detection improvements
- **Current issue**: Typo in Linux command (`fcitx-ueyboard-us` should be `fcitx-keyboard-us`)
- **Files**: `lua/util/inputmethod.lua:6`
- **Enhancement**: Add silent error handling if commands fail

#### Task 4.3: Document Plugin Choices
- **Action**: Add comments explaining why certain plugins are disabled
- **Files**: All plugin files
- **Example**: Why is `yanky.nvim` disabled? Why use `coerce.nvim` + `abolish` together?

#### Task 4.4: Review Plugin Alternatives
- **Research needed**:
  - Is `vim-visual-multi` still the best multi-cursor option?
  - Can any vim plugins be replaced with Lua alternatives?
  - Is `sqlite.lua` being used? (appears to have no configuration)

### Phase 5: Configuration Improvements (Priority: Low)

**Goal**: Better defaults and user experience

#### Task 5.1: Resolve Configuration Conflicts
- **Action**: Establish clear precedence rules
- **Decisions needed**:
  - Spell check in markdown: on or off by default?
  - Textwidth: 80 or 72 for text files?
  - Why is noice notifier disabled while nvim-notify is enabled?
- **Files**: `lua/config/autocmds.lua`, `lua/config/options.lua`, `lua/plugins/ui.lua`

#### Task 5.2: Improve Auto-wrap Plugin
- **Action**: Consider enhancements
- **Possibilities**:
  - Add more filetypes support
  - Add visual feedback when enabled/disabled
  - Consider formatting on InsertLeave instead of BufWritePre
- **Files**: `lua/util/auto_wrap.lua`

#### Task 5.3: Add Documentation
- **Action**: Create inline documentation for custom utilities
- **Files**: `lua/util/*.lua`
- **Format**: Add module-level docstrings explaining purpose and usage

## Implementation Strategy

### Recommended Order
1. Start with Phase 1 (Clean Up) - highest impact, lowest risk
2. Move to Phase 3 (Performance) - measurable improvements
3. Then Phase 2 (Organization) - better structure for maintenance
4. Finally Phases 4-5 (Modernization/Improvements) - nice-to-haves

### Testing Strategy
- Create git commits after each task
- Test in clean Neovim instance after each phase
- Run `:checkhealth` after major changes
- Profile startup time with `:Lazy profile` before and after Phase 3
- Test VSCode integration (since vscode extras are loaded)

### Risk Mitigation
- Work on `lazyvim` branch (current branch)
- Create backup before starting: `git tag backup-before-refactor`
- Test each change incrementally
- **Keep `vimrc.local` unchanged** - it's a server vim template and should not be modified

## Expected Outcomes

### Quantitative Improvements
- **Lines of code**: Reduce by ~50-100 lines (remove dead code, clean up commented sections)
- **Startup time**: Target 10-20% improvement from lazy-loading optimization
- **Maintainability**: Cleaner Lua configs, better documentation of vimrc.local overlap

### Qualitative Improvements
- Clear separation of concerns
- Easier to understand and modify
- Better documented
- More consistent coding style
- Modern Lua-first approach

## Open Questions for User

1. ~~**vimrc.local**: Do you want to keep it at all, or fully migrate to Lua?~~ **ANSWERED**: Keep as template for server vim
2. **Disabled plugins**: Should I remove `yanky.nvim` and `mini.pairs` entirely, or document why disabled?
3. **Spell check**: Do you want spell check enabled or disabled in markdown files?
4. **Textwidth**: Confirm 80 columns globally and 72 for text/markdown?
5. **sqlite.lua**: Is this plugin being used? No configuration found.
6. **Plugins to reconsider**: Any plugins you're not actively using that we should remove?

## Next Steps

After plan approval:
1. Create git tag for backup
2. Start with Phase 1, Task 1.1 (migrate vimrc.local keymaps)
3. Test thoroughly after each task
4. Iterate based on findings and user feedback
