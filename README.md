# 🧬 Simulace: Chignolin (CLN025)

Tento repozitář slouží jako studijní materiál pro vizualizaci chignolinu. Chignolin je nejmenší protein s jasně definovanou strukturou ($\beta$-hairpin), což z něj dělá ideální model pro pochopení sbalování proteinů.

---

## 📥 Soubory ke stažení
*Klikněte na zelené **"<> CODE"** a stáhněte .zip **"Download ZIP"**.*

| Soubor | Typ | Funkce |
| :--- | :--- | :--- |
| **Topologie** | `.pdb` | Statická struktura a názvy atomů |
| **Trajektorie** | `.dcd` | Záznam pohybu atomů |

---

## 🚀 Instrukce pro PyMOL

Aby simulace fungovala, musíte soubory načíst ve správném pořadí:

1. **Načtěte PDB:** Přetáhněte soubor `.pdb` do okna PyMOL nebo použijte `File -> Open`.
2. **Načtěte DCD:** Přetáhněte soubor `.dcd` do okna PyMOL nebo použijte `File -> Open`.
3. **Přehrávání:** V pravém dolním rohu uvidíte ovládací panel (tlačítko Play).

### 💡 Doporučené příkazy pro vizualizaci
Zkopírujte tyto příkazy do řádku v PyMOLu pro lepší přehlednost:

```python
# Vyčištění a zobrazení struktury
remove ino
zoom

# Zvýraznění ruzných částí struktur
as cartoon
as sticks
as sticks, bb.
