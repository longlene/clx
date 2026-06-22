# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.4
	android_system_properties@0.1.5
	atty@0.2.14
	autocfg@1.5.1
	bindgen@0.60.1
	bitflags@1.3.2
	bitflags@2.13.0
	bumpalo@3.20.3
	cc@1.2.63
	cexpr@0.6.0
	cfg-if@1.0.4
	chrono@0.4.45
	clang-sys@1.8.1
	clap@3.2.25
	clap_lex@0.2.4
	core-foundation-sys@0.8.7
	either@1.16.0
	env_logger@0.9.3
	errno@0.3.14
	find-msvc-tools@0.1.9
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	getrandom@0.2.17
	glob@0.3.3
	hashbrown@0.12.3
	hermit-abi@0.1.19
	home@0.5.12
	humantime@2.3.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	indexmap@1.9.3
	itoa@1.0.18
	js-sys@0.3.100
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.186
	libloading@0.8.9
	linux-raw-sys@0.4.15
	log@0.4.32
	memchr@2.8.1
	minimal-lexical@0.2.1
	nom@7.1.3
	num-traits@0.2.19
	once_cell@1.21.4
	os_str_bytes@6.6.1
	peeking_take_while@0.1.2
	pin-project-lite@0.2.17
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	quote@1.0.45
	rand@0.8.6
	rand_chacha@0.3.1
	rand_core@0.6.4
	regex-automata@0.4.14
	regex-syntax@0.8.11
	regex@1.12.4
	rustc-hash@1.1.0
	rustix@0.38.44
	rustversion@1.0.22
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	shlex@1.3.0
	shlex@2.0.1
	slab@0.4.12
	sqlite-loadable-macros@0.0.3
	sqlite-loadable@0.0.6-alpha.6
	sqlite3ext-sys@0.0.1
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.117
	termcolor@1.4.1
	textwrap@0.16.2
	unicode-ident@1.0.24
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.123
	wasm-bindgen-macro@0.2.123
	wasm-bindgen-shared@0.2.123
	wasm-bindgen@0.2.123
	which@4.4.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.59.0
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	zerocopy-derive@0.8.52
	zerocopy@0.8.52
	zmij@1.0.21
"

inherit cargo

DESCRIPTION="A SQLite extension for working with TIDs (Timestamp Identifiers)"
HOMEPAGE="https://github.com/asg017/sqlite-tid"

MY_COMMIT="7756b3482604130d17eed605e5a70a1692ef9982"
SRC_URI="
	https://github.com/asg017/sqlite-tid/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/sqlite-tid-${MY_COMMIT}"

LICENSE="|| ( Apache-2.0 MIT ) Apache-2.0 BSD ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

# clang-sys@1.8.1 (used by bundled bindgen@0.60.1) supports libclang 3.5–17.0.
# The system default clang (22) is outside that range and produces opaque bindgen
# output for complex structs.  Pin to clang 16 which is within the supported range.
BDEPEND="llvm-core/clang llvm-core/clang:16"

src_prepare() {
	default
	# git is unavailable in the portage sandbox; replace with a stub
	cat > build.rs <<'EOF' || die
fn main() {
	println!("cargo:rustc-env=GIT_HASH=unknown");
}
EOF
}

src_compile() {
	export LIBCLANG_PATH=/usr/lib/llvm/16/lib64
	cargo_src_compile
}

src_install() {
	newlib.so target/release/libsqlite_tid.so tid0.so
	dodoc README.md
}
