# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit lua

DESCRIPTION="Database connectivity for the Lua programming language"
HOMEPAGE="http://www.keplerproject.org/luasql/"
SRC_URI="https://github.com/keplerproject/luasql/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Kepler"
SLOT="0"
KEYWORDS="x86 amd64"

MODULES="sqlite sqlite3 mysql postgres odbc firebird oracle"
IUSE="${MODULES}"

RDEPEND=">=dev-lang/lua-5.1
	sqlite? ( dev-db/sqlite:0 )
	sqlite3? ( dev-db/sqlite:3 )
	mysql? ( virtual/mysql )
	odbc? ( dev-db/unixODBC )
	firebird? ( dev-db/firebird )
	oracle? ( dev-db/oracle-instantclient-basic )
	postgres? ( virtual/postgresql-base )"
DEPEND="${RDEPEND}
        virtual/pkgconfig"

src_compile() {
	local libs
	local incs=""
	local no_driver=1
	> "${S}/config"

	for mod in ${MODULES}; do
		if use ${mod}; then
			no_driver=0
			[ ${mod} == sqlite ] && libs="-lsqlite"
			[ ${mod} == sqlite3 ] && libs="-lsqlite3"
			[ ${mod} == mysql ] && libs="-lmysqlclient -lz" && incs="-I/usr/include/mysql"
			[ ${mod} == odbc ] && libs="-L/usr/lib -lodbc" && incs="-DUNIXODBC"
			[ ${mod} == postgres ] && libs="-lpq" && incs="-I/usr/include/postgresql"
			[ ${mod} == firebird ] && libs="-lfbclient"

			emake	T=${mod} \
				LUA_VERSION_NUM=${LUAVER_MAJOR}0${LUAVER_MINOR} \
				LIB_OPTION="-shared" \
				LIBNAME="${mod}.so" \
				CFLAGS="${CFLAGS} ${incs} -fPIC" \
				DRIVER_LIBS="${libs}" \
				|| die "Compiling driver '${mod}' failed"
		fi
	done

	if [ ${no_driver} == 1 ] ; then
		eerror
		eerror "No driver was selected, cannot build."
		eerror "Please set USE flags to build any driver."
		eerror "Possible USE flags: sqlite sqlite3 mysql postgres odbc firebird"
		eerror
		die "No driver selected"
	fi
}

src_install() {
	for mod in ${MODULES}; do
		if use ${mod}; then
			einfo "install ${mod} module"
			emake	LIBNAME="${mod}.so" \
				LUA_LIBDIR="${D}/$(pkg-config --variable INSTALL_CMOD lua)" install\
				|| die "Install of driver '${mod}' failed"
		fi
	done
}
