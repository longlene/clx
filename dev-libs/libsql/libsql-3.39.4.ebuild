# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open-source fork of the SQLite database library"
HOMEPAGE="https://github.com/tursodatabase/libsql"
SRC_URI="https://github.com/tursodatabase/libsql/archive/refs/tags/version-${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/libsql-version-${PV}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="fts3 fts4 fts5 geopoly rtree session +readline tcl"

# tclsh is required to generate shell.c for the sqlite3 CLI, even with USE=-tcl
BDEPEND="
	dev-lang/tcl
"
RDEPEND="
	readline? ( sys-libs/readline )
	tcl? ( dev-lang/tcl )
"

src_configure() {
	local myconf=(
		$(use_enable fts3)
		$(use_enable fts4)
		$(use_enable fts5)
		# --disable-geopoly is broken in upstream configure (any value sets
		# enable_geopoly=yes); absence of the flag is the only way to keep it off
		$(usex geopoly --enable-geopoly)
		$(use_enable rtree)
		$(use_enable session)
		$(use_enable readline)
	)
	if use tcl; then
		local tclconfig
		tclconfig="$(find "${EPREFIX}"/usr/$(get_libdir) -maxdepth 3 -name tclConfig.sh -print -quit)" \
			|| die "failed to search for tclConfig.sh"
		[[ -n ${tclconfig} ]] || die "tclConfig.sh not found; is dev-lang/tcl installed?"
		myconf+=( --with-tcl="$(dirname "${tclconfig}")" )
	fi
	econf "${myconf[@]}"
}
