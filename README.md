# oogie-claude-skills

내가 만든 Claude Code 스킬을 모아두는 저장소입니다.

## 스킬 목록

| 스킬 | 설명 |
| --- | --- |
| [`unit-note`](skills/unit-note/SKILL.md) | 강의 자료(슬라이드 이미지, 블로그 글)를 단원별 노션 서식 .md로 정리. 보충 설명, 예시 코드, 자료 오류 표시, Mermaid 그림. `Downloads\<단원명>_정리\` 에 저장하고 다음 파트는 이어서 추가 |

## 구조

```
oogie-claude-skills/
├── .claude-plugin/       ← 플러그인 설치용 설정
├── skills/
│   └── <스킬 이름>/SKILL.md
└── scripts/
    ├── sync.ps1          ← 이 PC의 스킬 → 저장소로 모으기
    ├── install.ps1       ← 저장소 → 이 PC(Claude Code)로 설치하기
    └── package.ps1       ← Claude Desktop 업로드용 zip 만들기 (dist/)
```

## Claude Desktop(채팅)에서 쓰기

스킬은 Claude Code와 Desktop 채팅 양쪽에서 동작하도록 작성합니다.

```bash
powershell -ExecutionPolicy Bypass -File scripts\package.ps1
```

`dist\<스킬 이름>.zip` 이 만들어지면 Claude Desktop → **설정 → Capabilities → Skills → Upload skill** 로 업로드합니다.
(.md 같은 파일을 내려받으려면 같은 화면의 **Code execution and file creation** 을 켜둡니다.)
스킬을 고치면 zip을 다시 만들어 다시 업로드해야 반영됩니다.

## 다른 PC에서 설치하기

### 방법 A. 스크립트로 설치 (`/unit-note` 처럼 짧게 호출)

```bash
git clone https://github.com/JinwookChei/oogie-claude-skills.git
```

```bash
cd oogie-claude-skills
```

```bash
powershell -ExecutionPolicy Bypass -File scripts\install.ps1
```

### 방법 B. 플러그인으로 설치 (`/my-skills:unit-note` 로 호출)

Claude Code에서:

```
/plugin marketplace add JinwookChei/oogie-claude-skills
```

```
/plugin install my-skills@oogie-claude-skills
```

업데이트: `/plugin marketplace update oogie-claude-skills`

## 새 스킬 추가하기

1. 평소처럼 `~/.claude/skills/<스킬 이름>/SKILL.md` 에 스킬을 만든다.
2. 저장소 폴더에서 스킬을 모은다.
   ```bash
   powershell -ExecutionPolicy Bypass -File scripts\sync.ps1
   ```
3. 위 스킬 목록 표에 한 줄 추가하고 commit / push 한다.
4. Desktop에서도 쓰려면 `package.ps1` 로 zip을 만들어 업로드한다.

> 스킬 작성 규칙: 맨 위 frontmatter에는 `name`, `description` 만 쓴다 (Desktop 업로드 호환). PC 경로에 저장하는 동작은 "파일에 쓸 수 없는 채팅 환경이면 내려받는 파일로 제공" 같은 대안을 함께 적는다.

> 앱이 자동으로 받아오는 `~/.claude/skills/synced` 폴더(claude.ai·조직 스킬)는 내 스킬이 아니므로 모으지 않습니다.
