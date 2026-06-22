#!/usr/bin/env python3
"""Replace network-download sources in cmake files with local distfile paths.

Usage: patch-cmake-sources.py HELIO_THIRD_PARTY EXTERNAL_LIBS DISTDIR
       RAPIDJSON_COMMIT EXPECTED_COMMIT DCONV_COMMIT HDR_COMMIT
       LUA_COMMIT JSONCONS_COMMIT
"""

import re
import sys

(helio_tp, ext_libs, distdir, rapidjson_commit, expected_commit,
 dconv_commit, hdr_commit, lua_commit, jsoncons_commit) = sys.argv[1:]

D = distdir  # shorthand

# ── helpers ─────────────────────────────────────────────────────────────────

def url_repl(path):
    return f'URL "{path}"'

def git_to_url(content, git_repo_pat, git_tag_pat, local_path, extra_remove=()):
    """Replace a GIT_REPOSITORY + GIT_TAG block (and optional extras) with URL."""
    # Build a pattern that matches the git source lines in any order inside
    # an add_third_party() call.  We replace GIT_REPOSITORY/GIT_TAG and any
    # extra git-specific lines, inserting a URL line in their place.
    lines_to_remove = [git_repo_pat, git_tag_pat] + list(extra_remove)
    # Remove each line individually (they may appear in any order)
    for pat in lines_to_remove:
        content = re.sub(r'\n\s*' + pat + r'[^\n]*', '', content)
    # Insert URL after the dep name line (first line of the add_third_party call)
    content = re.sub(
        r'(' + git_repo_pat[:20] + r')',  # anchor on first few chars of repo pat
        url_repl(local_path) + '\n  ',
        content, count=1
    )
    return content

def simple_url_repl(content, old_url, new_path):
    return content.replace(f'URL {old_url}', url_repl(new_path), 1)

# ── patch helio/cmake/third_party.cmake ─────────────────────────────────────

with open(helio_tp) as f:
    htpc = f.read()

# URL-based ExternalProject deps → local distfiles
htpc = simple_url_repl(htpc,
    'https://github.com/Cyan4973/xxHash/archive/v0.8.3.tar.gz',
    f'{D}/xxhash-0.8.3.gh.tar.gz')

htpc = simple_url_repl(htpc,
    'https://github.com/axboe/liburing/archive/refs/tags/liburing-2.13.tar.gz',
    f'{D}/liburing-2.13.gh.tar.gz')

htpc = simple_url_repl(htpc,
    'https://github.com/zeux/pugixml/archive/refs/tags/v1.15.tar.gz',
    f'{D}/pugixml-1.15.gh.tar.gz')

htpc = simple_url_repl(htpc,
    'https://codeload.github.com/c-ares/c-ares/tar.gz/refs/tags/v1.34.5',
    f'{D}/c-ares-1.34.5.tar.gz')

htpc = simple_url_repl(htpc,
    'https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.zst',
    f'{D}/zstd-1.5.7.tar.zst')

# GIT-based deps → URL with local tarball
# rapidjson: GIT_REPOSITORY ... GIT_TAG ab1842a
htpc = re.sub(
    r'GIT_REPOSITORY https://github\.com/Tencent/rapidjson\.git\s*\n\s*GIT_TAG \S+',
    url_repl(f'{D}/rapidjson-{rapidjson_commit[:8]}.gh.tar.gz'),
    htpc)

# expected-lite: GIT_REPOSITORY ... GIT_TAG f17940f...
htpc = re.sub(
    r'GIT_REPOSITORY https://github\.com/martinmoene/expected-lite\.git\s*\n\s*GIT_TAG \S+',
    url_repl(f'{D}/expected-lite-{expected_commit[:8]}.gh.tar.gz'),
    htpc)

# aws: disabled by WITH_AWS=OFF — leave as-is (gated by if(WITH_AWS))
# gperf: disabled by WITH_GPERF=OFF — leave as-is
# glog: disabled by LEGACY_GLOG=OFF — leave as-is

# liburing src/Makefile: override CFLAGS += $(BUILD_CFLAGS) $(LIBURING_CFLAGS)
# Pass LIBURING_CFLAGS so -fPIC is added to static object compilation.
htpc = htpc.replace(
    'BUILD_COMMAND make -C src\n',
    'BUILD_COMMAND make -C src LIBURING_CFLAGS=-fPIC\n',
    1)

with open(helio_tp, 'w') as f:
    f.write(htpc)

# ── patch src/external_libs.cmake ───────────────────────────────────────────

with open(ext_libs) as f:
    elc = f.read()

# URL-based deps → local distfiles
elc = simple_url_repl(elc,
    'https://github.com/Genivia/RE-flex/archive/refs/tags/v5.2.2.tar.gz',
    f'{D}/RE-flex-5.2.2.gh.tar.gz')

elc = simple_url_repl(elc,
    'https://github.com/lz4/lz4/archive/refs/tags/v1.10.0.tar.gz',
    f'{D}/lz4-1.10.0.gh.tar.gz')

elc = simple_url_repl(elc,
    'https://github.com/microsoft/mimalloc/archive/refs/tags/v2.2.4.tar.gz',
    f'{D}/mimalloc-2.2.4.gh.tar.gz')

elc = simple_url_repl(elc,
    'https://github.com/mariusbancila/croncpp/archive/refs/tags/v2023.03.30.tar.gz',
    f'{D}/croncpp-2023.03.30.gh.tar.gz')

elc = simple_url_repl(elc,
    'https://github.com/fastfloat/fast_float/archive/refs/tags/v5.2.0.tar.gz',
    f'{D}/fast_float-5.2.0.gh.tar.gz')

elc = simple_url_repl(elc,
    'https://github.com/google/flatbuffers/archive/refs/tags/v23.5.26.tar.gz',
    f'{D}/flatbuffers-23.5.26.gh.tar.gz')

# RE-flex is compiled as a static archive then linked into shared libraries;
# add -fPIC so position-independent code is generated.
elc = elc.replace(
    'CC=${CMAKE_C_COMPILER}',
    'CC=${CMAKE_C_COMPILER} CXXFLAGS=-fPIC CFLAGS=-fPIC',
    1)

# lua uses make with OPTFLAGS as an extension point for extra CFLAGS.
elc = elc.replace(
    'BUILD_COMMAND ${DFLY_TOOLS_MAKE} all\n',
    'BUILD_COMMAND ${DFLY_TOOLS_MAKE} all OPTFLAGS=-fPIC\n',
    1)

# lz4 lib/Makefile: CFLAGS = $(DEBUGFLAGS) $(USERCFLAGS); USERCFLAGS:= -O3 $(env CFLAGS)
# Override CFLAGS directly with -O3 -fPIC (backslash-space = cmake escaped space in a list token).
elc = elc.replace(
    'BUILD_COMMAND ${DFLY_TOOLS_MAKE} lib-release\n',
    'BUILD_COMMAND ${DFLY_TOOLS_MAKE} lib-release CFLAGS=-O3\\ -fPIC\n',
    1)

# GIT-based deps → URL with local tarball

# lua: GIT_REPOSITORY ... GIT_TAG Dragonfly-5.4.6a (branch, use commit)
elc = re.sub(
    r'GIT_REPOSITORY https://github\.com/dragonflydb/lua\s*\n\s*GIT_TAG Dragonfly-5\.4\.6a',
    url_repl(f'{D}/lua-{lua_commit[:8]}.gh.tar.gz'),
    elc)

# dconv: GIT_REPOSITORY ... GIT_TAG 0604b4c (keep PATCH_COMMAND)
elc = re.sub(
    r'GIT_REPOSITORY https://github\.com/google/double-conversion\s*\n\s*# URL [^\n]*\s*\n\s*GIT_TAG \S+',
    url_repl(f'{D}/double-conversion-{dconv_commit[:8]}.gh.tar.gz'),
    elc)
# Fallback if the comment line format differs
elc = re.sub(
    r'GIT_REPOSITORY https://github\.com/google/double-conversion\s*\n\s*GIT_TAG \S+',
    url_repl(f'{D}/double-conversion-{dconv_commit[:8]}.gh.tar.gz'),
    elc)

# jsoncons: GIT_REPOSITORY ... GIT_TAG Dragonfly1.5.0 GIT_SHALLOW 1 (branch, use commit)
elc = re.sub(
    r'GIT_REPOSITORY https://github\.com/dragonflydb/jsoncons\s*\n\s*GIT_TAG Dragonfly1\.5\.0\s*\n\s*GIT_SHALLOW 1',
    url_repl(f'{D}/jsoncons-{jsoncons_commit[:8]}.gh.tar.gz'),
    elc)

# hdr_histogram: GIT_REPOSITORY ... GIT_TAG <full-sha>
elc = re.sub(
    r'GIT_REPOSITORY https://github\.com/HdrHistogram/HdrHistogram_c/\s*\n\s*GIT_TAG \S+',
    url_repl(f'{D}/HdrHistogram_c-{hdr_commit[:8]}.gh.tar.gz'),
    elc)

with open(ext_libs, 'w') as f:
    f.write(elc)

print("cmake source patching complete")
