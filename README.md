# 🤖 AI 뉴스 챗봇

키워드로 뉴스를 검색하고 AI와 대화할 수 있는 웹 애플리케이션

## ✨ 주요 기능

- 🔍 키워드로 뉴스 10개 검색
- 📰 AI 자동 뉴스 요약
- 💬 뉴스 기반 AI 챗봇
- 🗄️ Supabase로 검색 키워드·수집 뉴스(제목/링크/내용) DB 저장
- 🎨 반응형 모던 UI

## 🚀 Vercel 배포 방법

### 1. GitHub에 푸시
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

### 2. Vercel에서 Import
1. [Vercel](https://vercel.com) 접속
2. "New Project" 클릭
3. GitHub 저장소 선택
4. **Environment Variables** 추가:
   - `GEMINI_API_KEY` = Gemini API 키
   - `SUPABASE_URL` = Supabase Project URL (예: https://xxxxx.supabase.co)
   - `SUPABASE_SERVICE_ROLE_KEY` = Supabase service_role 키 (DB 저장 시 사용)
5. "Deploy" 클릭

### 3. 완료!
배포 완료 후 제공된 URL로 접속

## 📁 프로젝트 구조

```
.
├── index.html           # 메인 페이지
├── api/
│   ├── gemini.js        # Gemini API (Vercel Serverless)
│   └── save-news.js     # Supabase 뉴스 저장 API
├── supabase/
│   ├── README.md        # Supabase 설정 가이드
│   └── migrations/
│       └── 001_create_news_log.sql   # news_log 테이블
├── package.json
└── README.md
```

## 🗄️ Supabase DB 설정

검색 키워드와 수집 뉴스(제목/링크/내용)를 저장하려면 Supabase를 설정해야 합니다.

1. [supabase.com](https://supabase.com)에서 프로젝트 생성
2. **SQL Editor**에서 `supabase/migrations/001_create_news_log.sql` 내용 실행
3. **Project Settings → API**에서 URL·service_role 키 복사 후 Vercel 환경변수에 등록

자세한 절차는 **supabase/README.md**를 참고하세요.

## 🛠️ 기술 스택

- Frontend: HTML, CSS, JavaScript
- Backend: Vercel Serverless Functions
- AI: Google Gemini API
- DB: Supabase (PostgreSQL)

## 💡 사용 방법

1. 키워드 입력하여 뉴스 검색
2. 뉴스 클릭하여 선택
3. 채팅창에 질문 입력

## 🔒 보안

- API 키는 Vercel 환경변수로 안전하게 관리
- 클라이언트에서 API 키 접근 불가
