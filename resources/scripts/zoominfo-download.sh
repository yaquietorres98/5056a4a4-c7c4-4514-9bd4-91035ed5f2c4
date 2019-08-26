#!/usr/bin/env bash

ZOOMINFO_SITEMAP_URL="https://www.zoominfo.com/sitemap-company-index-0.xml"
ZOOMINFO_SITEMAP_XML="zoominfo-sitemap.xml"
ZOOMINFO_SITEMAP_TXT="zoominfo-stiemap.txt"
ZOOMINFO_DATA_PATH="$(pwd)/../data/zoominfo"
ZOOMINFO_TEMPFILE=".temp"

download() {
  local sitemap="${1}"
  local filename="${ZOOMINFO_DATA_PATH}/$(grep -oP '(?<=company-).*?(?=.xml)' <<< ${sitemap}).txt"
  echo "[INFO] Downloading ${sitemap} info ${filename};"
  curl -X GET -o "${ZOOMINFO_TEMPFILE}" "${sitemap}"
  cat "${ZOOMINFO_TEMPFILE}" | grep -oP '(?<=https://).*?(?=</loc>)' | grep .com/c >> "${filename}"
  rm "${ZOOMINFO_TEMPFILE}"
}

# Download xml file
echo "[INFO] Downloading sitemap xml-file;"
curl -X GET -o "${ZOOMINFO_SITEMAP_XML}" "${ZOOMINFO_SITEMAP_URL}"

# Create plain/text file
echo "[INFO] Creating plain/text file;"
cat "${ZOOMINFO_SITEMAP_XML}" |
  grep -oP '(?<=http).*?(?=xml)' | # Filter any line that satisfies the regex.
  grep company | # Filter any line that contains the company table.
  sed 's/$/xml/' | # Appends "xml" to the end of the string. The line below prepends "http".
  sed 's/^/http/' \
  >> "${ZOOMINFO_SITEMAP_TXT}" # Write resutls into a plain/text format.

# Download company urls
mkdir -p "${ZOOMINFO_DATA_PATH}"
echo "[INFO] Starting sitemap-urls download;"
while read -r sitemap_url; do
  download "${sitemap_url}"
done < "${ZOOMINFO_SITEMAP_TXT}"
echo "[INFO] Done;"
