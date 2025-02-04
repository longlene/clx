# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs

DESCRIPTION="OpenAI's Whisper models converted to ggml format"
HOMEPAGE="https://huggingface.co/ggerganov/whisper.cpp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

MODELS=(
	"base" "base-q5_1" "base.en" "base.en-q5_1"
	"tiny" "tiny-q5_1" "tiny.en" "tiny.en-q5_1"
	"small" "small-q5_1" "small.en" "small.en-q5_1"
	"medium" "medium-q5_0" "medium.en" "medium.en-q5_0"
	"large-v1" "large-v2" "large-v3" "large-v3-q5_0"
)

REQUIRED_USE="|| ("
for i in ${MODELS[@]}; do
	use_default=""
	if [ "$i" == "base" ]; then
		use_default="+"
	elif [ "$i" == "large-v1" -o "$i" == "large-v2" ]; then
		use_default="-"
	fi
	IUSE="${IUSE} ${use_default}${i/./-}"
	REQUIRED_USE="${REQUIRED_USE} ${i/./-}"
	SRC_URI="${SRC_URI} ${i/./-}? ( https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-${i}.bin -> whisper-ggml-${i}.bin )"
done

IUSE="${IUSE} small-en-tdrz"
SRC_URI="${SRC_URI} small-en-tdrz? ( https://huggingface.co/akashmjn/tinydiarize-whisper.cpp/resolve/main/ggml-small.en-tdrz.bin -> whisper-ggml-small.en-tdrz.bin )"
REQUIRED_USE="${REQUIRED_USE} small-en-tdrz )"

whisper_check-reqs() {
	req=0
	use large-v1 && req=$((req+3100))
	use large-v2 && req=$((req+3100))
	use large-v3 && req=$((req+3100))
	use large-v3-q5_0 && req=$((req+1100))
	use medium && req=$((req+1500))
	use medium-en && req=$((req+1500))
	use medium-q5_0 && req=$((req+540))
	use medium-en-q5_0 && req=$((req+540))
	use small && req=$((req+490))
	use small-en && req=$((req+490))
	use small-en-tdrz && req=$((req+490))
	if [ $req -ne 0 ]; then
		CHECKREQS_DISK_BUILD="${req}M"
		CHECKREQS_DISK_USR="${req}M"
		"$@"
	fi
}

whisper-find-alternative-default() {
	for i in ${MODELS[@]}; do
		use ${i/./-} && return "$i"
	done
	use small-en-tdrz && return "small.en-tdrz"
}

pkg_pretend() {
	whisper_check-reqs check-reqs_pkg_pretend
}

pkg_setup() {
	whisper_check-reqs check-reqs_pkg_setup
}

src_unpack() { :; }

src_install() {
	insinto /usr/share/whisper/models
	for i in ${MODELS[@]} small.en-tdrz; do
		use ${i/./-} && newins "${DISTDIR}/whisper-ggml-${i}.bin" "${i}.bin"
	done

	# Install a symlink to one of the installed models so whisper-cpp can find it
	for i in ${MODELS[@]} small.en-tdrz; do
		if use ${i/./-}; then
			einfo "Selecting $i as the default model for whisper-cpp"
			dosym "models/${i}.bin" "/usr/share/whisper/whisper-default.bin"
			break
		fi
	done
}
