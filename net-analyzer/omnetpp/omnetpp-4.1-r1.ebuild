# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils toolchain-funcs flag-o-matic

DESCRIPTION="A C++-based object-oriented discrete event simulation."
HOMEPAGE="http://www.omnetpp.org/"
SRC_URI="http://www.omnetpp.org/download/release/${P}-src.tgz"

EAPI=2

LICENSE="omnetpp"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blt mpi pcap +doc example"

RDEPEND=">=virtual/jdk-1.5.0"
DEPEND="${RDEPEND}
        >=dev-lang/tcl-8.4
	>=dev-lang/tk-8.4
    	dev-lang/perl
	|| ( dev-libs/libxml2 dev-libs/expat )
	blt? ( dev-tcltk/blt )
	mpi? ( sys-cluster/openmpi )
	pcap? ( net-libs/libpcap )
	doc? ( net-libs/xulrunner 
	       media-gfx/graphviz
	       app-doc/doxygen )"


src_configure() {
    cd "${S}"
    epatch "${FILESDIR}"/wish-configure.patch
    eautoreconf

    export PATH="${PATH}:${S}/bin"
    export TCL_LIBRARY=$(whereis tcl | awk '{print $2}')
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${S}/lib"

    econf || die 'econf failed'
}

src_install() {

    local dirs="bin ide images lib include"

    dodir /opt/${P}

    # workaround for sun-jdk-1.6.0.24
    # https://bugs.eclipse.org/bugs/show_bug.cgi?id=333227#c7
    echo "-XX:-UseCompressedOops" >> ide/omnetpp.ini
    
    # remove ide components for win/osx    
    rm ide/win32 ide/macosx -fr

    cp -pPR $dirs "${D}/opt/${P}/" || die "failed to copy files"

    if use doc; then
       cp -pPR doc "${D}/opt/${P}/" || die "failed to copy doc files"
    fi

    dodoc README || die "failed to dodoc"

    # Makefile.inc
    sed 's#'"${S}"'#'"${ROOT}opt/${P}"'#g' <Makefile.inc >Makefile.inc.ins
    cp -p "${S}/Makefile.inc.ins" "${D}/opt/${P}/Makefile.inc"

    if use example; then
       insinto "${D}/opt/${P}/samples"
       doins -r samples/* || die "error: installing data failed"
       for x in $(find ./samples -executable -type f); do
       	   exeinto "${D}/opt/${P}/$(dirname ${x})"
	   doexe "${x}"
       done;
    fi

    # symbol link
    dosym ${D}/opt/${P}/ide/omnetpp /usr/bin/omnetpp

}

pkg_setup() {
    # used for MiXiM
    filter-ldflags -Wl,--as-needed --as-needed
}

pkg_postinst() {
    elog ""
    elog "Please put following into your .bashrc"
    elog "    export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${ROOT}opt/${P}/lib"
    elog "    export PATH=\$PATH:${ROOT}opt/${P}/bin"
    elog "    export TCL_LIBRARY=$(whereis tcl | awk '{print $2}')"
    elog ""
}