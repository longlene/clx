# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="NMatrix is a linear algebra library for Ruby, written mostly in C and C++"
HOMEPAGE="http://sciruby.com"

LICENSE="BSD 3-clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/packable-1.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/rspec-longrun-1.0"

