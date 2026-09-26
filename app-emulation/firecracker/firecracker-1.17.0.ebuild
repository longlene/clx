# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.93.0"

CRATES="
	aho-corasick@1.1.5
	alloca@0.4.0
	anes@0.1.6
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	arrayvec@0.7.8
	autocfg@1.5.1
	aws-lc-rs@1.18.0
	aws-lc-sys@0.44.0
	base64@0.23.1
	bindgen@0.69.5
	bitcode@0.6.9
	bitcode_derive@0.6.9
	bitflags@1.3.2
	bitflags@2.13.1
	bitvec@1.1.1
	bumpalo@3.20.3
	bytemuck@1.25.2
	byteorder@1.5.0
	cargo_toml@1.0.0
	cast@0.3.0
	cc@1.4.4
	cexpr@0.6.0
	cfg-if@1.0.4
	chacha20@0.10.2
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clang-sys@1.9.1
	clap-num@1.2.0
	clap@4.6.6
	clap_builder@4.6.6
	clap_derive@4.6.4
	clap_lex@1.1.0
	cmake@0.1.58
	colorchoice@1.0.5
	convert_case@0.10.0
	cpufeatures@0.3.0
	crc64@2.0.0
	criterion-plot@0.8.2
	criterion@0.8.2
	crunchy@0.2.4
	defmt-macros@1.1.1
	defmt-parser@1.0.0
	defmt@1.1.1
	derive_more-impl@2.1.1
	derive_more@2.1.1
	device_tree@1.1.0
	displaydoc@0.2.7
	dunce@1.0.5
	either@1.18.0
	env_filter@2.0.0
	env_logger@0.11.11
	equivalent@1.0.2
	errno@0.3.14
	event-manager@0.4.2
	find-msvc-tools@0.1.11
	fs_extra@1.3.0
	funty@2.0.0
	futures-core@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	gdbstub@0.7.10
	gdbstub_arch@0.3.3
	getrandom@0.3.4
	getrandom@0.4.3
	glam@0.33.5
	glob@0.3.4
	half@2.7.1
	hashbrown@0.17.1
	heck@0.5.0
	indexmap@2.14.0
	is_terminal_polyfill@1.70.2
	itertools@0.12.1
	itertools@0.13.0
	itertools@0.15.0
	itoa@1.0.18
	jiff-core@0.1.0
	jiff-static@0.2.35
	jiff@0.2.35
	jobserver@0.1.35
	js-sys@0.3.104
	kvm-bindings@0.14.1
	kvm-ioctls@0.25.0
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.189
	libloading@0.8.9
	linux-loader@0.14.0
	linux-raw-sys@0.12.1
	log@0.4.33
	managed@0.8.0
	memchr@2.8.3
	memfd@0.6.5
	minimal-lexical@0.2.1
	nix@0.27.1
	nom@7.1.3
	num-traits@0.2.19
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	oorandom@11.1.5
	page_size@0.6.0
	pastey@0.2.3
	pin-project-lite@0.2.17
	pkg-config@0.3.34
	portable-atomic-util@0.2.7
	portable-atomic@1.15.0
	ppv-lite86@0.2.21
	proc-macro2@1.0.107
	proptest@1.11.0
	quote@1.0.47
	r-efi@5.3.0
	r-efi@6.0.0
	radium@0.7.0
	rand@0.10.2
	rand@0.9.5
	rand_chacha@0.9.0
	rand_core@0.10.1
	rand_core@0.9.5
	rand_xorshift@0.4.0
	regex-automata@0.4.18
	regex-syntax@0.8.11
	regex@1.13.1
	rustc-hash@1.1.0
	rustc_version@0.4.1
	rustix@1.1.4
	rustversion@1.0.23
	same-file@1.0.6
	semver@1.0.28
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	serde_spanned@1.1.1
	shlex@1.3.0
	shlex@2.0.1
	slab@0.4.12
	strsim@0.11.1
	syn@2.0.119
	syn@3.0.3
	tap@1.0.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.20
	thiserror@1.0.69
	thiserror@2.0.20
	tinytemplate@1.2.1
	toml@1.1.4+spec-1.1.0
	toml_datetime@1.1.1+spec-1.1.0
	toml_parser@1.1.3+spec-1.1.0
	toml_writer@1.1.2+spec-1.1.0
	unarray@0.1.4
	unicode-ident@1.0.24
	unicode-segmentation@1.13.3
	unicode-xid@0.2.6
	untrusted@0.7.1
	userfaultfd-sys@0.6.0
	userfaultfd@0.9.0
	utf8parse@0.2.2
	uuid@1.24.1
	vhost@0.17.0
	vm-allocator@0.1.4
	vm-fdt@0.3.0
	vm-memory@0.18.0
	vm-superio@0.8.1
	vmm-sys-util@0.15.0
	walkdir@2.5.0
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen-macro-support@0.2.127
	wasm-bindgen-macro@0.2.127
	wasm-bindgen-shared@0.2.127
	wasm-bindgen@0.2.127
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.2.1
	windows-sys@0.61.2
	winnow@1.0.4
	wit-bindgen@0.57.1
	wyz@0.5.1
	zerocopy-derive@0.8.56
	zerocopy@0.8.56
	zeroize@1.9.0
	zmij@1.0.23
"

declare -A GIT_CRATES=(
	[micro_http]='https://github.com/firecracker-microvm/micro-http;7975fe0e59000e8c41cb1d58fbd39ffa102e5b27;micro-http-%commit%'
)

inherit cargo

DESCRIPTION="Secure and fast microVMs for serverless computing"
HOMEPAGE="http://firecracker-microvm.io https://github.com/firecracker-microvm/firecracker"
SRC_URI="
	https://github.com/firecracker-microvm/firecracker/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 0BSD BSD ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# aws-lc-sys bundles AWS-LC C library (needs cmake); bindgen needs libclang
BDEPEND="
	dev-build/cmake
	llvm-core/clang:=
"

src_install() {
	local release="${S}/build/cargo_target/release"
	dobin "${release}"/firecracker
	dobin "${release}"/cpu-template-helper
	dobin "${release}"/rebase-snap
	dobin "${release}"/seccompiler-bin
	dobin "${release}"/snapshot-editor
	dodoc README.md CHANGELOG.md
}
