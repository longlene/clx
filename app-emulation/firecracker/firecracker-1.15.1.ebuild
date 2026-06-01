# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.93.0"

CRATES="
	aho-corasick@1.1.4
	alloca@0.4.0
	anes@0.1.6
	anstream@0.6.21
	anstyle-parse@0.2.7
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.13
	arrayvec@0.7.6
	autocfg@1.5.0
	aws-lc-rs@1.16.2
	aws-lc-sys@0.39.0
	base64@0.22.1
	bindgen@0.69.5
	bitcode@0.6.9
	bitcode_derive@0.6.9
	bitflags@1.3.2
	bitflags@2.10.0
	bitvec@1.0.1
	bumpalo@3.19.1
	bytemuck@1.24.0
	byteorder@1.5.0
	cargo_toml@0.22.3
	cast@0.3.0
	cc@1.2.55
	cexpr@0.6.0
	cfg-if@1.0.4
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clang-sys@1.8.1
	clap-num@1.2.0
	clap@4.5.57
	clap_builder@4.5.57
	clap_derive@4.5.55
	clap_lex@0.7.7
	cmake@0.1.57
	colorchoice@1.0.4
	convert_case@0.10.0
	crc64@2.0.0
	criterion-plot@0.8.2
	criterion@0.8.2
	crunchy@0.2.4
	derive_more-impl@2.1.1
	derive_more@2.1.1
	device_tree@1.1.0
	displaydoc@0.2.5
	dunce@1.0.5
	either@1.15.0
	env_filter@0.1.4
	env_logger@0.11.8
	equivalent@1.0.2
	errno@0.3.14
	event-manager@0.4.2
	find-msvc-tools@0.1.9
	fs_extra@1.3.0
	funty@2.0.0
	gdbstub@0.7.9
	gdbstub_arch@0.3.2
	getrandom@0.3.4
	glam@0.30.10
	glob@0.3.3
	half@2.7.1
	hashbrown@0.16.1
	heck@0.5.0
	indexmap@2.13.0
	is_terminal_polyfill@1.70.2
	itertools@0.12.1
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.17
	jiff-static@0.2.19
	jiff@0.2.19
	jobserver@0.1.34
	js-sys@0.3.85
	kvm-bindings@0.14.0
	kvm-ioctls@0.24.0
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.180
	libloading@0.8.9
	linux-loader@0.13.2
	linux-raw-sys@0.11.0
	log@0.4.29
	managed@0.8.0
	memchr@2.8.0
	memfd@0.6.5
	minimal-lexical@0.2.1
	nix@0.27.1
	nom@7.1.3
	num-traits@0.2.19
	once_cell@1.21.3
	once_cell_polyfill@1.70.2
	oorandom@11.1.5
	page_size@0.6.0
	paste@1.0.15
	portable-atomic-util@0.2.5
	portable-atomic@1.13.1
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	proptest@1.10.0
	quote@1.0.44
	r-efi@5.3.0
	radium@0.7.0
	rand@0.9.2
	rand_chacha@0.9.0
	rand_core@0.9.5
	rand_xorshift@0.4.0
	regex-automata@0.4.14
	regex-syntax@0.8.9
	regex@1.12.3
	rustc-hash@1.1.0
	rustc_version@0.4.1
	rustix@1.1.3
	rustversion@1.0.22
	same-file@1.0.6
	semver@1.0.27
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.149
	serde_spanned@1.0.4
	serde_test@1.0.177
	shlex@1.3.0
	slab@0.4.12
	strsim@0.11.1
	syn@2.0.114
	tap@1.0.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	tinytemplate@1.2.1
	toml@0.9.11+spec-1.1.0
	toml_datetime@0.7.5+spec-1.1.0
	toml_parser@1.0.6+spec-1.1.0
	toml_writer@1.0.6+spec-1.1.0
	unarray@0.1.4
	unicode-ident@1.0.23
	unicode-segmentation@1.12.0
	unicode-xid@0.2.6
	untrusted@0.7.1
	userfaultfd-sys@0.6.0
	userfaultfd@0.9.0
	utf8parse@0.2.2
	uuid@1.20.0
	vhost@0.15.0
	vm-allocator@0.1.3
	vm-fdt@0.3.0
	vm-memory@0.17.1
	vm-superio@0.8.1
	vmm-sys-util@0.15.0
	walkdir@2.5.0
	wasip2@1.0.2+wasi-0.2.9
	wasm-bindgen-macro-support@0.2.108
	wasm-bindgen-macro@0.2.108
	wasm-bindgen-shared@0.2.108
	wasm-bindgen@0.2.108
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.2.1
	windows-sys@0.61.2
	winnow@0.7.14
	wit-bindgen@0.51.0
	wyz@0.5.1
	zerocopy-derive@0.8.39
	zerocopy@0.8.39
	zeroize@1.8.2
	zmij@1.0.20
"

declare -A GIT_CRATES=(
	[micro_http]='https://github.com/firecracker-microvm/micro-http;5c2254d6cf4f32a668d0d8e57ba20bebad9d4fba;micro-http-%commit%'
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
KEYWORDS="~amd64"

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
