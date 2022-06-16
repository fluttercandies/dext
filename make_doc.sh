dart doc -o ./docs .
git add docs/*

date_str = `date +%Y-%m-%d %H:%M:%S`
git commit -m "doc: Update docs at ${date_str}"