# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

FMT_COMMIT="e4c8cfe38ed3ae595aab58460f543c2f23a7f670"

DESCRIPTION="Erlang native interface to git"
HOMEPAGE="https://github.com/saleyn/egit"
SRC_URI="
	https://github.com/saleyn/egit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/fmtlib/fmt/archive/${FMT_COMMIT}.tar.gz -> fmt-${FMT_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libgit2
"
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare() {
	default
	rmdir c_src/fmt && ln -sv "${WORKDIR}"/fmt-${FMT_COMMIT} c_src/fmt
	eapply "${FILESDIR}"/egit-0.1.9-git.patch
	rebar_src_prepare
}
