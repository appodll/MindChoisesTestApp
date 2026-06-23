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

### 1. Which user inputs did I choose and why do they make sense for a coaching story-game?

The app collects inputs across two steps:

**Step 1 — Who you are (UserInfo):**
- **Name** — Used directly in the AI prompt as `"You are [name]..."`, making the character feel personal rather than generic.
- **Age** — Validated between 10–120. Provides context that can shape the coaching tone.
- **Gender** — Adjusts the narrative voice (she/he/they pronouns).

**Step 2 — How you feel (Customize):**
- **Archetype** (Warrior, Mage, Rogue, Healer, Ranger, Oracle) — Reflects how a person sees themselves. Self-image is fundamental in coaching.
- **Current mood** (Focused, Restless, Hopeful...) — Captures the user's emotional state so the AI can mirror and validate it in the narrative.
- **Driving goal** (Growth, Courage, Balance...) — The core of any coaching session: direction. This single field gives the AI the most meaningful signal.

These six inputs were chosen because together they form a complete psychological snapshot — from identity to values. The AI combines all of them into a unique second-person narrative (`"You are..."`) that feels empowering and personal to each user.

---

### 2. Where does AI genuinely add value — and where would it be wasteful?

**Where AI adds real value:**

Every user's combination of inputs is unique. Producing a narrative that meaningfully integrates name, age, gender, archetype, mood, and goal would either be too simplistic or too repetitive with static templates. The AI reads this combination and produces a poetic, emotionally resonant description that fits exactly that person at that moment.

```dart
// openai_service.dart — prompt structure
'You are ${r.name} the ${r.archetype}, ...'
'Driven by "${r.goal}", your ${r.mood} spirit...'
```

On top of that, the AI is instructed to surface one special ability and one signature flaw — a classic coaching framework (strength + shadow side) that would be hollow if hard-coded.

**Where it would be wasteful:**

- **Form validation** — Checking whether a name is empty or an age is out of range is plain Dart logic. Sending it to an LLM would be absurd.
- **Displaying the archetype label** — Showing `"You chose Warrior"` requires no AI.
- **Firestore read/write** — Database operations have nothing to do with AI.
- **The mock fallback** — When no API key is present, the app uses a template-based mock response. That mock is intentionally lightweight and covers the offline case without wasting API calls.

---

### 3. How would I handle the privacy of sensitive inputs (age, gender, preferences)?

**Current state:**

This is a test application. Data is written to Firebase Firestore and sent to the OpenAI API. Both surfaces carry risk.

**Approaches to apply in production:**

| Risk | Mitigation |
|---|---|
| API key stored on the client (`.env`) | Move to a backend proxy. The client should never call OpenAI directly — it calls your own server, which holds the key. |
| Age + gender sent to OpenAI | Send a range instead of an exact age (`"late 20s"` rather than `27`). Replace gender with archetype-based pronouns to reduce identifiability. |
| Name stored in plaintext in Firestore | Pseudonymize: store a hash-based ID instead of the real name, or encrypt the field at rest. |
| No user consent flow | Add an explicit consent screen before any data is collected — required for GDPR/CCPA compliance. |
| Mood + goal are psychological data | These inputs should either be anonymized before being sent to a third-party model, or processed entirely on-device using a local inference model. |

**The most important principle:** users must know what is being collected and why. This app currently has no privacy notice — that would be the first thing to add before any real-world release.
