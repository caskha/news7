# 🚀 Git 업로드 및 배포 가이드

## ⚠️ API 키 노출 방지 체크리스트

배포 전 반드시 확인하세요:

- [x] **api/gemini.js** → `process.env.GEMINI_API_KEY`만 사용 (코드에 키 없음)
- [x] **index.html** → `/api/gemini` 호출만 사용 (클라이언트에 키 없음)
- [x] **.gitignore** → `.env`, `.env.*` 등 환경변수 파일 제외
- [ ] **로컬에 `.env` 파일이 있다면** → Git에 추가하지 않음 (이미 .gitignore에 있음)

---

## 📤 Git 업로드 절차

### 1. Git 설치 (미설치 시)

**방법 A – 스크립트 사용 (이 폴더에 준비됨)**  
1. PowerShell에서 이 폴더로 이동 후 실행:
   ```powershell
   cd c:\Users\pgcm\Downloads\20260127
   .\install-git.ps1
   ```
2. 설치가 끝나면 **터미널을 닫았다가 새로 연다.**

**방법 B – 직접 설치**  
- [Git 다운로드](https://git-scm.com/download/win) → 설치 → 설치 후 터미널을 다시 연다.

### 2. 저장소 초기화 및 커밋

**한 번에 하려면 (스크립트):**
```powershell
cd c:\Users\pgcm\Downloads\20260127
.\git-upload.ps1
```
실행 정책 오류가 나면 먼저:  
`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

**또는 수동으로:**

```bash
cd c:\Users\pgcm\Downloads\20260127

git init
git add .
git status
```

**`git status`로 확인할 것:**
- `index.html`, `api/gemini.js`, `package.json`, `README.md`, `.gitignore` 등만 나오는지
- **`.env` 또는 API 키가 들어 있는 파일이 목록에 없어야 함**

이상 없으면:

```bash
git commit -m "feat: AI 뉴스 챗봇 초기 버전"
```

### 3. GitHub에 올리기

**방법 A: 새 저장소 만들고 연결**

1. [GitHub](https://github.com/new)에서 **New repository** 생성
2. 저장소 이름 입력 (예: `news-chatbot`)
3. **Create repository** 후 나오는 URL 복사 (예: `https://github.com/username/news-chatbot.git`)

```bash
git remote add origin https://github.com/사용자명/저장소명.git
git branch -M main
git push -u origin main
```

**방법 B: 이미 있는 저장소에 올리기**

```bash
git remote add origin https://github.com/사용자명/기존저장소.git
git branch -M main
git push -u origin main
```

---

## 🔒 한번 더 확인

- **절대 커밋하면 안 되는 것**
  - `.env`, `.env.local` 등 환경변수 파일
  - `AIzaSy...` 형태의 문자가 들어 있는 파일
- **API 키는**
  - **오직 Vercel 대시보드 → 프로젝트 → Settings → Environment Variables** 에만 입력한다.

---

## 📁 이 프로젝트에서 Git에 올라가는 파일

| 파일/폴더   | 업로드 | 비고                    |
|------------|--------|-------------------------|
| index.html | ✅     | 메인 페이지             |
| api/gemini.js | ✅  | API (키는 env에서만 사용) |
| package.json | ✅  | 프로젝트 설정           |
| README.md  | ✅     | 설명                    |
| DEPLOY.md  | ✅     | 배포/업로드 가이드      |
| .gitignore | ✅     | 제외 목록               |
| install-git.ps1 | ✅ | Git 설치 스크립트       |
| git-upload.ps1 | ✅  | Git 초기화/커밋 스크립트 |
| .env       | ❌     | .gitignore로 제외       |
| node_modules | ❌  | .gitignore로 제외       |

이 가이드대로만 진행하면 **API 키는 Git에 올라가지 않습니다.**
