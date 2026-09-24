# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1

CRATES="
	ahash@0.8.12
	aho-corasick@1.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	autocfg@1.5.1
	base64@0.13.1
	bitflags@1.3.2
	bitflags@2.13.1
	bumpalo@3.20.3
	castaway@0.2.4
	cc@1.4.4
	cfg-if@1.0.4
	colorchoice@1.0.5
	compact_str@0.9.1
	console@0.16.4
	crossbeam-deque@0.8.7
	crossbeam-epoch@0.9.20
	crossbeam-utils@0.8.22
	daachorse@3.0.3
	darling@0.20.11
	darling_core@0.20.11
	darling_macro@0.20.11
	dary_heap@0.3.9
	defmt-macros@1.1.1
	defmt-parser@1.0.0
	defmt@1.1.1
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	either@1.18.0
	encode_unicode@1.0.0
	env_filter@2.0.0
	env_logger@0.11.11
	errno@0.3.14
	esaxx-rs@0.1.10
	fastrand@2.5.0
	find-msvc-tools@0.1.11
	fnv@1.0.7
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-macro@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	getrandom@0.3.4
	getrandom@0.4.3
	heck@0.5.0
	ident_case@1.0.1
	indicatif@0.18.6
	is_terminal_polyfill@1.70.2
	itertools@0.14.0
	itoa@1.0.18
	jiff-core@0.1.0
	jiff-static@0.2.35
	jiff@0.2.35
	js-sys@0.3.104
	libc@0.2.189
	linux-raw-sys@0.12.1
	log@0.4.34
	macro_rules_attribute-proc_macro@0.2.3
	macro_rules_attribute@0.2.3
	matrixmultiply@0.3.11
	memchr@2.8.3
	minimal-lexical@0.2.1
	mio@1.2.3
	monostate-impl@0.1.18
	monostate@0.1.18
	ndarray@0.16.1
	ndarray@0.17.2
	nom@7.1.3
	num-complex@0.4.6
	num-integer@0.1.47
	num-traits@0.2.19
	numpy@0.29.0
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	onig@6.5.3
	onig_sys@69.9.3
	paste@1.0.15
	pastey@0.2.3
	pin-project-lite@0.2.17
	pkg-config@0.3.34
	portable-atomic-util@0.2.7
	portable-atomic@1.15.0
	ppv-lite86@0.2.21
	proc-macro2@1.0.107
	pyo3-async-runtimes@0.29.0
	pyo3-build-config@0.29.2
	pyo3-ffi@0.29.2
	pyo3-macros-backend@0.29.2
	pyo3-macros@0.29.2
	pyo3@0.29.2
	quote@1.0.47
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.9.5
	rand_chacha@0.9.0
	rand_core@0.9.5
	rawpointer@0.2.1
	rayon-cond@0.4.0
	rayon-core@1.13.0
	rayon@1.12.0
	regex-automata@0.4.18
	regex-syntax@0.8.11
	regex@1.13.1
	rustc-hash@2.1.3
	rustix@1.1.4
	rustversion@1.0.23
	ryu@1.0.23
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	shlex@2.0.1
	signal-hook-registry@1.4.8
	slab@0.4.12
	smallvec@1.16.0
	spm_precompiled@0.1.4
	static_assertions@1.1.0
	strsim@0.11.1
	syn@2.0.119
	syn@3.0.4
	target-lexicon@0.13.5
	tempfile@3.27.0
	thiserror-impl@2.0.20
	thiserror@2.0.20
	tokio-macros@2.7.2
	tokio@1.53.1
	unicode-ident@1.0.24
	unicode-normalization-alignments@0.1.12
	unicode-segmentation@1.13.3
	unicode-width@0.2.2
	unicode_categories@0.1.1
	unit-prefix@0.5.2
	utf8parse@0.2.2
	version_check@0.9.5
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen-macro-support@0.2.127
	wasm-bindgen-macro@0.2.127
	wasm-bindgen-shared@0.2.127
	wasm-bindgen@0.2.127
	web-time@1.1.0
	windows-link@0.2.1
	windows-sys@0.61.2
	wit-bindgen@0.57.1
	zerocopy-derive@0.8.56
	zerocopy@0.8.56
	zmij@1.0.23
"

RUST_MIN_VER="1.87.0"

inherit cargo distutils-r1

DESCRIPTION="Implementation of today's most used tokenizers"
HOMEPAGE="https://github.com/huggingface/tokenizers"
SRC_URI="
	https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT MPL-2.0
	Unicode-3.0 Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="dev-libs/oniguruma"
BDEPEND="
	test? ( sci-ml/datasets[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		dev-python/setuptools-rust[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest

QA_FLAGS_IGNORED=".*/site-packages/tokenizers/.*so"

src_unpack() {
	cargo_src_unpack
}

pkg_setup() {
	python-single-r1_pkg_setup
	rust_pkg_setup
}

src_prepare() {
	default
	cd bindings/python
	distutils-r1_src_prepare
}

src_configure() {
	cd bindings/python
	distutils-r1_src_configure
}

src_compile() {
	export RUSTONIG_SYSTEM_LIBONIG=1
	cd bindings/python
	distutils-r1_src_compile
}

src_test() {
	cd bindings/python
	local -x EPYTEST_IGNORE=( benches/ )
	local -x EPYTEST_DESELECT=(
		tests/bindings/test_encoding.py::TestEncoding::test_sequence_ids
		tests/bindings/test_encoding.py::TestEncoding::test_n_sequences
		tests/bindings/test_encoding.py::TestEncoding::test_word_to_tokens
		tests/bindings/test_encoding.py::TestEncoding::test_word_to_chars
		tests/bindings/test_encoding.py::TestEncoding::test_token_to_sequence
		tests/bindings/test_encoding.py::TestEncoding::test_token_to_chars
		tests/bindings/test_encoding.py::TestEncoding::test_token_to_word
		tests/bindings/test_encoding.py::TestEncoding::test_char_to_token
		tests/bindings/test_encoding.py::TestEncoding::test_char_to_word
		tests/bindings/test_encoding.py::TestEncoding::test_truncation
		tests/bindings/test_encoding.py::TestEncoding::test_invalid_truncate_direction
		tests/bindings/test_models.py::TestBPE::test_instantiate
		tests/bindings/test_models.py::TestWordLevel::test_instantiate
		tests/bindings/test_models.py::TestWordPiece::test_instantiate
		tests/bindings/test_processors.py::TestByteLevelProcessing::test_processing
		tests/bindings/test_trainers.py::TestUnigram::test_continuing_prefix_trainer_mismatch
		tests/bindings/test_trainers.py::TestUnigram::test_train
		tests/bindings/test_trainers.py::TestUnigram::test_train_parallelism_with_custom_pretokenizer
		tests/documentation/test_pipeline.py::TestPipeline::test_pipeline
		tests/documentation/test_pipeline.py::TestPipeline::test_bert_example
		tests/implementations/test_char_bpe.py::TestCharBPETokenizer::test_basic_encode
		tests/implementations/test_char_bpe.py::TestCharBPETokenizer::test_lowercase
		tests/implementations/test_char_bpe.py::TestCharBPETokenizer::test_decoding
		tests/implementations/test_char_bpe.py::TestCharBPETokenizer::test_multiprocessing_with_parallelism
		tests/test_serialization.py::TestSerialization::test_full_serialization_albert
		tests/test_serialization.py::TestSerialization::test_str_big
		tests/bindings/test_tokenizer.py::TestTokenizer::test_encode_formats
		tests/bindings/test_tokenizer.py::TestTokenizer::test_encode_add_special_tokens
		tests/bindings/test_tokenizer.py::TestTokenizer::test_from_pretrained
		tests/bindings/test_tokenizer.py::TestTokenizer::test_from_pretrained_revision
		tests/bindings/test_tokenizer.py::TestTokenizer::test_encode_special_tokens
		tests/bindings/test_tokenizer.py::TestTokenizer::test_splitting
		tests/documentation/test_quicktour.py::TestQuicktour::test_quicktour
		tests/documentation/test_tutorial_train_from_iterators.py::TestTrainFromIterators::test_datasets
		tests/documentation/test_tutorial_train_from_iterators.py::TestTrainFromIterators::test_gzip
		tests/implementations/test_bert_wordpiece.py::TestBertWordPieceTokenizer::test_basic_encode
		tests/implementations/test_bert_wordpiece.py::TestBertWordPieceTokenizer::test_multiprocessing_with_parallelism
		tests/implementations/test_byte_level_bpe.py::TestByteLevelBPE::test_basic_encode
		tests/implementations/test_byte_level_bpe.py::TestByteLevelBPE::test_add_prefix_space
		tests/implementations/test_byte_level_bpe.py::TestByteLevelBPE::test_lowerspace
		tests/implementations/test_byte_level_bpe.py::TestByteLevelBPE::test_multiprocessing_with_parallelism

	)
	distutils-r1_src_test
}

src_install() {
	cd bindings/python
	distutils-r1_src_install
}
