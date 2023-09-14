# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Unirest is a set of lightweight HTTP libraries available in multiple languages"
HOMEPAGE="https://github.com/Mashape/unirest-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/addressable-2.3.5"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5.0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

