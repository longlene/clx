# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ramaze is a simple and modular web framework"
HOMEPAGE="http://ramaze.net/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/innate-2012.12"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/Remarkably-0"
ruby_add_rdepend ">=dev-ruby/bacon-0"
ruby_add_rdepend ">=dev-ruby/dalli-0"
ruby_add_rdepend ">=dev-ruby/erector-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/ezamar-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/liquid-0"
ruby_add_rdepend ">=dev-ruby/locale-0"
ruby_add_rdepend ">=dev-ruby/maruku-0"
ruby_add_rdepend ">=dev-ruby/mustache-0"
ruby_add_rdepend ">=dev-ruby/rack-contrib-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/redis-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/slippers-0"
ruby_add_rdepend ">=dev-ruby/tagz-0"
ruby_add_rdepend ">=dev-ruby/tenjin-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/lokar-0"
ruby_add_rdepend ">=dev-ruby/localmemcache-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rdiscount-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/nagoro-0"

