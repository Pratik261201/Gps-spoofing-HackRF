A well-structured GitHub repository for your **GPS spoofing project using `gps-sdr-sim` & `HackRF`** 


---

### 📝 Suggested `README.md` Content

Here’s a sample `README.md` you can start with:

---

```markdown
# GPS Spoofing using gps-sdr-sim

This project demonstrates how to spoof GPS signals using [gps-sdr-sim](https://github.com/osqzss/gps-sdr-sim). The project allows simulation of both static and dynamic GPS locations using RTL-SDR or HackRF.

---

## 🚀 Features

- Simulate static and dynamic GPS positions
- Generate binary I/Q GPS signal files
- Test scenarios with LLH, ECEF, or NMEA motion profiles
- Spoof GPS location using hardware like HackRF

---

## 📁 Project Structure

```

gps-spoofing-sim/
├── ephemeris/        # RINEX ephemeris files
├── user\_motion/      # Dynamic motion files (ECEF, LLH, NMEA)
├── output/           # Generated GPS signal binary files
├── simulation\_scripts/ # Shell scripts for automation
├── docs/             # Additional documentation

````

---

## 🛠 Requirements

- Linux or WSL
- `gps-sdr-sim` (C++ based simulator)
- Ephemeris file (RINEX format, e.g., `brdc1520.25n`)
- Optionally: HackRF or RTL-SDR for transmitting
- (Optional) GNSS-SDR for analysis

---




## 🧪 Simulation Commands

### Static Location
```bash
./gps-sdr-sim -e brdc1520.25n -l 38.6139,37.2090,100 -t 2025/06/1,9:50:00 -d 600 -b 8 -o gpssim.bin
````

### Dynamic (ECEF)

```bash
./gps-sdr-sim -e brdc1520.25n -u user_motion/circle.csv -t 2025/06/1,9:50:00 -d 600 -b 8 -o gpssim.bin
```

### Dynamic (LLH)

```bash
./gps-sdr-sim -e brdc1520.25n -x user_motion/circle_llh.csv -t 2025/06/1,9:50:00 -d 600 -b 8 -o gpssim.bin
```

### Dynamic (NMEA GGA)

```bash
./gps-sdr-sim -e brdc1520.25n -g user_motion/triumphv3.txt -t 2025/06/1,9:50:00 -d 600 -b 8 -o gpssim.bin
```

---

## 📡 Transmitting the GPS Signal

To transmit using HackRF:

```bash
hackrf_transfer -t gpssim.bin -f 1575420000 -s 2600000
```

⚠️ **WARNING:** Spoofing GPS is illegal in many countries. Only test in controlled environments like Faraday cages or with shielded receivers.

---

## 📸 Screenshots

![Example Output](screenshots/example_output.png)

---

## 📄 License

MIT License

---

## 👨‍💻 Author

Pratik Chouragadey
IEEE PES Society, MITS-GWL
[LinkedIn](#) | [Email](#)

````

---

### 🔄 Optional Automation Script (run_simulation.sh)

```bash
#!/bin/bash
./gps-sdr-sim -e ephemeris/brdc1520.25n -x user_motion/circle_llh.csv -t 2025/06/1,9:50:00 -d 600 -b 8 -o output/gpssim.bin
````

Make it executable:

```bash
chmod +x simulation_scripts/run_simulation.sh
```

