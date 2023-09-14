# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit java-pkg-2 java-ant-2

HOMEPAGE="http://jajuk.info"

DESCRIPTION="Advanced audio player based on Java."

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

SRC_URI="http://prdownloads.sourceforge.net/jajuk/jajuk-sources-${PV}.zip"

LICENSE="GPL-2"

RDEPEND=">=virtual/jdk-1.5
	java-virtuals/jdk-with-com-sun
	>=dev-java/ant-1.7.0"

DEPEND=">=virtual/jdk-1.5
	java-virtuals/jdk-with-com-sun"

# ---- unpack ----
src_unpack() {
    S_part_of=$(dirname ${S})
    # fix path to jajuk-src-${PV}
    S2=${S_part_of}/${PN}-src-${PV}
    unpack ${A}
    # need? IMHO not
    cd ${S2}
}

# ---- compile ----
src_compile() {
    cd ${S2}/src/scripts
    einfo "Compilation src_compile() ..."
    # doesn't work right
    # mkdir -p ${D}/tmp/jajuk-dist/jajuk
    # eant rootdir=${D}/tmp/jajuk-dist/jajuk || die

    # create jajuk in /tmp/jajuk-dist/jajuk :-(
    eant || die
}

# ---- install files ----
src_install() {
    # move the output to ${D}
    cd /tmp/jajuk-dist/jajuk && treecopy . "${D}/usr/share/${PN}"
    # should be discussed
    # rm -rf /tmp/jajuk-dist

    chmod +x ${D}/usr/share/${PN}/${PN}
    dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
}
