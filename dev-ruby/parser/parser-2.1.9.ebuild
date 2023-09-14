# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby parser written in pure Ruby"
HOMEPAGE="http://github.com/whitequark/parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ast-1.1"
ruby_add_rdepend ">=dev-ruby/slop-3.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.2"
ruby_add_rdepend ">=dev-ruby/rake-0.9"
ruby_add_rdepend ">=dev-ruby/racc-1.4.9"
ruby_add_rdepend ">=dev-ruby/cliver-0.3.0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/kramdown-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/json_pure-0"
ruby_add_rdepend ">=dev-ruby/mime-types-1.25"
ruby_add_rdepend ">=dev-ruby/simplecov-sublime-ruby-coverage-0"
ruby_add_rdepend ">=dev-ruby/gauntlet-0"

