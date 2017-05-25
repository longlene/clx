# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2

DESCRIPTION="Luaj is a lua interpreter"
HOMEPAGE="http://www.luaj.org/"
SRC_URI="mirror://sourceforge/luaj/${P}.zip"

LICENSE="as-is"
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

src_compile() {
	ant || die "compile failed"
	use doc && ant doc || die "compile failed"
}

src_install() {
  java-pkg_dojar luaj-jse-${PV}.jar
  use doc && java-pkg_dojavadoc docs
  use source && java-pkg_dosrc src
}
