# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.91"

CRATES="
	android_system_properties@0.1.5
	autocfg@1.5.0
	bumpalo@3.20.2
	cc@1.2.62
	cfg-if@1.0.4
	chrono@0.4.44
	core-foundation-sys@0.8.7
	find-msvc-tools@0.1.9
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	heck@0.5.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	inventory@0.3.24
	js-sys@0.3.98
	libc@0.2.186
	libloading@0.9.0
	log@0.4.29
	memchr@2.8.0
	num-traits@0.2.19
	once_cell@1.21.4
	pin-project-lite@0.2.17
	proc-macro2@1.0.106
	quick-xml@0.39.4
	quote@1.0.45
	regex-lite@0.1.9
	rustler@0.37.4
	rustler_codegen@0.37.4
	rustversion@1.0.22
	shlex@1.3.0
	slab@0.4.12
	syn@2.0.117
	unicode-ident@1.0.24
	wasm-bindgen-macro-support@0.2.121
	wasm-bindgen-macro@0.2.121
	wasm-bindgen-shared@0.2.121
	wasm-bindgen@0.2.121
	windows-core@0.62.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-result@0.4.1
	windows-strings@0.5.1
"

inherit cargo rebar3

DESCRIPTION="quick_xml bindings for Erlang"
HOMEPAGE="https://github.com/filmor/faster_xml"
SRC_URI="
	https://github.com/filmor/faster_xml/archive/a522bf920c16ea179a337eae4bd2a6692ba2bf5c.tar.gz
		-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/faster_xml-a522bf920c16ea179a337eae4bd2a6692ba2bf5c"

LICENSE="all-rights-reserved ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	rebar3_src_prepare
	# Remove rebar3_cargo plugin and its hooks — NIF is built separately with cargo
	sed -i -e '/{plugins,/d' -e '/{project_plugins,/d' -e '/{cargo_opts,/d' \
		rebar.config || die
	perl -0 -i -pe 's/\{provider_hooks,.*?\}\.\n?//s' rebar.config || die
}

src_compile() {
	cargo_src_compile --package faster_xml_nif

	mkdir -p "${S}/priv/crates/faster_xml_nif" || die
	cp "${S}/$(cargo_target_dir)/libfaster_xml_nif.so" \
		"${S}/priv/crates/faster_xml_nif/faster_xml_nif.so" || die

	erebar3 compile
}

src_install() {
	rebar3_src_install
	# priv/ in _build is a symlink — install NIF from source priv/
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv/crates/faster_xml_nif"
	doins "${S}/priv/crates/faster_xml_nif/faster_xml_nif.so"
}
