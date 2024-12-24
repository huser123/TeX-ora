# LaTeX Scripts

## Leírás
Ez a gyűjtemény különféle shell szkripteket tartalmaz, amelyek segítenek a LaTeX dokumentumok kezelésében, fordításában és TikZ feladatok generálásában. Az alábbiakban megtalálhatóak a fájlok és funkcióik rövid leírásai.

---

## Fájlok listája és funkcióik

1. **feladat-atnevezes.sh**
   - Több LaTeX fájl egyszerű és gyors átnevezése meghatározott sablon szerint.

2. **md5sum_comparator.sh**
   - Két fájl MD5 checksumjának összehasonlítása, hogy ellenőrizze, azonosak-e a tartalmaik.

3. **tex-fordido.sh**
   - LaTeX dokumentumok fordítása automatikusan. Tartalmazhat hibakeresést és többszöri fordítást a hivatkozások frissítéséhez.

4. **tikz-feladat-generator.sh**
   - TikZ segítségével generál véletlenszerű vagy sablon-alapú feladatokat grafikus elemekkel.

5. **tikz-poligon.sh**
   - Egyedi poligonok generálása TikZ segítségével megadott paraméterek alapján.

---

## Használat
1. Adj végrehajtási jogot a szkripteknek:
   ```bash
   chmod +x script_neve.sh
   ```

2. Futtasd a kívánt szkriptet:
   ```bash
   ./script_neve.sh
   ```

3. Kövesd a parancssorban megjelenő utasításokat, vagy add meg a szükséges argumentumokat a szkriptekhez.

---

## Követelmények
- Bash környezet (Linux, macOS, vagy WSL Windows alatt)
- LaTeX telepítve (pl. TeX Live vagy MikTeX)
- TikZ csomag telepítve a LaTeX-hez

---
