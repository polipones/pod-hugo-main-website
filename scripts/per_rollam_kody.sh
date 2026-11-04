#!/bin/sh
# Vygeneruje unikátní hlasovací kódy pro hlasování per rollam a jejich SHA-512 hashe.
#
# Použití: per_rollam_kody.sh seznam.txt [adresar_pro_kody]
#   seznam.txt        jedno jméno hlasujícího na řádek
#   adresar_pro_kody  kam uložit soubor s kódy (výchozí $HOME, nikdy do repa)
#
# Na stdout vypíše Markdown řádky pro stránku /dokumenty/ (pouze hashe),
# kódy uloží do samostatného souboru s právy 600.

set -eu

seznam=${1:-}
[ -n "$seznam" ] || { echo "Použití: $0 seznam.txt [adresar_pro_kody]" >&2; exit 2; }
[ -r "$seznam" ] || { echo "Nelze číst: $seznam" >&2; exit 2; }

adresar=${2:-$HOME}
[ -d "$adresar" ] || { echo "Adresář neexistuje: $adresar" >&2; exit 2; }

command -v openssl >/dev/null 2>&1 || { echo "Chybí openssl" >&2; exit 2; }

jmena=$(grep -ve '^[[:space:]]*$' "$seznam" || true)
[ -n "$jmena" ] || { echo "Seznam je prázdný" >&2; exit 2; }

duplikaty=$(printf '%s\n' "$jmena" | sort | uniq -d)
[ -z "$duplikaty" ] || { echo "Duplicitní jména: $duplikaty" >&2; exit 2; }

pocet=$(printf '%s\n' "$jmena" | wc -l | tr -d ' ')

zaklad="$adresar/kody-per-rollam-$(date +%Y%m%d-%H%M%S)"
kody="$zaklad.txt"
n=1
while [ -e "$kody" ]; do
	n=$((n + 1))
	kody="$zaklad-$n.txt"
done

umask 077
: > "$kody"

hash_kodu() {
	printf %s "$1" | openssl dgst -sha512 | awk '{print $NF}'
}

printf '%s\n' "$jmena" | while IFS= read -r jmeno; do
	kod=$(openssl rand -hex 16)
	hash=$(hash_kodu "$kod")
	case $hash in
		*[!0-9a-f]*|'') echo "Neočekávaný výstup openssl pro '$jmeno'" >&2; exit 1 ;;
	esac
	[ ${#hash} -eq 128 ] || { echo "Hash nemá 128 znaků pro '$jmeno'" >&2; exit 1; }

	printf '%s\t%s\n' "$jmeno" "$kod" >> "$kody"
	printf '%s:\n- %s\n\n' "$jmeno" "$hash"
done || exit 1

echo "---" >&2
echo "Hlasujících: $pocet" >&2
echo "Kódy k rozeslání (SMS/Messenger): $kody" >&2
