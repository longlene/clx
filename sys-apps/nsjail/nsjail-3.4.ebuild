# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KAFEL_COMMIT="1af0975af45ca4404f357b9a4e1636f53a01bfd3"

DESCRIPTION="A light-weight process isolation tool"
HOMEPAGE="https://nsjail.dev/"
SRC_URI="
	https://github.com/google/nsjail/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/kafel/archive/${KAFEL_COMMIT}.tar.gz -> kafel-${KAFEL_COMMIT}.tar.gz
	"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libnl:3
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( config.proto configs README.md )

src_prepare() {
	default
	rmdir kafel && ln -sv "${WORKDIR}"/kafel-${KAFEL_COMMIT} kafel
}

src_install() {
	dobin nsjail
	doman nsjail.1
	einstalldocs
}
