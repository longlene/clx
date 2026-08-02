# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

FI_COMMIT="b9af0ec5b818bca29919e1a8d42b142feb71f269"

DESCRIPTION="CRDT-based offline-first sync extension for SQLite"
HOMEPAGE="https://github.com/sqliteai/sqlite-sync"
SRC_URI="
	https://github.com/sqliteai/sqlite-sync/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/sqliteai/fractional-indexing/archive/${FI_COMMIT}.tar.gz -> fractional-indexing-${FI_COMMIT}.tar.gz
"

LICENSE="Elastic-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl:=
	net-misc/curl:=
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	# modules/fractional-indexing is a git submodule; the GitHub archive
	# ships the directory empty. Populate it from the pre-fetched tarball
	# pinned to the same commit .gitmodules/GitHub resolve to.
	rmdir modules/fractional-indexing && \
		ln -sv "${WORKDIR}/fractional-indexing-${FI_COMMIT}" \
		modules/fractional-indexing || die

	# Use system curl instead of the Makefile's default of downloading and
	# building its own hermetic copy from a release tarball at compile
	# time -- unreachable under the network sandbox, and Gentoo already
	# has net-misc/curl.
	rm -rf curl/include && ln -sv /usr/include curl/include || die
	# $(TARGET) depends on $(CURL_LIB) (curl/linux/libcurl.a) via a rule
	# with no prerequisites of its own, so make treats an existing file at
	# that path as up to date and skips the (network-fetching) recipe.
	mkdir -p curl/linux && : > curl/linux/libcurl.a || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		LDFLAGS="-shared -lcurl -lssl -lcrypto -lm ${LDFLAGS}" \
		extension
}

src_install() {
	doheader src/cloudsync.h
	dolib.so dist/cloudsync.so
	einstalldocs
}
