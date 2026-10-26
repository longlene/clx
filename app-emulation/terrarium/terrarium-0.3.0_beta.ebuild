# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# union of the root and components/ Cargo.lock registries (no git deps)
CRATES="
	addr2line@0.26.1
	adler2@2.0.1
	ahash@0.8.12
	allocator-api2@0.2.21
	ambient-authority@0.0.2
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.104
	applevisor-sys@1.0.0
	applevisor@1.0.0
	arbitrary@1.5.0
	arrayvec@0.7.8
	async-io@2.6.0
	async-trait@0.1.92
	autocfg@1.5.1
	bitflags@1.3.2
	bitflags@2.13.2
	block-buffer@0.10.4
	block-buffer@0.12.1
	bumpalo@3.20.3
	bytes@1.12.1
	cap-primitives@4.0.3
	capstone-sys@0.18.0
	capstone@0.14.0
	cc@1.8.0
	cfg-if@1.0.5
	cfg_aliases@0.2.2
	chacha20@0.10.2
	clap@4.6.7
	clap_builder@4.6.7
	clap_complete@4.6.11
	clap_derive@4.6.7
	clap_lex@1.1.1
	clap_mangen@0.3.3
	cobs@0.3.0
	colorchoice@1.0.5
	concurrent-queue@2.5.0
	core_detect@1.0.0
	cpp_demangle@0.5.1
	cpufeatures@0.2.17
	cpufeatures@0.3.1
	cranelift-assembler-x64-meta@0.137.0
	cranelift-assembler-x64@0.137.0
	cranelift-bforest@0.137.0
	cranelift-bitset@0.137.0
	cranelift-codegen-meta@0.137.0
	cranelift-codegen-shared@0.137.0
	cranelift-codegen@0.137.0
	cranelift-control@0.137.0
	cranelift-entity@0.137.0
	cranelift-frontend@0.137.0
	cranelift-isle@0.137.0
	cranelift-native@0.137.0
	cranelift-srcgen@0.137.0
	crc32fast@1.5.2
	crossbeam-utils@0.8.23
	crossterm@0.29.0
	crossterm_winapi@0.9.1
	crypto-common@0.1.7
	crypto-common@0.2.2
	digest@0.10.7
	digest@0.11.3
	displaydoc@0.2.7
	document-features@0.2.12
	either@1.19.0
	embedded-io@0.4.0
	embedded-io@0.6.1
	encoding_rs@0.8.42
	env_filter@2.0.0
	equivalent@1.0.3
	errno@0.3.14
	fastrand@2.5.0
	find-msvc-tools@0.1.14
	flate2@1.1.10
	fnv@1.0.7
	foldhash@0.2.0
	form_urlencoded@1.2.2
	fs-set-times@0.20.3
	fsevent-sys@4.1.0
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-executor@0.3.34
	futures-io@0.3.34
	futures-lite@2.6.1
	futures-macro@0.3.34
	futures-sink@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	futures@0.3.34
	generic-array@0.14.7
	getrandom@0.4.3
	gimli@0.33.0
	hashbrown@0.14.5
	hashbrown@0.16.1
	hashbrown@0.17.1
	heck@0.5.0
	hermit-abi@0.5.3
	humantime@2.4.0
	hybrid-array@0.4.15
	icu_collections@2.3.0
	icu_locale_core@2.3.0
	icu_normalizer@2.3.0
	icu_normalizer_data@2.3.0
	icu_properties@2.3.0
	icu_properties_data@2.3.0
	icu_provider@2.3.1
	id-arena@2.3.0
	idna@1.1.0
	idna_adapter@1.2.2
	indexmap@2.14.2
	inotify-sys@0.1.8
	inotify@0.11.5
	io-extras@0.19.0
	io-lifetimes@2.0.4
	io-lifetimes@3.0.1
	ipnet@2.12.2
	is_terminal_polyfill@1.70.2
	itertools@0.14.0
	itoa@1.0.18
	js-sys@0.3.106
	kqueue-sys@1.1.2
	kqueue@1.2.1
	kvm-bindings@0.14.2
	kvm-ioctls@0.25.1
	leb128fmt@0.1.0
	libc@0.2.191
	libm@0.2.16
	libyaml-rs@0.3.0
	linux-raw-sys@0.12.1
	litemap@0.8.3
	litrs@1.0.1
	lock_api@0.4.14
	log@0.4.34
	lru@0.18.5
	lz4-sys@1.11.1+lz4-1.10.0
	lz4@1.28.1
	lz4_flex@0.14.0
	mach2@0.6.0
	macro-string@0.3.0
	maybe-owned@0.3.4
	memchr@2.8.3
	memfd@0.6.6
	memoffset@0.9.1
	miniz_oxide@0.9.1
	mio@1.2.4
	multiversion_no_op@1.0.0
	nohash-hasher@0.2.0
	notify-types@2.1.0
	notify@8.2.0
	ntapi@0.4.3
	objc2-core-foundation@0.3.2
	objc2-io-kit@0.3.2
	object@0.40.0
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	pin-project-internal@1.1.13
	pin-project-lite@0.2.17
	pin-project@1.1.13
	polling@3.11.0
	postcard@1.1.3
	potential_utf@0.1.6
	prettyplease@0.3.0
	proc-macro2@1.0.107
	pty-process@0.5.3
	pulley-interpreter@50.0.0
	pulley-macros@50.0.0
	quinn-udp@0.6.3
	quote@1.0.47
	r-efi@6.0.0
	rand@0.10.3
	rand_core@0.10.1
	redox_syscall@0.5.18
	regalloc2@0.15.2
	roff@1.1.1
	rustc-demangle@0.1.28
	rustc-hash@2.1.3
	rustix-linux-procfs@0.1.1
	rustix@1.1.5
	rustversion@1.0.23
	ryu@1.0.23
	same-file@1.0.6
	scopeguard@1.2.0
	seccompiler@0.5.0
	semver@1.0.28
	serde@1.0.229
	serde_bytes@0.11.19
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.154
	sha2@0.10.9
	sha2@0.11.1
	shlex@2.0.1
	signal-hook-registry@1.4.8
	simd-adler32@0.3.10
	simdutf8@0.1.5
	slab@0.4.12
	smallvec@1.16.3
	socket2@0.6.5
	stable_deref_trait@1.2.1
	static_assertions@1.1.0
	strsim@0.11.1
	syn@2.0.119
	syn@3.0.9
	synstructure@0.14.0
	syscalls@0.8.1
	sysinfo@0.39.6
	target-lexicon@0.13.5
	tempfile@3.27.0
	termcolor@1.4.1
	thiserror-impl@2.0.21
	thiserror@2.0.21
	tinystr@0.8.4
	tokio-macros@2.7.2
	tokio-util@0.7.20
	tokio@1.53.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing@0.1.44
	typenum@1.20.1
	uds_windows@1.2.1
	unicode-ident@1.0.27
	unicode-width@0.2.2
	url@2.5.8
	utf8_iter@1.0.4
	utf8parse@0.2.2
	version_check@0.9.5
	virtio-bindings@0.2.7
	virtio-queue@0.18.0
	virtio-vsock@0.12.0
	vm-fdt@0.3.0
	vm-memory@0.18.0
	vmm-sys-util@0.15.0
	vt100@0.16.2
	vte@0.15.0
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.129
	wasm-bindgen-macro@0.2.129
	wasm-bindgen-shared@0.2.129
	wasm-bindgen@0.2.129
	wasm-encoder@0.261.0
	wasm-encoder@0.262.0
	wasm-metadata@0.261.0
	wasm-metadata@0.262.0
	wasmparser@0.261.0
	wasmparser@0.262.0
	wasmprinter@0.261.0
	wasmtime-environ@50.0.0
	wasmtime-internal-component-macro@50.0.0
	wasmtime-internal-component-util@50.0.0
	wasmtime-internal-core@50.0.0
	wasmtime-internal-cranelift@50.0.0
	wasmtime-internal-fiber@50.0.0
	wasmtime-internal-jit-debug@50.0.0
	wasmtime-internal-jit-icache-coherence@50.0.0
	wasmtime-internal-unwinder@50.0.0
	wasmtime-internal-versioned-export-macros@50.0.0
	wasmtime-internal-wit-bindgen@50.0.0
	wasmtime-wasi-io@50.0.0
	wasmtime-wasi@50.0.0
	wasmtime@50.0.0
	wast@262.0.0
	wat@1.262.0
	web-time@1.1.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-collections@0.3.2
	windows-core@0.62.2
	windows-future@0.3.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-numerics@0.3.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows-threading@0.2.1
	windows@0.62.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	winx@0.36.4
	wit-bindgen-core@0.63.0
	wit-bindgen-rust-macro@0.63.0
	wit-bindgen-rust@0.63.0
	wit-bindgen@0.63.0
	wit-component@0.261.0
	wit-component@0.262.0
	wit-parser@0.261.0
	wit-parser@0.262.0
	writeable@0.6.4
	yaml_serde@0.10.7
	yamux@0.14.1
	yoke-derive@0.8.4
	yoke@0.8.3
	zerocopy-derive@0.8.63
	zerocopy@0.8.63
	zerofrom-derive@0.1.8
	zerofrom@0.1.8
	zerotrie@0.2.5
	zerovec-derive@0.11.6
	zerovec@0.11.8
	zmij@1.0.23
"

inherit cargo multiprocessing

# upstream tag is v0.3.0-beta; the portage PV cannot carry a hyphen
MY_PV="${PV/_/-}"
# build tool releases pinned by upstream (WASM_TOOLS_VERSION / ZIG_VERSION)
WASM_TOOLS_PV="1.262.0"
ZIG_PV="0.17.0"

DESCRIPTION="Portable minimal MicroVM sandbox for agents and development tools"
HOMEPAGE="https://github.com/terrarium-sh/terrarium"
# terra-source.tar.gz: pinned guest inputs (kernel 6.18.57, Alpine 3.24.2
# rootfs, doas, libcap, e2fsprogs, bubblewrap submodule) from the attested
# release dist. wasm-tools and zig are not in this tree; the releases are
# the ones upstream pins (WASM_TOOLS_VERSION / ZIG_VERSION).
SRC_URI="
	https://github.com/terrarium-sh/terrarium/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/terrarium-sh/terrarium/releases/download/v${MY_PV}/terra-source.tar.gz
	https://github.com/bytecodealliance/wasm-tools/releases/download/v${WASM_TOOLS_PV}/wasm-tools-${WASM_TOOLS_PV}-x86_64-linux.tar.gz
	https://github.com/bytecodealliance/wasm-tools/releases/download/v${WASM_TOOLS_PV}/wasm-tools-${WASM_TOOLS_PV}-aarch64-linux.tar.gz
	https://ziglang.org/download/${ZIG_PV}/zig-x86_64-linux-${ZIG_PV}.tar.xz
	https://ziglang.org/download/${ZIG_PV}/zig-aarch64-linux-${ZIG_PV}.tar.xz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/terrarium-${MY_PV}"

# workspace is Apache-2.0; the static binary embeds the guest Linux kernel
# (GPL-2), bubblewrap (LGPL-2.1+), libcap (BSD-3 OR GPL-2), e2fsprogs
# (GPL-2+), doas/Alpine minirootfs (ISC) and the AOT device components; the
# rest is the crate union.
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 GPL-2 GPL-2+ ISC MIT Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# zig and wasm-tools come from the pinned release tarballs in SRC_URI (not
# in this tree); the Makefile's check-zig verifies the staged version.
BDEPEND="
	dev-lang/python
	sys-devel/binutils
	virtual/os-headers
	virtual/zlib
"
DEPEND="${BDEPEND}"
# statically linked musl binary: the guest kernel, rootfs, bubblewrap and
# AOT device components are all embedded, nothing is loaded at runtime

src_unpack() {
	# terra-source is staged, not unpacked wholesale (it carries a second copy
	# of the tree beside the ~1.5 GB of pinned guest inputs)
	local a myA=()
	for a in ${A}; do
		[[ ${a} == terra-source.tar.gz ]] && continue
		myA+=( "${a}" )
	done
	local A="${myA[*]}"
	cargo_src_unpack
	# The tag archive leaves the bubblewrap submodule empty; take the pinned
	# submodule source and the build-time guest inputs from the release dist.
	tar -xzf "${DISTDIR}/terra-source.tar.gz" \
		terrarium/vendor/bubblewrap terrarium/build || die
	mv "${WORKDIR}/terrarium/vendor/bubblewrap" "${S}/vendor/" || die
	mv "${WORKDIR}/terrarium/build" "${S}/" || die
	rm -rf "${WORKDIR}/terrarium" || die
}

src_prepare() {
	default
	eapply "${FILESDIR}/${P}-offline-build.patch"
	# The pinned rust-toolchain files name rustup toolchains portage cannot
	# provide (and this box's local 1.99.1 lacks the needed targets); build
	# with the host toolchain instead, which must carry the musl and
	# wasm32/wasm32-wasip3 std prebuilts.
	rm rust-toolchain.toml components/rust-toolchain.toml || die
}

src_configure() {
	# The repo's pinned toolchain files are gone, and the portage environment
	# CARGO/RUSTC (dev-lang/rust) may lack the needed targets (this box's
	# local 1.99.0 is gnu-only), so locate a rustup toolchain carrying both
	# the musl and the wasm32-wasip3 std prebuilts (the guest agent builds
	# for wasip3: tier-2 target, shipped prebuilt by nightly, and by stable
	# once it ships it) and use it for the whole build.
	case ${ARCH} in
		amd64) MYARCH="x86_64" ;;
		arm64) MYARCH="aarch64" ;;
		*) die "unsupported ARCH ${ARCH}" ;;
	esac
	local d h rh rustc_bin toolchain_bin
	local candidates=( "${RUSTUP_HOME}" "${HOME}/.rustup" /root/.rustup )
	for h in /home/*; do candidates+=( "${h}/.rustup" ); done
	for rh in "${candidates[@]}"; do
		[[ -d ${rh}/toolchains ]] || continue
		for d in "${rh}"/toolchains/*/; do
			d="${d%/}"
			[[ -x ${d}/bin/rustc ]] || continue
			ls "${d}"/lib/rustlib/wasm32-wasip3/lib/libstd-*.rlib > /dev/null 2>&1 || continue
			ls "${d}"/lib/rustlib/${MYARCH}-unknown-linux-musl/lib/libstd-*.rlib > /dev/null 2>&1 || continue
			rustc_bin="${d}/bin/rustc"
			toolchain_bin="${d}/bin"
			break 2
		done
	done
	[[ -n ${rustc_bin} ]] ||
		die "no rustup toolchain carrying the wasm32-wasip3 and ${MYARCH}-unknown-linux-musl std prebuilts was found (checked RUSTUP_HOME, ~/.rustup, /root/.rustup, /home/*/.rustup); install one via rustup target add"
	echo 'fn main() {}' > "${WORKDIR}/toolchain-check.rs" || die
	"${rustc_bin}" --edition 2021 --target wasm32-wasip3 \
		"${WORKDIR}/toolchain-check.rs" -o "${WORKDIR}/toolchain-check" ||
		die "toolchain check failed for wasm32-wasip3"
	export CARGO="${toolchain_bin}/cargo"
	export RUSTC="${rustc_bin}"
	export PATH="${toolchain_bin}:${WORKDIR}/wasm-tools-${WASM_TOOLS_PV}-${MYARCH}-linux:${WORKDIR}/zig-${MYARCH}-linux-${ZIG_PV}:${PATH}"
}

src_compile() {
	# upstream Makefile drives the whole build: guest kernel + Alpine rootfs
	# + volume/boot images, bubblewrap + libcap, socket probe, the eight AOT
	# device components, then the static musl terra binary, man pages and the
	# staged dist/. Staged distfiles skip the upstream curl downloads (the
	# sha256 checks still run).
	# portage exports ARCH=amd64 (and ABI) into the environment, which would
	# override the Makefile's `ARCH ?= $(uname -m)` defaults; pin both. The
	# Makefile sets no CFLAGS of its own, so portage's host-optimized flags
	# (-march/-mabm, ...) would leak into the zig-cc guest builds, whose
	# bundled clang rejects Intel-specific options; clear them.
	unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
	local uname_arch
	uname_arch="$(uname -m)" || die
	# The `man` target (gen-docs compiles the terra lib, which include_bytes!
	# the guest images and the precompiled AOT components) carries no make
	# prerequisites, so `make -j dist` can race it against the kernel build
	# or the component precompiles; run the stages sequentially.
	local makeargs=( ARCH="${uname_arch}" BUILD_ARCH="${uname_arch}"
		KERNEL_JOBS="$(makeopts_jobs)" )
	make -j$(makeopts_jobs) guest-assets "${makeargs[@]}" || die
	make -j$(makeopts_jobs) build "${makeargs[@]}" || die
	make man "${makeargs[@]}" || die
	make -j$(makeopts_jobs) dist "${makeargs[@]}" || die
}

src_install() {
	dobin dist/terra || die
	doman packaging/man/*.1 || die
	dodoc dist/LICENSE dist/NOTICE || die
	docinto LICENSES
	doins -r dist/LICENSES || die
}
