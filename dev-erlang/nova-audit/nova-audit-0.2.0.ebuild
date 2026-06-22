# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Append-only audit event log for the Nova ecosystem"
HOMEPAGE="https://github.com/novaframework/nova_audit"
SRC_URI="https://github.com/novaframework/nova_audit/archive/refs/tags/v${PV}.tar.gz
	-> nova_audit-${PV}.gh.tar.gz"
S="${WORKDIR}/nova_audit-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="apps/nova_audit/src/nova_audit.app.src"

RDEPEND=">=dev-erlang/jhn_stdlib-5.11"

src_prepare() {
	rebar3_src_prepare
	# Umbrella app: set version in kura and pgo sub-apps too
	local vsn="${PV%_*}"
	sed -e "s/vsn, git/vsn, \"${vsn}\"/" \
		-i apps/nova_audit_kura/src/nova_audit_kura.app.src \
		apps/nova_audit_pgo/src/nova_audit_pgo.app.src || die
}

src_compile() {
	erebar3 as "${REBAR_PROFILE}" compile
}

src_install() {
	local builddir="_build/${REBAR_PROFILE}/lib"
	rebar3_install_lib "${builddir}/nova_audit"
	rebar3_install_lib "${builddir}/nova_audit_kura"
	rebar3_install_lib "${builddir}/nova_audit_pgo"
	einstalldocs
}
