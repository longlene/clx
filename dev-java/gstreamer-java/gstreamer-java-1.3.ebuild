# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="ant-nodeps ant-junit4"

inherit java-pkg-2 java-ant-2 

DESCRIPTION="A set of java bindings for the gstreamer multimedia framework."
HOMEPAGE="http://code.google.com/p/gstreamer-java/"
SRC_URI="http://gstreamer-java.googlecode.com/files/${PN}-src-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/${PN}"

DEPEND=">=virtual/jdk-1.6
	>=media-libs/gstreamer-0.10.19
	>=media-libs/gst-plugins-base-0.10.19
	>=media-libs/gst-plugins-good-0.10.7
	>=media-libs/gst-plugins-bad-0.10.6
	>=media-libs/gst-plugins-ugly-0.10.7
	dev-java/jna
	dev-java/junit:4
	dev-java/swt:3.5"

java_prepare() {
        cd "${S}/lib"
        rm -v *.jar || die

        java-pkg_jar-from jna,junit-4,swt-3.5
}

src_install() {
	java-pkg_dojar dist/*.jar
	
	dodoc CHANGES COPYING* tutorials/*
        
        use doc && java-pkg_dojavadoc dist/javadoc
        use source && java-pkg_dosrc src/*
}

