# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Oga is an XML/HTML parser written in Ruby"
HOMEPAGE="https://github.com/yorickpeterse/oga/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ast-0"
ruby_add_rdepend ">=dev-ruby/ruby-ll-2.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/kramdown-0"
ruby_add_rdepend ">=dev-ruby/benchmark-ips-2.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"

