# MindChoises Test App

A Flutter coaching story-game where the user builds a personal hero character and receives an AI-generated narrative description powered by OpenAI.

---

## Setup

1. Clone the repository
2. Create a `.env` file in the project root
3. Add your OpenAI API key:

```
OPENAI_API_KEY=your_openai_api_key_here
```

> **Note:** The `.env` file is gitignored and must never be committed. Keep your API key private.

```bash
flutter pub get
flutter run
```

---

## Design Decisions

### 1. Hansı istifadəçi inputlarını seçdim və niyə koçinq hekayə oyunu üçün mənalıdır?

Tətbiq iki mərhələdə input toplayır:

**Mərhələ 1 — Kim olduğun (UserInfo):**
- **Ad** — AI promptunda "You are [name]..." kimi istifadə olunur. Xarakter şəxsi hiss etdirilir.
- **Yaş** — Validasiya: 10–120 arası. Koçinq kontekstini müəyyənləşdirir.
- **Cins** — Narrative tonunu tənzimləyir (she/he/they).

**Mərhələ 2 — Necə hiss etdiyin (Customize):**
- **Arxetip** (Warrior, Mage, Rogue, Healer, Ranger, Oracle) — İnsanların özlərini necə gördüklərini əks etdirir. Koçinqdə self-image əsasdır.
- **Hazırkı əhval-ruhiyyə** (Focused, Restless, Hopeful...) — İnsanın indiki emosional vəziyyəti AI-ın tonunu şəkilləndirsin deyə daxil edilib.
- **Hərəkətverici məqsəd** (Growth, Courage, Balance...) — Koçinqin özəyi budur: istiqamət. Bu input AI-a ən çox "dərinlik" verən fielddir.

Bunlar seçildi çünki hamısı birlikdə tam bir psixoloji profil yaradır — addan tutmuş dəyərlərə qədər. AI bu 6 datanı bir araya gətirib unikal, ikinci şəxs ("You are...") formatlı bir hekayə yazır ki, bu da istifadəçini gücləndirir.

---

### 2. AI harada həqiqətən dəyər əlavə edir — harada israfçılıq olardı?

**AI-ın real dəyər verdiyi yer:**

Hər bir istifadəçinin input kombinasiyası unikaldır. 6 fərqli arqumentin (ad, yaş, cins, arxetip, əhval, məqsəd) cəmi hər dəfə fərqli bir narrativ tələb edir — bunu statik template ilə etmək ya çox sadə, ya da çox monoton olardı. AI məhz bu kombinasiyanı qavrayan, emosional rezonans yaradan, poetik tonda bir mətn yaradır.

```dart
// openai_service.dart — prompt strukturu
'You are ${r.name} the ${r.archetype}, ...'
'Driven by "${r.goal}", your ${r.mood} spirit...'
```

Bunun üstündə: AI "one special ability" və "one signature flaw" əlavə edir — bu koçinq narrativinin əsasıdır (güclü cəhət + kölgə tərəf).

**Harada israfçılıq olardı:**

- **Formu validate etmək** — ad boşdur, yaş səhvdir kimi yoxlamalar sadə Dart kodudur, AI-a göndərmək absurddur.
- **Arxetip adını göstərmək** — "You chose Warrior" tipli statik mətn AI tələb etmir.
- **Firestore save/load** — database əməliyyatları AI-la heç bir əlaqəsi yoxdur.
- **Mockup fallback** — API key olmadıqda tətbiq template-based mock istifadə edir, bu kifayətdir.

---

### 3. Həssas inputların (yaş, cins, üstünlüklər) məxfiliyini necə idarə edərəm?

**Hazırkı vəziyyət:**

Bu test tətbiqidir. Data Firebase Firestore-a yazılır, OpenAI API-ya göndərilir. Hər iki yer üçün risk var.

**Production üçün tətbiq ediləcək yanaşmalar:**

| Risk | Həll |
|---|---|
| API key client-da saxlanır (`.env`) | Production-da key backend proxy arxasına keçirilməlidir. Client heç vaxt birbaşa OpenAI-a çatmamalıdır. |
| Yaş + cins OpenAI-a gedir | Promptda real yaş əvəzinə range göndərilə bilər: `"late 20s"` əvəzinə `27`. Cins yerinə arxetip-based pronounlar istifadə edilə bilər. |
| Ad Firestore-da açıq saxlanır | Pseudonymization: istifadəçi adı əvəzinə hash-based ID saxlanıla bilər. |
| İstifadəçi razılığı yoxdur | GDPR/KVKK uyğunluğu üçün data toplama öncəsindən açıq consent ekranı əlavə edilməlidir. |
| Mood + goal psixoloji data sayılır | Bu inputlar OpenAI-a göndərilməzdən əvvəl anonimləşdirilməli, ya da yalnız on-device inference (local model) istifadə edilməlidir. |

**Ən vacib prinsip:** İstifadəçi nəyin nəyə görə toplandığını bilməlidir. Bu tətbiqdə bu hələ yoxdur — ilk əlavə ediləcək şey bir privacy notice ekranı olmalıdır.
