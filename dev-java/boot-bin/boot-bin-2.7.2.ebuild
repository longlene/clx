# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Build tooling for Clojure"
HOMEPAGE="http://boot-clj.com/"
SRC_URI="https://github.com/boot-clj/boot-bin/releases/download/${PV}/boot.sh -> ${P}.sh"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
  app-arch/unzip
  ${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

src_install() {
	newbin ${P}.sh boot
}
