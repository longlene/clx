# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ruby_parser (RP) is a ruby parser written in pure ruby (utilizing
racc--which does by default use a C extension)"
HOMEPAGE="https://github.com/seattlerb/ruby_parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sexp_processor-4.9"
ruby_add_rdepend ">=dev-ruby/oedipus_lex-2.5"
ruby_add_rdepend ">=dev-ruby/racc-1.4.6"
ruby_add_rdepend ">=dev-ruby/hoe-3.16"

