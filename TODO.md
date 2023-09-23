# TODO

- [x] Setup docsify
- [ ] Configure docsify
- [x] Setup Doxygen and output as xml
- [ ] Setup doxybook2: doxygen output to markdown
- [ ] Setup GitHub Actions
- [ ] Setup GitHub Pages for docs

## Github Action

- [ ] Checkout
- [ ] Run doc.sh
- [ ] Deploy to GitHub Pages

## Scripts

- doc.sh
  - Check for doxygen, install if not found
  - Check for doxybook2, install if not found
  - Create directory structure
  - Run doxygen
  - Run doxybook2
  - Move files from doxybook2 output to docs/api

doxybook2.exe --input .\docs\.doxygen\xml --output .\docs\doxybook --config .\docs\.doxybook\config.json