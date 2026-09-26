# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.8.12
	ambient-authority@0.0.2
	android_system_properties@0.1.5
	anyhow@1.0.102
	ar_archive_writer@0.5.1
	arbitrary@1.4.2
	async-trait@0.1.89
	bitflags@1.3.2
	bitflags@2.13.0
	bumpalo@3.20.3
	bytes@1.11.1
	cap-fs-ext@3.4.5
	cap-net-ext@3.4.5
	cap-primitives@3.4.5
	cap-rand@3.4.5
	cap-std@3.4.5
	cap-time-ext@3.4.5
	cc@1.2.63
	cfg-if@1.0.4
	clap@4.0.29
	clap_lex@0.3.0
	cobs@0.3.0
	codespan-reporting@0.11.1
	core-foundation-sys@0.8.7
	cranelift-bforest@0.111.9
	cranelift-bitset@0.111.9
	cranelift-codegen-meta@0.111.9
	cranelift-codegen-shared@0.111.9
	cranelift-codegen@0.111.9
	cranelift-control@0.111.9
	cranelift-entity@0.111.9
	cranelift-frontend@0.111.9
	cranelift-isle@0.111.9
	cranelift-native@0.111.9
	cranelift-wasm@0.111.9
	crc32fast@1.5.0
	cxx@1.0.83
	cxxbridge-flags@1.0.83
	cxxbridge-macro@1.0.83
	dirs-sys@0.3.7
	dirs@4.0.0
	displaydoc@0.2.6
	either@1.16.0
	embedded-io@0.4.0
	embedded-io@0.6.1
	encoding_rs@0.8.35
	equivalent@1.0.2
	errno@0.3.14
	fallible-iterator@0.3.0
	fd-lock@4.0.4
	find-msvc-tools@0.1.9
	foldhash@0.1.5
	form_urlencoded@1.2.2
	fs-set-times@0.20.3
	futures-channel@0.3.32
	futures-core@0.3.32
	futures-executor@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-sink@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	futures@0.3.32
	getrandom@0.2.17
	gimli@0.29.0
	hashbrown@0.13.2
	hashbrown@0.14.5
	hashbrown@0.15.5
	hashbrown@0.17.1
	heck@0.4.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	icu_collections@2.2.0
	icu_locale_core@2.2.0
	icu_normalizer@2.2.0
	icu_normalizer_data@2.2.0
	icu_properties@2.2.0
	icu_properties_data@2.2.0
	icu_provider@2.2.0
	id-arena@2.3.0
	idna@1.1.0
	idna_adapter@1.2.2
	indexmap@2.14.0
	io-extras@0.18.4
	io-lifetimes@2.0.4
	ipnet@2.12.0
	itertools@0.12.1
	itoa@1.0.18
	js-sys@0.3.99
	leb128@0.2.6
	leb128fmt@0.1.0
	libc@0.2.186
	libm@0.2.16
	libredox@0.1.17
	link-cplusplus@1.0.12
	linux-raw-sys@0.12.1
	linux-raw-sys@0.4.15
	litemap@0.8.2
	log@0.4.32
	mach2@0.4.3
	maybe-owned@0.3.4
	memchr@2.8.1
	memfd@0.6.5
	mio@1.2.1
	object@0.36.7
	object@0.37.3
	once_cell@1.21.4
	os_str_bytes@6.4.1
	paste@1.0.15
	percent-encoding@2.3.2
	pin-project-lite@0.2.17
	postcard@1.1.3
	potential_utf@0.1.5
	ppv-lite86@0.2.21
	proc-macro2@1.0.106
	proc-macro2@1.0.47
	psm@0.1.31
	quote@1.0.21
	quote@1.0.45
	rand@0.8.6
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_users@0.4.6
	regalloc2@0.9.3
	rustc-hash@1.1.0
	rustix-linux-procfs@0.1.1
	rustix@0.38.44
	rustix@1.1.4
	rustversion@1.0.22
	semver@1.0.28
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_json@1.0.150
	shellexpand@2.1.2
	shlex@2.0.1
	slab@0.4.12
	slice-group-by@0.3.1
	smallvec@1.15.1
	socket2@0.6.4
	sptr@0.3.2
	stable_deref_trait@1.2.1
	strsim@0.10.0
	syn@1.0.105
	syn@1.0.109
	syn@2.0.117
	synstructure@0.13.2
	system-interface@0.27.3
	target-lexicon@0.12.16
	termcolor@1.1.3
	termcolor@1.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	tinystr@0.8.3
	tokio@1.52.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing@0.1.44
	unicode-ident@1.0.24
	unicode-ident@1.0.5
	unicode-width@0.1.10
	unicode-width@0.2.2
	unicode-xid@0.2.6
	url@2.5.8
	utf8_iter@1.0.4
	version_check@0.9.5
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-macro-support@0.2.122
	wasm-bindgen-macro@0.2.122
	wasm-bindgen-shared@0.2.122
	wasm-bindgen@0.2.122
	wasm-encoder@0.215.0
	wasm-encoder@0.251.0
	wasmparser@0.215.0
	wasmparser@0.251.0
	wasmprinter@0.215.0
	wasmtime-asm-macros@24.0.9
	wasmtime-component-macro@24.0.9
	wasmtime-component-util@24.0.9
	wasmtime-cranelift@24.0.9
	wasmtime-environ@24.0.9
	wasmtime-fiber@24.0.9
	wasmtime-jit-icache-coherence@24.0.9
	wasmtime-slab@24.0.9
	wasmtime-types@24.0.9
	wasmtime-versioned-export-macros@24.0.9
	wasmtime-wasi@24.0.9
	wasmtime-winch@24.0.9
	wasmtime-wit-bindgen@24.0.9
	wasmtime@24.0.9
	wast@251.0.0
	wast@35.0.2
	wat@1.251.0
	wiggle-generate@24.0.9
	wiggle-macro@24.0.9
	wiggle@24.0.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	winch-codegen@0.22.9
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.52.0
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
	winx@0.36.4
	wit-parser@0.215.0
	witx@0.9.1
	writeable@0.6.3
	yoke-derive@0.8.2
	yoke@0.8.3
	zerocopy-derive@0.8.50
	zerocopy@0.8.50
	zerofrom-derive@0.1.7
	zerofrom@0.1.8
	zerotrie@0.2.4
	zerovec-derive@0.11.3
	zerovec@0.11.6
	zmij@1.0.21
"

LLVM_COMPAT=( {21..23} )
PYTHON_COMPAT=( python3_{13..15} )
RUST_MIN_VER="1.85.0"

inherit cargo cmake flag-o-matic java-pkg-2 llvm-r2 python-any-r1 systemd

MY_P="scylladb-scylla-${PV}"
SEASTAR_COMMIT="ffeb9a3ca4f8339110320d76613613ced23ba984"
ABSEIL_COMMIT="24b0cb748f3ca62faedab4853030e80d30d6b980"
ANTLR3_PV="3.5.3"

DESCRIPTION="NoSQL data store compatible with Apache Cassandra and Amazon DynamoDB"
HOMEPAGE="https://www.scylladb.com/ https://github.com/scylladb/scylladb"
SRC_URI="
	https://github.com/scylladb/scylladb/archive/refs/tags/scylla-${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/scylladb/seastar/archive/${SEASTAR_COMMIT}.tar.gz
		-> scylla-seastar-${SEASTAR_COMMIT}.gh.tar.gz
	https://github.com/scylladb/abseil-cpp/archive/${ABSEIL_COMMIT}.tar.gz
		-> scylla-abseil-cpp-${ABSEIL_COMMIT}.gh.tar.gz
	https://github.com/antlr/antlr3/archive/${ANTLR3_PV}.tar.gz -> antlr3-${ANTLR3_PV}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${MY_P}"

# ScyllaDB itself; bundled seastar/abseil/antlr3 C++ runtime; rust crates
LICENSE="ScyllaDB-Source-Available-1.1 Apache-2.0 BSD"
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-3.0
	Unicode-DFS-2016 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror test"

DEPEND="
	app-arch/libdeflate:=
	app-arch/lz4:=
	app-arch/snappy:=
	app-arch/zstd:=
	app-crypt/p11-kit
	dev-cpp/cpp-jwt
	dev-cpp/rapidxml
	dev-cpp/yaml-cpp:=
	dev-lang/lua:5.4
	dev-libs/boost:=
	dev-libs/crypto++:=
	dev-libs/icu:=
	dev-libs/jsoncpp:=
	dev-libs/libfmt:=
	dev-libs/protobuf:=
	dev-libs/rapidjson
	dev-libs/xxhash
	net-dns/c-ares:=
	net-libs/gnutls:=
	net-misc/lksctp-tools
	net-nds/openldap:=
	sys-apps/hwloc:=
	sys-libs/liburing:=
	sys-libs/libxcrypt:=
	sys-process/numactl
	virtual/zlib:=
	dev-debug/valgrind
	sys-fs/xfsprogs
"
RDEPEND="
	${DEPEND}
	acct-group/scylla
	acct-user/scylla
"
BDEPEND="
	${PYTHON_DEPS}
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}
		llvm-core/lld:${LLVM_SLOT}
	')
	app-arch/xz-utils
	dev-java/antlr-tool:3.5
	dev-util/ragel
	virtual/jre:*
	virtual/pkgconfig
"

pkg_setup() {
	java-pkg-2_pkg_setup
	llvm-r2_pkg_setup
	python-any-r1_pkg_setup
	rust_pkg_setup
}

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	rmdir seastar abseil || die
	mv "${WORKDIR}"/seastar-${SEASTAR_COMMIT} seastar || die
	mv "${WORKDIR}"/abseil-cpp-${ABSEIL_COMMIT} abseil || die

	# version/release strings normally come from git
	echo "${PV}-0.gentoo" > version || die

	# antlr3: the tool is only shipped as a jar, the C++ runtime is header-only
	mkdir -p "${T}"/bin || die
	cat > "${T}"/bin/antlr3 <<-EOF || die
		#!/bin/sh
		exec java -cp "$(java-pkg_getjars --build-only --with-dependencies antlr-tool-3.5)" org.antlr.Tool "\$@"
	EOF
	chmod +x "${T}"/bin/antlr3 || die

	cmake_src_prepare
}

src_configure() {
	# cxxbridge must match the pinned cxx crate version exactly
	pushd "${ECARGO_VENDOR}"/cxxbridge-cmd-1.0.83 >/dev/null || die
	cargo build --offline --release --target-dir "${WORKDIR}"/cxxbridge-build || die
	popd >/dev/null || die
	cp "${WORKDIR}"/cxxbridge-build/release/cxxbridge "${T}"/bin/ || die
	export PATH="${T}/bin:${PATH}"

	local -x CC="${CHOST}-clang" CXX="${CHOST}-clang++"
	strip-unsupported-flags

	local mycmakeargs=(
		-DScylla_ENABLE_LTO=OFF
		-DScylla_USE_PRECOMPILED_HEADER=OFF
		-DANTLR3_INCLUDE_DIR="${WORKDIR}/antlr3-${ANTLR3_PV}/runtime/Cpp/include"
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile scylla
}

src_install() {
	dobin "${BUILD_DIR}"/scylla

	insinto /etc/scylla
	doins conf/scylla.yaml conf/cassandra-rackdc.properties

	insinto /etc/sysconfig
	newins dist/common/sysconfig/scylla-server scylla-server
	insinto /etc/scylla.d
	doins dist/common/scylla.d/*.conf

	# the pre/post helpers live in scylla's python setup tooling, not shipped
	sed -e '/^ExecStartPre=/d' -e '/^ExecStopPost=/d' \
		-e '/^Wants=scylla-housekeeping/d' \
		dist/common/systemd/scylla-server.service > "${T}"/scylla-server.service || die
	systemd_dounit "${T}"/scylla-server.service dist/common/systemd/scylla-server.slice

	keepdir /var/lib/scylla/{data,commitlog,hints,view_hints}
	fowners -R scylla:scylla /var/lib/scylla

	einstalldocs
}
