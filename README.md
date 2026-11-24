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
    └── install.ps1       ← 저장소 → 이 PC로 설치하기
```

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

> 앱이 자동으로 받아오는 `~/.claude/skills/synced` 폴더(claude.ai·조직 스킬)는 내 스킬이 아니므로 모으지 않습니다.
