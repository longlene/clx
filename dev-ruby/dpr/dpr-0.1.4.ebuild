# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The simplest Ruby HTTP client"
HOMEPAGE="https://www.github.com/SudhagarS/dpr"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/guard-2.13"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.6"
ruby_add_rdepend "<dev-ruby/pry-0.9.10"
ruby_add_rdepend ">=dev-ruby/rest-client-1.8"
ruby_add_rdepend ">=dev-ruby/addressable-2.3"

