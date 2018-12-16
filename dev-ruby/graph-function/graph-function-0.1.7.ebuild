# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Using gnuplot and Ruby's benchmarking abilities, see the asymptotic behavior of your functions graphed"
HOMEPAGE="http://github.com/mooreniemi/graph-function"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gnuplot-0"
ruby_add_rdepend ">=dev-ruby/rantly-0"
ruby_add_rdepend ">=dev-ruby/faker-0"
ruby_add_rdepend ">=dev-ruby/ruby-progressbar-0"
ruby_add_rdepend ">=dev-ruby/benchmark-memory-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/pry-0"

