# Supabase 설정 가이드

## 1. Supabase 프로젝트 생성

1. [supabase.com](https://supabase.com) 접속 후 로그인
2. **New Project** 클릭
3. Organization 선택, 프로젝트 이름·비밀번호 입력 후 **Create new project** 실행

## 2. 테이블 생성

1. Supabase 대시보드에서 **SQL Editor** 메뉴 이동
2. **New query** 클릭
3. `migrations/001_create_news_log.sql` 파일 내용을 복사해 붙여넣기
4. **Run** 실행

## 3. API 키 확인

1. **Project Settings** (휴지통 아이콘 왼쪽 톱니바퀴) 클릭
2. **API** 메뉴 선택
3. 아래 값 복사:
   - **Project URL** → Vercel 환경변수 `SUPABASE_URL`
   - **service_role** 키 (secret) → Vercel 환경변수 `SUPABASE_SERVICE_ROLE_KEY`  
     (또는 **anon public** 키만 쓸 경우 `SUPABASE_ANON_KEY`)

⚠️ **service_role** 키는 서버에서만 사용하고, 클라이언트·Git에 노출하지 마세요.

## 4. Vercel 환경변수 설정

Vercel 프로젝트 **Settings → Environment Variables**에 추가:

| Name | Value |
|------|--------|
| `SUPABASE_URL` | Project URL (예: https://xxxxx.supabase.co) |
| `SUPABASE_SERVICE_ROLE_KEY` | service_role 키 (긴 문자열) |

저장 후 **Redeploy** 한 번 실행하세요.
