@echo off
cd /d "%~dp0"
python -c "
import os, re, json
chapters = {}
for f in sorted(os.listdir('.'), key=lambda x: re.search(r'\d+', x).group() if re.search(r'\d+', x) else 0):
    if os.path.isdir(f) and f.lower().startswith('glava'):
        n = int(re.search(r'\d+', f).group())
        pages = sorted([img for img in os.listdir(f) if img.lower().endswith(('.png','.jpg','.jpeg','.webp','.gif'))], 
                       key=lambda x: int(re.search(r'\d+', x).group()) if re.search(r'\d+', x) else 0)
        chapters[n] = {'title': f'Глава {n}', 'pages': [f'{f}/{p}' for p in pages]}
with open('chapters.json', 'w', encoding='utf-8') as f:
    json.dump(chapters, f, ensure_ascii=False)
print('Готово!')
"