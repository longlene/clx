#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.63)
AC_INIT(keydb, 0.9.5, antirez@gmail.com)
AM_CFLAGS="-pedantic -Wall -W -D__EXTENSIONS__ -D_XPG6"
if test x"$CFLAGS" = x""; then
    AM_CFLAGS="$AM_CFLAGS -O2"
else
    AM_CFLAGS="$AM_CFLAGS $CFLAGS"
fi

# options
AC_MSG_CHECKING([whether to build with debug information])
AC_ARG_ENABLE([debug],
    [AS_HELP_STRING([--enable-debug],
        [enable debug data generation (def=no)])],
    [debugit="$enableval"],
    [debugit=no])
AC_MSG_RESULT([$debugit])

if test x"$debugit" = x"yes"; then
    AC_DEFINE([DEBUG],[],[Debug Mode])
    AM_CFLAGS="$AM_CFLAGS -g -rdynamic -ggdb"
else
    AC_DEFINE([NDEBUG],[],[No-debug Mode])
fi
AC_SUBST([AM_CFLAGS])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h limits.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_INLINE
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_OFF_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T

# Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_FORK
AC_FUNC_STRCOLL
AC_FUNC_STRTOD
AC_CHECK_FUNCS([dup2 gethostbyname gettimeofday inet_ntoa memchr memmove memset select socket strcasecmp strchr strerror strstr strtol])

# Check for lua-5.1 or luajit
AC_ARG_WITH([luajit],
    AS_HELP_STRING([--with-luajit], [Use luajit instead of lua]))

AS_IF([test "x$with_luajit" = "xyes"],
      [PKG_CHECK_MODULES([LUA], [luajit >= 2], [], [AC_MSG_ERROR([luajit requested but not found])])],
      [PKG_CHECK_MODULES([LUA], [lua5.1], [], [AC_MSG_ERROR([lua-5.1 required but not found])])])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
