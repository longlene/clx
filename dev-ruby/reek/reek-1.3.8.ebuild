# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Reek is a tool that examines Ruby classes, modules and methods
and reports any code smells it finds"
HOMEPAGE="http://wiki.github.com/troessner/reek"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby_parser-3.3"
ruby_add_rdepend ">=dev-ruby/sexp_processor-0"
ruby_add_rdepend ">=dev-ruby/ruby2ruby-2.0.8"
ruby_add_rdepend ">=dev-ruby/rainbow-1.99"
ruby_add_rdepend ">=dev-ruby/bundler-1.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.12"
ruby_add_rdepend ">=dev-ruby/flay-0"
ruby_add_rdepend ">=dev-ruby/yard-0"

