# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cloud Gem Server for your private RubyGems at http://gemfury"
HOMEPAGE="http://www.gemfury.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-1.6.0"
ruby_add_rdepend ">=dev-ruby/netrc-0.7.7"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"
ruby_add_rdepend ">=dev-ruby/thor-0.14.0"
ruby_add_rdepend ">=dev-ruby/faraday-0.9.0"

