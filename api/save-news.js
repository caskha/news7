// Supabase에 검색 키워드·수집 뉴스 저장
// 환경변수: SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,POST');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') {
        res.status(200).end();
        return;
    }

    if (req.method !== 'POST') {
        return res.status(405).json({ error: 'Method not allowed' });
    }

    try {
        const { keyword, news } = req.body;

        if (!keyword || typeof keyword !== 'string') {
            return res.status(400).json({ error: 'keyword is required (string)' });
        }
        if (!Array.isArray(news) || news.length === 0) {
            return res.status(400).json({ error: 'news must be a non-empty array' });
        }

        const supabaseUrl = process.env.SUPABASE_URL;
        const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

        if (!supabaseUrl || !supabaseKey) {
            return res.status(500).json({
                error: 'Supabase not configured. Set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in Vercel env.',
            });
        }

        const rows = news.map((item) => ({
            keyword: keyword.trim(),
            title: item.title ?? '',
            link: item.link ?? item.url ?? '',
            content: item.content ?? item.summary ?? '',
            source: item.source ?? '',
            date: item.date ?? '',
        }));

        const response = await fetch(`${supabaseUrl}/rest/v1/news_log`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'apikey': supabaseKey,
                'Authorization': `Bearer ${supabaseKey}`,
                'Prefer': 'return=minimal',
            },
            body: JSON.stringify(rows),
        });

        if (!response.ok) {
            const text = await response.text();
            throw new Error(`Supabase error: ${response.status} ${text}`);
        }

        return res.status(200).json({
            success: true,
            saved: rows.length,
        });
    } catch (error) {
        console.error('save-news error:', error);
        return res.status(500).json({
            error: error.message || 'Failed to save news',
        });
    }
}
