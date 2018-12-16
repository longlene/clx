# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Adds DMGeometry type to DataMapper that uses GeoRuby for (de)serializing Geometry types into Postgis"
HOMEPAGE="http://github.com/rkj/dm-postgis"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/GeoRuby-1.3.4"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/dm-core-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-postgres-adapter-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.2.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"
ruby_add_rdepend ">=dev-ruby/debugger-0"

