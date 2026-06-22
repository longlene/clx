# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Object/file storage abstraction for the Nova ecosystem"
HOMEPAGE="https://github.com/novaframework/nova_storage"
SRC_URI="https://github.com/novaframework/nova_storage/archive/refs/tags/v${PV}.tar.gz
	-> nova_storage-${PV}.gh.tar.gz"
S="${WORKDIR}/nova_storage-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REBAR_APP_SRC="src/nova_storage.app.src"

src_install() {
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/nova_storage
	popd >/dev/null || die
	einstalldocs
}
