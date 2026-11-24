# claude-study-skills

강의 자료(슬라이드 이미지, 블로그 글)를 **노션 서식 .md 노트**로 정리하는 Claude Code 스킬 모음입니다.

## 포함된 스킬

| 스킬 | 설명 |
| --- | --- |
| `unit-note` | 자료를 단원별 노션용 .md로 정리 (보충 설명, 예시 코드, 자료 오류 표시, Mermaid 그림). `Downloads\<단원명>_정리\` 에 저장하고, 다음 파트는 같은 파일에 이어서 추가 |

## 설치 방법

### 방법 A. 플러그인으로 설치 (추천)

Claude Code에서 아래 두 명령을 차례로 실행합니다.

```
/plugin marketplace add JinwookChei/claude-study-skills
```

```
/plugin install study@claude-study-skills
```

설치 후 호출: `/study:unit-note 스프링_MVC`

업데이트: `/plugin marketplace update claude-study-skills`

### 방법 B. 스킬 폴더에 직접 복사

`/unit-note` 처럼 짧게 부르고 싶다면 저장소를 받아 스킬 폴더에 복사합니다.

```bash
git clone https://github.com/JinwookChei/claude-study-skills.git
```

```bash
cp -r claude-study-skills/skills/unit-note ~/.claude/skills/
```

설치 후 호출: `/unit-note 스프링_MVC`

## 사용 예

슬라이드 이미지를 첨부하고:

```
/unit-note 스프링_AOP
```

다음 파트도 같은 단원명으로 다시 부르면 기존 파일에 이어서 추가됩니다.
