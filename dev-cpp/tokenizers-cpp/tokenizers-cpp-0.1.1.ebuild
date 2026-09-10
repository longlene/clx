# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.8.12
	aho-corasick@1.1.4
	base64@0.13.1
	bitflags@2.13.0
	castaway@0.2.4
	cc@1.2.65
	cfg-if@1.0.4
	compact_str@0.9.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	darling@0.20.11
	darling_core@0.20.11
	darling_macro@0.20.11
	dary_heap@0.3.9
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	either@1.16.0
	esaxx-rs@0.1.10
	find-msvc-tools@0.1.9
	fnv@1.0.7
	getrandom@0.3.4
	ident_case@1.0.1
	itertools@0.14.0
	itoa@1.0.18
	libc@0.2.186
	log@0.4.33
	macro_rules_attribute-proc_macro@0.2.2
	macro_rules_attribute@0.2.2
	memchr@2.8.2
	minimal-lexical@0.2.1
	monostate-impl@0.1.18
	monostate@0.1.18
	nom@7.1.3
	once_cell@1.21.4
	onig@6.5.3
	onig_sys@69.9.3
	paste@1.0.15
	pkg-config@0.3.33
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	quote@1.0.46
	r-efi@5.3.0
	rand@0.9.4
	rand_chacha@0.9.0
	rand_core@0.9.5
	rayon-cond@0.4.0
	rayon-core@1.13.0
	rayon@1.12.0
	regex-automata@0.4.14
	regex-syntax@0.8.11
	regex@1.12.4
	rustversion@1.0.22
	ryu@1.0.23
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	shlex@2.0.1
	smallvec@1.15.2
	spm_precompiled@0.1.4
	static_assertions@1.1.0
	strsim@0.11.1
	syn@2.0.118
	thiserror-impl@2.0.18
	thiserror@2.0.18
	tokenizers@0.21.4
	unicode-ident@1.0.24
	unicode-normalization-alignments@0.1.12
	unicode-segmentation@1.13.3
	unicode_categories@0.1.1
"

inherit cargo cmake

DESCRIPTION="Universal cross-platform C++ tokenizers binding to HuggingFace and sentencepiece"
HOMEPAGE="https://github.com/mlc-ai/tokenizers-cpp"
SRC_URI="
	https://github.com/mlc-ai/tokenizers-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	dev-cpp/msgpack-cxx
	dev-libs/oniguruma:=
	sci-ml/sentencepiece:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	${RUST_DEPEND}
	virtual/pkgconfig
"

PATCHES=( "${FILESDIR}/${P}-system-deps.patch" )

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	cp "${FILESDIR}/cargo-lock-${PV}.lock" rust/Cargo.lock || die
	cargo_gen_config
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DMLC_ENABLE_SENTENCEPIECE_TOKENIZER=ON
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins include/tokenizers_c.h include/tokenizers_cpp.h
	dolib.a "${BUILD_DIR}"/libtokenizers_cpp.a
	dolib.a "${BUILD_DIR}"/libtokenizers_c.a
	einstalldocs
}
