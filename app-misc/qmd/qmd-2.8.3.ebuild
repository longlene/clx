# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="mini cli search engine for your docs, knowledge bases, meeting notes, whatever"
HOMEPAGE="https://github.com/tobi/qmd"

# qmd is a Bun/TypeScript CLI published only through the npm registry (and a
# Nix flake that vendors node_modules via a network-fetched, hash-pinned
# fixed-output derivation). Neither ::gentoo nor this overlay has an
# npm-dependency eclass (nothing like cargo.eclass's CARGO_CRATE_URIS), and
# upstream ships no standalone binary release, so every runtime + build-time
# npm dependency actually used (production "dependencies", the linux-x64
# native optionals, and the "typescript"/"@types/*" devDependencies needed by
# scripts/build.mjs) is hand-vendored below, pinned to the exact versions
# `bun.lock` resolves. Test-only devDependencies (vitest, vite, tsx, esbuild,
# rollup...) are intentionally not vendored: they are never invoked by
# scripts/build.mjs.
#
# node-llama-cpp, sqlite-vec and the four tree-sitter grammars all ship
# prebuilt native binaries *inside* their npm tarballs (verified by
# unpacking each one) -- there is no node-gyp/cmake compile step here, only
# extraction, which is what makes hand-vendoring feasible at all.
SRC_URI="
	https://github.com/tobi/qmd/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz

	https://registry.npmjs.org/@huggingface/jinja/-/jinja-0.5.10.tgz -> huggingface__jinja-0.5.10.npm.tgz
	https://registry.npmjs.org/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz -> isaacs__fs-minipass-4.0.1.npm.tgz
	https://registry.npmjs.org/@kwsites/file-exists/-/file-exists-1.1.1.tgz -> kwsites__file-exists-1.1.1.npm.tgz
	https://registry.npmjs.org/@kwsites/promise-deferred/-/promise-deferred-1.1.1.tgz -> kwsites__promise-deferred-1.1.1.npm.tgz
	https://registry.npmjs.org/@modelcontextprotocol/core/-/core-2.0.0.tgz -> modelcontextprotocol__core-2.0.0.npm.tgz
	https://registry.npmjs.org/@modelcontextprotocol/server/-/server-2.0.0.tgz -> modelcontextprotocol__server-2.0.0.npm.tgz
	https://registry.npmjs.org/@node-llama-cpp/linux-x64/-/linux-x64-3.20.0.tgz -> node-llama-cpp__linux-x64-3.20.0.npm.tgz
	https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> nodelib__fs.scandir-2.1.5.npm.tgz
	https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> nodelib__fs.stat-2.0.5.npm.tgz
	https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> nodelib__fs.walk-1.2.8.npm.tgz
	https://registry.npmjs.org/@reflink/reflink/-/reflink-0.1.19.tgz -> reflink__reflink-0.1.19.npm.tgz
	https://registry.npmjs.org/@reflink/reflink-linux-x64-gnu/-/reflink-linux-x64-gnu-0.1.19.tgz -> reflink__reflink-linux-x64-gnu-0.1.19.npm.tgz
	https://registry.npmjs.org/@simple-git/args-pathspec/-/args-pathspec-1.0.3.tgz -> simple-git__args-pathspec-1.0.3.npm.tgz
	https://registry.npmjs.org/@simple-git/argv-parser/-/argv-parser-1.1.1.tgz -> simple-git__argv-parser-1.1.1.npm.tgz
	https://registry.npmjs.org/@tinyhttp/content-disposition/-/content-disposition-2.2.4.tgz -> tinyhttp__content-disposition-2.2.4.npm.tgz
	https://registry.npmjs.org/@types/better-sqlite3/-/better-sqlite3-7.6.13.tgz -> types__better-sqlite3-7.6.13.npm.tgz
	https://registry.npmjs.org/@types/node/-/node-24.10.1.tgz -> types__node-24.10.1.npm.tgz
	https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-6.2.1.tgz -> ansi-escapes-6.2.1.npm.tgz
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz -> ansi-regex-5.0.1.npm.tgz
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-6.3.0.tgz -> ansi-regex-6.3.0.npm.tgz
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz -> ansi-styles-4.3.0.npm.tgz
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-6.2.3.tgz -> ansi-styles-6.2.3.npm.tgz
	https://registry.npmjs.org/async-retry/-/async-retry-1.3.3.tgz -> async-retry-1.3.3.npm.tgz
	https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-13.0.3.tgz -> better-sqlite3-13.0.3.npm.tgz
	https://registry.npmjs.org/braces/-/braces-3.0.3.tgz -> braces-3.0.3.npm.tgz
	https://registry.npmjs.org/bytes/-/bytes-3.1.2.tgz -> bytes-3.1.2.npm.tgz
	https://registry.npmjs.org/chalk/-/chalk-5.6.2.tgz -> chalk-5.6.2.npm.tgz
	https://registry.npmjs.org/chmodrp/-/chmodrp-1.0.2.tgz -> chmodrp-1.0.2.npm.tgz
	https://registry.npmjs.org/chownr/-/chownr-3.0.0.tgz -> chownr-3.0.0.npm.tgz
	https://registry.npmjs.org/ci-info/-/ci-info-4.4.0.tgz -> ci-info-4.4.0.npm.tgz
	https://registry.npmjs.org/cli-cursor/-/cli-cursor-5.0.0.tgz -> cli-cursor-5.0.0.npm.tgz
	https://registry.npmjs.org/cli-spinners/-/cli-spinners-2.9.2.tgz -> cli-spinners-2.9.2.npm.tgz
	https://registry.npmjs.org/cli-spinners/-/cli-spinners-3.4.0.tgz -> cli-spinners-3.4.0.npm.tgz
	https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz -> cliui-8.0.1.npm.tgz
	https://registry.npmjs.org/cmake-js/-/cmake-js-8.0.0.tgz -> cmake-js-8.0.0.npm.tgz
	https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz -> color-convert-2.0.1.npm.tgz
	https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz -> color-name-1.1.4.npm.tgz
	https://registry.npmjs.org/commander/-/commander-10.0.1.tgz -> commander-10.0.1.npm.tgz
	https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.6.tgz -> cross-spawn-7.0.6.npm.tgz
	https://registry.npmjs.org/debug/-/debug-4.4.3.tgz -> debug-4.4.3.npm.tgz
	https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz -> deep-extend-0.6.0.npm.tgz
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-10.6.0.tgz -> emoji-regex-10.6.0.npm.tgz
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz -> emoji-regex-8.0.0.npm.tgz
	https://registry.npmjs.org/env-var/-/env-var-7.5.0.tgz -> env-var-7.5.0.npm.tgz
	https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz -> escalade-3.2.0.npm.tgz
	https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.4.tgz -> eventemitter3-5.0.4.npm.tgz
	https://registry.npmjs.org/fast-glob/-/fast-glob-3.3.3.tgz -> fast-glob-3.3.3.npm.tgz
	https://registry.npmjs.org/fastq/-/fastq-1.20.3.tgz -> fastq-1.20.3.npm.tgz
	https://registry.npmjs.org/filename-reserved-regex/-/filename-reserved-regex-3.0.0.tgz -> filename-reserved-regex-3.0.0.npm.tgz
	https://registry.npmjs.org/filenamify/-/filenamify-6.0.0.tgz -> filenamify-6.0.0.npm.tgz
	https://registry.npmjs.org/fill-range/-/fill-range-7.1.1.tgz -> fill-range-7.1.1.npm.tgz
	https://registry.npmjs.org/fs-extra/-/fs-extra-11.4.0.tgz -> fs-extra-11.4.0.npm.tgz
	https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz -> get-caller-file-2.0.5.npm.tgz
	https://registry.npmjs.org/get-east-asian-width/-/get-east-asian-width-1.6.0.tgz -> get-east-asian-width-1.6.0.npm.tgz
	https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz -> glob-parent-5.1.2.npm.tgz
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz -> graceful-fs-4.2.11.npm.tgz
	https://registry.npmjs.org/ignore/-/ignore-7.0.9.tgz -> ignore-7.0.9.npm.tgz
	https://registry.npmjs.org/ini/-/ini-1.3.8.tgz -> ini-1.3.8.npm.tgz
	https://registry.npmjs.org/ipull/-/ipull-3.9.5.tgz -> ipull-3.9.5.npm.tgz
	https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz -> is-extglob-2.1.1.npm.tgz
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz -> is-fullwidth-code-point-3.0.0.npm.tgz
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-5.1.0.tgz -> is-fullwidth-code-point-5.1.0.npm.tgz
	https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz -> is-glob-4.0.3.npm.tgz
	https://registry.npmjs.org/is-interactive/-/is-interactive-2.0.0.tgz -> is-interactive-2.0.0.npm.tgz
	https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz -> is-number-7.0.0.npm.tgz
	https://registry.npmjs.org/is-unicode-supported/-/is-unicode-supported-2.1.0.tgz -> is-unicode-supported-2.1.0.npm.tgz
	https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz -> isexe-2.0.0.npm.tgz
	https://registry.npmjs.org/isexe/-/isexe-4.0.0.tgz -> isexe-4.0.0.npm.tgz
	https://registry.npmjs.org/jsonfile/-/jsonfile-6.2.1.tgz -> jsonfile-6.2.1.npm.tgz
	https://registry.npmjs.org/lifecycle-utils/-/lifecycle-utils-2.1.0.tgz -> lifecycle-utils-2.1.0.npm.tgz
	https://registry.npmjs.org/lifecycle-utils/-/lifecycle-utils-4.4.1.tgz -> lifecycle-utils-4.4.1.npm.tgz
	https://registry.npmjs.org/lodash.debounce/-/lodash.debounce-4.0.8.tgz -> lodash.debounce-4.0.8.npm.tgz
	https://registry.npmjs.org/log-symbols/-/log-symbols-7.0.1.tgz -> log-symbols-7.0.1.npm.tgz
	https://registry.npmjs.org/lowdb/-/lowdb-7.0.1.tgz -> lowdb-7.0.1.npm.tgz
	https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz -> merge2-1.4.1.npm.tgz
	https://registry.npmjs.org/micromatch/-/micromatch-4.0.8.tgz -> micromatch-4.0.8.npm.tgz
	https://registry.npmjs.org/mimic-function/-/mimic-function-5.0.1.tgz -> mimic-function-5.0.1.npm.tgz
	https://registry.npmjs.org/minimist/-/minimist-1.2.8.tgz -> minimist-1.2.8.npm.tgz
	https://registry.npmjs.org/minipass/-/minipass-7.1.3.tgz -> minipass-7.1.3.npm.tgz
	https://registry.npmjs.org/minizlib/-/minizlib-3.1.0.tgz -> minizlib-3.1.0.npm.tgz
	https://registry.npmjs.org/ms/-/ms-2.1.3.tgz -> ms-2.1.3.npm.tgz
	https://registry.npmjs.org/nanoid/-/nanoid-5.1.16.tgz -> nanoid-5.1.16.npm.tgz
	https://registry.npmjs.org/node-addon-api/-/node-addon-api-8.9.2.tgz -> node-addon-api-8.9.2.npm.tgz
	https://registry.npmjs.org/node-api-headers/-/node-api-headers-1.9.0.tgz -> node-api-headers-1.9.0.npm.tgz
	https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.8.4.tgz -> node-gyp-build-4.8.4.npm.tgz
	https://registry.npmjs.org/node-llama-cpp/-/node-llama-cpp-3.20.0.tgz -> node-llama-cpp-3.20.0.npm.tgz
	https://registry.npmjs.org/onetime/-/onetime-7.0.0.tgz -> onetime-7.0.0.npm.tgz
	https://registry.npmjs.org/ora/-/ora-9.4.1.tgz -> ora-9.4.1.npm.tgz
	https://registry.npmjs.org/parse-ms/-/parse-ms-3.0.0.tgz -> parse-ms-3.0.0.npm.tgz
	https://registry.npmjs.org/parse-ms/-/parse-ms-4.0.0.tgz -> parse-ms-4.0.0.npm.tgz
	https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz -> path-key-3.1.1.npm.tgz
	https://registry.npmjs.org/picomatch/-/picomatch-2.3.2.tgz -> picomatch-2.3.2.npm.tgz
	https://registry.npmjs.org/picomatch/-/picomatch-4.0.5.tgz -> picomatch-4.0.5.npm.tgz
	https://registry.npmjs.org/pretty-bytes/-/pretty-bytes-6.1.1.tgz -> pretty-bytes-6.1.1.npm.tgz
	https://registry.npmjs.org/pretty-ms/-/pretty-ms-8.0.0.tgz -> pretty-ms-8.0.0.npm.tgz
	https://registry.npmjs.org/pretty-ms/-/pretty-ms-9.3.1.tgz -> pretty-ms-9.3.1.npm.tgz
	https://registry.npmjs.org/proper-lockfile/-/proper-lockfile-4.1.2.tgz -> proper-lockfile-4.1.2.npm.tgz
	https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz -> queue-microtask-1.2.3.npm.tgz
	https://registry.npmjs.org/rc/-/rc-1.2.8.tgz -> rc-1.2.8.npm.tgz
	https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz -> require-directory-2.1.1.npm.tgz
	https://registry.npmjs.org/restore-cursor/-/restore-cursor-5.1.0.tgz -> restore-cursor-5.1.0.npm.tgz
	https://registry.npmjs.org/retry/-/retry-0.12.0.tgz -> retry-0.12.0.npm.tgz
	https://registry.npmjs.org/retry/-/retry-0.13.1.tgz -> retry-0.13.1.npm.tgz
	https://registry.npmjs.org/reusify/-/reusify-1.1.0.tgz -> reusify-1.1.0.npm.tgz
	https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz -> run-parallel-1.2.0.npm.tgz
	https://registry.npmjs.org/semver/-/semver-7.8.5.tgz -> semver-7.8.5.npm.tgz
	https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz -> shebang-command-2.0.0.npm.tgz
	https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz -> shebang-regex-3.0.0.npm.tgz
	https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz -> signal-exit-3.0.7.npm.tgz
	https://registry.npmjs.org/signal-exit/-/signal-exit-4.1.0.tgz -> signal-exit-4.1.0.npm.tgz
	https://registry.npmjs.org/simple-git/-/simple-git-3.36.0.tgz -> simple-git-3.36.0.npm.tgz
	https://registry.npmjs.org/sleep-promise/-/sleep-promise-9.1.0.tgz -> sleep-promise-9.1.0.npm.tgz
	https://registry.npmjs.org/slice-ansi/-/slice-ansi-7.1.2.tgz -> slice-ansi-7.1.2.npm.tgz
	https://registry.npmjs.org/slice-ansi/-/slice-ansi-8.0.0.tgz -> slice-ansi-8.0.0.npm.tgz
	https://registry.npmjs.org/sqlite-vec/-/sqlite-vec-0.1.9.tgz -> sqlite-vec-0.1.9.npm.tgz
	https://registry.npmjs.org/sqlite-vec-linux-x64/-/sqlite-vec-linux-x64-0.1.9.tgz -> sqlite-vec-linux-x64-0.1.9.npm.tgz
	https://registry.npmjs.org/stdin-discarder/-/stdin-discarder-0.3.2.tgz -> stdin-discarder-0.3.2.npm.tgz
	https://registry.npmjs.org/stdout-update/-/stdout-update-4.0.1.tgz -> stdout-update-4.0.1.npm.tgz
	https://registry.npmjs.org/steno/-/steno-4.0.2.tgz -> steno-4.0.2.npm.tgz
	https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz -> string-width-4.2.3.npm.tgz
	https://registry.npmjs.org/string-width/-/string-width-7.2.0.tgz -> string-width-7.2.0.npm.tgz
	https://registry.npmjs.org/string-width/-/string-width-8.2.2.tgz -> string-width-8.2.2.npm.tgz
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz -> strip-ansi-6.0.1.npm.tgz
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-7.2.0.tgz -> strip-ansi-7.2.0.npm.tgz
	https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-2.0.1.tgz -> strip-json-comments-2.0.1.npm.tgz
	https://registry.npmjs.org/tar/-/tar-7.5.22.tgz -> tar-7.5.22.npm.tgz
	https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz -> to-regex-range-5.0.1.npm.tgz
	https://registry.npmjs.org/tree-sitter-go/-/tree-sitter-go-0.25.0.tgz -> tree-sitter-go-0.25.0.npm.tgz
	https://registry.npmjs.org/tree-sitter-javascript/-/tree-sitter-javascript-0.23.1.tgz -> tree-sitter-javascript-0.23.1.npm.tgz
	https://registry.npmjs.org/tree-sitter-python/-/tree-sitter-python-0.25.0.tgz -> tree-sitter-python-0.25.0.npm.tgz
	https://registry.npmjs.org/tree-sitter-rust/-/tree-sitter-rust-0.24.0.tgz -> tree-sitter-rust-0.24.0.npm.tgz
	https://registry.npmjs.org/tree-sitter-typescript/-/tree-sitter-typescript-0.23.2.tgz -> tree-sitter-typescript-0.23.2.npm.tgz
	https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz -> typescript-5.9.3.npm.tgz
	https://registry.npmjs.org/undici-types/-/undici-types-7.16.0.tgz -> undici-types-7.16.0.npm.tgz
	https://registry.npmjs.org/universalify/-/universalify-2.0.1.tgz -> universalify-2.0.1.npm.tgz
	https://registry.npmjs.org/url-join/-/url-join-4.0.1.tgz -> url-join-4.0.1.npm.tgz
	https://registry.npmjs.org/validate-npm-package-name/-/validate-npm-package-name-7.0.2.tgz -> validate-npm-package-name-7.0.2.npm.tgz
	https://registry.npmjs.org/web-tree-sitter/-/web-tree-sitter-0.26.12.tgz -> web-tree-sitter-0.26.12.npm.tgz
	https://registry.npmjs.org/which/-/which-2.0.2.tgz -> which-2.0.2.npm.tgz
	https://registry.npmjs.org/which/-/which-6.0.1.tgz -> which-6.0.1.npm.tgz
	https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz -> wrap-ansi-7.0.0.npm.tgz
	https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz -> y18n-5.0.8.npm.tgz
	https://registry.npmjs.org/yallist/-/yallist-5.0.0.tgz -> yallist-5.0.0.npm.tgz
	https://registry.npmjs.org/yaml/-/yaml-2.9.0.tgz -> yaml-2.9.0.npm.tgz
	https://registry.npmjs.org/yargs/-/yargs-17.7.3.tgz -> yargs-17.7.3.npm.tgz
	https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz -> yargs-parser-21.1.1.npm.tgz
	https://registry.npmjs.org/yoctocolors/-/yoctocolors-2.2.0.tgz -> yoctocolors-2.2.0.npm.tgz
	https://registry.npmjs.org/zod/-/zod-4.2.1.tgz -> zod-4.2.1.npm.tgz
"

S="${WORKDIR}/${P}"

LICENSE="Apache-2.0 BlueOak-1.0.0 ISC MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

RDEPEND=">=net-libs/nodejs-22"
BDEPEND="${RDEPEND}"

QA_PREBUILT="
	usr/lib/qmd/node_modules/better-sqlite3/prebuilds/linux-x64.node
	usr/lib/qmd/node_modules/tree-sitter-go/prebuilds/linux-x64/*
	usr/lib/qmd/node_modules/tree-sitter-javascript/prebuilds/linux-x64/*
	usr/lib/qmd/node_modules/tree-sitter-python/prebuilds/linux-x64/*
	usr/lib/qmd/node_modules/tree-sitter-rust/prebuilds/linux-x64/*
	usr/lib/qmd/node_modules/tree-sitter-typescript/prebuilds/linux-x64/*
	usr/lib/qmd/node_modules/@node-llama-cpp/linux-x64/bins/linux-x64/*
	usr/lib/qmd/node_modules/sqlite-vec-linux-x64/vec0.so
	usr/lib/qmd/node_modules/@reflink/reflink-linux-x64-gnu/*.node
"

DOCS=( README.md CHANGELOG.md )

src_unpack() {
	unpack "${P}.gh.tar.gz"
}

src_prepare() {
	default

	# node_modules/<relative path> -> vendored distfile. Paths with a
	# "node_modules/" component are nested copies npm's resolver placed
	# there for a version conflicting with the hoisted top-level package
	# of the same name (mirrors what a real `npm install` produced for
	# this exact dependency graph).
	local -A npm_layout=(
		[@huggingface/jinja]="huggingface__jinja-0.5.10.npm.tgz"
		[@isaacs/fs-minipass]="isaacs__fs-minipass-4.0.1.npm.tgz"
		[@kwsites/file-exists]="kwsites__file-exists-1.1.1.npm.tgz"
		[@kwsites/promise-deferred]="kwsites__promise-deferred-1.1.1.npm.tgz"
		[@modelcontextprotocol/core]="modelcontextprotocol__core-2.0.0.npm.tgz"
		[@modelcontextprotocol/server]="modelcontextprotocol__server-2.0.0.npm.tgz"
		[@node-llama-cpp/linux-x64]="node-llama-cpp__linux-x64-3.20.0.npm.tgz"
		[@nodelib/fs.scandir]="nodelib__fs.scandir-2.1.5.npm.tgz"
		[@nodelib/fs.stat]="nodelib__fs.stat-2.0.5.npm.tgz"
		[@nodelib/fs.walk]="nodelib__fs.walk-1.2.8.npm.tgz"
		[@reflink/reflink]="reflink__reflink-0.1.19.npm.tgz"
		[@reflink/reflink-linux-x64-gnu]="reflink__reflink-linux-x64-gnu-0.1.19.npm.tgz"
		[@simple-git/args-pathspec]="simple-git__args-pathspec-1.0.3.npm.tgz"
		[@simple-git/argv-parser]="simple-git__argv-parser-1.1.1.npm.tgz"
		[@tinyhttp/content-disposition]="tinyhttp__content-disposition-2.2.4.npm.tgz"
		[@types/better-sqlite3]="types__better-sqlite3-7.6.13.npm.tgz"
		[@types/node]="types__node-24.10.1.npm.tgz"
		[ansi-escapes]="ansi-escapes-6.2.1.npm.tgz"
		[ansi-regex]="ansi-regex-6.3.0.npm.tgz"
		[ansi-styles]="ansi-styles-6.2.3.npm.tgz"
		[async-retry]="async-retry-1.3.3.npm.tgz"
		[better-sqlite3]="better-sqlite3-13.0.3.npm.tgz"
		[braces]="braces-3.0.3.npm.tgz"
		[bytes]="bytes-3.1.2.npm.tgz"
		[chalk]="chalk-5.6.2.npm.tgz"
		[chmodrp]="chmodrp-1.0.2.npm.tgz"
		[chownr]="chownr-3.0.0.npm.tgz"
		[ci-info]="ci-info-4.4.0.npm.tgz"
		[cli-cursor]="cli-cursor-5.0.0.npm.tgz"
		[cli-spinners]="cli-spinners-2.9.2.npm.tgz"
		[cliui]="cliui-8.0.1.npm.tgz"
		[cliui/node_modules/ansi-regex]="ansi-regex-5.0.1.npm.tgz"
		[cliui/node_modules/is-fullwidth-code-point]="is-fullwidth-code-point-3.0.0.npm.tgz"
		[cliui/node_modules/string-width]="string-width-4.2.3.npm.tgz"
		[cliui/node_modules/strip-ansi]="strip-ansi-6.0.1.npm.tgz"
		[cmake-js]="cmake-js-8.0.0.npm.tgz"
		[color-convert]="color-convert-2.0.1.npm.tgz"
		[color-name]="color-name-1.1.4.npm.tgz"
		[commander]="commander-10.0.1.npm.tgz"
		[cross-spawn]="cross-spawn-7.0.6.npm.tgz"
		[cross-spawn/node_modules/isexe]="isexe-2.0.0.npm.tgz"
		[cross-spawn/node_modules/which]="which-2.0.2.npm.tgz"
		[debug]="debug-4.4.3.npm.tgz"
		[deep-extend]="deep-extend-0.6.0.npm.tgz"
		[emoji-regex]="emoji-regex-8.0.0.npm.tgz"
		[env-var]="env-var-7.5.0.npm.tgz"
		[escalade]="escalade-3.2.0.npm.tgz"
		[eventemitter3]="eventemitter3-5.0.4.npm.tgz"
		[fast-glob]="fast-glob-3.3.3.npm.tgz"
		[fastq]="fastq-1.20.3.npm.tgz"
		[filename-reserved-regex]="filename-reserved-regex-3.0.0.npm.tgz"
		[filenamify]="filenamify-6.0.0.npm.tgz"
		[fill-range]="fill-range-7.1.1.npm.tgz"
		[fs-extra]="fs-extra-11.4.0.npm.tgz"
		[get-caller-file]="get-caller-file-2.0.5.npm.tgz"
		[get-east-asian-width]="get-east-asian-width-1.6.0.npm.tgz"
		[glob-parent]="glob-parent-5.1.2.npm.tgz"
		[graceful-fs]="graceful-fs-4.2.11.npm.tgz"
		[ignore]="ignore-7.0.9.npm.tgz"
		[ini]="ini-1.3.8.npm.tgz"
		[ipull]="ipull-3.9.5.npm.tgz"
		[ipull/node_modules/lifecycle-utils]="lifecycle-utils-2.1.0.npm.tgz"
		[ipull/node_modules/parse-ms]="parse-ms-3.0.0.npm.tgz"
		[ipull/node_modules/pretty-ms]="pretty-ms-8.0.0.npm.tgz"
		[ipull/node_modules/slice-ansi]="slice-ansi-7.1.2.npm.tgz"
		[is-extglob]="is-extglob-2.1.1.npm.tgz"
		[is-fullwidth-code-point]="is-fullwidth-code-point-5.1.0.npm.tgz"
		[is-glob]="is-glob-4.0.3.npm.tgz"
		[is-interactive]="is-interactive-2.0.0.npm.tgz"
		[is-number]="is-number-7.0.0.npm.tgz"
		[is-unicode-supported]="is-unicode-supported-2.1.0.npm.tgz"
		[isexe]="isexe-4.0.0.npm.tgz"
		[jsonfile]="jsonfile-6.2.1.npm.tgz"
		[lifecycle-utils]="lifecycle-utils-4.4.1.npm.tgz"
		[lodash.debounce]="lodash.debounce-4.0.8.npm.tgz"
		[log-symbols]="log-symbols-7.0.1.npm.tgz"
		[lowdb]="lowdb-7.0.1.npm.tgz"
		[merge2]="merge2-1.4.1.npm.tgz"
		[micromatch]="micromatch-4.0.8.npm.tgz"
		[micromatch/node_modules/picomatch]="picomatch-2.3.2.npm.tgz"
		[mimic-function]="mimic-function-5.0.1.npm.tgz"
		[minimist]="minimist-1.2.8.npm.tgz"
		[minipass]="minipass-7.1.3.npm.tgz"
		[minizlib]="minizlib-3.1.0.npm.tgz"
		[ms]="ms-2.1.3.npm.tgz"
		[nanoid]="nanoid-5.1.16.npm.tgz"
		[node-addon-api]="node-addon-api-8.9.2.npm.tgz"
		[node-api-headers]="node-api-headers-1.9.0.npm.tgz"
		[node-gyp-build]="node-gyp-build-4.8.4.npm.tgz"
		[node-llama-cpp]="node-llama-cpp-3.20.0.npm.tgz"
		[onetime]="onetime-7.0.0.npm.tgz"
		[ora]="ora-9.4.1.npm.tgz"
		[ora/node_modules/cli-spinners]="cli-spinners-3.4.0.npm.tgz"
		[parse-ms]="parse-ms-4.0.0.npm.tgz"
		[path-key]="path-key-3.1.1.npm.tgz"
		[picomatch]="picomatch-4.0.5.npm.tgz"
		[pretty-bytes]="pretty-bytes-6.1.1.npm.tgz"
		[pretty-ms]="pretty-ms-9.3.1.npm.tgz"
		[proper-lockfile]="proper-lockfile-4.1.2.npm.tgz"
		[proper-lockfile/node_modules/retry]="retry-0.12.0.npm.tgz"
		[queue-microtask]="queue-microtask-1.2.3.npm.tgz"
		[rc]="rc-1.2.8.npm.tgz"
		[require-directory]="require-directory-2.1.1.npm.tgz"
		[restore-cursor]="restore-cursor-5.1.0.npm.tgz"
		[restore-cursor/node_modules/signal-exit]="signal-exit-4.1.0.npm.tgz"
		[retry]="retry-0.13.1.npm.tgz"
		[reusify]="reusify-1.1.0.npm.tgz"
		[run-parallel]="run-parallel-1.2.0.npm.tgz"
		[semver]="semver-7.8.5.npm.tgz"
		[shebang-command]="shebang-command-2.0.0.npm.tgz"
		[shebang-regex]="shebang-regex-3.0.0.npm.tgz"
		[signal-exit]="signal-exit-3.0.7.npm.tgz"
		[simple-git]="simple-git-3.36.0.npm.tgz"
		[sleep-promise]="sleep-promise-9.1.0.npm.tgz"
		[slice-ansi]="slice-ansi-8.0.0.npm.tgz"
		[sqlite-vec]="sqlite-vec-0.1.9.npm.tgz"
		[sqlite-vec-linux-x64]="sqlite-vec-linux-x64-0.1.9.npm.tgz"
		[stdin-discarder]="stdin-discarder-0.3.2.npm.tgz"
		[stdout-update]="stdout-update-4.0.1.npm.tgz"
		[stdout-update/node_modules/emoji-regex]="emoji-regex-10.6.0.npm.tgz"
		[stdout-update/node_modules/string-width]="string-width-7.2.0.npm.tgz"
		[steno]="steno-4.0.2.npm.tgz"
		[string-width]="string-width-8.2.2.npm.tgz"
		[strip-ansi]="strip-ansi-7.2.0.npm.tgz"
		[strip-json-comments]="strip-json-comments-2.0.1.npm.tgz"
		[tar]="tar-7.5.22.npm.tgz"
		[to-regex-range]="to-regex-range-5.0.1.npm.tgz"
		[tree-sitter-go]="tree-sitter-go-0.25.0.npm.tgz"
		[tree-sitter-javascript]="tree-sitter-javascript-0.23.1.npm.tgz"
		[tree-sitter-python]="tree-sitter-python-0.25.0.npm.tgz"
		[tree-sitter-rust]="tree-sitter-rust-0.24.0.npm.tgz"
		[tree-sitter-typescript]="tree-sitter-typescript-0.23.2.npm.tgz"
		[typescript]="typescript-5.9.3.npm.tgz"
		[undici-types]="undici-types-7.16.0.npm.tgz"
		[universalify]="universalify-2.0.1.npm.tgz"
		[url-join]="url-join-4.0.1.npm.tgz"
		[validate-npm-package-name]="validate-npm-package-name-7.0.2.npm.tgz"
		[web-tree-sitter]="web-tree-sitter-0.26.12.npm.tgz"
		[which]="which-6.0.1.npm.tgz"
		[wrap-ansi]="wrap-ansi-7.0.0.npm.tgz"
		[wrap-ansi/node_modules/ansi-regex]="ansi-regex-5.0.1.npm.tgz"
		[wrap-ansi/node_modules/ansi-styles]="ansi-styles-4.3.0.npm.tgz"
		[wrap-ansi/node_modules/is-fullwidth-code-point]="is-fullwidth-code-point-3.0.0.npm.tgz"
		[wrap-ansi/node_modules/string-width]="string-width-4.2.3.npm.tgz"
		[wrap-ansi/node_modules/strip-ansi]="strip-ansi-6.0.1.npm.tgz"
		[y18n]="y18n-5.0.8.npm.tgz"
		[yallist]="yallist-5.0.0.npm.tgz"
		[yaml]="yaml-2.9.0.npm.tgz"
		[yargs]="yargs-17.7.3.npm.tgz"
		[yargs-parser]="yargs-parser-21.1.1.npm.tgz"
		[yargs/node_modules/ansi-regex]="ansi-regex-5.0.1.npm.tgz"
		[yargs/node_modules/is-fullwidth-code-point]="is-fullwidth-code-point-3.0.0.npm.tgz"
		[yargs/node_modules/string-width]="string-width-4.2.3.npm.tgz"
		[yargs/node_modules/strip-ansi]="strip-ansi-6.0.1.npm.tgz"
		[yoctocolors]="yoctocolors-2.2.0.npm.tgz"
		[zod]="zod-4.2.1.npm.tgz"
	)

	local relpath distfile
	for relpath in "${!npm_layout[@]}"; do
		distfile=${npm_layout[${relpath}]}
		mkdir -p "node_modules/${relpath}" || die
		tar -xzf "${DISTDIR}/${distfile}" -C "node_modules/${relpath}" \
			--strip-components=1 || die "failed to unpack ${distfile}"
	done

	# Drop the prebuilt native binaries for platforms we never load, so the
	# installed image doesn't carry macOS/Windows/other-arch weight for a
	# ~amd64 package.
	local ts_pkg
	for ts_pkg in tree-sitter-go tree-sitter-javascript tree-sitter-python \
			tree-sitter-rust tree-sitter-typescript; do
		find "node_modules/${ts_pkg}/prebuilds" -mindepth 1 -maxdepth 1 \
			! -name 'linux-x64' -exec rm -rf {} + || die
	done
	find node_modules/better-sqlite3/prebuilds -type f \
		! -name 'linux-x64.node' -delete || die
}

src_compile() {
	node scripts/build.mjs || die
}

src_install() {
	local libdir="/usr/lib/${PN}"

	insinto "${libdir}"
	doins -r dist node_modules skills
	doins package.json

	exeinto "${libdir}/bin"
	doexe bin/qmd

	dodir /usr/bin
	dosym "../lib/${PN}/bin/qmd" /usr/bin/qmd

	einstalldocs
}
