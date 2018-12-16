# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Numo::NArray - New NArray class library in Ruby/Numo"
HOMEPAGE="https://github.com/ruby-numo/narray"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/rake-compiler-1.0.1"
ruby_add_rdepend ">=dev-ruby/rake-compiler-dock-0"

