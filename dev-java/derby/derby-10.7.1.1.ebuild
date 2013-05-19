# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc"
EANT_BUILD_TARGET="buildsource buildjars"
WANT_ANT_TASKS="ant-nodeps"
JAVA_PKG_BSFIX="off"
inherit java-pkg-2 java-ant-2

MY_P=db-${P}
DESCRIPTION="An embeddable relational database implemented entirely in Java"
HOMEPAGE="http://db.apache.org/derby/"
SRC_URI="mirror://apache/db/${PN}/${MY_P}/${MY_P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="linguas_de linguas_es linguas_fr linguas_hu linguas_it linguas_ja linguas_ko linguas_pl linguas_pt linguas_ru linguas_zh"

DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6"

S="${WORKDIR}/${MY_P}-src"

src_install() {
	local LOCALE_JARS="${LINGUAS// /,}"

	java-pkg_dojar jars/sane/derby{,run,net,tools,client}.jar
	if [[ -n "${LOCALE_JARS}" ]]; then
		[[ "${LOCALE_JARS}" != *,* ]] && \
			java-pkg_dojar jars/sane/derbyLocale_${LOCALE_JARS}*.jar || \
			java-pkg_dojar jars/sane/derbyLocale_{${LOCALE_JARS}}*.jar
	fi
	java-pkg_dowar jars/sane/derby.war

	dodoc README STATUS KEYS NOTICE || die "docs failed"
	dohtml -r {RELEASE-NOTES,published_api_overview}.html || die "docs failed"

	use doc && java-pkg_dojavadoc javadoc
}
