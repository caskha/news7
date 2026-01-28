-- 뉴스 검색/수집 로그 테이블
-- Supabase 대시보드 > SQL Editor에서 전체 선택 후 Run 실행

-- 1) 테이블 생성
CREATE TABLE IF NOT EXISTS public.news_log (
    id bigserial PRIMARY KEY,
    keyword text NOT NULL,
    title text NOT NULL,
    link text DEFAULT '',
    content text NOT NULL,
    source text DEFAULT '',
    date text DEFAULT '',
    created_at timestamptz DEFAULT now()
);

-- 2) 인덱스 (키워드/날짜 조회용)
CREATE INDEX IF NOT EXISTS idx_news_log_keyword ON public.news_log (keyword);
CREATE INDEX IF NOT EXISTS idx_news_log_created_at ON public.news_log (created_at DESC);
