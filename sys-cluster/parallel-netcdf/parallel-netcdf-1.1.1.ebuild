# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Parallel extension to netCDF"
HOMEPAGE="http://www-unix.mcs.anl.gov/parallel-netcdf/"
SLOT="0"

LICENSE="UCAR-Unidata"
KEYWORDS="~amd64 -x86"
SRC_URI="http://ftp.mcs.anl.gov/pub/parallel-netcdf/parallel-netcdf-1.1.1.tar.bz2"
RDEPEND="dev-libs/clearsilver
sqlite? ( >=dev-db/sqlite-3.6.20 >=dev-python/pysqlite-2.0.0 )
postgresql? ( dev-db/postgresql dev-python/pypgsql )
mysql? ( >=dev-db/mysql-4.1.22 dev-python/mysql-python )
sci-libs/netcdf
virtual/mpi" 
DEPEND=$RDEPEND
IUSE="sqlite postgresql mysql -fortran -largefile"
src_configure()
{
    einfo "Notice, the virtual/mpi package which currently pulls in openmpi"
    einfo "by default. Tweak to merge your preferred MPI implementation."
    econf \
    $(use_enable fortran)\
    $(use_enable largefile) \
    $(echo "--with-mpi=/usr")
}
src_compile()
{
    emake || die "Build failure"
}
src_install()
{
    einstall DESTDIR=$D install || die “The installation phase failed.”
}
