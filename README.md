# 🧬 simulace: chignolin (cln025)

chignolin je nejmenší protein s jasně definovanou strukturou ($\beta$-hairpin), což z něj dělá ideální model pro pochopení sbalování proteinů.

## 1. stažení simulace
*klikněte na zelené **"<> code"** a stáhněte .zip **"download zip"**.*
extrahujte .zip soubor. ve složce najdete topologii, trajektorii a graf rmsd.

simulace se obvykle ukládají jako dvojice souborů:
- **topologie** (`.pdb`) obsahuje informace o atomech (atomové typy, vazby, ...)
- **trajektorie** (`.dcd`) obsahuje souřadnice atomů pro několik snímků

různé simulační programy zapisují topologii i trajektorii různě:
|program|top|traj|
|:-|:-:|:-:|
|amber|.prmtop|.traj / .nc|
|gromacs|.tpr|.xtc|
|charmm|.psf|.dcd|
|openmm|.pdb|.dcd|

## 2. načítání simulace
aby simulace fungovala, musíte soubory načíst ve správném pořadí:

1. **načtěte pdb:** přetáhněte soubor `.pdb` do okna pymol nebo použijte `file -> open`.
2. **načtěte dcd:** přetáhněte soubor `.dcd` do okna pymol nebo použijte `file -> open`.

trajektorii je potřeba načíst vždy až po topologií, aby se pohyb přiřadíl k správným atomům.

## 3. příprava simulace

**spusťte simulaci**. v pravém dolním rohu uvidíte ovládací panel (tlačítko play).
protein a ionty soli se budou rychle pohybovat. pro lepší přehlednost odstraníme ionty.
> během simulace je protein obklopený vodou, ukládání souřadnic pro simulace k analýze většinou ale není užitečné.
mazání vod snižuje velikost trajektorie z 204 mb na 9.9 mb, protože ukládame jen souřadnice 165 atomů, celý systém obsahuje 8927.

```python
remove ino  # odstranění iontů kolem proteinu
zoom        # přiblížení
```

**spusťte simulaci**. protein se bude velmi rychle pohybovat a otáčet, protože během simulace ve vodě volně difunduje.
přeložením jednotlivých snímků přes sebe pomocí `intra_fit` translaci i rotaci zastavíme. hektický pohyb vyhladíme příkazem `smooth`:

```python
intra_fit polymer
smooth  # interpolace pohybu
```

nyní máme připravenou simulaci tak, abychom si ji mohli prohlédnout.

## 4. prohlížení simulace

postupně si zobrazte molekulu v různých zobrazení:

```python
as cartoon
# nebo
as sticks
# nebo
as sticks, bb.
```

## 5. úkoly

1. prohlédněte si celou simulaci. co lze pozorovat?

1. porovnejte chování proteinu s průběhem hodnot rmsd v následujícím grafu (`chignolin-rmsd.png`).  

   >rmsd (root mean square deviation) je průměrná vzdálenost atomů (jendotka å nebo nm) od nějaké referenční struktury, v tomto případě je to struktura s pdb id 1uao.
   $$rmsd = \sqrt{\frac{1}{n} \sum_{i=1}^{n} (x_{i,ref}-x_{i,sim})^2}$$

    ![graf rmsd](chignolin-rmsd.png)

1. ve stejném okně si stáhněte tuto strukturu a porovnejte ji se strukturou ze simulace.
   vytvořte objekt jen z první struktury ensemblu:
   ```python
   create exp, 1uao, 1  # , 1 znamená, že kopírujete první strukturu z 18
   delete 1uao  # původní objekt už nepotřebujeme, máme novy objekt 'exp'
   # přeložení trajektorie a reference
   extra_fit polymer  # polymerní části v3objektů
   extra_fit bb.  # páteře objektů
   ```

1. znovu se podívejte na simulaci a graf rmsd.

1. zobrazte si vodíkove vazby, které se během simulace vytvoří.
   ```python
   dist hbonds, chignolin, chignolin, mode=2
   ```

   >jestli při přenastavování zobrazení vazby zmizí, spusťte příkaz `as dashes, hbonds`
