# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-base golang-vcs-snapshot

EGO_PN="github.com/NeowayLabs/nash"

DESCRIPTION="Nash shell"
HOMEPAGE="https://github.com/NeowayLabs/nash"
SRC_URI="https://github.com/NeowayLabs/nash/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	set -- env GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"/cmd/nash
	echo "$@"
	"$@" || die

	set -- env GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"/cmd/nashfmt
	echo "$@"
	"$@" || die

	set -- env GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}"/stdbin/mkdir
	echo "$@"
	"$@" || die
}

src_install() {
	dobin nash nashfmt
	dodoc src/${EGO_PN}/README.md
}

