# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Useful for testing the server's BOSH support"
HOMEPAGE="http://www.getvines.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/coffee-script-2.2.0"
ruby_add_rdepend ">=dev-ruby/coffee-script-source-1.6.2"
ruby_add_rdepend ">=dev-ruby/sass-3.2.9"
ruby_add_rdepend ">=dev-ruby/sprockets-2.10.0"
ruby_add_rdepend ">=dev-ruby/uglifier-2.1.1"
ruby_add_rdepend ">=dev-ruby/rack-1.5.2"
ruby_add_rdepend ">=dev-ruby/rake-10.1.0"

