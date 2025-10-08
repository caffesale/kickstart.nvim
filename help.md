# Neovim Kickstart 설정 가이드

> Kickstart.nvim 기반 Neovim 설정 - 빠르고 강력한 개발 환경

**Neovim 버전**: 0.11.4
**설정 위치**: `~/.config/nvim/`

---

## 📋 목차

1. [Kickstart.nvim이란?](#kickstartnvim이란)
2. [설치된 플러그인](#설치된-플러그인)
3. [LSP 설정](#lsp-설정)
4. [DAP 디버거 설정](#dap-디버거-설정)
5. [키맵 레퍼런스](#키맵-레퍼런스)
6. [init.lua 구조 설명](#initlua-구조-설명)

---

## Kickstart.nvim이란?

Kickstart.nvim은 **배포판이 아닌 시작점**입니다. 모든 코드를 위에서 아래로 읽고 이해할 수 있도록 설계되었으며, 자신의 필요에 맞게 수정할 수 있습니다.

### 특징
- 📖 **읽기 쉬운 단일 파일 구성** (init.lua)
- 🔧 **모듈화 가능한 구조** (lua/kickstart/plugins/)
- 🚀 **최신 Neovim 기능 활용** (LSP, Treesitter, DAP)
- 📦 **lazy.nvim 플러그인 관리자** 사용

---

## 설치된 플러그인

### 🎨 UI 및 테마

#### **tokyonight.nvim**
- **역할**: Tokyo Night 컬러스킴
- **설정**: `tokyonight-night` 테마 사용, 주석 이탤릭 비활성화
- **명령어**: `:Telescope colorscheme` - 다른 테마 선택

#### **which-key.nvim**
- **역할**: 키 입력 후 가능한 키맵을 팝업으로 표시
- **사용법**:
  - `<leader>` 입력 후 대기하면 자동으로 가능한 키맵 표시
  - 그룹별로 정리: `<leader>s` (검색), `<leader>t` (토글), `<leader>h` (Git)

#### **mini.statusline**
- **역할**: 하단 상태바
- **표시 정보**: 모드, 파일명, 위치, Git 브랜치 등

#### **indent-blankline.nvim**
- **역할**: 들여쓰기 가이드 라인 표시
- **명령어**: `:IBLToggle` - 토글

---

### 🔍 검색 및 탐색

#### **telescope.nvim**
- **역할**: 퍼지 파인더 - 파일, 텍스트, LSP 심볼 등 검색
- **의존성**:
  - `plenary.nvim` - Lua 유틸리티 라이브러리
  - `telescope-fzf-native.nvim` - FZF 알고리즘 (C로 작성, 빠름)
  - `telescope-ui-select.nvim` - Vim의 select UI를 Telescope로 교체
- **주요 기능**:
  - 파일 검색
  - 텍스트 검색 (live grep)
  - LSP 심볼 검색
  - 도움말 검색
  - Git 파일 검색

#### **neo-tree.nvim**
- **역할**: 파일 탐색기 (사이드바)
- **의존성**: `plenary.nvim`, `nui.nvim`, `nvim-web-devicons`
- **키맵**: `\` - 파일 트리 열기/닫기
- **기능**:
  - 파일/디렉토리 생성, 삭제, 이동
  - Git 상태 표시
  - 버퍼 탐색

---

### 📝 편집 도구

#### **nvim-treesitter**
- **역할**: 문법 트리 기반 코드 하이라이팅 및 구조 분석
- **설치 언어**: bash, c, diff, html, lua, luadoc, markdown, vim, vimdoc
- **기능**:
  - 정확한 문법 하이라이팅
  - 코드 접기 (folding)
  - 증분 선택
- **명령어**: `:TSUpdate` - 파서 업데이트

#### **mini.nvim**
- **mini.ai**: 텍스트 객체 확장
  - 예: `va)` - 괄호 포함 선택, `yinq` - 다음 따옴표 안 복사
- **mini.surround**: 괄호/따옴표 조작
  - `saiw)` - 단어를 괄호로 감싸기
  - `sd'` - 따옴표 제거
  - `sr)'` - 괄호를 따옴표로 변경

#### **nvim-autopairs**
- **역할**: 자동 괄호 닫기
- **기능**: `(`, `[`, `{`, `'`, `"` 입력 시 자동으로 닫는 문자 추가

#### **guess-indent.nvim**
- **역할**: 파일의 탭/스페이스 설정 자동 감지

---

### 🔧 LSP 및 개발 도구

#### **nvim-lspconfig**
- **역할**: LSP 서버 설정 관리
- **기능**:
  - 자동완성
  - 정의로 이동
  - 참조 찾기
  - 이름 변경
  - 코드 액션

#### **mason.nvim** + **mason-lspconfig.nvim**
- **역할**: LSP 서버, DAP 어댑터, 린터, 포매터 자동 설치
- **명령어**:
  - `:Mason` - Mason UI 열기
  - `:MasonUpdate` - 패키지 업데이트
- **현재 설정**: `ensure_installed = { 'stylua' }`

#### **mason-tool-installer.nvim**
- **역할**: Mason 도구 일괄 설치
- **자동 설치**: lua_ls에서 사용하는 도구들

#### **fidget.nvim**
- **역할**: LSP 진행 상태 표시 (우측 하단)

#### **lazydev.nvim**
- **역할**: Neovim Lua API 자동완성 및 타입 체크
- **대상**: `init.lua` 및 플러그인 설정 파일

---

### ✨ 자동완성

#### **blink.cmp**
- **역할**: 자동완성 엔진 (nvim-cmp의 최신 대안)
- **의존성**: `LuaSnip` (스니펫 엔진)
- **키맵**:
  - `<C-y>` - 완성 수락
  - `<C-n>/<C-p>` 또는 `<Up>/<Down>` - 항목 선택
  - `<C-e>` - 메뉴 숨기기
  - `<C-space>` - 문서 열기/메뉴 열기
  - `<C-k>` - 시그니처 도움말 토글
  - `<Tab>/<S-Tab>` - 스니펫 확장 시 이동
- **소스**: LSP, 경로, 스니펫, lazydev

#### **LuaSnip**
- **역할**: 스니펫 엔진
- **버전**: 2.x

---

### 🎨 포매터

#### **conform.nvim**
- **역할**: 코드 자동 포맷팅
- **설정된 포매터**:
  - Lua: `stylua`
- **키맵**: `<leader>f` - 현재 버퍼 포맷
- **자동 저장 포맷**: 활성화 (C/C++ 제외)
- **명령어**: `:ConformInfo` - 포매터 정보

---

### 🔍 린터

#### **nvim-lint**
- **역할**: 코드 린팅 (정적 분석)
- **설정된 린터**:
  - Markdown: `markdownlint`
- **자동 실행**: 버퍼 진입, 저장 후, Insert 모드 종료 시

---

### 🐛 디버거 (DAP)

#### **nvim-dap**
- **역할**: Debug Adapter Protocol 클라이언트
- **지원**: 다양한 언어의 디버거 어댑터 연결

#### **nvim-dap-ui**
- **역할**: DAP용 UI
- **의존성**: `nvim-nio`
- **기능**:
  - 변수 뷰
  - 콜스택
  - 브레이크포인트 목록
  - REPL

#### **mason-nvim-dap.nvim**
- **역할**: Mason을 통한 DAP 어댑터 자동 설치
- **설치된 어댑터**: `delve` (Go 디버거)

#### **nvim-dap-go**
- **역할**: Go 언어 디버깅 설정
- **디버거**: delve

---

### 🎯 Git 통합

#### **gitsigns.nvim**
- **역할**: Git 변경사항 표시 및 관리
- **기능**:
  - 사인컬럼에 변경사항 표시 (+, ~, _)
  - Hunk 단위 스테이징/리셋
  - Blame 정보 표시
  - Diff 보기

---

### 🌟 기타

#### **todo-comments.nvim**
- **역할**: 주석 내 TODO, FIXME, NOTE 등 하이라이트
- **검색**: `:TodoTelescope` - Telescope로 TODO 검색

---

## LSP 설정

### 현재 설치된 LSP 서버

#### **lua_ls** (Lua Language Server)
- **언어**: Lua
- **설정**:
  ```lua
  {
    completion = {
      callSnippet = 'Replace',  -- 함수 호출 시 스니펫 사용
    },
  }
  ```
- **기능**:
  - Neovim API 자동완성 (lazydev.nvim과 연동)
  - 타입 체크
  - 린팅

### LSP 추가 방법

1. **자동 설치 방식** (권장):
   ```lua
   -- init.lua의 servers 테이블에 추가
   local servers = {
     lua_ls = { ... },
     -- 새 서버 추가
     pyright = {},  -- Python
     ts_ls = {},    -- TypeScript/JavaScript
     gopls = {},    -- Go
   }
   ```

2. **수동 설치 방식**:
   ```vim
   :Mason
   ```
   Mason UI에서 원하는 LSP 서버 검색 후 설치

### 사용 가능한 LSP 서버 목록
`:help lspconfig-all` 명령어로 확인

---

## DAP 디버거 설정

### 설치된 디버거

#### **delve** (Go)
- **언어**: Go
- **설정**: Windows가 아닌 경우 detached 모드

### 디버거 추가 방법

1. **mason-nvim-dap를 통한 자동 설치**:
   ```lua
   -- lua/kickstart/plugins/debug.lua
   ensure_installed = {
     'delve',    -- Go
     'debugpy',  -- Python (추가 예시)
   }
   ```

2. **언어별 플러그인 추가**:
   ```lua
   dependencies = {
     'leoluz/nvim-dap-go',      -- Go
     'mfussenegger/nvim-dap-python',  -- Python (추가 예시)
   }
   ```

### 디버깅 워크플로우

1. 브레이크포인트 설정: `<leader>b`
2. 디버깅 시작: `<F5>`
3. 단계별 실행:
   - `<F1>` - Step Into
   - `<F2>` - Step Over
   - `<F3>` - Step Out
4. UI 토글: `<F7>`
5. 계속 실행: `<F5>`

---

## 키맵 레퍼런스

### 🔑 Leader 키
**Leader**: `<Space>`

---

### 📋 기본 키맵

| 키맵 | 모드 | 설명 |
|------|------|------|
| `<Esc>` | Normal | 검색 하이라이트 제거 |
| `<leader>q` | Normal | 진단 퀵픽스 리스트 열기 |
| `<Esc><Esc>` | Terminal | 터미널 모드 종료 |

### 🪟 윈도우 네비게이션

| 키맵 | 설명 |
|------|------|
| `<C-h>` | 왼쪽 윈도우로 포커스 이동 |
| `<C-l>` | 오른쪽 윈도우로 포커스 이동 |
| `<C-j>` | 아래 윈도우로 포커스 이동 |
| `<C-k>` | 위 윈도우로 포커스 이동 |

---

### 🔍 Telescope 검색 (`<leader>s`)

| 키맵 | 설명 |
|------|------|
| `<leader>sh` | 도움말 검색 |
| `<leader>sk` | 키맵 검색 |
| `<leader>sf` | 파일 찾기 |
| `<leader>ss` | Telescope 선택 (Telescope 기능 목록) |
| `<leader>sw` | 현재 단어 검색 |
| `<leader>sg` | Live grep (프로젝트 전체 텍스트 검색) |
| `<leader>sd` | 진단(Diagnostic) 검색 |
| `<leader>sr` | 이전 검색 재개 |
| `<leader>s.` | 최근 파일 (oldfiles) |
| `<leader>sn` | Neovim 설정 파일 검색 |
| `<leader>s/` | 열린 파일들에서 검색 |
| `<leader>/` | 현재 버퍼에서 퍼지 검색 |
| `<leader><leader>` | 버퍼 목록 |

**Telescope 내부 키맵**:
- `<C-n>/<C-p>` 또는 `<Down>/<Up>` - 항목 선택
- `<C-c>` 또는 `<Esc>` - 닫기
- `<CR>` - 선택 확정
- `<C-x>` - 가로 분할로 열기
- `<C-v>` - 세로 분할로 열기
- `<C-t>` - 새 탭으로 열기
- `<C-/>` (Insert 모드) 또는 `?` (Normal 모드) - 도움말

---

### 🧑‍💻 LSP 키맵 (버퍼별 자동 설정)

| 키맵 | 설명 |
|------|------|
| `grn` | 이름 변경 (Rename) |
| `gra` | 코드 액션 |
| `grr` | 참조 찾기 (References) |
| `gri` | 구현으로 이동 (Implementation) |
| `grd` | 정의로 이동 (Definition) |
| `grD` | 선언으로 이동 (Declaration) |
| `gO` | 문서 심볼 목록 |
| `gW` | 워크스페이스 심볼 목록 |
| `grt` | 타입 정의로 이동 |
| `<leader>th` | Inlay hints 토글 |
| `K` | Hover 문서 표시 (기본 LSP 키맵) |

**사용법**:
- 함수/변수 위에 커서를 두고 `grd`를 누르면 정의로 이동
- `<C-t>`로 되돌아오기
- 여러 정의가 있을 경우 Telescope 리스트로 표시

---

### 🎨 포맷팅

| 키맵 | 설명 |
|------|------|
| `<leader>f` | 현재 버퍼 포맷 |

**자동 저장 포맷**: 파일 저장 시 자동 실행 (C/C++ 제외)

---

### 🐛 디버깅 (DAP)

| 키맵 | 설명 |
|------|------|
| `<F5>` | 디버깅 시작/계속 |
| `<F1>` | Step Into (함수 안으로) |
| `<F2>` | Step Over (다음 줄) |
| `<F3>` | Step Out (함수 밖으로) |
| `<leader>b` | 브레이크포인트 토글 |
| `<leader>B` | 조건부 브레이크포인트 설정 |
| `<F7>` | DAP UI 토글 |

---

### 🌳 Neo-tree 파일 탐색기

| 키맵 | 설명 |
|------|------|
| `\` | 파일 트리 열기/닫기 |

**Neo-tree 내부 키맵** (트리 내에서):
- `<CR>` 또는 `o` - 파일 열기/디렉토리 열기
- `\` - 창 닫기
- `a` - 파일/디렉토리 추가
- `d` - 삭제
- `r` - 이름 변경
- `y` - 복사
- `x` - 잘라내기
- `p` - 붙여넣기
- `R` - 새로고침
- `?` - 도움말

---

### 🎯 Git (Gitsigns)

#### 네비게이션
| 키맵 | 설명 |
|------|------|
| `]c` | 다음 Git 변경사항으로 이동 |
| `[c` | 이전 Git 변경사항으로 이동 |

#### Hunk 작업 (`<leader>h`)
| 키맵 | 모드 | 설명 |
|------|------|------|
| `<leader>hs` | Normal/Visual | Hunk 스테이징 |
| `<leader>hr` | Normal/Visual | Hunk 리셋 |
| `<leader>hS` | Normal | 버퍼 전체 스테이징 |
| `<leader>hu` | Normal | 스테이징 취소 |
| `<leader>hR` | Normal | 버퍼 전체 리셋 |
| `<leader>hp` | Normal | Hunk 미리보기 |
| `<leader>hb` | Normal | Blame 정보 표시 |
| `<leader>hd` | Normal | 인덱스와 Diff |
| `<leader>hD` | Normal | 마지막 커밋과 Diff |

#### 토글 (`<leader>t`)
| 키맵 | 설명 |
|------|------|
| `<leader>tb` | 현재 줄 Blame 토글 |
| `<leader>tD` | 삭제된 내용 인라인 표시 토글 |

---

### 📝 텍스트 객체 (mini.ai)

| 키맵 | 설명 | 예시 |
|------|------|------|
| `va)` | 괄호 포함 선택 | `func(arg)` 전체 선택 |
| `vi)` | 괄호 내부 선택 | `arg`만 선택 |
| `yinq` | 다음 따옴표 안 복사 | 다음 `"text"` 복사 |
| `ci'` | 따옴표 안 변경 | `'text'`를 변경 |

**사용 가능한 객체**: `()`, `[]`, `{}`, `''`, `""`, `<>`, `t` (태그)

---

### 🔄 Surround (mini.surround)

| 키맵 | 설명 | 예시 |
|------|------|------|
| `saiw)` | 단어를 괄호로 감싸기 | `word` → `(word)` |
| `sd'` | 따옴표 제거 | `'word'` → `word` |
| `sr)'` | 괄호를 따옴표로 변경 | `(word)` → `'word'` |

---

### ⚙️ 유용한 명령어

| 명령어 | 설명 |
|--------|------|
| `:Lazy` | 플러그인 관리자 (설치/업데이트/삭제) |
| `:Mason` | LSP/DAP/린터/포매터 관리 |
| `:checkhealth` | Neovim 건강 체크 |
| `:Telescope` | Telescope 기능 목록 |
| `:ConformInfo` | 포매터 정보 |
| `:LspInfo` | LSP 서버 상태 |
| `:LspLog` | LSP 로그 |
| `:TSUpdate` | Treesitter 파서 업데이트 |
| `:Tutor` | Neovim 튜토리얼 |

---

## init.lua 구조 설명

### 📄 파일 구조

```
~/.config/nvim/
├── init.lua                    # 메인 설정 파일
├── lua/
│   └── kickstart/
│       └── plugins/
│           ├── autopairs.lua   # 자동 괄호 닫기
│           ├── debug.lua       # DAP 디버거 설정
│           ├── gitsigns.lua    # Git 키맵
│           ├── indent_line.lua # 들여쓰기 가이드
│           ├── lint.lua        # 린터 설정
│           └── neo-tree.lua    # 파일 탐색기
└── help.md                     # 이 파일
```

---

### 📖 init.lua 섹션별 설명

#### 1️⃣ **Leader 키 설정** (87-91줄)
```lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```
- **역할**: 리더 키를 `<Space>`로 설정
- **중요**: 플러그인 로드 전에 설정해야 함

---

#### 2️⃣ **기본 옵션** (96-167줄)
```lua
vim.o.relativenumber = true  -- 상대 줄 번호
vim.o.mouse = 'a'            -- 마우스 활성화
vim.o.clipboard = 'unnamedplus'  -- 시스템 클립보드 사용
vim.o.undofile = true        -- 영구 실행 취소
vim.o.ignorecase = true      -- 대소문자 무시 검색
vim.o.smartcase = true       -- 대문자 포함 시 대소문자 구분
```
- **역할**: Neovim의 기본 동작 설정
- **참고**: `:help vim.o` 또는 `:help option-list`

---

#### 3️⃣ **기본 키맵** (169-206줄)
- 검색 하이라이트 제거
- 진단 퀵픽스 리스트
- 터미널 모드 종료
- 윈도우 네비게이션

---

#### 4️⃣ **자동명령** (208-220줄)
```lua
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
```
- **역할**: 텍스트 복사 시 하이라이트 효과

---

#### 5️⃣ **lazy.nvim 설치** (222-235줄)
- **역할**: 플러그인 관리자 자동 설치
- **위치**: `~/.local/share/nvim/lazy/lazy.nvim`

---

#### 6️⃣ **플러그인 설정** (237-993줄)

##### 📦 플러그인 정의 구조
```lua
{
  'owner/repo',           -- GitHub 저장소
  event = 'VimEnter',     -- 로딩 시점
  dependencies = { ... }, -- 의존성
  opts = { ... },         -- 옵션 (자동으로 setup() 호출)
  config = function()     -- 수동 설정 함수
    -- 설정 코드
  end,
  keys = { ... },         -- 키맵 (lazy loading)
}
```

##### 주요 플러그인 섹션:
1. **guess-indent.nvim** (250줄)
2. **gitsigns.nvim** (274-285줄)
3. **which-key.nvim** (301-352줄)
4. **telescope.nvim** (361-463줄)
5. **lazydev.nvim** (466-477줄) - Lua LSP
6. **nvim-lspconfig** (478-737줄) - LSP 설정
7. **conform.nvim** (739-778줄) - 포매터
8. **blink.cmp** (780-877줄) - 자동완성
9. **tokyonight.nvim** (879-899줄) - 컬러스킴
10. **todo-comments.nvim** (902줄)
11. **mini.nvim** (904-940줄)
12. **nvim-treesitter** (941-965줄)

##### kickstart 추가 플러그인 (976-981줄):
```lua
require 'kickstart.plugins.debug',      -- DAP
require 'kickstart.plugins.indent_line', -- 들여쓰기
require 'kickstart.plugins.lint',       -- 린터
require 'kickstart.plugins.autopairs',  -- 자동 괄호
require 'kickstart.plugins.neo-tree',   -- 파일 탐색기
require 'kickstart.plugins.gitsigns',   -- Git 키맵
```

---

#### 7️⃣ **LSP 설정 상세** (478-737줄)

##### LSP 어태치 시 자동 실행 (525-627줄)
- **역할**: LSP가 버퍼에 연결될 때 키맵 설정
- **키맵**: `grn`, `gra`, `grr`, `grd` 등
- **기능**:
  - 문서 하이라이트 (커서 아래 심볼 강조)
  - Inlay hints 토글

##### 진단 설정 (629-656줄)
```lua
vim.diagnostic.config {
  severity_sort = true,           -- 심각도순 정렬
  float = { border = 'rounded' }, -- 둥근 테두리
  underline = { severity = vim.diagnostic.severity.ERROR }, -- 에러만 밑줄
  virtual_text = { ... },         -- 가상 텍스트 설정
}
```

##### LSP 서버 정의 (673-701줄)
```lua
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = 'Replace' },
      },
    },
  },
}
```

##### Mason 설정 (716-735줄)
- **자동 설치**: `servers` 테이블의 모든 서버
- **도구**: `stylua` (Lua 포매터)

---

#### 8️⃣ **자동완성 설정** (780-877줄)

##### blink.cmp 설정
```lua
opts = {
  keymap = { preset = 'default' },  -- <C-y>로 수락
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
  },
  snippets = { preset = 'luasnip' },
}
```

---

#### 9️⃣ **Lazy.nvim UI 설정** (993-1013줄)
- **역할**: `:Lazy` 명령어 UI 아이콘 설정
- **조건**: Nerd Font 사용 여부에 따라 다른 아이콘

---

### 🎓 학습 리소스

- **Neovim 튜토리얼**: `:Tutor`
- **Vim 도움말**: `:help`
- **Lua 가이드**: `:help lua-guide`
- **LSP 설정**: `:help lspconfig`
- **Telescope**: `:help telescope`
- **Lazy.nvim**: `:help lazy.nvim`

---

### 🔧 커스터마이징

#### 플러그인 추가
1. `init.lua`의 `require('lazy').setup({ ... })` 내부에 추가
2. 또는 `lua/custom/plugins/` 디렉토리 생성 후 모듈화

#### LSP 서버 추가
```lua
local servers = {
  lua_ls = { ... },
  pyright = {},  -- Python
  ts_ls = {},    -- TypeScript
}
```

#### 키맵 추가
```lua
vim.keymap.set('n', '<leader>x', ':command<CR>', { desc = '설명' })
```

#### 컬러스킴 변경
```lua
vim.cmd.colorscheme 'gruvbox'  -- 또는 다른 테마
```

---

### 🐛 문제 해결

#### LSP가 작동하지 않을 때
1. `:LspInfo` - LSP 서버 상태 확인
2. `:Mason` - 서버가 설치되었는지 확인
3. `:checkhealth lsp` - LSP 건강 체크

#### 플러그인 오류
1. `:Lazy` - 플러그인 상태 확인
2. `:Lazy sync` - 플러그인 동기화
3. `:checkhealth` - 전체 건강 체크

#### 성능 문제
1. `:Lazy profile` - 플러그인 로딩 시간 확인
2. Treesitter 파서 줄이기
3. LSP 서버 비활성화

---

### 📚 추가 자료

- [Neovim 공식 문서](https://neovim.io/doc/)
- [Kickstart.nvim GitHub](https://github.com/nvim-lua/kickstart.nvim)
- [Lazy.nvim 문서](https://github.com/folke/lazy.nvim)
- [Mason.nvim 문서](https://github.com/mason-org/mason.nvim)
- [Learn Lua in Y minutes](https://learnxinyminutes.com/docs/lua/)

---

## 🎉 결론

이 설정은 **시작점**입니다. 자신의 필요에 맞게 수정하고 확장하세요!

**Tip**:
- 모든 코드를 읽어보세요
- 주석을 읽고 이해하세요
- 한 번에 하나씩 변경하세요
- 실험을 두려워하지 마세요!

**Happy Vimming! 🚀**
