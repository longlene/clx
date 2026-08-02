# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

REBAR_APP_SRC="src/livery_grpc.app.src"

DESCRIPTION="gRPC for Erlang on the livery HTTP/2 stack: server, client, all call types"
HOMEPAGE="https://github.com/benoitc/livery_grpc"
SRC_URI="https://github.com/benoitc/livery_grpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/livery_grpc-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-erlang/gpb"
RDEPEND="
	dev-erlang/gpb
	dev-erlang/h2
	dev-erlang/livery
"

src_prepare() {
	# Pre-compile .proto files using the installed gpb; rebar3_gpb_plugin
	# would otherwise try to fetch itself from hex (no network in sandbox).
	local gpb_ebin
	gpb_ebin=$(ls -d /usr/lib64/erlang/lib/gpb-*/ebin 2>/dev/null | head -n 1)
	[[ -n "${gpb_ebin}" ]] || die "gpb ebin not found — is dev-erlang/gpb installed?"

	local opts='[{i,"proto"},{module_name_suffix,"_pb"},{o_erl,"src"},{o_hrl,"src"},{strings_as_binaries,true},{maps,true},{maps_unset_optional,omitted},type_specs,descriptor,{report_warnings,true}]'
	local proto
	for proto in proto/*.proto; do
		erl -noshell -pa "${gpb_ebin}" \
			-eval "gpb_compile:file(\"${proto}\", ${opts}), init:stop()." \
			|| die "gpb_compile failed for ${proto}"
	done

	# Remove rebar3_gpb_plugin from project_plugins (already compiled above)
	sed -i '/{rebar3_gpb_plugin/d' rebar.config || die
	# Remove provider_hooks block so rebar3 does not attempt a second compile
	perl -0777 -i -pe 's/\{provider_hooks,\s*\[.*?\]\s*\}\.\n?//s' rebar.config || die

	rebar3_src_prepare
}

src_install() {
	local appdir="${S}/_build/default/lib/livery_grpc"
	local destdir
	destdir="$(get_erl_libs)/livery_grpc-${PV}"
	insinto "${destdir}/ebin"
	doins "${appdir}"/ebin/*.{app,beam}
	dodoc README.md
}
