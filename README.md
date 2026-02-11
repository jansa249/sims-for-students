# 🧬 Simulace: Chignolin (CLN025)

Chignolin je nejmenší protein s jasně definovanou strukturou ($\beta$-hairpin), což z něj dělá ideální model pro pochopení sbalování proteinů.

---

## Soubory ke stažení
*Klikněte na zelené **"<> CODE"** a stáhněte .zip **"Download ZIP"**.*
Extrahujte soubor, najdete topologii, trajektorii a graf RMSD v .pdf.

| Soubor | Typ | Funkce |
| :--- | :--- | :--- |
| **Topologie** | `.pdb` | Statická struktura a názvy atomů |
| **Trajektorie** | `.dcd` | Záznam pohybu atomů |

---

## Instrukce pro PyMOL

Aby simulace fungovala, musíte soubory načíst ve správném pořadí:

1. **Načtěte PDB:** Přetáhněte soubor `.pdb` do okna PyMOL nebo použijte `File -> Open`.
2. **Načtěte DCD:** Přetáhněte soubor `.dcd` do okna PyMOL nebo použijte `File -> Open`.
3. **Přehrávání:** V pravém dolním rohu uvidíte ovládací panel (tlačítko Play).

Trajektorii je potřeba načíst vždy až po topologií, aby se pohyb přiřadíl k správným atomům.

### Doporučené příkazy pro vizualizaci
Zkopírujte tyto příkazy do řádku v PyMOLu pro lepší přehlednost:

```python
remove ino  # Odstranění iontů kolem proteinu
zoom        # Přiblížení
```
Spusťte simulaci. Molekula se bude rychle otáčet.
Přeložením jednotlivých snímků přes sebe rotaci zastavíme pomocí `intra_fit` a hektický pohyb vyhladíme příkazem `smooth`:

```python
intra_fit polymer
smooth  # Interpolace pohybu
```

Postupně si zobrazte molekulu v různých zobrazení:

```python
as cartoon
as sticks
as sticks, bb.
```
## Úkoly

Simulace ukazuje sbalování chignolinu z lineární struktury.
1. Porovnejte chování proteinu s hodnotami v grafu RMSD (chignolin-rmsd.pdf)  
   _(RMSD je průměrná vzdálenost atomů od nějaké referenční struktury, v tomto případě je to struktura s PDB ID 1UAO.)_
2. Ve stejném okně si stáhněte tuto strukturu a porovnejte ji se strukturou ze simulace.
   Vytvořte objekt jen z první struktury ensemblu:
   ```python
   create experimental, 1UAO, 1  # , 1 znamená, že kopírujete první strukturu z 18
   delete 1UAO  # původní objekt už nepotřebujeme
   extra_fit polymer  # přeložit přes sebe polymerní části objektů
   ```
3. Znovu se podívejte na simulaci a graf RMSD.
