# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A library designed to retrieve and parse feeds as quickly as possible"
HOMEPAGE="http://feedjira.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sax-machine-1.0"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9"
ruby_add_rdepend ">=dev-ruby/loofah-2.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

