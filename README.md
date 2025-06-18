

# 🚀 GPS Spoofing Project using `gps-sdr-sim` & HackRF

![GPS Spoofing Banner](screenshots/banner.png)

> Simulate and spoof GPS signals — static or dynamic — using open-source tools and SDR hardware.

---

## 🔥 Overview

This project demonstrates GPS signal spoofing using the powerful [gps-sdr-sim](https://github.com/osqzss/gps-sdr-sim) simulator. Generate custom GPS I/Q data streams to test devices with **static** or **dynamic** location profiles, and transmit using SDR devices like HackRF.

---

## ⚙️ Features

- 🎯 Simulate **static GPS locations** with precise coordinates and altitude
- 🔄 Create **dynamic GPS tracks** with ECEF, LLH, or NMEA motion profiles
- 💾 Generate GPS binary I/Q signal files compatible with SDR transmitters
- 📡 Transmit spoofed signals using **HackRF** or **RTL-SDR**
- 📊 Supports ephemeris RINEX files for accurate satellite data

---

## 🗂️ Project Structure

```plaintext
gps-spoofing-sim/
├── ephemeris/           # RINEX ephemeris files (e.g., brdc1520.25n)
├── user_motion/         # Dynamic motion files (ECEF, LLH, NMEA)
├── output/              # Generated GPS signal binary files
├── simulation_scripts/  # Automation shell scripts
├── docs/                # Additional documentation and references
├── screenshots/         # Images and examples
````

---

## 🛠️ Requirements

* Linux or WSL environment
* [gps-sdr-sim](https://github.com/osqzss/gps-sdr-sim) (C++ GPS signal simulator)
* Ephemeris file in RINEX format (e.g., `brdc1520.25n`)
* HackRF or RTL-SDR (for transmission)
* (Optional) GNSS-SDR for signal analysis

---

## 🧪 How to Run Simulations

### Static Location Example

```bash
./gps-sdr-sim -e ephemeris/brdc1520.25n -l 38.6139,37.2090,100 -t 2025/06/1,09:50:00 -d 600 -b 8 -o output/gpssim.bin
```

### Dynamic Location Examples

* **ECEF Motion Profile**

  ```bash
  ./gps-sdr-sim -e ephemeris/brdc1520.25n -u user_motion/circle.csv -t 2025/06/1,09:50:00 -d 600 -b 8 -o output/gpssim.bin
  ```

* **LLH Motion Profile**

  ```bash
  ./gps-sdr-sim -e ephemeris/brdc1520.25n -x user_motion/circle_llh.csv -t 2025/06/1,09:50:00 -d 600 -b 8 -o output/gpssim.bin
  ```

* **NMEA GGA Motion Profile**

  ```bash
  ./gps-sdr-sim -e ephemeris/brdc1520.25n -g user_motion/triumphv3.txt -t 2025/06/1,09:50:00 -d 600 -b 8 -o output/gpssim.bin
  ```

---

## 📡 Transmitting the GPS Signal with HackRF

Use the following command to transmit the generated GPS I/Q file:

```bash
hackrf_transfer -t output/gpssim.bin -f 1575420000 -s 2600000
```

> **⚠️ WARNING:** GPS spoofing is illegal in many jurisdictions. Use only in controlled environments such as Faraday cages or shielded labs for research and testing.

---

## 📸 Screenshots

![GPS Signal Simulation Output](screenshots/Screenshot (1).png)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Pratik Chouragadey**
IEEE PES Society, MITS-GWL

[LinkedIn](https://linkedin.com/in/pratik-chouragadey) | [Email](mailto:pratik@example.com)

---

## 🔄 Optional: Automation Script

Run this script to execute a predefined simulation:

```bash
#!/bin/bash
./gps-sdr-sim -e ephemeris/brdc1520.25n -x user_motion/circle_llh.csv -t 2025/06/1,09:50:00 -d 600 -b 8 -o output/gpssim.bin
```

Make executable:

```bash
chmod +x simulation_scripts/run_simulation.sh
```

Run:

```bash
./simulation_scripts/run_simulation.sh
```

---

Thank you for exploring GPS spoofing safely and responsibly! 🚀

```

---

