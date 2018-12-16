# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="UV is Ruby OOP bindings for libuv"
HOMEPAGE="http://avalanche123.github.com/uvrb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/cucumber-1.3"
ruby_add_rdepend ">=dev-ruby/aruba-0.5"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"

