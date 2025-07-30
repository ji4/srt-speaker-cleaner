# 🎬 Speaker Prefix Remover

A simple shell script to remove speaker labels from subtitle files (.srt).

## 🔄 Before & After

| Before Processing | After Processing |
|-------------------|------------------|
| `15`<br>`00:01:23,450 --> 00:01:26,180`<br>`Speaker 1: Hi everyone` | `15`<br>`00:01:23,450 --> 00:01:26,180`<br>`Hi everyone` |
| `16`<br>`00:01:26,850 --> 00:01:29,720`<br>`Speaker 2: Thanks for joining` | `16`<br>`00:01:26,850 --> 00:01:29,720`<br>`Thanks for joining` |
| `17`<br>`00:01:30,120 --> 00:01:33,890`<br>`Speaker 1: Let's start` | `17`<br>`00:01:30,120 --> 00:01:33,890`<br>`Let's start` |
| `18`<br>`00:01:34,200 --> 00:01:37,650`<br>`Speaker 3: Sounds good` | `18`<br>`00:01:34,200 --> 00:01:37,650`<br>`Sounds good` |
| `19`<br>`00:01:38,100 --> 00:01:41,920`<br>`Speaker 2: Perfect` | `19`<br>`00:01:38,100 --> 00:01:41,920`<br>`Perfect` |

## 🚀 Quick Start

### One-Line Usage
```bash
sed 's/^Speaker [0-9]*: //g' input.srt > output.srt
```

### Download Script
```bash
curl -O https://raw.githubusercontent.com/yourusername/speaker-remover/main/remove_speaker_prefix.sh
chmod +x remove_speaker_prefix.sh
./remove_speaker_prefix.sh input.srt output.srt
```

## 📦 Installation

### Method 1: Simple Setup
```bash
# 1. Create bin folder
mkdir -p ~/bin

# 2. Copy script
cp remove_speaker_prefix.sh ~/bin/rmspeaker
chmod +x ~/bin/rmspeaker

# 3. Add to PATH
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# 4. Use it
rmspeaker input.srt
```

### Method 2: With Tab Completion (macOS)
```bash
# Follow Method 1, then add:
echo '_rmspeaker() { _files -g "*.srt" }' >> ~/.zshrc
echo 'compdef _rmspeaker rmspeaker' >> ~/.zshrc
source ~/.zshrc

# Now tab shows only .srt files
rmspeaker [Tab]
```

## 💡 More Examples

### Podcast Interview
```
Before: Speaker 1: How did you start?
After:  How did you start?

Before: Speaker 2: It began in 2019
After:  It began in 2019
```

### Online Class  
```
Before: Speaker 4: Today's topic is React
After:  Today's topic is React

Before: Speaker 5: Any questions?
After:  Any questions?
```

### Support Call
```
Before: Speaker 1: How can I help?
After:  How can I help?

Before: Speaker 2: I need assistance
After:  I need assistance
```

## 🔧 Batch Processing
```bash
# Process all .srt files
for file in *.srt; do
    rmspeaker "$file" "${file%.*}_clean.srt"
done
```

## 🆘 Troubleshooting

**Permission denied?**
```bash
chmod +x remove_speaker_prefix.sh
```

**Command not found?**
```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Tab completion not working?**
```bash
source ~/.zshrc
```

## 📋 Requirements
- macOS or Linux
- Built-in `sed` command

## 🤝 Contributing
1. Fork this repo
2. Make your changes  
3. Submit a pull request