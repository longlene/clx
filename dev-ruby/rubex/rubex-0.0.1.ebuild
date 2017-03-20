# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Crystal-inspired language for writing Ruby extensions
"
HOMEPAGE="http://github.com/v0dro/rubex"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oedipus_lex-2.4"
ruby_add_rdepend ">=dev-ruby/racc-1.4.14"
ruby_add_rdepend ">=dev-ruby/rake-11.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"

